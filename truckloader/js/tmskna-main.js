import * as THREE from 'three';

import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';
import { DRACOLoader } from 'three/addons/loaders/DRACOLoader.js';
import { OrbitControls } from 'three/addons/controls/OrbitControls.js';

let container;

let camera, scene, renderer, controls;

let mouseX = 0, mouseY = 0;

let windowHalfX = window.innerWidth / 2;
let windowHalfY = window.innerHeight / 2;

let fast_animation = false;
let use_textures = true;
let free_camera = false;
let multitextures = true;

let object;
let mixer;
let truckMixer;
let modelReady = false;
let animations = {
    truck_door: {},
    cubes: {
        items: [],
        active: false
    }
};

let object_placement_offset_x = -600;
let object_placement_offset_y = 0;
let object_placement_offset_z = 0;

let truck_coords = {
    // lower angle of the far door
    x_min: -420 + object_placement_offset_x,
    y_min: -71 + object_placement_offset_y,
    z_max: 120 + object_placement_offset_z, // inverse direction

    x_max: 1050 + object_placement_offset_x,
    y_max: -25 + object_placement_offset_y, // unchecked
    z_min: -400 + object_placement_offset_z, // unchecked
};

let truck_scale_x = 2.5;
let truck_scale_y = 2.5;
let truck_scale_z = 2.5;

let truck_length = truck_coords.x_max - truck_coords.x_min;

let max_camera_distance = 2400; //2000;
let min_camera_distance = 1400;

let start_camera_angle_rate = max_camera_distance / 2119.;

let trajectory_up = {
    x_start: -1850 + object_placement_offset_x,
    x_end: -750 + object_placement_offset_x,
    y_start: -120 + object_placement_offset_y,
    y_end: 50 + object_placement_offset_y
};

let trajectory_down = {
    x_start: trajectory_up.x_end + 0,
    y_start: trajectory_up.y_end,
    x_end: truck_coords.x_min,
    y_end: truck_coords.y_min,
    z_end: truck_coords.z_max
};

const clock = new THREE.Clock();

const PACKAGING_FACE_KEYS = ['back', 'front', 'left', 'right', 'bottom', 'top'];
const SINGLE_TEXTURE_URL = 'truckloader/lib/three/examples/textures/crate.gif';


let packagingFaceCache = { crate: null, pallet: null };
let dbgCubeTick = 0;

let files = {
    warehouse: 'models/Warehouse ANIM.glb',
    truck: 'models/Truck model ANIM.glb',
    skybox: 'models/Skybox_4k.glb'
};

let file_sizes = {
};

function createParabolicY(startX, startY, endX, endY, maxHeight) {

    const dx = endX - startX;
    const midY = (startY + endY) / 2;
    const h = maxHeight - midY;

    return function (x) {
        const t = (x - startX) / dx;
        return (1 - t) * startY + t * endY + 4 * h * t * (1 - t);
    };
}

function crateMaxHeight(crateHeight) {
    return truck_scale_y * ((-1) * truck_coords.y_max - crateHeight);
}

function pickNum(b, keys) {
    for (let i = 0; i < keys.length; i++) {
        const v = b[keys[i]];
        if (v !== undefined && v !== null && v !== '') return Number(v);
    }
    return 0;
}

function pickStr(b, keys, defaultVal) {
    for (let i = 0; i < keys.length; i++) {
        const v = b[keys[i]];
        if (v !== undefined && v !== null && String(v).trim() !== '') return String(v).trim();
    }
    return defaultVal;
}

function normalizeServerBox(b) {



    const rawKind = pickStr(b, ['PackKind', 'packKind', 'COL_1205559151'], 'C');
    const packKind = String(rawKind).charAt(0).toUpperCase() === 'P' ? 'P' : 'C';
    return {
        pos_L: pickNum(b, ['PosL', 'pos_L', 'posL']),
        pos_W: pickNum(b, ['PosW', 'pos_W', 'posW']),
        pos_H: pickNum(b, ['PosH', 'pos_H', 'posH']),
        width: pickNum(b, ['Length', 'length']),
        height: pickNum(b, ['Height', 'height']),
        length: pickNum(b, ['Width', 'width']),
        packKind: packKind
    }
}

function facePngUrl(kind, face) {
    const prefix = kind === 'pallet' ? 'pallet_' : 'crate_';
    return 'models/' + prefix + face + '.png';
}

function faceSetReady(kind) {
    const s = packagingFaceCache[kind];
    return !!(s && s._ready);
}

function copyFaceRefsFromTo(fromKind, toKind) {
    const from = packagingFaceCache[fromKind];
    if (!from || !from._ready) return;
    const to = { _ready: true };
    for (let i = 0; i < PACKAGING_FACE_KEYS.length; i++) {
        const k = PACKAGING_FACE_KEYS[i];
        to[k] = from[k];
    }
    packagingFaceCache[toKind] = to;
}

function loadFaceSetSequential(kind, onDone, onError) {
    if (faceSetReady(kind)) {
        onDone();
        return;
    }
    const out = {};
    let idx = 0;
    function next() {
        if (idx >= PACKAGING_FACE_KEYS.length) {
            out._ready = true;
            packagingFaceCache[kind] = out;
            onDone();
            return;
        }
        const face = PACKAGING_FACE_KEYS[idx++];
        new THREE.TextureLoader().load(
            facePngUrl(kind, face),
            function (tex) {
                if (tex.colorSpace !== undefined) tex.colorSpace = THREE.SRGBColorSpace;
                out[face] = tex;
                next();
            },
            undefined,
            onError
        );
    }
    next();
}

function loadSingleGifIntoFaceCaches(onDone, onError) {
    if (faceSetReady('crate') && packagingFaceCache.crate._singleGif) {
        packagingFaceCache.pallet = packagingFaceCache.crate;
        onDone();
        return;
    }
    new THREE.TextureLoader().load(
        SINGLE_TEXTURE_URL,
        function (tex) {
            if (tex.colorSpace !== undefined) tex.colorSpace = THREE.SRGBColorSpace;
            const o = { _ready: true, _singleGif: true };
            for (let i = 0; i < PACKAGING_FACE_KEYS.length; i++) {
                const k = PACKAGING_FACE_KEYS[i];
                o[k] = tex;
            }
            packagingFaceCache.crate = o;
            packagingFaceCache.pallet = o;
            onDone();
        },
        undefined,
        onError
    );
}

function packagingReadyForTargets(targets) {
    if (!multitextures) {
        return faceSetReady('crate') && packagingFaceCache.crate._singleGif;
    }
    const needPallet = targets.some(function (t) { return t.packKind === 'P' });
    const needCrate = targets.some(function (t) { return t.packKind !== 'P' });
    if (needCrate && !faceSetReady('crate')) return false;
    if (needPallet && !faceSetReady('pallet')) return false;
    return true;
}

function isPalletBox(size) {
    if (!size) return false;
    const raw = size.packKind ?? size.PackKind ?? size.pack_kind ?? size.kind ?? size.type;
    if (raw === undefined || raw === null) return false;
    const s = String(raw).trim().toUpperCase();
    return s === 'P' || s === 'PALLET' || s === 'PAL';
}

function getFaceTexturesForBox(size) {
    const wantPallet = isPalletBox(size);
    const primary = wantPallet ? packagingFaceCache.pallet : packagingFaceCache.crate;
    if (primary && primary._ready) return primary;
    const fb = packagingFaceCache.crate;
    if (fb && fb._ready) return fb;
    return primary;
}

function setLoadProgText(msg) {
    const el = document.getElementById("loadProg");
    if (!el) return;
    if (msg === null || msg === undefined || msg === '') {
        el.style.display = 'none';
        return;
    }
    el.textContent = msg;
    el.style.display = 'block';
}

function hideLoadProg() {
    const el = document.getElementById("loadProg");
    if (el) el.style.display = 'none';
}

function dbgCrateOnce() {
    const c = packagingFaceCache.crate;
    const p = packagingFaceCache.pallet;
    const tex = multitextures ? (p && p.top) || (c && c.top) : c && c.top;
    const img = tex && tex.image;
    console.log('[packaging]', multitextures ? 'PNG faces' : 'gif', img && img.src, 'complete=' + !!(img && img.complete));
}

function beginCubesAfterTextures(result) {
    const targets = result.slice();
    const onFail = function () {
        use_textures = false;
        start_cubes(targets);
    }
    const finish = function () {
        dbgCrateOnce();
        start_cubes(targets);
    }

    if (packagingReadyForTargets(targets)) {
        finish();
        return;
    }

    if (!multitextures) {
        loadSingleGifIntoFaceCaches(finish, onFail);
        return;
    }

    const needPallet = targets.some(function (t) { return t.packKind === 'P' });
    const needCrate = targets.some(function (t) { return t.packKind !== 'P' });

    if (needCrate && !needPallet) {
        loadFaceSetSequential('crate', finish, onFail);
        return;
    }

    if (!needCrate && needPallet) {
        loadFaceSetSequential(
            'pallet',
            finish,
            function () {
                loadFaceSetSequential(
                    'crate',
                    function () {
                        copyFaceRefsFromTo('crate', 'pallet');
                        finish();
                    },
                    onFail
                )
            }
        );
        return;
    }

    loadFaceSetSequential('crate', function () {
        loadFaceSetSequential(
            'pallet',
            finish,
            function () {
                copyFaceRefsFromTo('crate', 'pallet');
                finish();
            }
        );
    }, onFail);
}

function runShipmentDoorSequence(result) {
    clear_cubes();
    animations.truck_door.active = false;
    truckMixer.update(clock.getDelta() * (fast_animation ? 10 : 5));
    if (animations.warehouse_door && animations.warehouse_door.anim) {
        run_animation(animations.warehouse_door);
    }
    setTimeout(function () {
        run_animation(animations.truck_door);
        beginCubesAfterTextures(result);
    }, fast_animation ? 500 : 1000);
}

function tryStartEmbeddedFromHiddenField() {
    const el = document.getElementById('hdnBoxData');
    if (!el || !el.value || !String(el.value).trim() || String(el.value).trim() === '[]') {
        hideLoadProg();
        setLoadProgText('No cargo data to animate.');
        return;
    }
    let raw;
    try {
        raw = JSON.parse(el.value);
    } catch (e) {
        console.error(e);
        setLoadProgText('Invalid cargo data.');
        return;
    }
    if (!Array.isArray(raw) || raw.length === 0) {
        hideLoadProg();
        setLoadProgText('No cargo data to animate.');
        return;
    }
    const result = raw.map(normalizeServerBox);
    hideLoadProg();
    runShipmentDoorSequence(result);
}

let total_files_size = 0;
let total_downloaded_size = 0;

init();
animate();

// https://stackoverflow.com/questions/17416274/ajax-get-size-of-file-before-downloading
function get_filesize(url, callback) {
    var xhr = new XMLHttpRequest();
    xhr.open("HEAD", url, true);
    xhr.onreadystatechange = function () {
        if (this.readyState == this.DONE) {
            callback(parseInt(xhr.getResponseHeader("Content-Length")));
        }
    };
    xhr.send();
}

function calculate_total_files_size(callback, files_) {
    if (
        Object.values(files).length > Object.values(file_sizes).length
        &&
        (files_ === undefined || files_.length > 0)
    ) {
        files_ = files_ || Object.values(files);
        let file = files_.shift();
        get_filesize(file, function (size) {
            total_files_size += size;
            file_sizes[file] = size;
            calculate_total_files_size(callback, files_);
        });
    } else if (callback) {
        callback();
    }
}

function run_animation(o, is_reverse) {
    if (!o || !o.anim) return;
    o.anim.reset();
    if (is_reverse) {
        o.anim.timeScale = -1;
        o.anim.time = o.anim.getClip().duration;
    } else {
        o.anim.timeScale = 1;
        o.anim.time = 0;
    }
    o.active = true;
    o.anim.play();
}

function init() {

    container = document.getElementById("sceneWrap");
    if (!container) {
        console.error("scenenWrap missing");
        return;
    }

    const cw = container.clientWidth || window.innerWidth;
    const ch = container.clientHeight || window.innerHeight;
    camera = new THREE.PerspectiveCamera(45, cw / ch, 100, 40000);
    camera.position.x = 1000 * start_camera_angle_rate;
    camera.position.y = 500 * start_camera_angle_rate;
    camera.position.z = -1800 * start_camera_angle_rate;

    // scene

    scene = new THREE.Scene();

    //const light = new THREE.PointLight( 0xffffff, 4, 0 );
    const light_color = 0xffffff;
    const light = new THREE.DirectionalLight(light_color, 1.5)
    light.position.set(1000, 5000, -3000);
    light.target.position.set(-500, -200, 0);
    light.castShadow = true;
    light.shadow.camera.near = 0.1;
    light.shadow.camera.far = 9000;
    light.shadow.bias = -0.002;

    let d = 1200;
    light.shadow.camera.left = -d;
    light.shadow.camera.right = d * 2;
    light.shadow.camera.top = d;
    light.shadow.camera.bottom = -d;
    //light.shadow.mapSize = new THREE.Vector2( 80000, 80000 );
    //light.shadow.camera.lookAt( new THREE.Vector3(-500,-200, 0) )
    scene.add(light);
    //scene.add( new THREE.CameraHelper( light.shadow.camera ) );
    const ambientLight = new THREE.AmbientLight(light_color, 4);
    scene.add(ambientLight);

    function onProgress(xhr) {
        if (xhr.lengthComputable && total_files_size > 0) {
            const percentComplete = (total_downloaded_size + xhr.loaded) / total_files_size * 100;
            setLoadProgText("Loading: " + Math.round(percentComplete, 2) + "%...")
        }
    }

    var loader = new GLTFLoader();
    var dracoLoader = new DRACOLoader();
    dracoLoader.setDecoderPath('truckloader/lib/three/examples/jsm/libs/draco/');
    loader.setDRACOLoader(dracoLoader);

    function load_glb_file(id, callback) {
        calculate_total_files_size(function () {
            loader.load(files[id], function (gltf) {
                total_downloaded_size += file_sizes[files[id]];
                return callback(gltf);
            }, onProgress);
        });
    }

    load_glb_file('warehouse', function (gltf) {
        mixer = new THREE.AnimationMixer(gltf.scene);
        if (gltf.animations.length > 0) {
            animations.warehouse_door = {};
            animations.warehouse_door.anim = mixer.clipAction(gltf.animations[0]);
            animations.warehouse_door.anim.setLoop(THREE.LoopOnce);
            animations.warehouse_door.anim.clampWhenFinished = true;
            animations.warehouse_door.anim.enable = true;
        }

        animations.cubes.active = false;

        let object = gltf.scene;
        //object.map = terrain;

        gltf.scene.traverse(function (child) {
            if (child.isMesh) {
                child.castShadow = true;
                child.receiveShadow = true;
            }
        });
        object.scale.set(100, 100, 100);
        object.position.x = -500 + object_placement_offset_x;
        object.position.y = -200 + object_placement_offset_y;
        object.position.z = 0 + object_placement_offset_z;
        object.rotation.set(0, Math.PI / 2, 0);
        //object.receiveShadow = true;
        scene.add(object);

        load_glb_file('skybox', function (gltf) {
            let object = gltf.scene;
            object.scale.set(160, 160, 160);
            object.position.x = 0 + object_placement_offset_x;
            object.position.y = 1500 + object_placement_offset_y;
            object.position.z = 0 + object_placement_offset_z;
            object.castShadow = false;
            //object.rotation.set(0,Math.PI/2,0);
            scene.add(object);

            load_glb_file('truck', function (gltf) {
                hideLoadProg();
                truckMixer = new THREE.AnimationMixer(gltf.scene);
                animations.truck_door.anim = truckMixer.clipAction(gltf.animations[0]);
                animations.truck_door.anim.setLoop(THREE.LoopOnce);
                animations.truck_door.anim.clampWhenFinished = true;
                animations.truck_door.anim.enable = true;

                truckMixer.addEventListener('finished', function () {
                    animations.truck_door.active = false;
                });

                let object = gltf.scene;
                //object.children[1].material.lightMap = lightmap;
                object.traverse(function (child) {
                    if (child.isMesh) {
                        child.castShadow = true;
                        child.receiveShadow = true;
                    }
                });
                object.scale.set(100, 100, 100);
                object.position.x = -60 + object_placement_offset_x;
                object.position.y = -200 + object_placement_offset_y;
                object.position.z = 0 + object_placement_offset_z;
                object.rotation.set(0, Math.PI / 2, 0);
                //object.receiveShadow = true;
                scene.add(object);

                //animations.truck_door.play();

                render();

                tryStartEmbeddedFromHiddenField();

            });

        });
    });

    renderer = new THREE.WebGLRenderer({ antialias: true });
    renderer.setPixelRatio(window.devicePixelRatio);
    renderer.setSize( container.clientWidth || window.innerWidth, container.clientHeight || window.innerHeight);
    renderer.shadowMap.enabled = true;
    if (THREE.SRGBColorSpace !== undefined) {
        renderer.outputColorSpace = THREE.SRGBColorSpace;
    }
    container.insertBefore(renderer.domElement, container.firstChild);
    controls = new OrbitControls(camera, container);
    if (!free_camera) {
        controls.maxPolarAngle = Math.PI / 2.0; //15 * Math.PI/32;
        controls.maxDistance = max_camera_distance;
        controls.minDistance = min_camera_distance;
        //controls.minAzimuthAngle = -5 * Math.PI / 16; //3 * Math.PI / 4;
        controls.maxAzimuthAngle = Math.PI / 2; //21 * Math.PI / 16;
    }
    controls.target.set(-60 + object_placement_offset_x, -100 + object_placement_offset_y, object_placement_offset_z);
    controls.update();

    document.addEventListener('mousemove', onDocumentMouseMove);

    window.addEventListener('resize', onWindowResize);

}

function onWindowResize() {

    const wrap = container || document.getElementById("sceneWrap");
    const w = wrap ? wrap.clientWidth : window.innerWidth;
    const h = wrap ? wrap.clientHeight : window.innerHeight;
    windowHalfX = w / 2;
    windowHalfY = h / 2;

    camera.aspect = w / h;
    camera.updateProjectionMatrix();

    renderer.setSize(w, h);

}

function onDocumentMouseMove(event) {

    mouseX = (event.clientX - windowHalfX) / 2;
    mouseY = (event.clientY - windowHalfY) / 2;

}

function clear_cubes() {

    let items = animations.cubes.items;
    for (let i = 0; i < items.length; i++) {
        scene.remove(items[i].cube);
    }
    animations.cubes.active = false;
    animations.cubes.items = [];
    dbgCubeTick = 0;
}


function start_cubes(targets) {

    if (targets.length) {
        let target = targets.shift();
        let target_norm_x = - target.pos_L * truck_scale_x + trajectory_down.x_end + truck_length;
        let target_norm_z = - target.pos_W * truck_scale_z + trajectory_down.z_end;
        let target_norm_y = target.pos_H * truck_scale_y + trajectory_down.y_end;

        start_cube(target_norm_x, target_norm_z, target_norm_y, target);
        setTimeout(function () {
            start_cubes(targets);
        }, fast_animation ? 200 : 600);
    } else {
        if (animations.warehouse_door && animations.warehouse_door.anim) {
            run_animation(animations.warehouse_door, true);
        }
    }
}

function create_mesh(piece, crate_texture, x_offset, y_offset, z_offset, x_angle, y_angle, z_angle) {

    piece.rotateX(x_angle);
    piece.rotateY(y_angle);
    piece.rotateZ(z_angle);

    // moving the pivot point to the bottom of the box (farthest corner)
    piece.computeBoundingBox();
    piece.translate(
        -piece.boundingBox.min.x + x_offset,
        -piece.boundingBox.min.y + y_offset,
        piece.boundingBox.min.z + z_offset
    );

    const faceTexture = use_textures ? crate_texture : undefined;
    if (faceTexture && faceTexture.colorSpace !== undefined) {
        faceTexture.colorSpace = THREE.SRGBColorSpace;
    }

    const material = new THREE.MeshBasicMaterial({
        vertexColors: true,
        map: faceTexture,
        transparent: !!faceTexture,
        alphaTest: faceTexture ? 0.05 : 0,
        side: THREE.DoubleSide
    });
    const positionAttribute = piece.getAttribute('position');
    const colors = [];

    const color = new THREE.Color();

    for (let i = 0; i < positionAttribute.count; i += 6) {

        color.setHex(0xffffff * (use_textures ? 1 : Math.random()));

        colors.push(color.r, color.g, color.b);
        colors.push(color.r, color.g, color.b);
        colors.push(color.r, color.g, color.b);

        colors.push(color.r, color.g, color.b);
        colors.push(color.r, color.g, color.b);
        colors.push(color.r, color.g, color.b);
    }

    piece.setAttribute('color', new THREE.Float32BufferAttribute(colors, 3));
    let plane = new THREE.Mesh(piece, material);
    plane.castShadow = true;

    return plane;
}

function start_cube(target_pos_x, target_pos_z, target_pos_y, size) {

    const dx = size.width * truck_scale_x;
    const dy = size.height * truck_scale_y;
    const dz = size.length * truck_scale_z;

    const back = new THREE.PlaneGeometry(dx, dy).toNonIndexed();
    const front = new THREE.PlaneGeometry(dx, dy).toNonIndexed();
    const left = new THREE.PlaneGeometry(dz, dy).toNonIndexed();
    const right = new THREE.PlaneGeometry(dz, dy).toNonIndexed();
    const top = new THREE.PlaneGeometry(dx, dz).toNonIndexed();
    const bottom = new THREE.PlaneGeometry(dx, dz).toNonIndexed();

    const faceTextures = getFaceTexturesForBox(size) || {};

    const back_mesh = create_mesh(
       back,
       faceTextures["back"],
       0, 0, 0,
       0, 0, 0
    );

    const front_mesh = create_mesh(
       front,
       faceTextures["front"],
       0, 0, -dz,
       0, Math.PI, 0
    );

    const left_mesh = create_mesh(
       left,
       faceTextures["left"],
       dx, 0, 0,
       0, Math.PI / 2, 0
    );

    const right_mesh = create_mesh(
       right,
       faceTextures["right"],
       0, 0, 0,
       0, Math.PI * 1.5, 0
    );

    const bottom_mesh = create_mesh(
       bottom,
       faceTextures["bottom"],
       0, 0, 0,
       Math.PI / 2, 0, 0
    );

    const top_mesh = create_mesh(
       top,
       faceTextures["top"],
       0, dy, 0,
       Math.PI * 1.5, 0, 0
    );

    let cube = new THREE.Group();
    cube.add(back_mesh);
    cube.add(front_mesh);
    cube.add(left_mesh);
    cube.add(right_mesh);
    cube.add(bottom_mesh);
    cube.add(top_mesh);

    cube.position.x = trajectory_up.x_start;
    cube.position.y = trajectory_up.y_start;
    cube.position.z = target_pos_z;

    let maxHeight = crateMaxHeight(size.height)
    animations.cubes.items.push({
        cube: cube,
        target_x: target_pos_x,
        target_y: target_pos_y,
        active: true,

        position: createParabolicY(trajectory_up.x_start, trajectory_up.y_start, target_pos_x, target_pos_y, (-1) * maxHeight),
    });

    animations.cubes.active = true;

    scene.add(cube);
    if (animations.cubes.items.length === 1) {
        console.log('[cube0] target', target_pos_x.toFixed(0), target_pos_y.toFixed(0), target_pos_z.toFixed(0));
    }
}



function animate() {

    requestAnimationFrame(animate);

    let clock_delta = clock.getDelta() * (fast_animation ? 10 : 5);

    if (animations.truck_door.active && truckMixer) {
        truckMixer.update(clock_delta);
    }

    if (animations.warehouse_door && animations.warehouse_door.active && mixer) {
        mixer.update(clock_delta);
    }

    if (animations.cubes.active) {

        let still_active = false;

        for (let i = 0; i < animations.cubes.items.length; i++) {

            let item = animations.cubes.items[i];

            if (item.active) {

                still_active = true;

                let cube = item.cube;

                cube.position.x += fast_animation ? 40 : 26;
                cube.position.y = item.position(cube.position.x);

                if (cube.position.x > item.target_x) {
                    item.active = false;
                }
                if (i === 0 && item.active && ++dbgCubeTick % 30 === 0) {
                    console.log('[cube0]', cube.position.x.toFixed(0), cube.position.y.toFixed(0), cube.position.z.toFixed(0));
                }
            }
        }

        if (!still_active) {
            animations.cubes.active = false;
            if (animations.truck_door && animations.truck_door.anim) {
                run_animation(animations.truck_door, true);
            }
        }
    }

    render();
}



function render() {

    if (!renderer || !scene || !camera) return;
    if (controls) controls.update();
    renderer.render(scene, camera);

}
