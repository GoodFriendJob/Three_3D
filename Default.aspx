<%@ Page Language="VB" MasterPageFile="~/Common/MainLayout.master" AutoEventWireup="false" CodeFile="Default.aspx.vb"
    Inherits="LoadConsolidation_Default" Title="Consolidations" MaintainScrollPositionOnPostBack="true" %>

    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
        <%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
            <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

                <script type="text/javascript">
                    Sys.Application.add_init(function () {
                        if (Sys.WebForms && Sys.WebForms.PageRequestManager && !Sys.WebForms.PageRequestManager.prototype._destroyTree) {
                            Sys.WebForms.PageRequestManager.prototype._destroyTree = function () { };
                        }
                    });
                </script>

                <script runat="server">
                    Protected Sub RadGrid1_ItemDataBound(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs)
                        If TypeOf e.Item Is Telerik.Web.UI.GridDataItem Then
                            Dim dataItem As Telerik.Web.UI.GridDataItem = CType(e.Item, Telerik.Web.UI.GridDataItem)

                            If dataItem.DataItem IsNot Nothing Then
                                Dim shipperValue As Object = DataBinder.Eval(dataItem.DataItem, "COL_1251888419")
                                Dim shipperText As String = Convert.ToString(shipperValue)

                                If String.IsNullOrWhiteSpace(shipperText) Then
                                    dataItem.Visible = False
                                End If
                            End If
                        End If
                    End Sub
                </script>

                    <script type="text/javascript">
                        (function () {
                            var loader = document.getElementById("customLoading");
                            if (loader) {
                                loader.style.display = "block";
                            }
                        })();
                    </script>




<script type="text/javascript">
    function showLoader() {
        var loader = document.getElementById("customLoading");
        if (loader) {
            loader.style.display = "block";
        }
    }

    function hideLoader() {
        var loader = document.getElementById("customLoading");
        if (loader) {
            loader.style.display = "none";
        }
    }

    // Hook into ASP.NET AJAX (Telerik uses this)
    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(function () {
        showLoader();
    });

    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
        hideLoader();
    });
</script>










                    <script type="text/javascript">

                        function showCustomLoader() {
                        var loader = document.getElementById('customLoading');
                        if(loader) loader.style.display = 'block';
}
                    </script>

                    <script type="text/javascript">

                        function hideCustomLoader() {
                            var loader = document.getElementById('customLoading');
                            if (loader) loader.style.display = 'none';
                        }

                    </script>

                    <script type="text/javascript">

                    function showCustomLoading() {
                        var loader = document.getElementById('customLoading');
                        if (loader) loader.style.display = 'block';
                    }

                    </script>
                
                <script type="text/javascript">

                    function hideCustomLoading() {
                        var loader = document.getElementById('customLoading');
                        if (loader) loader.style.display = 'none';
                    }

                </script>
                
                <script type="text/javascript">

                    function initializeRadGrid() {
                        var grid = $find("<%= grdLoadConsolidation.ClientID %>");
                        if (!grid) return;

                        var masterTable = grid.get_masterTableView ? grid.get_masterTableView() : null;
                        if (masterTable && typeof masterTable.add_requestStart === "function" && typeof masterTable.add_requestEnd === "function") {
                            masterTable.add_requestStart(function () { showCustomLoading(); });
                            masterTable.add_requestEnd(function () { hideCustomLoading(); });
                        }
                    }

                    Sys.Application.add_load(initializeRadGrid);

                </script>
                
                <script type="text/javascript">

                    function showGrid() {
                        var grid = $find("<%= grdLoadConsolidation.ClientID %>");
    var gridElement = grid.get_element();
    gridElement.style.display = 'block'; // Show the grid

    // Optionally, rebind the grid if you need to fetch data
    grid.rebind();
}

                </script>




                
                <script type="text/javascript">

function showCustomLoading() {
    var loader = document.getElementById('customLoading');
    if (loader) loader.style.display = 'block';
}

                </script>
                
                <script type="text/javascript">

function hideCustomLoading() {
    var loader = document.getElementById('customLoading');
    if (loader) loader.style.display = 'none';
}

                </script>
                
                <script type="text/javascript">

function initializeRadGrid() {
    var grid = $find("<%= grdLoadConsolidation.ClientID %>");
    if (!grid) return;
    var masterTable = grid.get_masterTableView ? grid.get_masterTableView() : null;
    if (masterTable && typeof masterTable.add_requestStart === "function" && typeof masterTable.add_requestEnd === "function") {
        masterTable.add_requestStart(function() { showCustomLoading(); });
        masterTable.add_requestEnd(function() { hideCustomLoading(); });
    }
}

Sys.Application.add_load(initializeRadGrid);

                </script>


















                <script type="text/javascript">
                    // Wait until the page and Telerik scripts are loaded
                    function overrideRadGridWait() {
                        // Get the RadGrid client object
                        var grid = $find("<%= grdLoadConsolidation.ClientID %>");
                        if (!grid) return;

                        // Override the default showLoading function
                        grid.showLoading = function () {
                            var waitDiv = document.getElementById("wait1");
                            if (waitDiv) {
                                waitDiv.style.display = "block"; // show your custom loader
                            }
                        };

                        // Override the default hideLoading function
                        grid.hideLoading = function () {
                            var waitDiv = document.getElementById("wait1");
                            if (waitDiv) {
                                waitDiv.style.display = "none"; // hide your custom loader
                            }
                        };
                    }

                    // Call the override after the Telerik scripts and page load
                    Sys.Application.add_load(overrideRadGridWait);
                </script>

                <script runat="server">

                    Protected Sub grdLoadConsolidation_ItemDataBound(sender As Object, e As Telerik.Web.UI.GridItemEventArgs) Handles grdLoadConsolidation.ItemDataBound
                        If TypeOf e.Item Is Telerik.Web.UI.GridDataItem Then
                            Dim item As Telerik.Web.UI.GridDataItem = CType(e.Item, Telerik.Web.UI.GridDataItem)
                            item.BackColor = System.Drawing.Color.FromArgb(255, 250, 205) ' #FFFACD yellow
                            item.ForeColor = System.Drawing.Color.Black
                        End If
                    End Sub

                </script>

<script type="text/javascript">
    function enforceRadGridYellow() {
        var grid = $find("<%= grdLoadConsolidation.ClientID %>");
        if (!grid) return;

        var dataItems = grid.get_masterTableView().get_dataItems();
        for (var i = 0; i < dataItems.length; i++) {
            var row = dataItems[i].get_element();
            if (row.classList && row.classList.contains('trailer-last-master')) continue;
            row.style.backgroundColor = "#FFFACD"; // yellow
            row.style.color = "#000";              // black text
        }
    }

    // Call after page load and after any partial postback
    Sys.Application.add_load(function () {
        enforceRadGridYellow();
    });
</script>
                    <Script runat = "server" >
                        Protected Function GetProgressFillStyle(valObj As Object) As String
                            Dim val As Integer = 0

                            ' Safe conversion
                            If valObj IsNot DBNull.Value Then
                                Integer.TryParse(valObj.ToString(), val)
                            End If

                            ' Clamp between 0–100
                            val = Math.Max(0, Math.Min(100, val))

                            Dim gradient As String

                            ' Determine gradient based on value
                            Select Case val
                                Case < 60
                                    ' Red gradient
                                    gradient = "linear-gradient(90deg, #D43A3A, #B80000)"
                                Case < 75
                                    ' Yellow gradient
                                    gradient = "linear-gradient(90deg, #FFEB3B, #FFC107)"
                                Case Else
                                    ' Green gradient
                                    gradient = "linear-gradient(90deg, #3E7A41, #2E6B31)"
                            End Select

                            ' Return CSS style string
                            Return String.Format("width:{0}%; background:{1}; transition: width 0.3s ease;", val, gradient)

                        End Function

                </script>

                <script type="text/javascript">
                    var _trailerPageUrl = '<%= ResolveUrl("~/LoadConsolidation/TrailerAnimation.aspx") %>';
                    var _pendingTrailerRow = null;

                    /** If the trailer iframe navigated to the login page (e.g. session timeout), leave the whole app to full login — not login inside the overlay. */
                    function redirectTopIfTrailerIframeShowsLogin() {
                        var iframe = document.getElementById("truckloaderIframe");
                        if (!iframe || !iframe.contentWindow) return false;
                        try {
                            var href = iframe.contentWindow.location.href || "";
                            if (href.toLowerCase().indexOf("login.aspx") !== -1) {
                                window.top.location.replace(href);
                                return true;
                            }
                        } catch (ex) { }
                        return false;
                    }

                    function clearTrailerRowMarks() {
                        document.querySelectorAll('.trailer-last-master, .trailer-marker-row, .trailer-selected-row').forEach(function (n) {
                            n.classList.remove('trailer-last-master', 'trailer-marker-row', 'trailer-selected-row');
                        });
                    }

                    function markTrailerRowsFromProgress(el) {
                        clearTrailerRowMarks();
                        var detailRow = el.closest('tr');
                        if (detailRow) {
                            detailRow.classList.add('trailer-selected-row', 'trailer-marker-row');
                            _pendingTrailerRow = detailRow;
                        }
                        var detailTable = el.closest('.rgDetailTable');
                        if (detailTable) {
                            var wrapTr = detailTable.closest('tr');
                            var probe = wrapTr ? wrapTr.previousElementSibling : null;
                            if (probe && probe.classList && (probe.classList.contains('rgRow') || probe.classList.contains('rgAltRow'))) {
                                probe.classList.add('trailer-last-master');
                            }
                        }
                    }

                    function onTrailerProgressClick(el) {
                        var value = parseFloat(el.getAttribute('data-value')) || 0;
                        if (value < 1) return;
                        var p002 = el.getAttribute('data-p002');
                        if (!p002) return;
                        var p001 = el.getAttribute('data-p001');
                        markTrailerRowsFromProgress(el);
                        var url = _trailerPageUrl + '?P001=' + encodeURIComponent(p001) + '&P002=' + encodeURIComponent(p002);
                        openNewWindow(url);
                    }

                    function fixRadGridYellow(gridId) {
                        var grid = $find(gridId);
                        if (!grid) return;

                        var masterTable = grid.get_masterTableView();
                        for (var i = 0; i < masterTable.get_dataItems().length; i++) {
                            var item = masterTable.get_dataItems()[i].get_element();
                            if (item.classList && item.classList.contains('trailer-last-master')) continue;
                            item.style.backgroundColor = "#FFFACD"; // yellow
                            item.style.color = "#000";              // black text
                        }
                    }

                    // Call after page load or after grid is rebound
                    Sys.Application.add_load(function () {
                        fixRadGridYellow("<%= grdLoadConsolidation.ClientID %>");
                    });

                    function forceRadGridYellow() {
                        var grid = $find("<%= grdLoadConsolidation.ClientID %>");
                        if (!grid) return;

                        var items = grid.get_masterTableView().get_dataItems();
                        for (var i = 0; i < items.length; i++) {
                            var row = items[i].get_element();
                            if (row.classList && row.classList.contains('trailer-last-master')) continue;
                            row.style.backgroundColor = "#FFFACD"; // yellow
                            row.style.color = "#000";              // black text
                        }
                    }

                    // Run after page load
                    Sys.Application.add_load(function () {
                        forceRadGridYellow();
                    });

                    function openNewWindow(animationUrl) {
                        var overlay = document.getElementById('truckloaderOverlay');
                        var iframe = document.getElementById("truckloaderIframe");

                        // Decide the uniform border style
                        const borderStyle = "1px solid #333"; // change as needed

                        // Apply to overlay (outer border)
                        overlay.style.setProperty("border", borderStyle, "important");
                        overlay.style.setProperty("border-radius", "0", "important");
                        overlay.style.setProperty("box-shadow", "none", "important");

                        // Apply to the inner element causing the inner border
                        // If the inner border is actually the iframe
                        iframe.style.setProperty("border", borderStyle, "important");
                        iframe.style.setProperty("border-radius", "0", "important");

                        // Optional: remove padding/margin that exaggerates borders
                        overlay.style.setProperty("padding", "0", "important");
                        overlay.style.setProperty("margin", "0", "important");

                        // Set iframe src and display overlay
                        iframe.onload = function () {
                            redirectTopIfTrailerIframeShowsLogin();
                        };
                        iframe.src = animationUrl;
                        overlay.style.display = "flex";

                        // Highlight the row if needed
                        var row = _pendingTrailerRow || document.querySelector('.trailer-selected-row');
                        if (row) {
                            row.classList.add('trailer-selected-row');
                            row.id = row.id || ('hlRow_' + Date.now());
                            overlay.setAttribute('data-highlighted-row-id', row.id);
                        }
                    }

                    function closeTrailerOverlay(e) {
                        // If the event exists, prevent default action (like form submission) and stop bubbling
                        if (e) {
                            e.preventDefault();
                            e.stopPropagation();
                        }

                        if (redirectTopIfTrailerIframeShowsLogin()) {
                            return false;
                        }

                        // Hide the overlay and reset the iframe
                        var overlay = document.getElementById("truckloaderOverlay");
                        var iframe = document.getElementById("truckloaderIframe");

                        if (overlay) overlay.style.display = "none";
                        if (iframe) iframe.src = "about:blank";

                        if (typeof selectedRowIndex !== 'undefined' && selectedRowIndex !== null) {
                            var grid = $find("<%= grdLoadConsolidation.ClientID %>");
                            if (grid) {
                                var masterTable = grid.get_masterTableView();
                                var item = masterTable.get_dataItems()[selectedRowIndex];
                                if (item) item.set_selected(true);
                            }
                        }

                        var mr = document.querySelector('.trailer-last-master');
                        if (mr && typeof mr.scrollIntoView === 'function') {
                            try { mr.scrollIntoView({ block: 'nearest', inline: 'nearest' }); } catch (ex) { mr.scrollIntoView(true); }
                        }

                        return false;
                    }


                    // This function will be called when the overlay (RadWindow) closes
                        function onOverlayClose(sender, args) {
                            // sender is the RadWindow object
                            // args contains event info (not needed here)

                            // Close the window without triggering postback
                            sender.close();

                        // OPTIONAL: Do something on the client-side after closing
                        // Example: hide a div or show a message
                        // document.getElementById("overlayMessage").style.display = "none";

                        // Prevent any default postback
                        return false;
                    }

                    function addGroupHeader(sender, args) {
                        var grid = sender.get_element();
                        var masterTable = grid.querySelector('.rgMasterTable');
                        if (!masterTable) return;
                        var thead = masterTable.querySelector('thead');
                        if (!thead) return;
                        // Avoid duplicate insertion
                        if (thead.querySelector('.rgGroupHeader')) return;
                        var headerRow = thead.querySelector('tr');
                        if (!headerRow) return;

                        // Count the expand/collapse column (first th)
                        var groupRow = document.createElement('tr');
                        groupRow.className = 'rgGroupHeader';

                        // Expand/collapse cell - spans 2 rows
                        var expandTh = document.createElement('th');
                        expandTh.rowSpan = 2;
                        expandTh.innerHTML = '&nbsp;';
                        groupRow.appendChild(expandTh);

                        // Consolidations group (3 columns: Strategies, Count, Savings (%))
                        var consolTh = document.createElement('th');
                                               consolTh.colSpan = 3;
                        consolTh.textContent = 'Efficiency Metrics';
                        consolTh.style.textAlign = 'center';
                        consolTh.style.color = '#555555';
                        consolTh.style.fontWeight = 'normal';  
                        
                        // Apply Telerik Skin Header Look to consolTh (Header)
                        consolTh.style.background = 'linear-gradient(to bottom, #f9f9f9, #e9e9e9)';  // Telerik skin-like gradient
                        consolTh.style.borderBottom = 'none';  // Remove bottom border
                        consolTh.style.borderRadius = '0';  // Sharp corners for a flat design

                        // Subtle inner shadow for a slight 3D effect, characteristic of Telerik
                        consolTh.style.boxShadow = 'inset 0 1px 3px rgba(0, 0, 0, 0.08), inset 0 -1px 3px rgba(0, 0, 0, 0.05)';

                        // Append to groupRow
                        groupRow.appendChild(consolTh);

                        // Variables group (4 columns: Shipments, Units, Weight, Cube)
                        var varTh = document.createElement('th');
                        varTh.colSpan = 4;
                        varTh.textContent = 'Shipments Summary';
                        varTh.style.textAlign = 'center';
                        varTh.style.color = '#555555';  // Standard text color for readability
                        varTh.style.fontWeight = 'normal';  // Regular font weight for clarity

                        // Apply Telerik-like style to varTh (same gradient and subtle design)
                        varTh.style.background = 'linear-gradient(to bottom, #f9f9f9, #e9e9e9)';  // Telerik skin-like gradient
                        varTh.style.borderBottom = 'none';  // Remove bottom border
                        varTh.style.borderRadius = '0';  // Sharp, flat corners

                        // Soft inner shadow for varTh to maintain Telerik consistency
                        varTh.style.boxShadow = 'inset 0 1px 3px rgba(0, 0, 0, 0.08), inset 0 -1px 3px rgba(0, 0, 0, 0.05)';

                        // Append to groupRow
                        groupRow.appendChild(varTh);

                        // Insert group row before the existing header row
                        thead.insertBefore(groupRow, headerRow);

                        // Remove the expand/collapse cell from the original header row
                        // since the group row's expand cell now spans 2 rows
                        var firstCell = headerRow.cells[0];
                        if (firstCell && !firstCell.textContent.trim()) {
                            headerRow.removeChild(firstCell);
                        }
                    }

                    function MenuItemClickingDisplayWait(sender, args) {

                        document.getElementById("wait1").style.display = 'block'

                    }

                    function MenuItemClickingCancelPostback(sender, args) {

                        document.getElementById("wait1").style.display = 'block'
                        // args.set_cancel(true);  // Cancel the postback
                    }

                    function OnClientRateModuleClose(sender, eventArgs) {
                        closeTrailerOverlay();
                        document.getElementById('<%= btnDummy.ClientID %>').click();
                    }
                    function onLoadConsolidationRowExpanded(sender, args) {
                        args.get_gridDataItem().set_selected(true);
                    }
                    function RefreshLoadConsolidationGrid() {
                        var masterTableOpen = $find("<%= grdLoadConsolidation.ClientID %>").get_masterTableView();
                        masterTableOpen.rebind();
                    }

                    var _savedScrollTop = 0;
                    var _savedGridScroll = 0;
                    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(function () {
                        _savedScrollTop = document.documentElement.scrollTop || document.body.scrollTop;
                        var gd = document.querySelector('#<%= grdLoadConsolidation.ClientID %>> .rgDataDiv');
                        _savedGridScroll = gd ? gd.scrollTop : 0;
                    });
                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                        window.scrollTo(0, _savedScrollTop);
                        setTimeout(function () {
                            var gd = document.querySelector('#<%= grdLoadConsolidation.ClientID %>> .rgDataDiv');
                            if (gd) gd.scrollTop = _savedGridScroll;
                        })
                    });

                </script>

<script type="text/javascript">
    (function () {

        // 🔹 CONFIG: tables + labels
        var tableConfigs = [
            ["Table_02", "Label_002", "Label_004"],
            ["Table_03", "Label_006", "Label_008"],
            ["Table_04", "Label_010", "Label_012"],
            ["Table_05", "Label_014", "Label_016"],
            ["Table_06", "Label_018", "Label_019"],
            //["Table_07", "Label_022", "Label_024"],
            ["Table_08", "Label_116"]
        ];

        // 🔹 Helper: check if label is empty
        function isEmpty(label) {
            if (!label) return true;
            var text = label.innerText || label.textContent || "";
            return text.replace(/\u00A0/g, ' ').trim().length === 0;
        }

        // 🔹 Process ONE row only
        function processRow(row) {

            var totalHeight = 0;

            tableConfigs.forEach(function (config) {

                // ✅ IMPORTANT: scope everything to THIS row
                var table = row.querySelector('[id$="' + config[0] + '"]');
                var label1 = row.querySelector('[id$="' + config[1] + '"]');
                var label2 = row.querySelector('[id$="' + config[2] + '"]');

                if (!table) return;

                // 🔹 Hide table if both labels empty
                if (isEmpty(label1) && isEmpty(label2)) {
                    table.style.display = "none";
                } else {
                    table.style.display = ""; // reset if previously hidden
                }

                // 🔹 Only count visible tables
                if (window.getComputedStyle(table).display !== "none") {
                    totalHeight += table.offsetHeight;
                }
            });

            // 🔹 Find overlay INSIDE this row
            var overlay = row.querySelector(".overlay");

            if (!overlay) return;

            // 🔹 Adjust overlay
            if (totalHeight > 0) {
                overlay.style.height = totalHeight + "px";
                overlay.style.display = "block";
            } else {
                overlay.style.height = "0px";
                overlay.style.display = "none";
            }
        }

        // 🔹 Process entire grid
        function processGrid() {

            // Telerik rows
            var rows = document.querySelectorAll(".rgMasterTable tr");

            rows.forEach(function (row) {

                // Skip header/footer rows
                if (!row.querySelector("td")) return;

                processRow(row);
            });
        }

        // 🔹 Telerik-safe load (handles AJAX postbacks too)
        function init() {
            processGrid();
        }

        if (typeof (Sys) !== "undefined") {
            Sys.Application.add_load(init);
        } else {
            document.addEventListener("DOMContentLoaded", init);
        }

    })();
</script>

<style>
#customLoading {
    position: fixed;   /* ensures it overlays everything */
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.3); /* optional dim background */
}
</style>

                <style>

/* Master table rows */
#grdLoadConsolidation .rgMasterTable .rgRow,
#grdLoadConsolidation .rgMasterTable .rgAltRow {
    background-color: #FFFACD !important;  /* yellow paper color */
}

/* Selected rows */
#grdLoadConsolidation .rgMasterTable .rgSelected,
#grdLoadConsolidation .rgMasterTable .rgRowSelected {
    background-color: #FFFACD !important;  /* keep yellow even when selected */
    color: #000 !important;                /* optional: black text */
}

/* Optional: hover effect (can keep light yellow) */
#grdLoadConsolidation .rgMasterTable .rgRow:hover,
#grdLoadConsolidation .rgMasterTable .rgAltRow:hover {
    background-color: #FFFFE0 !important;  /* slightly lighter yellow on hover */
}
                </style>

                <style>

                /* Remove rounded corners and borders for grdLoadConsolidation */
                #<%= grdLoadConsolidation.ClientID %> .rgRootTable {
                    border: none;        /* remove any border */
                    border-radius: 0;    /* sharp corners */
                    overflow: visible;   /* no clipping needed */
                }

                /* Remove rounded corners from header cells */
                #<%= grdLoadConsolidation.ClientID %> .rgHeader td:first-child,
                #<%= grdLoadConsolidation.ClientID %> .rgHeader td:last-child {
                    border-radius: 0;
                }

                /* Remove rounded corners from last row cells */
                #<%= grdLoadConsolidation.ClientID %> .rgMasterTable tr:last-child td:first-child,
                #<%= grdLoadConsolidation.ClientID %> .rgMasterTable tr:last-child td:last-child {
                    border-radius: 0;
                }                

                </style>

                <style type="text/css">
                    /* Remove top and bottom borders of the header, keep vertical borders */
                    .noTopBottomHeaderBorder .rgHeader, 
                    .noTopBottomHeaderBorder .rgHeader .rgHeaderInner {
                        border-top: none !important;
                        border-bottom: none !important;
                    }
                </style>

                <style type="text/css">

                    .overlay {
                        overflow: hidden;
                        transition: height 0.3s ease;
                    }


                </style>


                <style type="text/css">

/* High-polish chrome metallic look for grdLoadConsolidation hierarchy bar */
#grdLoadConsolidation .rgExpandCol {
    background: 
        linear-gradient(to bottom, #ffffff 0%, #d0d0d0 40%, #a0a0a0 60%, #f0f0f0 100%);
    border: 1px solid #888;               /* edge for depth */
    border-radius: 0;                     /* sharp corners */
    box-shadow: 
        inset 0 1px 2px rgba(255,255,255,0.7),   /* top highlight */
        inset 0 -1px 2px rgba(0,0,0,0.4),       /* bottom shadow */
        0 1px 1px rgba(0,0,0,0.2);              /* subtle outer shadow */
    width: 20px;
    height: 100%;
    position: relative;
    overflow: hidden;
}
/* Optional: subtle reflection line */
#grdLoadConsolidation .rgExpandCol::after {
    content: '';
    position: absolute;
    top: 5%;
    left: 0;
    width: 100%;
    height: 20%;
    background: linear-gradient(to bottom, rgba(255,255,255,0.6), rgba(255,255,255,0));
    border-radius: 0;   /* sharp corners */
}

/* Center the plus/minus icon */
#grdLoadConsolidation .rgExpandCol img {
    display: block;
    margin: auto;
    position: relative; /* so reflection doesn't cover */
    z-index: 1;
}

/* Hover: bright metallic shine */
#grdLoadConsolidation .rgExpandCol:hover {
    background: linear-gradient(to bottom, #ffffff 0%, #c0c0c0 40%, #909090 60%, #f8f8f8 100%);
    box-shadow: 
        inset 0 2px 4px rgba(255,255,255,0.8),
        inset 0 -2px 4px rgba(0,0,0,0.5),
        0 2px 2px rgba(0,0,0,0.2);
    cursor: pointer;
}

                </style>



                <style type="text/css">


#grdLoadConsolidation .rgRow,
#grdLoadConsolidation .rgAltRow,
#grdLoadConsolidation .rgSelected,
#grdLoadConsolidation .rgRowSelected {
    background-color: #FFFACD !important;
    color: #000 !important;
}

                </style>

                <style type="text/css">

#grdLoadConsolidation .rgRow,
#grdLoadConsolidation .rgAltRow {
    background-color: #FFFACD !important;
    color: #000 !important;
    border: 1px solid #FFD700; /* thin golden lines for notepad effect */
}

                </style>

                <style type="text/css">
                    .custom-fullscreen-modal {
                        z-index: 1000000 !important;
                    }

                    div.flash-warning,
                    #flash-warning-message {
                        display: none !important;
                    }

                    label {
                        font-size: 10px;
                    }

                    .btnStyle {
                        position: relative;
                        color: black;
                        box-shadow: 0 0px 0 #5b7a6b, 0 2px 0 #444, 0 2px 2px rgba(0, 0, 0, 0.9);
                        -webkit-transform: translateY(3px);
                        -webkit-animation: none;
                        animation: pulsate;
                        border: 1px solid #5b7a6b;
                        border-radius: 0;           /* sharp corners for all browsers */
                        -webkit-border-radius: 0;   /* remove old webkit rounding */
                        -moz-border-radius: 0;      /* remove old Firefox rounding */
                        -ms-border-radius: 0;       /* remove old IE rounding */
                        cursor: pointer;
                        -webkit-animation: pulse 1.25s infinite cubic-bezier(0.66, 0, 0, 1);
                        -moz-animation: pulse 1.25s infinite cubic-bezier(0.66, 0, 0, 1);
                        -ms-animation: pulse 1.25s infinite cubic-bezier(0.66, 0, 0, 1);
                        animation: pulse 1.25s infinite cubic-bezier(0.66, 0, 0, .1);
                    }
                    .pulse-button:hover {
                        -webkit-animation: none;
                        -moz-animation: none;
                        -ms-animation: none;
                        animation: none;
                    }

                    @-webkit-keyframes@-webkit-keyframes@-webkit-keyframespulse {
                        to {
                            box-shadow: 00045pxrgba(232, 76, 61, 0);
                        }

                        @-moz-keyframespulse {
                            to {
                                box-shadow: 00045pxrgba(232, 76, 61, 0);
                            }

                            @-ms-keyframespulse {
                                to {
                                    box-shadow: 00045pxrgba(232, 76, 61, 0);
                                }

                                @keyframespulse {
                                    to {
                                        box-shadow: 00045pxrgba(232, 76, 61, 0);
                                    }
                </style>





                <style type="text/css">
                    .RadInputRTL {
                        text-align: left !important;
                    }
                </style>
                <link rel="Stylesheet" href="script/kendo.default.css" />
                <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
                <script src="script/kendo.all.min.js"></script>
                <script type="text/javascript">
                    function loadPanelBar(sender) {
                        var panelBar = sender;
                        for (var i = panelBar.get_allItems().length - 1; i > -1; i--) {
                            panelBar.get_allItems()[i].expand();
                        }
                        panelBar.get_allItems()[0].expand();
                        panelBar.get_allItems()[panelBar.get_allItems().length - 1].collapse();

                    }
                    $(document).ready(function () {
                        var dataSource = [
                            {
                                "Text": "Top Global Manufacturers",
                                "flagPath": "blank.png",
                                imageUrl: "./flags/blank.png",
                                "Id": 112,
                                "Areas": [
                                    {
                                        "Text": "China",
                                        "Id": 692,
                                        "flagPath": "cn.png",
                                        imageUrl: "./flags/cn.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "United States (CONUS)",
                                        "Id": 111,
                                        "flagPath": "us.png",
                                        imageUrl: "./flags/us.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Japan",
                                        "Id": 693,
                                        "flagPath": "jp.png",
                                        imageUrl: "./flags/jp.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Germany",
                                        "Id": 562,
                                        "flagPath": "de.png",
                                        imageUrl: "./flags/de.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "India",
                                        "Id": 694,
                                        "flagPath": "in.png",
                                        imageUrl: "./flags/in.png",
                                        "Areas": []
                                  },
                                     {
                                        "Text": "Korea, South",
                                        "Id": 695,
                                        "flagPath": "kr.png",
                                        imageUrl: "./flags/kr.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Mexico",
                                        "Id": 502,
                                        "flagPath": "mx.png",
                                        imageUrl: "./flags/mx.png",
                                        "Areas": []
                                     },
                                    {
                                        "Text": "Italy",
                                        "Id": 565,
                                        "flagPath": "it.png",
                                        imageUrl: "./flags/it.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Russia",
                                        "Id": 608,
                                        "flagPath": "ru.png",
                                        imageUrl: "./flags/ru.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "France",
                                        "Id": 564,
                                         "flagPath": "fr.png",
                                        imageUrl: "./flags/fr.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "United Kingdom",
                                        "Id": 563,
                                        "flagPath": "gb.png",
                                        imageUrl: "./flags/gb.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Indonesia",
                                        "Id": 696,
                                        "flagPath": "id.png",
                                        imageUrl: "./flags/id.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Brazil",
                                        "Id": 511,
                                        "flagPath": "br.png",
                                        imageUrl: "./flags/br.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Ireland (Eire)",
                                        "Id": 573,
                                        "flagPath": "ie.png",
                                        imageUrl: "./flags/ie.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Canada",
                                        "Id": 501,
                                        "flagPath": "ca.png",
                                        imageUrl: "./flags/ca.png",
                                        "Areas": []
                                    }


                                ]
                            },

                            {
                                "Text": "Contiguous 48 United States",
                                "Id": 111,
                                         "flagPath": "us.png",
                                        imageUrl: "./flags/us.png",
                               "Areas": [
                                    {
                                        "Text": "California",
                                        "Id": 900,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Texas",
                                        "Id": 901,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Illinois",
                                        "Id": 902,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Pennsylvania",
                                        "Id": 903,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Ohio",
                                        "Id": 904,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "New York",
                                        "Id": 905,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Michigan",
                                        "Id": 906,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Florida",
                                        "Id": 907,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Georgia",
                                        "Id": 908,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "New Jersey",
                                        "Id": 909,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "North Carolina",
                                        "Id": 910,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Indiana",
                                        "Id": 911,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Tennessee",
                                        "Id": 912,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Washington",
                                        "Id": 913,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Wisconsin",
                                        "Id": 914,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Alabama",
                                        "Id": 915,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Arizona",
                                        "Id": 916,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Arkansas",
                                        "Id": 917,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Colorado",
                                        "Id": 918,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Connecticut",
                                        "Id": 919,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Delaware",
                                        "Id": 920,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Idaho",
                                        "Id": 921,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Iowa",
                                        "Id": 922,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Kansas",
                                        "Id": 923,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Kentucky",
                                        "Id": 924,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Louisiana",
                                        "Id": 925,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Maine",
                                        "Id": 926,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Maryland",
                                        "Id": 927,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Massachusetts",
                                        "Id": 928,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Minnesota",
                                        "Id": 929,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Mississippi",
                                        "Id": 930,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Missouri",
                                        "Id": 931,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Montana",
                                        "Id": 932,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Nebraska",
                                        "Id": 933,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Nevada",
                                        "Id": 934,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "New Hampshire",
                                        "Id": 935,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "New Mexico",
                                        "Id": 936,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "North Dakota",
                                        "Id": 937,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Oklahoma",
                                        "Id": 938,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Oregon",
                                        "Id": 939,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Rhode Island",
                                        "Id": 940,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "South Carolina",
                                        "Id": 941,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "South Dakota",
                                        "Id": 942,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Utah",
                                        "Id": 943,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Vermont",
                                        "Id": 944,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Virginia",
                                        "Id": 945,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "West Virginia",
                                        "Id": 946,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Wyoming",
                                        "Id": 947,
                                        "flagPath": "u2.png",
                                        imageUrl: "./flags/u2.png",
                                        "Areas": []
                                    }
                                ]
                            },


                            {
                                "Text": "North America",
                                "flagPath": "blank.png",
                                imageUrl: "./flags/blank.png",
                                "Id": 100,
                                "Areas": [
                                    {
                                        "Text": "United States (CONUS)",
                                        "Id": 111,
                                        "flagPath": "us.png",
                                        imageUrl: "./flags/us.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Canada",
                                        "Id": 501,
                                        "flagPath": "ca.png",
                                        imageUrl: "./flags/ca.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Mexico",
                                        "Id": 502,
                                        "flagPath": "mx.png",
                                        imageUrl: "./flags/mx.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Saint Pierre & Miquelon",
                                        "Id": 503,
                                        "flagPath": "pm.png",
                                        imageUrl: "./flags/pm.png",
                                        "Areas": []
                                    }
                                ]
                            },
                            {
                                "Text": "Asia",
                                "flagPath": "blank.png",
                                imageUrl: "./flags/blank.png",
                                "Id": 101,
                                "Areas": [
                                    {
                                        "Text": "Asia, Northeast",
                                        "Id": 1,
                                        "Areas": [
                                            {
                                                "Text": "China",
                                                "flagPath": "cn.png",
                                                imageUrl: "./flags/cn.png",
                                                "Id": 692,
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Japan",
                                                "flagPath": "jp.png",
                                                imageUrl: "./flags/jp.png",
                                                "Id": 693,
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Korea, South",
                                                "Id": 695,
                                                "flagPath": "jp.png",
                                                imageUrl: "./flags/kr.png",
                                               "Areas": []
                                            },
                                            {
                                                "Text": "Hong Kong",
                                                "Id": 704,
                                                "flagPath": "hk.png",
                                                imageUrl: "./flags/hk.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Macau",
                                                "Id": 711,
                                                "flagPath": "mo.png",
                                                imageUrl: "./flags/mo.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Mongolia",
                                                "Id": 712,
                                                "flagPath": "mn.png",
                                                imageUrl: "./flags/mn.png",
                                                 "Areas": []
                                            },
                                            {
                                                "Text": "Korea, North",
                                                "Id": 720,
                                                "flagPath": "kp.png",
                                                imageUrl: "./flags/kp.png",
                                                 "Areas": []
                                          },
                                            {
                                                "Text": "Taiwan",
                                                "Id": 721,
                                                "flagPath": "tw.png",
                                                imageUrl: "./flags/tw.png",
                                                "Areas": []
                                            }
                                        ]
                                    },
                                    {
                                        "Text": "Asia, South",
                                        "Id": 2,
                                        "Areas": [
                                            {
                                                "Text": "India",
                                                "Id": 694,
                                                "flagPath": "in.png",
                                                imageUrl: "./flags/in.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Bangladesh",
                                                "Id": 699,
                                               "flagPath": "bd.png",
                                                imageUrl: "./flags/bd.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Pakistan",
                                                "Id": 703,
                                               "flagPath": "pk.png",
                                                imageUrl: "./flags/pk.png",
                                               "Areas": []
                                            },
                                            {
                                                "Text": "Sri Lanka",
                                                "Id": 707,
                                                "flagPath": "lk.png",
                                                imageUrl: "./flags/lk.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Nepal",
                                                "Id": 709,
                                                "flagPath": "np.png",
                                                imageUrl: "./flags/np.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Maldives",
                                                "Id": 717,
                                                "flagPath": "mv.png",
                                                imageUrl: "./flags/mv.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Afghanistan",
                                                "Id": 718,
                                                "flagPath": "af.png",
                                                imageUrl: "./flags/af.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Bhutan",
                                                "Id": 719,
                                                "flagPath": "bt.png",
                                                imageUrl: "./flags/bt.png",
                                                "Areas": []
                                            }
                                        ]
                                    },
                                    {
                                        "Text": "Asia, Southeast",
                                        "Id": 3,
                                        "Areas": [
                                            {
                                                "Text": "Indonesia",
                                                "Id": 696,
                                                "flagPath": "id.png",
                                                imageUrl: "./flags/id.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Thailand",
                                                "Id": 697,
                                                "flagPath": "th.png",
                                                imageUrl: "./flags/th.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Singapore",
                                                "Id": 698,
                                                "flagPath": "sg.png",
                                                imageUrl: "./flags/sg.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Malaysia",
                                                "Id": 701,
                                                "flagPath": "my.png",
                                                imageUrl: "./flags/my.png",
                                               "Areas": []
                                            },
                                            {
                                                "Text": "Philippines",
                                                "Id": 702,
                                                "flagPath": "ph.png",
                                                imageUrl: "./flags/ph.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Myanmar",
                                                "Id": 708,
                                                "flagPath": "mm.png",
                                                imageUrl: "./flags/mm.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Cambodia",
                                                "Id": 710,
                                               "flagPath": "kh.png",
                                                imageUrl: "./flags/kh.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Brunei Darussalam",
                                                "Id": 713,
                                                "flagPath": "bn.png",
                                                imageUrl: "./flags/bn.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Laos",
                                                "Id": 714,
                                                "flagPath": "la.png",
                                                imageUrl: "./flags/la.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Timor-Leste",
                                                "Id": 728,
                                                "flagPath": "tl.png",
                                                imageUrl: "./flags/tl.png",
                                                "Areas": []
                                            }
                                        ]
                                    },
                                    {
                                        "Text": "Asia, Central",
                                        "Id": 4,
                                        "Areas": [
                                            {
                                                "Text": "Kazakhstan",
                                                "Id": 705,
                                                "flagPath": "kz.png",
                                                imageUrl: "./flags/kz.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Uzbekistan",
                                                "Id": 706,
                                                "flagPath": "uz.png",
                                                imageUrl: "./flags/uz.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Kyrgyzstan",
                                                "Id": 715,
                                                "flagPath": "kg.png",
                                                imageUrl: "./flags/kg.png",
                                                 "Areas": []
                                            },
                                            {
                                                "Text": "Tajikistan",
                                                "flagPath": "tj.png",
                                                imageUrl: "./flags/tj.png",
                                                "Id": 716,
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Turkmenistan",
                                                "Id": 722,
                                                "flagPath": "tm.png",
                                                imageUrl: "./flags/tm.png",
                                                "Areas": []
                                            }
                                        ]
                                    }
                                ]
                            },
                            {
                                "Text": "European Union",
                                "flagPath": "blank.png",
                                imageUrl: "./flags/blank.png",
                                "Id": 5,
                                "Areas": [
                                    {
                                        "Text": "Germany",
                                        "flagPath": "de.png",
                                        imageUrl: "./flags/de.png",
                                        "Id": 562,
                                        "Areas": []
                                    },
                                    {
                                        "Text": "France",
                                         "flagPath": "fr.png",
                                        imageUrl: "./flags/fr.png",
                                       "Id": 564,
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Italy",
                                        "Id": 565,
                                        "flagPath": "it.png",
                                        imageUrl: "./flags/it.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Spain",
                                        "Id": 566,
                                        "flagPath": "es.png",
                                        imageUrl: "./flags/es.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "The Netherlands",
                                        "Id": 567,
                                        "flagPath": "nl.png",
                                        imageUrl: "./flags/nl.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Poland",
                                        "Id": 569,
                                        "flagPath": "pl.png",
                                        imageUrl: "./flags/pl.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Sweden",
                                        "Id": 570,
                                        "flagPath": "se.png",
                                        imageUrl: "./flags/se.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Belgium",
                                        "Id": 572,
                                        "flagPath": "be.png",
                                        imageUrl: "./flags/be.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Ireland (Eire)",
                                        "Id": 573,
                                        "flagPath": "ie.png",
                                        imageUrl: "./flags/ie.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Austria",
                                        "Id": 574,
                                        "flagPath": "at.png",
                                        imageUrl: "./flags/at.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Denmark",
                                        "Id": 575,
                                        "flagPath": "dk.png",
                                        imageUrl: "./flags/dk.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Romania",
                                        "Id": 576,
                                        "flagPath": "ro.png",
                                        imageUrl: "./flags/ro.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Finland",
                                        "Id": 577,
                                        "flagPath": "fi.png",
                                        imageUrl: "./flags/fi.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Portugal",
                                        "Id": 578,
                                        "flagPath": "pt.png",
                                        imageUrl: "./flags/pt.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Greece",
                                        "Id": 579,
                                        "flagPath": "gr.png",
                                        imageUrl: "./flags/gr.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Hungary",
                                        "Id": 580,
                                        "flagPath": "hu.png",
                                        imageUrl: "./flags/hu.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Slovakia",
                                        "Id": 581,
                                        "flagPath": "sk.png",
                                        imageUrl: "./flags/sk.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Bulgaria",
                                        "Id": 582,
                                        "flagPath": "bg.png",
                                        imageUrl: "./flags/bg.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Luxembourg",
                                        "Id": 583,
                                        "flagPath": "lu.png",
                                        imageUrl: "./flags/lu.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Lithuania",
                                        "Id": 584,
                                        "flagPath": "lt.png",
                                        imageUrl: "./flags/lt.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Slovenia",
                                        "Id": 585,
                                        "flagPath": "si.png",
                                        imageUrl: "./flags/si.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Latvia",
                                        "Id": 586,
                                        "flagPath": "lv.png",
                                        imageUrl: "./flags/lv.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Estonia",
                                        "Id": 587,
                                        "flagPath": "ee.png",
                                        imageUrl: "./flags/ee.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Holland",
                                        "Id": 596,
                                        "flagPath": "nl.png",
                                        imageUrl: "./flags/nl.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Cyprus",
                                        "Id": 602,
                                        "flagPath": "cy.png",
                                        imageUrl: "./flags/cy.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Malta",
                                        "Id": 603,
                                        "flagPath": "mt.png",
                                        imageUrl: "./flags/mt.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Czech Republic",
                                        "Id": 610,
                                        "flagPath": "cz.png",
                                        imageUrl: "./flags/cz.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Croatia",
                                        "Id": 614,
                                        "flagPath": "hr.png",
                                        imageUrl: "./flags/hr.png",
                                        "Areas": []
                                    }
                                ]
                            },
                            {
                                "Text": "Europe",
                                "flagPath": "blank.png",
                                imageUrl: "./flags/blank.png",
                                "Id": 6,
                                "Areas": [
                                    {
                                        "Text": "United Kingdom",
                                        "Id": 563,
                                        "flagPath": "gb.png",
                                        imageUrl: "./flags/gb.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Switzerland",
                                        "flagPath": "ch.png",
                                        imageUrl: "./flags/ch.png",
                                        "Id": 568,
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Norway",
                                        "Id": 571,
                                        "flagPath": "no.png",
                                        imageUrl: "./flags/no.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Iceland",
                                        "Id": 588,
                                        "flagPath": "is.png",
                                        imageUrl: "./flags/is.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Montenegro",
                                        "Id": 589,
                                        "flagPath": "me.png",
                                        imageUrl: "./flags/me.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Azores",
                                        "Id": 590,
                                        "flagPath": "ap.png",
                                        imageUrl: "./flags/ap.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Canary Islands",
                                        "Id": 591,
                                        "flagPath": "ic.png",
                                        imageUrl: "./flags/ic.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Channel Islands",
                                        "Id": 592,
                                        "flagPath": "im.png",
                                        imageUrl: "./flags/im.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Faroe Islands",
                                        "Id": 593,
                                        "flagPath": "fo.png",
                                        imageUrl: "./flags/fo.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Greenland",
                                        "Id": 594,
                                        "flagPath": "gl.png",
                                        imageUrl: "./flags/gl.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Guernsey",
                                        "Id": 595,
                                        "flagPath": "gs.png",
                                        imageUrl: "./flags/gs.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Liechtenstein",
                                        "Id": 597,
                                        "flagPath": "li.png",
                                        imageUrl: "./flags/li.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Northern Ireland",
                                        "Id": 598,
                                        "flagPath": "nb.png",
                                        imageUrl: "./flags/nb.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Scotland",
                                        "Id": 599,
                                        "flagPath": "sf.png",
                                        imageUrl: "./flags/sf.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Vatican City",
                                        "Id": 600,
                                        "flagPath": "va.png",
                                        imageUrl: "./flags/va.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Wales",
                                        "Id": 601,
                                        "flagPath": "wl.png",
                                        imageUrl: "./flags/wl.png",
                                        "Areas": []
                                    }
                                ]
                            },
                            {
                                "Text": "Eastern Europe",
                                "flagPath": "blank.png",
                                imageUrl: "./flags/blank.png",
                                "Id": 103,
                                "Areas": [
                                    {
                                        "Text": "Russia",
                                        "Id": 608,
                                        "flagPath": "ru.png",
                                        imageUrl: "./flags/ru.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Turkey",
                                        "Id": 609,
                                        "flagPath": "tr.png",
                                        imageUrl: "./flags/tr.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Ukraine",
                                        "Id": 611,
                                        "flagPath": "ua.png",
                                        imageUrl: "./flags/ua.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Azerbaijan",
                                        "Id": 612,
                                        "flagPath": "az.png",
                                        imageUrl: "./flags/az.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Belarus",
                                        "Id": 613,
                                        "flagPath": "by.png",
                                        imageUrl: "./flags/by.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Serbia",
                                        "Id": 615,
                                        "flagPath": "rs.png",
                                        imageUrl: "./flags/rs.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Georgia",
                                        "Id": 616,
                                        "flagPath": "ge.png",
                                        imageUrl: "./flags/ge.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Armenia",
                                        "Id": 617,
                                        "flagPath": "am.png",
                                        imageUrl: "./flags/am.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Albania",
                                        "Id": 618,
                                        "flagPath": "al.png",
                                        imageUrl: "./flags/al.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Moldova",
                                        "Id": 619,
                                        "flagPath": "md.png",
                                        imageUrl: "./flags/md.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "North Macedonia",
                                        "Id": 620,
                                        "flagPath": "mk.png",
                                        imageUrl: "./flags/mk.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Bosnia & Herzegovina",
                                        "Id": 621,
                                        "flagPath": "ba.png",
                                        imageUrl: "./flags/ba.png",
                                        "Areas": []
                                    }
                                ]
                            },
                            {
                                "Text": "Middle East",
                                "flagPath": "blank.png",
                                imageUrl: "./flags/blank.png",
                                "Id": 104,
                                "Areas": [
                                    {
                                        "Text": "Saudi Arabia",
                                        "Id": 622,
                                        "flagPath": "sa.png",
                                        imageUrl: "./flags/sa.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Israel",
                                        "Id": 623,
                                        "flagPath": "il.png",
                                        imageUrl: "./flags/il.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "United Arab Emirates",
                                        "Id": 624,
                                        "flagPath": "ae.png",
                                        imageUrl: "./flags/ae.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Egypt",
                                        "Id": 625,
                                        "flagPath": "eg.png",
                                        imageUrl: "./flags/eg.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Iran",
                                        "Id": 626,
                                        "flagPath": "ir.png",
                                        imageUrl: "./flags/ir.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Iraq",
                                        "Id": 627,
                                        "flagPath": "iq.png",
                                        imageUrl: "./flags/iq.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Qatar",
                                        "Id": 628,
                                        "flagPath": "qa.png",
                                        imageUrl: "./flags/qa.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Kuwait",
                                        "Id": 629,
                                        "flagPath": "kw.png",
                                        imageUrl: "./flags/kw.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Oman",
                                        "Id": 630,
                                        "flagPath": "om.png",
                                        imageUrl: "./flags/om.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Jordan",
                                        "Id": 631,
                                        "flagPath": "jo.png",
                                        imageUrl: "./flags/jo.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Bahrain",
                                        "Id": 632,
                                        "flagPath": "bh.png",
                                        imageUrl: "./flags/bh.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Palestinian Authority",
                                        "Id": 633,
                                        "flagPath": "ps.png",
                                        imageUrl: "./flags/ps.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Lebanon",
                                        "Id": 634,
                                        "flagPath": "lb.png",
                                        imageUrl: "./flags/lb.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Syria",
                                        "Id": 635,
                                        "flagPath": "sy.png",
                                        imageUrl: "./flags/sy.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Yemen",
                                        "Id": 636,
                                        "flagPath": "ye.png",
                                        imageUrl: "./flags/ye.png",
                                        "Areas": []
                                    }
                                ]
                            },
                            {
                                "Text": "South America",
                                "flagPath": "blank.png",
                                imageUrl: "./flags/blank.png",
                                "Id": 105,
                                "Areas": [
                                    {
                                        "Text": "Brazil",
                                        "Id": 511,
                                        "flagPath": "br.png",
                                        imageUrl: "./flags/br.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Argentina",
                                        "Id": 512,
                                        "flagPath": "ar.png",
                                        imageUrl: "./flags/ar.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Colombia",
                                        "Id": 513,
                                        "flagPath": "co.png",
                                        imageUrl: "./flags/co.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Chile",
                                        "Id": 514,
                                        "flagPath": "cl.png",
                                        imageUrl: "./flags/cl.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Peru",
                                        "Id": 515,
                                        "flagPath": "pe.png",
                                        imageUrl: "./flags/pe.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Ecuador",
                                        "Id": 516,
                                        "flagPath": "ec.png",
                                        imageUrl: "./flags/ec.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Uruguay",
                                        "Id": 517,
                                        "flagPath": "uy.png",
                                        imageUrl: "./flags/uy.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Bolivia",
                                        "Id": 518,
                                        "flagPath": "bo.png",
                                        imageUrl: "./flags/bo.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Paraguay",
                                        "Id": 519,
                                        "flagPath": "py.png",
                                        imageUrl: "./flags/py.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Guyana",
                                        "Id": 520,
                                        "flagPath": "gy.png",
                                        imageUrl: "./flags/gy.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Suriname",
                                        "Id": 521,
                                        "flagPath": "sr.png",
                                        imageUrl: "./flags/sr.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Falkland Islands",
                                        "Id": 522,
                                        "flagPath": "fk.png",
                                        imageUrl: "./flags/fk.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "French Guiana",
                                        "Id": 523,
                                        "flagPath": "gf.png",
                                        imageUrl: "./flags/gf.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Venezuela",
                                        "Id": 524,
                                        "flagPath": "ve.png",
                                        imageUrl: "./flags/ve.png",
                                        "Areas": []
                                    }
                                ]
                            },
                            {
                                "Text": "Africa",
                                "flagPath": "blank.png",
                                imageUrl: "./flags/blank.png",
                                "Id": 106,
                                "Areas": [
                                    {
                                        "Text": "Africa, North",
                                        "Id": 7,
                                        "Areas": [
                                            {
                                                "Text": "Algeria",
                                                "Id": 639,
                                                "flagPath": "dz.png",
                                                imageUrl: "./flags/dz.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Morocco",
                                                "Id": 640,
                                                "flagPath": "ma.png",
                                                imageUrl: "./flags/ma.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Tunisia",
                                                "Id": 649,
                                                "flagPath": "tn.png",
                                                imageUrl: "./flags/tn.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Libyan Arab Jamahiriya",
                                                "Id": 650,
                                                "flagPath": "ly.png",
                                                imageUrl: "./flags/ly.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Sudan",
                                                "Id": 691,
                                                "flagPath": "sd.png",
                                                imageUrl: "./flags/sd.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "South Sudan",
                                                "Id": 648,
                                                "flagPath": "ss.png",
                                                imageUrl: "./flags/ss.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Western Sahara",
                                                "Id": 760,
                                                "flagPath": "eh.png",
                                                imageUrl: "./flags/eh.png",
                                                "Areas": []
                                            }
                                        ]
                                    },
                                    {
                                        "Text": "Africa, Central",
                                        "Id": 8,
                                        "Areas": [
                                            {
                                                "Text": "Angola",
                                                "Id": 643,
                                                "flagPath": "ao.png",
                                                imageUrl: "./flags/ao.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Congo, DR",
                                                "Id": 647,
                                                "flagPath": "cd.png",
                                                imageUrl: "./flags/cd.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Cameroon",
                                                "Id": 652,
                                                "flagPath": "cm.png",
                                                imageUrl: "./flags/cm.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Congo",
                                                "Id": 662,
                                                "flagPath": "cg.png",
                                                imageUrl: "./flags/cg.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Chad",
                                                "Id": 667,
                                                "flagPath": "td.png",
                                                imageUrl: "./flags/td.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Equatorial Guinea",
                                                "Id": 669,
                                                "flagPath": "gq.png",
                                                imageUrl: "./flags/gq.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "CAR",
                                                "Id": 677,
                                                "flagPath": "cf.png",
                                                imageUrl: "./flags/cf.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Sao Tome & Principe",
                                                "Id": 683,
                                                "flagPath": "st.png",
                                                imageUrl: "./flags/st.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Gabon",
                                                "Id": 687,
                                                "flagPath": "ga.png",
                                                imageUrl: "./flags/ga.png",
                                                "Areas": []
                                            }
                                        ]
                                    },
                                    {
                                        "Text": "Africa, South",
                                        "Id": 9,
                                        "Areas": [
                                            {
                                                "Text": "South Africa",
                                                "Id": 638,
                                                "flagPath": "za.png",
                                                imageUrl: "./flags/za.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Botswana",
                                                "Id": 656,
                                                "flagPath": "bw.png",
                                                imageUrl: "./flags/bw.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "eSwatini",
                                                "Id": 672,
                                                "flagPath": "sz.png",
                                                imageUrl: "./flags/sz.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Lesotho",
                                                "Id": 676,
                                                "flagPath": "ls.png",
                                                imageUrl: "./flags/ls.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Namibia",
                                                "Id": 668,
                                                "flagPath": "na.png",
                                                imageUrl: "./flags/na.png",
                                                "Areas": []
                                            }
                                        ]
                                    },
                                    {
                                        "Text": "Africa, East",
                                        "Id": 10,
                                        "Areas": [
                                            {
                                                "Text": "Ethiopia",
                                                "Id": 641,
                                                "flagPath": "et.png",
                                                imageUrl: "./flags/et.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Kenya",
                                                "Id": 642,
                                                "flagPath": "ke.png",
                                                imageUrl: "./flags/ke.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Tanzania",
                                                "Id": 644,
                                                "flagPath": "tz.png",
                                                imageUrl: "./flags/tz.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Uganda",
                                                "Id": 651,
                                                "flagPath": "ug.png",
                                                imageUrl: "./flags/ug.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Zambia",
                                                "Id": 653,
                                                "flagPath": "zm.png",
                                                imageUrl: "./flags/zm.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Zimbabwe",
                                                "Id": 655,
                                                "flagPath": "zw.png",
                                                imageUrl: "./flags/zw.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Mozambique",
                                                "Id": 659,
                                                "flagPath": "mz.png",
                                                imageUrl: "./flags/mz.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Madagascar",
                                                "Id": 661,
                                                "flagPath": "mg.png",
                                                imageUrl: "./flags/mg.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Rwanda",
                                                "Id": 664,
                                                "flagPath": "rw.png",
                                                imageUrl: "./flags/rw.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Malawi",
                                                "Id": 665,
                                                "flagPath": "mw.png",
                                                imageUrl: "./flags/mw.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Burundi",
                                                "Id": 675,
                                                "flagPath": "bi.png",
                                                imageUrl: "./flags/bi.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Seychelles",
                                                "Id": 681,
                                                "flagPath": "sc.png",
                                                imageUrl: "./flags/sc.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Comoros",
                                                "Id": 682,
                                                "flagPath": "km.png",
                                                imageUrl: "./flags/km.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Djibouti",
                                                "Id": 684,
                                                "flagPath": "dj.png",
                                                imageUrl: "./flags/dj.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Eritrea",
                                                "Id": 685,
                                                "flagPath": "er.png",
                                                imageUrl: "./flags/er.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Reunion",
                                                "Id": 689,
                                                "flagPath": "re.png",
                                                imageUrl: "./flags/re.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Mayotte",
                                                "Id": 688,
                                                "flagPath": "yt.png",
                                                imageUrl: "./flags/yt.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Somalia",
                                                "Id": 690,
                                                "flagPath": "so.png",
                                                imageUrl: "./flags/so.png",
                                                "Areas": []
                                            }
                                        ]
                                    },
                                    {
                                        "Text": "Africa, West",
                                        "Id": 11,
                                        "Areas": [
                                            {
                                                "Text": "Nigeria",
                                                "Id": 637,
                                                "flagPath": "ng.png",
                                                imageUrl: "./flags/ng.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Ghana",
                                                "Id": 645,
                                                "flagPath": "gh.png",
                                                imageUrl: "./flags/gh.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Ivory Coast",
                                                "Id": 646,
                                                "flagPath": "ci.png",
                                                imageUrl: "./flags/ci.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Senegal",
                                                "Id": 654,
                                                "flagPath": "sn.png",
                                                imageUrl: "./flags/sn.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Burkina Faso",
                                                "Id": 657,
                                                "flagPath": "bf.png",
                                                imageUrl: "./flags/bf.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Mali",
                                                "Id": 658,
                                                "flagPath": "ml.png",
                                                imageUrl: "./flags/ml.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Benin",
                                                "Id": 660,
                                                "flagPath": "bj.png",
                                                imageUrl: "./flags/bj.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Niger",
                                                "Id": 663,
                                                "flagPath": "ne.png",
                                                imageUrl: "./flags/ne.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Mauritius",
                                                "Id": 666,
                                                "flagPath": "mu.png",
                                                imageUrl: "./flags/mu.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Saint Helena",
                                                "Id": 723,
                                                "flagPath": "sh.png",
                                                imageUrl: "./flags/sh.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Mauritania",
                                                "Id": 670,
                                                "flagPath": "mr.png",
                                                imageUrl: "./flags/mr.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Togo",
                                                "Id": 671,
                                                "flagPath": "tg.png",
                                                imageUrl: "./flags/tg.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Liberia",
                                                "Id": 673,
                                                "flagPath": "lr.png",
                                                imageUrl: "./flags/lr.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Sierra Leone",
                                                "Id": 674,
                                                "flagPath": "sl.png",
                                                imageUrl: "./flags/sl.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Cape Verde",
                                                "Id": 678,
                                                "flagPath": "cv.png",
                                                imageUrl: "./flags/cv.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Gambia",
                                                "Id": 679,
                                                "flagPath": "gm.png",
                                                imageUrl: "./flags/gm.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "Guinea-Bissau",
                                                "Id": 680,
                                                "flagPath": "gw.png",
                                                imageUrl: "./flags/gw.png",
                                                "Areas": []
                                            },
                                            {
                                                "Text": "TAAF",
                                                "Id": 686,
                                                "flagPath": "tf.png",
                                                imageUrl: "./flags/tf.png",
                                                "Areas": []
                                            }
                                        ]
                                    }
                                ]
                            },
                            {
                                "Text": "Oceania",
                                "flagPath": "blank.png",
                                imageUrl: "./flags/blank.png",
                                "Id": 107,
                                "Areas": [
                                    {
                                        "Text": "Australia",
                                        "Id": 724,
                                        "flagPath": "tf.png",
                                        imageUrl: "./flags/au.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "New Zealand",
                                        "Id": 725,
                                        "flagPath": "nz.png",
                                        imageUrl: "./flags/nz.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Papua New Guinea",
                                        "Id": 726,
                                        "flagPath": "pg.png",
                                        imageUrl: "./flags/pg.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Fiji",
                                        "Id": 727,
                                        "flagPath": "fj.png",
                                        imageUrl: "./flags/fj.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Solomon Islands",
                                        "Id": 729,
                                        "flagPath": "sb.png",
                                        imageUrl: "./flags/sb.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Vanuatu",
                                        "Id": 730,
                                        "flagPath": "vu.png",
                                        imageUrl: "./flags/vu.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Western Samoa",
                                        "Id": 731,
                                        "flagPath": "ws.png",
                                        imageUrl: "./flags/ws.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "FSM",
                                        "Id": 732,
                                        "flagPath": "fm.png",
                                        imageUrl: "./flags/fm.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Marshall Islands",
                                        "Id": 733,
                                        "flagPath": "mh.png",
                                        imageUrl: "./flags/mh.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Kiribati",
                                        "Id": 734,
                                        "flagPath": "ki.png",
                                        imageUrl: "./flags/ki.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Tuvalu",
                                        "Id": 735,
                                        "flagPath": "tv.png",
                                        imageUrl: "./flags/tv.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "American Samoa",
                                        "Id": 736,
                                        "flagPath": "us.png",
                                        imageUrl: "./flags/us.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Cook Islands",
                                        "Id": 737,
                                        "flagPath": "ck.png",
                                        imageUrl: "./flags/ck.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "French Polynesia",
                                        "Id": 738,
                                        "flagPath": "pf.png",
                                        imageUrl: "./flags/pf.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Guam",
                                        "Id": 739,
                                        "flagPath": "us.png",
                                        imageUrl: "./flags/us.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Hawaii",
                                        "Id": 740,
                                        "flagPath": "us.png",
                                        imageUrl: "./flags/us.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Kosrae",
                                        "Id": 741,
                                        "flagPath": "ko.png",
                                        imageUrl: "./flags/ko.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Nauru",
                                        "Id": 742,
                                        "flagPath": "nr.png",
                                        imageUrl: "./flags/nr.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "New Caledonia",
                                        "Id": 743,
                                        "flagPath": "nc.png",
                                        imageUrl: "./flags/nc.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Niue",
                                        "Id": 744,
                                        "flagPath": "nu.png",
                                        imageUrl: "./flags/nu.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Norfolk Island",
                                        "Id": 745,
                                        "flagPath": "nf.png",
                                        imageUrl: "./flags/nf.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Northern Mariana Islands",
                                         "flagPath": "us.png",
                                        imageUrl: "./flags/us.png",
                                       "Id": 746,
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Palau",
                                        "Id": 747,
                                        "flagPath": "pw.png",
                                        imageUrl: "./flags/pw.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Pitcairn Islands",
                                        "Id": 748,
                                        "flagPath": "pn.png",
                                        imageUrl: "./flags/pn.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Rota",
                                        "Id": 750,
                                        "flagPath": "us.png",
                                        imageUrl: "./flags/us.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Saipan",
                                        "Id": 751,
                                        "flagPath": "us.png",
                                        imageUrl: "./flags/us.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Tahiti",
                                        "Id": 752,
                                        "flagPath": "ta.png",
                                        imageUrl: "./flags/ta.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Tinian",
                                        "Id": 753,
                                        "flagPath": "us.png",
                                        imageUrl: "./flags/us.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Tokelau",
                                        "Id": 754,
                                        "flagPath": "tk.png",
                                        imageUrl: "./flags/tk.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Tonga",
                                        "Id": 755,
                                        "flagPath": "to.png",
                                        imageUrl: "./flags/to.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Truk",
                                        "Id": 756,
                                        "flagPath": "fm.png",
                                        imageUrl: "./flags/fm.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Wake Island",
                                        "Id": 757,
                                        "flagPath": "us.png",
                                        imageUrl: "./flags/us.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Wallis & Futuna Islands",
                                        "Id": 758,
                                        "flagPath": "wf.png",
                                        imageUrl: "./flags/wf.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Yap",
                                        "Id": 759,
                                        "flagPath": "ya.png",
                                        imageUrl: "./flags/ya.png",
                                        "Areas": []
                                    }
                                ]
                            },
                            {
                                "Text": "Central America",
                                "flagPath": "blank.png",
                                imageUrl: "./flags/blank.png",
                                "Id": 108,
                                "Areas": [
                                    {
                                        "Text": "Guatemala",
                                        "Id": 504,
                                        "flagPath": "gt.png",
                                        imageUrl: "./flags/gt.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Panama",
                                        "Id": 505,
                                        "flagPath": "pa.png",
                                        imageUrl: "./flags/pa.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Costa Rica",
                                        "Id": 506,
                                        "flagPath": "cr.png",
                                        imageUrl: "./flags/cr.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "El Salvador",
                                        "Id": 507,
                                        "flagPath": "sv.png",
                                        imageUrl: "./flags/sv.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Honduras",
                                        "Id": 508,
                                        "flagPath": "hn.png",
                                        imageUrl: "./flags/hn.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Nicaragua",
                                        "Id": 509,
                                        "flagPath": "ni.png",
                                        imageUrl: "./flags/ni.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Belize",
                                        "Id": 510,
                                        "flagPath": "bz.png",
                                        imageUrl: "./flags/bz.png",
                                        "Areas": []
                                    }
                                ]
                            },
                            {
                                "Text": "Caribbean",
                                "flagPath": "blank.png",
                                imageUrl: "./flags/blank.png",
                                "Id": 109,
                                "Areas": [
                                    {
                                        "Text": "Puerto Rico",
                                        "Id": 546,
                                        "flagPath": "us.png",
                                        imageUrl: "./flags/us.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Dominican Republic",
                                        "Id": 525,
                                        "flagPath": "do.png",
                                        imageUrl: "./flags/do.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Haiti",
                                        "Id": 526,
                                        "flagPath": "ht.png",
                                        imageUrl: "./flags/ht.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Jamaica",
                                        "Id": 527,
                                        "flagPath": "jm.png",
                                        imageUrl: "./flags/jm.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Bahamas",
                                        "Id": 528,
                                        "flagPath": "bs.png",
                                        imageUrl: "./flags/bs.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Barbados",
                                        "Id": 529,
                                        "flagPath": "bb.png",
                                        imageUrl: "./flags/bb.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Saint Lucia",
                                        "Id": 530,
                                        "flagPath": "lc.png",
                                        imageUrl: "./flags/lc.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Grenada",
                                        "Id": 531,
                                        "flagPath": "gd.png",
                                        imageUrl: "./flags/gd.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Dominica",
                                        "Id": 532,
                                        "flagPath": "dm.png",
                                        imageUrl: "./flags/dm.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Anguilla",
                                        "Id": 533,
                                        "flagPath": "gb.png",
                                        imageUrl: "./flags/gb.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Antigua & Barbuda",
                                        "Id": 534,
                                        "flagPath": "gb.png",
                                        imageUrl: "./flags/gb.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Aruba",
                                        "Id": 535,
                                        "flagPath": "aw.png",
                                        imageUrl: "./flags/aw.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Bermuda",
                                        "Id": 536,
                                        "flagPath": "gb.png",
                                        imageUrl: "./flags/gb.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Bonaire",
                                        "Id": 537,
                                        "flagPath": "nl.png",
                                        imageUrl: "./flags/nl.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "British Virgin Islands",
                                        "Id": 538,
                                        "flagPath": "gb.png",
                                        imageUrl: "./flags/gb.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Caribbean Netherlands",
                                        "Id": 547,
                                        "flagPath": "nl.png",
                                        imageUrl: "./flags/nl.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Cayman Islands",
                                        "Id": 539,
                                        "flagPath": "gb.png",
                                        imageUrl: "./flags/gb.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Cuba",
                                        "Id": 540,
                                        "flagPath": "cu.png",
                                        imageUrl: "./flags/cu.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Curacao",
                                        "Id": 541,
                                        "flagPath": "cb.png",
                                        imageUrl: "./flags/cb.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Guadeloupe",
                                        "Id": 542,
                                        "flagPath": "fr.png",
                                        imageUrl: "./flags/fr.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Martinique",
                                        "Id": 543,
                                        "flagPath": "fr.png",
                                        imageUrl: "./flags/fr.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Montserrat",
                                        "Id": 544,
                                        "flagPath": "gb.png",
                                        imageUrl: "./flags/gb.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Netherlands Antilles",
                                        "Id": 545,
                                        "flagPath": "nl.png",
                                        imageUrl: "./flags/nl.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Saint Barthelemy",
                                        "Id": 548,
                                        "flagPath": "fr.png",
                                        imageUrl: "./flags/fr.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Saint Christopher",
                                        "Id": 549,
                                        "flagPath": "sw.png",
                                        imageUrl: "./flags/sw.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Saint Croix",
                                        "Id": 550,
                                        "flagPath": "us.png",
                                        imageUrl: "./flags/us.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Saint Eustatius",
                                        "Id": 551,
                                        "flagPath": "nl.png",
                                        imageUrl: "./flags/nl.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Saint John",
                                        "Id": 552,
                                        "flagPath": "us.png",
                                        imageUrl: "./flags/us.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Saint Kitts & Nevis",
                                        "Id": 553,
                                        "flagPath": "kn.png",
                                        imageUrl: "./flags/kn.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Saint Maarten",
                                        "Id": 554,
                                        "flagPath": "mb.png",
                                        imageUrl: "./flags/mb.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Saint Martin",
                                        "Id": 555,
                                        "flagPath": "nl.png",
                                        imageUrl: "./flags/nl.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Saint Thomas",
                                        "Id": 556,
                                        "flagPath": "us.png",
                                        imageUrl: "./flags/us.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "SVG",
                                        "Id": 557,
                                        "flagPath": "vc.png",
                                        imageUrl: "./flags/vc.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Trinidad & Tobago",
                                        "Id": 558,
                                        "flagPath": "tt.png",
                                        imageUrl: "./flags/tt.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Turks & Caicos Islands",
                                        "Id": 559,
                                        "flagPath": "gb.png",
                                        imageUrl: "./flags/gb.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "U.S. Virgin Islands",
                                        "Id": 560,
                                        "flagPath": "us.png",
                                        imageUrl: "./flags/us.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Union Island",
                                        "Id": 561,
                                        "flagPath": "vc.png",
                                        imageUrl: "./flags/vc.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Andorra",
                                        "Id": 604,
                                        "flagPath": "ad.png",
                                        imageUrl: "./flags/ad.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "Gibraltar",
                                        "Id": 605,
                                        "flagPath": "gb.png",
                                        imageUrl: "./flags/gb.png",
                                        "Areas": []
                                    },
                                    {
                                        "Text": "San Marino",
                                        "Id": 607,
                                        "flagPath": "sm.png",
                                        imageUrl: "./flags/sm.png",
                                        "Areas": []
                                    }
                                ]
                            }
                        ];
                        function parseAllowedRegionIds(csvValue) {
                            if (!csvValue) return {};
                            var parts = csvValue.split(",");
                            var allowed = {};
                            for (var i = 0; i < parts.length; i++) {
                                var id = $.trim(parts[i]);
                                if (id) {
                                    allowed[id] = true;
                                }
                            }
                            return allowed;
                        }

                        function filterRegionTree(nodes, allowedIds) {
                            if (!nodes || !nodes.length) return [];

                            var filtered = [];

                            for (var i = 0; i < nodes.length; i++) {
                                var node = nodes[i];
                                var nodeId = node && node.Id !== undefined && node.Id !== null ? String(node.Id) : "";
                                var childNodes = (node && node.Areas) ? node.Areas : [];
                                var filteredChildren = filterRegionTree(childNodes, allowedIds);
                                var isNodeAllowed = !!allowedIds[nodeId];

                                if (isNodeAllowed || filteredChildren.length > 0) {
                                    var clonedNode = $.extend({}, node);
                                    clonedNode.Areas = filteredChildren;
                                    filtered.push(clonedNode);
                                }
                            }

                            return filtered;
                        }

                        var allowedIdsCsv = document.getElementById('<%= hdnAllowedRegionIds.ClientID %>').value;
                        var allowedRegionIds = parseAllowedRegionIds(allowedIdsCsv);
                        var filteredDataSource = filterRegionTree(dataSource, allowedRegionIds);

                        $("#dropDownTree").kendoDropDownTree({
                            dataTextField: "Text",
                            dataValueField: "Id",
                            dataSource: {
                                data: filteredDataSource,
                                schema: {
                                    model: {
                                        children: "Areas"
                                    }
                                }
                            },
                            placeholder: "Select a Delivery Region",
                            loadOnDemand: false,
                            height: "500px",
                            select: function (e) {
                                var item = this.dataItem(e.node);
                                document.getElementById('<%= hdnSelectedRegion.ClientID %>').value = item.Id;
                                document.getElementById('<%= hdnSelectedRegionText.ClientID %>').value = item.Text;
                                document.getElementById('<%= hdnSelectedRegionUrl.ClientID %>').value = item.flagPath;
                                var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                                if (ajaxManager) {
                                    ajaxManager.ajaxRequest("RegionChanged");
                                }
                            },
                            valueTemplate: function (dataItem) {
                                if (!dataItem) return "";
                                return '<img src="' + dataItem.imageUrl + '" style="width:16px; height:16px; vertical-align:middle; margin-right:5px;" />' + dataItem.Text;
                            },
                            change: function (e) {
                                var wrapper = this.wrapper;
                                var values = this.value();
                                if (values && values.length > 0) {
                                    wrapper.removeClass("dropdowntree-placeholder");
                                } else {
                                    wrapper.addClass("dropdowntree-placeholder");
                                    document.getElementById('<%= hdnSelectedRegion.ClientID %>').value = "";
                                    document.getElementById('<%= hdnSelectedRegionText.ClientID %>').value = "";
                                    document.getElementById('<%= hdnSelectedRegionUrl.ClientID %>').value = "";
                                    var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                                    if (ajaxManager) {
                                        ajaxManager.ajaxRequest("RegionChanged");
                                    }
                                }
                                collapseChildGrids();
                            }
                        });
                        // Apply italic class initially (placeholder is showing)
                        $("#dropDownTree").data("kendoDropDownTree").wrapper.addClass("dropdowntree-placeholder");
                    });

                    function collapseChildGrids() {
                        
                        var grid = $find("<%= grdLoadConsolidation.ClientID %>");
                        var masterTable = grid.get_masterTableView();

                        var rows = masterTable.get_dataItems();
                        
                        for (var i = 0; i < rows.length; i++) {

                            if (rows[i].get_expanded()) {
                                
                                masterTable.collapseItem(rows[i].get_element());
                            }
                        }
                    }

                </script>

                <style type="text/css">

                .CenteredLoadingPanel {
                    position: fixed;            /* fixed to viewport */
                    top: 0;
                    left: 0;
                    width: 100vw;
                    height: 100vh;
                    background: rgba(255,255,255,0.6); /* Telerik-like semi-transparent overlay */
                    z-index: 10000;

                    display: flex;              /* flex centering */
                    justify-content: center;    /* horizontal center */
                    align-items: center;        /* vertical center */
                }

                .CenteredLoadingPanel .raDiv {
                    position: relative !important;  /* cancel internal offsets */
                    left: 0 !important;
                    top: 0 !important;
                }

            </style>

                <style type="text/css">


/* Optional: hover effect for header (like Telerik) */
.RadGrid .rgHeader th:hover {
    background-color: #e6e6e6 !important;
    cursor: pointer;
}


                    /* Column group header (top-level: Consolidations / Variables) */
                    .RadGrid.RadGrid_Telerik .rgHeader th,
                    .RadGrid.RadGrid_Telerik th.rgHeader,
                    .RadGrid.RadGrid_Telerik .rgHeaderDiv th {
                        font-weight: normal !important;   /* not bold */
                        font-size: 13px !important;
                        color: #000 !important;           /* black text */
                        padding: 8px 12px !important;
                        border: 1px solid #ccc !important;
                        text-transform: none !important;
                        letter-spacing: 0.3px !important;
                    }

                    /* Data rows */
                    .RadGrid .rgRow td,
                    .RadGrid .rgAltRow td {
                        padding: 7px 12px !important;
                        line-height: 1.4 !important;
                        border: 1px solid #e9ecef !important;
                        color: #333 !important;
                    }
                    .RadGrid .rgRow td {
                        background-color: #ffffff !important;
                    }
                    .RadGrid .rgAltRow td {
                        background-color: #f8f9fa !important;
                    }
                    .RadGrid .rgRow:hover td,
                    .RadGrid .rgAltRow:hover td {
                        background-color: #e8f0fe !important;
                    }

                    /* Selected row */
                    .RadGrid .rgSelectedRow td {
                        background-color: #d0e3ff !important;
                        color: #1a3e6e !important;
                    }

                    /* Expand/collapse column */
                    .RadGrid .rgExpand,
                    .RadGrid .rgCollapse {
                        cursor: pointer;
                    }

                    /* Pager */
                    .RadGrid .rgPager {
                        background: #f0f2f5 !important;
                        border-top: 1px solid #dee2e6 !important;
                        padding: 6px 10px !important;
                    }
                    .RadGrid .rgPager .rgPageFirst,
                    .RadGrid .rgPager .rgPagePrev,
                    .RadGrid .rgPager .rgPageNext,
                    .RadGrid .rgPager .rgPageLast,
                    .RadGrid .rgPager .rgCurrentPage,
                    .RadGrid .rgPager .rgNumPart a {
                        color: #3a7bd5 !important;
                    }
                    .RadGrid .rgPager .rgCurrentPage {
                        font-weight: bold !important;
                    }

                    /* Detail table (child grid) */
                    .RadGrid.RadGrid_Telerik .rgDetailTable .rgHeader,
                    .RadGrid.RadGrid_Telerik .rgDetailTable thead th,
                    .RadGrid.RadGrid_Telerik .rgDetailTable .rgHeader td,
                    .RadGrid.RadGrid_Telerik .rgDetailTable .rgHeader th {
                        font-weight: normal !important;      /* Ensure text is not bold */
                        font-size: 13px !important;          /* Set font size */
                        color: #000 !important;              /* Black text */
                        padding: 8px 12px !important;        /* Padding */
                        border: 1px solid #ccc !important;   /* Border */
                        text-transform: none !important;     /* Remove uppercase */
                        letter-spacing: 0.3px !important;    /* Slight spacing */
                    }


                    .dropdowntree-placeholder .k-input-value-text {
                        font-style: italic;
                    }
                    .trailer-progress {
                        width: 80px;
                        height: 18px;
                        background-color: #f2f2f2;
                        border-radius: 0;  /* square corners */
                        overflow: hidden;
                        cursor: pointer;
                        display: inline-block;
                    }
                    .trailer-progress-fill {
                        height: 100%;
                        background-color: #f2f2f2;
                        border-radius: 0;     /* square corners */
                        transition: width 0.3s;
                    }

                    /* Detail row while / after trailer was opened from it */
                    .trailer-selected-row td,
                    .trailer-marker-row td{
                        background-color: #e8f4fc !important;
                        outline: none !important;
                        border-color: transparent !important;
                    }

                    /* Master consolidation row - stays visible after overlay closes */
                    .trailer-last-master > td {
                        background color: #d6eafa !important;
                        box-shadow: inset 4px 0 0 #1565c0 important;
                    }
                </style>

                    <style type="text/css">
                        div.RadGrid .rgPager .rgAdvPart {
                            display: none;
                        }
                    </style>
                    <style type="text/css">
                        .rgDataDiv {
                            overflow-x: hidden !important;
                        }

                        div.RadGrid .rgPager .rgAdvPart {
                            display: none;
                        }

                        .rgRow td,
                        .rgAltRow td,
                        .rgHeader td,
                        .rgFilterRow td {
                            border-left: solid 1px transparent !important;
                        }
                    </style>

                    <style type="text/css">
                        .RadComboBoxDropDown .rcbScroll {
                            overflow-x: auto !important;
                            overflow-y: hidden !important;
                        }

                        .rad-filter.RadComboBoxDropDown .rcbScroll {
                            overflow-x: auto !important;
                            overflow-y: auto !important;
                        }
                    </style>

                    <asp:HiddenField ID="hdnConsolidationNum" runat="server" />

                    <telerik:RadAjaxLoadingPanel 
                        ID="RadAjaxLoadingPanel2" 
                        runat="server" 
                        Modal="true" 
                        CssClass="CenteredLoadingPanel">
                    </telerik:RadAjaxLoadingPanel>

                    <telerik:radajaxmanager id="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
                        <AjaxSettings>

                            <telerik:AjaxSetting AjaxControlID="grdLoadConsolidation">
                                <UpdatedControls>
                                    <telerik:AjaxUpdatedControl ControlID="grdLoadConsolidation" />
                                </UpdatedControls>
                            </telerik:AjaxSetting>

                            <telerik:AjaxSetting AjaxControlID="radPnlbarLoad">
                                <UpdatedControls>
                                    <telerik:AjaxUpdatedControl ControlID="grdLoadConsolidation"
                                        LoadingPanelID="RadAjaxLoadingPanel1" />
                                </UpdatedControls>
                            </telerik:AjaxSetting>

                            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                                <UpdatedControls>
                                    <telerik:AjaxUpdatedControl ControlID="grdLoadConsolidation" LoadingPanelID="RadAjaxLoadingPanel2" />
                                </UpdatedControls>
                            </telerik:AjaxSetting>

                        </AjaxSettings>
                    </telerik:radajaxmanager>

                    <telerik:RadWindowManager ID="RadWindowManager1" runat="server"
                        EnableViewState="false"
                        Behaviors="Close"
                        IconUrl="../CustomerGraphics/shield.png"
                        Style="z-index:200000"
                        ReloadOnShow="true"
                        ShowContentDuringLoad="false"
                        Modal="true"
                        VisibleStatusbar="false"
                        PostBackOnClose="false"
                        Skin="Telerik">
                    </telerik:RadWindowManager>

                    <telerik:RadWindowManager ID="RadWindowManager2" runat="server"
                        EnableViewState="false"
                        Behaviors="Close"
                        IconUrl="../CustomerGraphics/shield.png"
                        Style="z-index:20000"
                        ReloadOnShow="true"
                        ShowContentDuringLoad="false"
                        Modal="true"
                        VisibleStatusbar="false"
                        PostBackOnClose="false"
                        Skin="Telerik"
                        OnClientClose="onOverlayClose">
                    </telerik:RadWindowManager>

                    <telerik:RadWindow ID="rwDetails" runat="server" Modal="true" PostBackOnClose="false" 
                        OnClientClose="onOverlayClose">
                    </telerik:RadWindow>

                    <div style="display: none;">
                        <asp:Button runat="server" ID="btnDummy" />
                    </div>
<telerik:RadAjaxManagerProxy ID="RadAjaxManagerProxy1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RadGrid1">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManagerProxy>

                    <telerik:RadAjaxLoadingPanel 
                        ID="RadAjaxLoadingPanel1" 
                        runat="server" 
                        Modal="true" 
                        CssClass="CenteredLoadingPanel">
                    </telerik:RadAjaxLoadingPanel>

                    <asp:Button runat="server" ID="btnDummyForMP" Text="dummy" Style="display: none" />
                    <telerik:radmenu id="menuLoadConsolidation" runat="server" skin="Telerik" flow="Horizontal"
                        style="z-index: 100; left: 0px; position: absolute; top: 68px"
                        onclientitemclicking="MenuItemClickingCancelPostback">
                        <Items>
                            <telerik:RadMenuItem Text="Close" Value="Close" runat="server"
                                ImageUrl="../Images/Close.png">
                            </telerik:RadMenuItem>

                            <telerik:RadMenuItem Text="Refresh" Value="Refresh" runat="server"
                                ImageUrl="../Images/refresh.png">
                            </telerik:RadMenuItem>

                            <telerik:RadMenuItem Text="Help" ForeColor="Transparent" Font-Size="0" Value="Help"
                                ImageUrl="../Images/HelpFile.png">
                            </telerik:RadMenuItem>

                        </Items>
                        <CollapseAnimation Duration="200" Type="OutQuint" />
                    </telerik:radmenu>

                    <asp:LinkButton 
                        ID="lblCloseLoadConsolidation" 
                        runat="server" 
                        Text="Close" 
                        CssClass="close-link"
                        OnClientClick="closePopup(); return false;" 
                        Visible="false">
                    </asp:LinkButton>

                    <div style="margin-top: 35px;">
                    </div>
                    <div id="dropdownTreeContainer" runat="server" style="margin-left:6px">
                        <input id="dropDownTree" style="width:30%" />
                    </div>
                    <asp:Panel ID="pnlLoadDetails" runat="Server" Visible="true">
                        <table>
                            <tr>

<!-- CSS -->
<style>
.radgrid-wrapper {
    border: none;          /* no outer border */
    border-radius: 0;      /* removes rounded corners */
    overflow: hidden;                 /* Clips inner content to rounded corners */
    padding: 5px;                     /* Optional spacing around grid */
    background-color: #fff;           /* Optional background color */

    /* Shadow effect */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* subtle shadow */
    transition: box-shadow 0.3s ease;         /* smooth hover effect */
}

/* Optional: subtle inner cell borders */
.radgrid-wrapper .rgMasterTable,
.radgrid-wrapper .rgHeader,
.radgrid-wrapper .rgFooter,
.radgrid-wrapper .rgRow,
.radgrid-wrapper .rgAltRow,
.radgrid-wrapper .rgDataCell {
    border: 1px solid #e0e0e0;
    border-radius: 0; /* keep inner cells square */
}

/* Optional: elevate shadow on hover */
.radgrid-wrapper:hover {
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
}
</style>

                    <div style="margin-top: 2px;">

                                    <td valign="top">
<div class="radgrid-wrapper">
                                        
<!-- Custom Loading Spinner -->
<div id="customLoading" class="modalBox_backdrop loader" style="display:none; z-index: 10000;">
    <img src="../Images/LoadingProgressBar.gif" alt="Loading" 
         style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);" 
         width="32" height="32" />
</div>

                                        <telerik:RadGrid ID="grdLoadConsolidation" runat="server" Skin="Default" ShowStatusBar="true"
                                            AutoGenerateColumns="false" AllowSorting="false"
                                            AllowMultiRowSelection="false"
                                            BorderStyle="None"
                                            GridLines="None"
                                            EnableRowsHover="false"
                                            EnableEmbeddedSkins="true"
                                            EnablePostBackOnRowClick="false"
                                            OnDetailTableDataBind="grdLoadConsolidation_detailDataBind"
                                            OnItemDataBound="grdLoadConsolidation_itemDataBound"
                                            allowpaging="True" pagesize="15" Visible="false">
                                            <MasterTableView AutoGenerateColumns="false" DataKeyNames="COL_1999870249,COL_1192779487">

                                                <DetailTables>

                                                    <telerik:GridTableView DataKeyNames="COL_1712880211"
                                                        Name="ShippingDetails" AllowPaging="true" PageSize="10" GridLines="None" BorderStyle="None" BorderWidth="0px">
                                                        <Columns>
                                                            <telerik:GridTemplateColumn HeaderText="Load Factors" HeaderStyle-Width ="120px" 
                                                                HeaderStyle-HorizontalAlign="center"
                                                                AllowFiltering="false" UniqueName="LoadFactor"
                                                                HeaderStyle-Wrap="False">
                                                                <ItemTemplate>
                                                                    <div class="trailer-progress"
                                                                        onclick="onTrailerProgressClick(this); return false;"
                                                                        data-value='<%# If(Eval("COL_1150800777") Is DBNull.Value, "0", Eval("COL_1150800777")) %>'
                                                                        data-poo1='<%# System.Web.HttpUtility.HtmlAttributeEncode(CType(CType(Container, Telerik.Web.UI.GridDataItem).OwnerTableView.ParentItem, Telerik.Web.UI.GridDataItem).GetDataKeyValue("COL_1999870249").ToString()) %>'
                                                                        data-p002='<%# System.Web.HttpUtility.HtmlAttributeEncode(If(Eval("ConsolidationNumber") Is DBNull.Value, "", Eval("ConsolidationNumber").ToString())) %>'
                                                                        title='<%# If(Eval("COL_1150800777") Is DBNull.Value, "0", Eval("COL_1150800777")) & "%" %>'>

                                                                    <div class="trailer-progress-fill" 
                                                                         style='<%# GetProgressFillStyle(Eval("COL_1150800777")) %>'>
                                                                    </div>

                                                                    </div>
                                                                    <asp:LinkButton ID="lbtnTrailer" runat="server" Style="display:none;"
                                                                        CommandArgument='<%# "Trailer|" & Eval("ConsolidationNumber") %>'
                                                                        CommandName="TrailerClick" />
                                                                </ItemTemplate>
                                                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" />
                                                                <HeaderStyle Wrap="false" />
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridBoundColumn HeaderText="Ship Dates"
                                                                HeaderButtonType="TextButton" DataField="COL_1712880211"
                                                                UniqueName="Ship Date" HeaderStyle-Wrap="False"
                                                                ItemStyle-Wrap="false">
                                                                <ItemStyle Wrap="False" />
                                                                <ItemStyle VerticalAlign="Top" />
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                <HeaderStyle Wrap="false" />
                                                                <ItemStyle Wrap="false" />
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn HeaderText="Savings (%)"
                                                                AllowFiltering="false" HeaderButtonType="TextButton"
                                                                DataField="COL_1449190424" UniqueName="Savings"
                                                                HeaderStyle-Wrap="False" ItemStyle-Wrap="false">
                                                                <ItemStyle VerticalAlign="Top" />
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                <HeaderStyle Wrap="false" />
                                                                <ItemStyle Wrap="false" />
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridTemplateColumn HeaderText="Shipments"
                                                                HeaderButtonType="TextButton" DataField="COL_1888214142"
                                                                ItemStyle-HorizontalAlign="Left"
                                                                ItemStyle-VerticalAlign="Middle"
                                                                HeaderStyle-Wrap="False" ItemStyle-Wrap="false"
                                                                UniqueName="Shipments">
                                                                <ItemTemplate>
                                                                    <asp:Image ID="lblShipments" Font-Italic="true"
                                                                        runat="server"
                                                                        ImageUrl="../Images/search_order.png"
                                                                        Visible="false" />
                                                                    <asp:Label ID="lblShipmentsData" runat="server"
                                                                        Text='<%#DataBinder.Eval(Container.DataItem, "COL_1888214142")%>'>
                                                                    </asp:Label>
                                                                </ItemTemplate>

                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridBoundColumn HeaderText="Units"
                                                                AllowFiltering="false" HeaderButtonType="TextButton"
                                                                DataField="COL_1190210202" UniqueName="Units"
                                                                HeaderStyle-Wrap="False" ItemStyle-Wrap="false">
                                                                <ItemStyle VerticalAlign="Top" />
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                <HeaderStyle Wrap="false" />
                                                                <ItemStyle Wrap="false" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn HeaderText="Weight"
                                                                AllowFiltering="false" HeaderButtonType="TextButton"
                                                                DataField="COL_1911147145" UniqueName="Weight"
                                                                HeaderStyle-Wrap="False" ItemStyle-Wrap="false">
                                                                <ItemStyle VerticalAlign="Top" />
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                <HeaderStyle Wrap="false" />
                                                                <ItemStyle Wrap="false" />

                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn HeaderText="Cube"
                                                                AllowFiltering="false" HeaderButtonType="TextButton"
                                                                DataField="COL_1407597278" UniqueName="Cube"
                                                                HeaderStyle-Wrap="False" ItemStyle-Wrap="false">
                                                                <ItemStyle VerticalAlign="Top" />
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                <HeaderStyle Wrap="false" />
                                                                <ItemStyle Wrap="false" />
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridTemplateColumn HeaderText="Shippers"
                                                                AllowFiltering="true" ItemStyle-HorizontalAlign="Left"
                                                                ItemStyle-VerticalAlign="Middle"
                                                                HeaderStyle-Wrap="False" ItemStyle-Wrap="false"
                                                                UniqueName="Shipper">

                                                                <ItemTemplate>
                                                                    <asp:Image ID="lblShipper" Font-Italic="true"
                                                                        runat="server"
                                                                        ImageUrl="../Images/search_order.png"
                                                                        Visible="true" />
                                                                    <asp:Label ID="lblShipperData" runat="server"
                                                                        Text='<%#DataBinder.Eval(Container.DataItem, "COL_1251888419")%>'
                                                                        Style="vertical-align: Top; cursor: hand">
                                                                    </asp:Label>

                                                                    <asp:Panel ID="popupMenuShipper" runat="server"
                                                                        BackColor="#FFFACD" 
                                                                        BorderColor="#C49E74" 
                                                                        BorderStyle="Solid" 
                                                                        BorderWidth="1px"
                                                                        
                                                                        Style="padding:0; border-radius:0; width:904px; position:absolute; display:none; z-index:1000;"> 

                                                                        <div style="margin: 0; width: 900px;">
                                                                                                            <itemtemplate>
                                                                                                            <table id="Table_01" cellspacing="0"
                                                                                    cellpadding="0" width="900px"
                                                                                    border="0" style="border-collapse: collapse;">


    <!-- Notepad-style header -->
<tr style="height: 20px;">
    <td style="
        background: linear-gradient(to bottom, #FFF8A0, #FFE082);  
        border-top: 1px solid #FFD700;     
        border-bottom: 1px solid #FF4500;  
        padding: 2px 4px; 
        font-family: verdana; 
        font-size: 10px; 
        font-weight: bold; 
        color: #003366;
        box-shadow: inset 0 1px 0 rgba(255,255,255,0.6);
    "
    colspan="5">
    </td>
</tr>
                                                                                </table>
                                                                                                            <itemtemplate>

<table id="Table_02" cellspacing="0" cellpadding="0" width="900px" border="0" height="35px">
    <tr>
        <td width="80px" align="left"
            style="background-color:#FFFACD !important; border-left:none !important; border-right:none !important; border-top:none !important; border-bottom:none !important; padding:2px 4px; ">
            
            <asp:Label ID="Label_001" runat="server"
                Width="80px"
                Text='<%# Eval("COL_1917211557") %>'
                Font-Names="Verdana"
                Font-Size="9pt"
                Font-Underline="true"
                Font-Italic="true" />
        </td>

        <td width="385px"
            style="background-color:#FFFACD !important; border-left:none !important; border-right:none !important; border-top:none !important; border-bottom:none !important; padding:2px 4px;">
            
            <asp:Label ID="Label_002" runat="server"
                Width="320px"
                Text='<%# Eval("COL_1725975950") %>'
                Font-Names="Verdana"
                Font-Size="9pt" />
        </td>

        <td width="80px" align="left"
            style="background-color:#FFFACD !important; border-left:1px solid #C2DAB2 !important; border-right:none !important; border-top:none !important; border-bottom:none !important; padding:0px 4px;">
            
            <asp:Label ID="Label_003" runat="server"
                Width="80px"
                Text='<%# Eval("COL_1552947922") %>'
                Font-Names="Verdana"
                Font-Size="9pt"
                Font-Underline="true"
                Font-Italic="true" />
        </td>

        <td width="385px"
            style="background-color:#FFFACD !important; border-left:none !important; border-bottom:none !important; border-top:none !important; padding:2px 4px; border-right:none;">
            
            <asp:Label ID="Label_004" runat="server"
                Width="320px"
                Text='<%# Eval("COL_1595700166") %>'
                Font-Names="Verdana"
                Font-Size="9pt" />
        </td>
    </tr>
</table>                                                                                                            
                                                                                                            </itemtemplate>
                                                                                                            <itemtemplate>

<table id="Table_03" cellspacing="0" cellpadding="0" width="900px" border="0">
    <tr>
        <td width="80px" align="left"
            style="background-color:#FFFACD !important; border-left:none !important; border-right:none !important; border-top:none !important; border-bottom:none !important; padding:2px 4px; ">
            
            <asp:Label ID="Label_005" runat="server"
                Width="80px"
                Font-Names="Verdana"
                Font-Size="9pt"
                Font-Underline="true"
                Font-Italic="true" />
        </td>

        <td width="385px"
            style="background-color:#FFFACD !important; border-left:none !important; border-right:1px solid #C2DAB2 !important; border-top:none !important; border-bottom:none !important; padding:2px 4px;">
            
            <asp:Label ID="Label_006" runat="server"
                Width="320px"
                Text='<%# Eval("COL_1752514952") %>'
                Font-Names="Verdana"
                Font-Size="9pt" />
        </td>

        <td width="80px" align="left"
            style="background-color:#FFFACD !important; border-left:none !important; border-right:none !important; border-top:none !important; border-bottom:none !important; padding:0px 4px;">
            
            <asp:Label ID="Label_007" runat="server"
                Width="80px"
                Font-Names="Verdana"
                Font-Size="9pt"
                Font-Underline="true"
                Font-Italic="true" />
        </td>

        <td width="385px"
            style="background-color:#FFFACD !important; border-left:none !important; border-bottom:none !important; border-top:none !important; padding:2px 4px; border-right:none;">
            
            <asp:Label ID="Label_008" runat="server"
                Width="320px"
                Text='<%# Eval("COL_1196115269") %>'
                Font-Names="Verdana"
                Font-Size="9pt" />
        </td>
    </tr>
</table>

                                                                                                            </itemtemplate>
                                                                                                            <itemtemplate>

<table id="Table_04" cellspacing="0" cellpadding="0" width="900px" border="0">
    <tr>
        <td width="80px" align="left"
            style="background-color:#FFFACD !important; border-left:none !important; border-right:none !important; border-top:none !important; border-bottom:1px solid #C2DAB2 !important; padding:2px 4px; ">
            
            <asp:Label ID="Label_009" runat="server"
                Width="80px"
                Text=""
                Font-Names="Verdana"
                Font-Size="9pt"
                Font-Underline="true"
                Font-Italic="true" />
        </td>

        <td width="385px"
            style="background-color:#FFFACD !important; border-left:none !important; border-right:1px solid #C2DAB2 !important; border-top:none !important; border-bottom:1px solid #C2DAB2 !important; padding:2px 4px;">
            
            <asp:Label ID="Label_010" runat="server"
                Width="320px"
                Text='<%# Eval("COL_1495880017") %>'
                Font-Names="Verdana"
                Font-Size="9pt" />
        </td>

        <td width="80px" align="left"
            style="background-color:#FFFACD !important; border-left:none !important; border-right:none !important; border-top:none !important; border-bottom:1px solid #C2DAB2 !important; padding:0px 4px;">
            
            <asp:Label ID="Label_011" runat="server"
                Width="80px"
                Text=""
                Font-Names="Verdana"
                Font-Size="9pt"
                Font-Underline="true"
                Font-Italic="true" />
        </td>

        <td width="385px"
            style="background-color:#FFFACD !important; border-left:none !important; border-bottom:1px solid #C2DAB2 !important; border-top:none !important; padding:2px 4px; border-right:none;">
            
            <asp:Label ID="Label_012" runat="server"
                Width="320px"
                Text='<%# Eval("COL_1924988242") %>'
                Font-Names="Verdana"
                Font-Size="9pt" />
        </td>
    </tr>
</table>

                                                                                                            </itemtemplate>
                                                                                                            <itemtemplate>

<table id="Table_05" cellspacing="0" cellpadding="0" width="900px" border="0">
    <tr>
        <td width="80px" align="left"
            style="background-color:#FFFACD !important; border-left:none !important; border-right:none !important; border-top:none !important; border-bottom:none !important; padding:2px 4px; ">
            
            <asp:Label ID="Label_013" runat="server"
                Width="80px"
                Text='<%# Eval("COL_1950997995") %>'
                Font-Names="Verdana"
                Font-Size="9pt"
                Font-Underline="true"
                Font-Italic="true" />
        </td>

        <td width="385px"
            style="background-color:#FFFACD !important; border-left:none !important; border-right:1px solid #C2DAB2 !important; border-top:none !important; border-bottom:none !important; padding:2px 4px;">
            
            <asp:Label ID="Label_014" runat="server"
                Width="320px"
                Text='<%# Eval("COL_1999798902") %>'
                Font-Names="Verdana"
                Font-Size="9pt" />
        </td>

        <td width="80px" align="left"
            style="background-color:#FFFACD !important; border-left:none !important; border-right:none !important; border-top:none !important; border-bottom:none !important; padding:0px 4px;">
            
            <asp:Label ID="Label_015" runat="server"
                Width="80px"
                Text='<%# Eval("COL_1945772544") %>'
                Font-Names="Verdana"
                Font-Size="9pt"
                Font-Underline="true"
                Font-Italic="true" />
        </td>

        <td width="385px"
            style="background-color:#FFFACD !important; border-left:none !important; border-bottom:none !important; border-top:none !important; padding:2px 4px; border-right:none;">
            
            <asp:Label ID="Label_016" runat="server"
                Width="320px"
                Text='<%# Eval("COL_1582172949") %>'
                Font-Names="Verdana"
                Font-Size="9pt" />
        </td>
    </tr>
</table>                                                                                
                                                                                                            </itemtemplate>
                                                                                                            <itemtemplate>

<table id="Table_06" cellspacing="0" cellpadding="0" width="900px" border="0">
    <tr>
        <td width="80px" align="left"
            style="background-color:#FFFACD !important; border-left:none !important; border-right:none !important; border-top:none !important; border-bottom:none !important; padding:2px 4px; ">
            
            <asp:Label ID="Label_017" runat="server"
                Width="80px"
                Text=""
                Font-Names="Verdana"
                Font-Size="9pt"
                Font-Underline="true"
                Font-Italic="true" />
        </td>

        <td width="385px"
            style="background-color:#FFFACD !important; border-left:none !important; border-right:1px solid #C2DAB2 !important; border-top:none !important; border-bottom:none !important; padding:2px 4px;">
            
            <asp:Label ID="Label_018" runat="server"
                Width="320px"
                Text='<%# Eval("COL_1292817042") %>'
                Font-Names="Verdana"
                Font-Size="9pt" />
        </td>

        <td width="80px" align="left"
            style="background-color:#FFFACD !important; border-left:none !important; border-right:none !important; border-top:none !important; border-bottom:none !important; padding:0px 4px;">
            
            <asp:Label ID="Label_019" runat="server"
                Width="80px"
                Text=""
                Font-Names="Verdana"
                Font-Size="9pt"
                Font-Underline="true"
                Font-Italic="true" />
        </td>

        <td width="385px"
            style="background-color:#FFFACD !important; border-left:none !important; border-bottom:none !important; border-top:none !important; padding:2px 4px; border-right:none;">
            
            <asp:Label ID="Label_020" runat="server"
                Width="320px"
                Text='<%# Eval("COL_1449514427") %>'
                Font-Names="Verdana"
                Font-Size="9pt" />
        </td>
    </tr>

    <tr>
        <td width="80px" align="left"
            style="background-color:#FFFACD !important; border-left:none !important; border-right:none !important; border-top:none !important; border-bottom:1px solid #C2DAB2 !important; padding:2px 4px; ">
            <asp:Label ID="Label_021" runat="server"
                Width="80px"
                Text=""
                Font-Names="Verdana"
                Font-Size="9pt"
                Font-Underline="true"
                Font-Italic="true" />
        </td>

        <td width="385px"
            style="background-color:#FFFACD !important; border-left:none !important; border-right:none !important; border-top:none !important; border-bottom:1px solid #C2DAB2 !important; padding:2px 4px;">
            <asp:Label ID="Label_022" runat="server"
                Width="320px"
                Text='<%# Eval("COL_1181009877") %>'
                Font-Names="Verdana"
                Font-Size="9pt" />
        </td>

        <td width="80px" align="left"
            style="background-color:#FFFACD !important; border-left:1px solid #C2DAB2 !important; border-right:none !important; border-top:none !important; border-bottom:1px solid #C2DAB2 !important; padding:0px 4px;">
            <asp:Label ID="Label_023" runat="server"
                Width="80px"
                Text=""
                Font-Names="Verdana"
                Font-Size="9pt"
                Font-Underline="true"
                Font-Italic="true" />
        </td>

        <td width="385px"
            style="background-color:#FFFACD !important; border-left:none !important; border-bottom:1px solid #C2DAB2 !important; border-top:none !important; padding:2px 4px; border-right:none;">
            <asp:Label ID="Label_024" runat="server"
                Width="320px"
                Text='<%# Eval("COL_1344848925") %>'
                Font-Names="Verdana"
                Font-Size="9pt" />
        </td>
    </tr>


</table>
                                                                                
<%--                                                                                                            </itemtemplate>
                                                                                                            <itemtemplate>

<table id="Table_07" cellspacing="0" cellpadding="0" width="900px" border="0">
    <tr>
        <td width="80px" align="left"
            style="background-color:#FFFACD !important; border-left:none !important; border-right:none !important; border-top:none !important; border-bottom:1px solid #C2DAB2 !important; padding:2px 4px; ">
            <asp:Label ID="Label_021" runat="server"
                Width="80px"
                Text=""
                Font-Names="Verdana"
                Font-Size="9pt"
                Font-Underline="true"
                Font-Italic="true" />
        </td>

        <td width="385px"
            style="background-color:#FFFACD !important; border-left:none !important; border-right:none !important; border-top:none !important; border-bottom:1px solid #C2DAB2 !important; padding:2px 4px;">
            <asp:Label ID="Label_022" runat="server"
                Width="320px"
                Text='<%# Eval("COL_1181009877") %>'
                Font-Names="Verdana"
                Font-Size="9pt" />
        </td>

        <td width="80px" align="left"
            style="background-color:#FFFACD !important; border-left:1px solid #C2DAB2 !important; border-right:none !important; border-top:none !important; border-bottom:1px solid #C2DAB2 !important; padding:0px 4px;">
            <asp:Label ID="Label_023" runat="server"
                Width="80px"
                Text=""
                Font-Names="Verdana"
                Font-Size="9pt"
                Font-Underline="true"
                Font-Italic="true" />
        </td>

        <td width="385px"
            style="background-color:#FFFACD !important; border-left:none !important; border-bottom:1px solid #C2DAB2 !important; border-top:none !important; padding:2px 4px; border-right:none;">
            <asp:Label ID="Label_024" runat="server"
                Width="320px"
                Text='<%# Eval("COL_1344848925") %>'
                Font-Names="Verdana"
                Font-Size="9pt" />
        </td>
    </tr>
</table>--%>
                                                                                                            </itemtemplate>
                                                                                                            <itemtemplate>

<table id="Table_08" cellspacing="0" cellpadding="0" width="900px" border="0">
    <tr>

        <td width="80px" align="left"
            style="background-color:#FFFACD !important; border-left:none !important; border-right:none !important; border-top:none !important; border-bottom:1px solid #C2DAB2 !important; padding:2px 4px; ">
            <asp:Label ID="Label_115" runat="server"
                Width="80px"
                Text='<%# Eval("COL_1845418194") %>'
                Font-Names="Verdana"
                Font-Size="9pt"
                Font-Underline="true"
                Font-Italic="true" />
        </td>

        <td width="850px" align="left"
            style="background-color:#FFFACD !important; border-left:none !important; border-right:none !important; border-top:none !important; border-bottom:1px solid #C2DAB2 !important; padding:2px 4px;">
            <asp:Label ID="Label_116" runat="server"
                Width="320px"
                Text='<%# Eval("COL_1124088948") + " | "+  Eval("COL_1569790609") + " | "+  Eval("COL_1490249788") %>'
                Font-Names="Verdana"
                Font-Size="9pt" />
        </td>

    </tr>
</table>                                                                                

                                                                                                            </itemtemplate>

                                                                        </div>
                                                                    </asp:Panel>
                                                                    <ajaxToolkit:HoverMenuExtender ID="hoverMenuShipper"
                                                                        runat="server" PopupControlID="popupMenuShipper"
                                                                        PopupPosition="Bottom"
                                                                        TargetControlID="lblShipper" PopDelay="100" />
                                                                </ItemTemplate>


                                                                <FilterTemplate>
                                                                    <telerik:RadComboBox RenderMode="Lightweight"
                                                                        ID="RadComboBoxOrigin"
                                                                        DataTextField="ContactsData" DropDownWidth="400"
                                                                        DataValueField="ContactsData" Width="350px"
                                                                        AppendDataBoundItems="true" NoWrap="true"
                                                                        Height="300" DropDownCssClass="rad-filter"
                                                                        runat="server"
                                                                        OnClientSelectedIndexChanged="OriginIndexChanged">
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="All" />
                                                                        </Items>
                                                                    </telerik:RadComboBox>

                                                                    <telerik:RadScriptBlock
                                                                        ID="RadScriptBlockOriginIndexChanged"
                                                                        runat="server">
                                                                        <script type="text/javascript">
                                                                            function OriginIndexChanged(sender, args) {
                                                                                var tableView = $find("<%#  TryCast(Container,GridItem).OwnerTableView.ClientID %>");
                                                                                tableView.filter("Origin", args.get_item().get_value(), "EqualTo");
                                                                            }
                                                                        </script>


                                                                        <script type="text/javascript">
                                                                            $(document).ready(function () {
                                                                                $(".metallicComboBox").each(function () {
                                                                                    var wrapper = $(this);

                                                                                    // Style input box and arrow with metallic gradient + metallic border
                                                                                    wrapper.find(".rcbInput, .rcbArrow").css({
                                                                                        "background": "linear-gradient(to bottom, #f0f0f0 0%, #d1d1d1 20%, #c0c0c0 50%, #b0b0b0 80%, #f2f2f2 100%)",  // Adjusted gradient for a smoother, more polished feel
                                                                                        "border": "3px solid",
                                                                                        "border-image": "linear-gradient(to bottom, #ffffff, #e0e0e0, #b0b0b0, #999999, #e0e0e0) 1",  // Smoother border gradient
                                                                                        "border-radius": "6px",
                                                                                        "color": "#333",  // Slightly darker text color for better contrast
                                                                                        "padding": "4px 8px",
                                                                                        "box-shadow": "inset 0 1px 0 rgba(255,255,255,0.8), inset 0 -1px 1px rgba(0,0,0,0.15)",  // Slightly softer shadow
                                                                                        "transition": "all 0.25s ease"
                                                                                    });

                                                                                    // Style dropdown list
                                                                                    wrapper.find(".rcbSlide").css({
                                                                                        "background": "linear-gradient(to bottom, #f8f8f8 0%, #dcdcdc 50%, #e0e0e0 100%)",  // Adjusted gradient for a cleaner effect
                                                                                        "border": "3px solid",
                                                                                        "border-image": "linear-gradient(to bottom, #ffffff, #dcdcdc, #b0b0b0, #999999, #ffffff) 1",  // Smoother, more cohesive border gradient
                                                                                        "border-radius": "6px",
                                                                                        "box-shadow": "inset 0 1px 2px rgba(255,255,255,0.4)"  // Softer inner shadow for a more subtle metallic effect
                                                                                    });                                                                                });
                                                                            });
                                                                        </script>

                                                                    </telerik:RadScriptBlock>
                                                                </FilterTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn UniqueName="TemplateColumn"
                                                                HeaderText="Consignees" HeaderStyle-Wrap="False"
                                                                ItemStyle-Wrap="false">
                                                                <ItemTemplate>

                                                                    <%#DataBinder.Eval(Container.DataItem, "COL_1829542428"
                                                                        )%>
                                                                </ItemTemplate>
                                                                <FilterTemplate>
                                                                    <telerik:RadComboBox RenderMode="Lightweight"
                                                                        ID="RadComboBoxDestination"
                                                                        DataTextField="ContactsData"
                                                                        DataValueField="ContactsData" Width="350px"
                                                                        AppendDataBoundItems="true" NoWrap="true"
                                                                        Height="300" DropDownCssClass="rad-filter"
                                                                        DropDownWidth="400" runat="server"
                                                                        OnClientSelectedIndexChanged="DestinationIndexChanged">
                                                                        <Items>
                                                                            <telerik:RadComboBoxItem Text="All" />
                                                                        </Items>
                                                                    </telerik:RadComboBox>
                                                                    <telerik:RadScriptBlock
                                                                        ID="RadScriptBlockRadComboBoxDestination"
                                                                        runat="server">
                                                                        <script type="text/javascript">
                                                                            function DestinationIndexChanged(sender, args) {
                                                                                var tableView = $find("<%#  TryCast(Container,GridItem).OwnerTableView.ClientID %>");
                                                                                tableView.filter("Destination", args.get_item().get_value(), "EqualTo");
                                                                            }
                                                                        </script>
                                                                    </telerik:RadScriptBlock>
                                                                </FilterTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn UniqueName="ConsolidationNumber"
                                                                HeaderText="ConsolidationNumber" Display="false"
                                                                HeaderStyle-Wrap="False" ItemStyle-Wrap="false">
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "ConsolidationNumber"
                                                                        )%>
                                                                </ItemTemplate>

                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridBoundColumn HeaderText="Stops"
                                                                AllowFiltering="false" HeaderButtonType="TextButton"
                                                                DataField="Stops" UniqueName="Stops"
                                                                HeaderStyle-Wrap="False" ItemStyle-Wrap="false"
                                                                Visible="false">
                                                                <ItemStyle VerticalAlign="Top" />
                                                                <ItemStyle HorizontalAlign="Left" />
                                                                <HeaderStyle Wrap="false" />
                                                                <ItemStyle Wrap="false" />
                                                            </telerik:GridBoundColumn>

                                                        </Columns>
                                                        <EditFormSettings EditFormType="Template">
                                                            <FormTemplate>

                                                                <table id="Table1" width="100%" cellspacing="0"
                                                                    cellpadding="3" border="0" rules="none"
                                                                    style="border-collapse: collapse; background: white;">
                                                                    <tr class="EditFormHeader">
                                                                        <td style="font-size: small" colspan="8">
                                                                            <hr />

                                                                            <asp:Label ID="Label4" runat="server"
                                                                                Text="Edit Details:"
                                                                                Font-Names="Verdana" Font-Size="small"
                                                                                Font-Bold="true"></asp:Label>


                                                                            <hr />
                                                                        </td>
                                                                    </tr>
                            </tr>
                            <td>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            </tr>
                            </tr>
                        </table>
                        </FormTemplate>
                        </EditFormSettings>
                        </telerik:GridTableView>
                        </DetailTables>
                        <Columns>
                            <telerik:GridBoundColumn HeaderText="Consolidation Type" HeaderButtonType="TextButton"
                                DataField="COL_1999870249"> <HeaderStyle BorderWidth="0px" /></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Count" HeaderButtonType="TextButton"
                                DataField="COL_1924404459"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Savings (%)" HeaderButtonType="TextButton"
                                DataField="COL_1919047029"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Shipments" HeaderButtonType="TextButton"
                                DataField="COL_1228984825"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Units" HeaderButtonType="TextButton"
                                DataField="COL_1709099272"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Weight" HeaderButtonType="TextButton"
                                DataField="COL_1905801985"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Cube" HeaderButtonType="TextButton"
                                DataField="COL_1080288899"></telerik:GridBoundColumn>
                        </Columns>
                        </MasterTableView>
                        <clientsettings enablerowhoverstyle="true">
                            <ClientEvents OnHierarchyExpanded="onLoadConsolidationRowExpanded" OnGridCreated="addGroupHeader" />
                            <Selecting AllowRowSelect="true" />
            <ClientEvents OnGridCreated="addGroupHeader" OnHierarchyExpanded="onLoadConsolidationRowExpanded" />
                        </clientsettings>
                        </telerik:RadGrid>
    </div>

                        </td>
                        </tr>
                        </table>
                    </asp:Panel>
                    <div id="truckloaderOverlay" style="
    display: none;
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 1000000;
    justify-content: center;
    align-items: center;">

                        <div style="position: relative; background: transparent; border-radius: 0; box-shadow: none;">

<button onclick="closeTrailerOverlay(); return false;"
    style="position: absolute; top: -12px; right: -12px; 
           background: #c0392b; color: white; border: none; 
           border-radius: 0; /* square corners */
           width: 28px; height: 28px; font-size: 14px; 
           font-weight: bold; cursor: pointer; z-index: 1;">
    X
</button>

<div style="border-radius: 0; /* square corners */
            overflow: hidden; 
            width: 93vw; height: 88vh;">
    <iframe id="truckloaderIframe" style="border: none; width: 100%; height: 100%;"></iframe>
</div>


                    <asp:HiddenField ID="hdnSelectedRegion" runat="server" />
                    <asp:HiddenField ID="hdnSelectedRegionText" runat="server" />
                    <asp:HiddenField ID="hdnSelectedRegionUrl" runat="server" />
                    <asp:HiddenField ID="hdnAllowedRegionIds" runat="server" />

                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet" />
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            </asp:Content>