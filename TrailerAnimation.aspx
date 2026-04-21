<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TrailerAnimation.aspx.vb"
    Inherits="LoadConsolidation_TrailerAnimation" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trailer Animation</title>
    <style type="text/css">
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', Arial, sans-serif; overflow: hidden; }
        .animation-container { width: 100%; height: 100vh; display: flex; flex-direction: column; }
        .animation-header {
            background: linear-gradient(135deg, #1a2a3a 0%, #2c5282 100%); color: #fff; padding: 8px 16px;
            font-size: 14px; font-weight: 600; display: flex; align-items: center; justify-content: space-between;
            z-index: 20; position: relative;
        }
        .animation-header .info { font-size: 12px; font-weight: normal; opacity: 0.8; }
        .scene-wrap { flex: 1; position: relative; overflow: hidden; background: #222; }
        .no-data { text-align: center; padding: 60px; font-size: 15px; color: #aaa; }
        .error-msg { text-align: center; padding: 60px; font-size: 14px; color: #e74c3c; }
        #statusText {
            position: absolute; top: 12px; left: 50%; transform: translateX(-50%);
            color: #fff; font-size: 13px; z-index: 10; pointer-events: none;
            text-shadow: 0 1px 4px rgba(0,0,0,0.8);
            background: rgba(0,0,0,0.4); padding: 5px 16px; border-radius: 5px;
        }
        #loadProg {
            position: absolute; top: 50%; left: 50%; transform: translate(-50%,-50%);
            color: #fff; font-size: 15px; z-index: 10; animation: pulse 1.2s infinite;
        }
        @keyframes pulse { 0%,100%{opacity:1} 50%{opacity:.3} }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="animation-container">
            <div class="animation-header">
                <span>AI-Powered Trailer Visualization</span>
                <span id="spanInfo" runat="server" class="info"></span>
            </div>
            <asp:Literal ID="litContent" runat="server" />
            <asp:HiddenField ID="hdnBoxData" runat="server" ClientIDMode="Static" />
            <div class="scene-wrap" id="sceneWrap">
                <div id="loadProg">Loading 3D scene...</div>
                <div id="statusText" style="display:none;"></div>
            </div>
        </div>
    </form>

    <%  Dim urlThreeMod As String = ResolveUrl("~/LoadConsolidation/truckloader/lib/three/build/three.module.js")
        Dim urlThreeAddons As String = ResolveUrl("~/LoadConsolidation/truckloader/lib/three/examples/jsm/")
        Dim urlTruckMain As String = ResolveUrl("~/LoadConsolidation/truckloader/js/tmskna-main.js")
    %>

    <script async src="https://unpkg.com/es-module-shims@1.6.3/dist/es-module-shims.js"></script>
    <script type="importmap">
        {
            "imports": {
                "three": "<%= urlThreeMod %>",
                "three/addons/": "<%= urlThreeAddons %>"
            }
        }
    </script>

    <script type="module" src="<%= urlTruckMain %>"></script>

</body>
</html>
