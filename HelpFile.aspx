<%@ Page Language="VB" AutoEventWireup="false" CodeFile="HelpFile.aspx.vb"
    Inherits="Common_HelpFile" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Phalanx™ Help File</title>

    <script language="javascript" type="text/javascript">
    function OnDisagree()
    {
        GetRadWindow().close();
        window.top.CloseAndOpenWin();
    }
   
    function GetRadWindow()
    {
        var oWindow = null;
        if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
        else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;//IE (and Moz as well)				
        return oWindow;
    }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="Scriptmanager1" runat="server">
            </asp:ScriptManager>
            <telerik:RadWindowManager runat="server" ID="RadWindowTUPSRegistration" Skin="Telerik" IconUrl="../CustomerGraphics/shield.png" Overlay="true" 
                VisibleStatusbar="false" Behaviors="Move">
            </telerik:RadWindowManager>
            <%--<telerik:RadFormDecorator Skin="Telerik" runat="server" ID="RadFormDecorator1" />--%>
          </div>
           
         

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" SelectedIndex="0" Skin="Telerik">
            <Tabs>
                <telerik:RadTab Text="Notes" ></telerik:RadTab>
                <telerik:RadTab Text="Concepts" ></telerik:RadTab>
                <telerik:RadTab Text="Trailers" ></telerik:RadTab>
                
<%--                <telerik:RadTab Text="Video" ImageUrl="../Images/film.png"></telerik:RadTab>
--%>                
            </Tabs>
        </telerik:RadTabStrip>         
     
     
     
                        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" Width="865px" Height="550px" BorderStyle="Solid" BorderWidth="1px" BorderColor="DarkGray">

                    <telerik:RadPageView ID="PageView1" runat="server">
            <table style="font-family: Verdana; font-size: 11px;">
                <tr>
                    <td>
                        <div style="height: 545px; overflow-y: scroll; width: 860px;">
                            <table>
                            
                                <tr>
                                    <td style="text-align: justify">
                                        The Shipment Consolidation Module is a constraint-based component which consolidates shipments into optimal truckloads; 
                                        it runs on a predetermined schedule. Shipments are obtained from the following sources:<br/>
                                        
                            <ul>
                                <li>Shipments effected in the application.</li>
                                <li>Load tenders submitted by customers or carriers; via EDI, XML or web interfaces.</li>
                                <li>Batches in the client's order well queue. </li>
                                    </ul>
                                        
                                    </td>
                                </tr>
                                
                                
                                
                                
                                <tr>
                                    <td>
                                        <strong>Consolidation Strategies</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: justify">
                                    
                                <br>
                                The Consolidation Strategies panel bar lists the pertinent consolidation strategies. Consolidation strategies include:<br/>
                            <ul>
                                <li><asp:Label ID="Label4" runat="server" Text="Consolidation." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Consolidation refers to an optimization process that groups shipments traveling from the same origin to the same destination within the same time frame.</li>

                                <li><asp:Label ID="Label71" runat="server" Text="Load-and-Holds." Font-Italic="true" Font-Underline="true"></asp:Label>
                                .</li>

                                <li><asp:Label ID="Label3" runat="server" Text="Multi-Stop Truckload." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Combines heterogeneous shipments into multi-stop truckloads. This involves missions that pick-up goods or drop them off in more than one location. </li>

                                <li><asp:Label ID="Label72" runat="server" Text="Parcel to Less-than-Truckload." Font-Italic="true" Font-Underline="true"></asp:Label>
                                .</li>

                                <li><asp:Label ID="Label2" runat="server" Text="Pooling." Font-Italic="true" Font-Underline="true"></asp:Label>
                                <asp:Label ID="Label1" runat="server" Text="The pooling strategy reduces transportation costs by combining multiple less-than-truckload shipments into truckloads either by bringing less-than-truckload pick-ups together at a consolidation point, by breaking truckloads into multiple less-than-truckloads for local delivery, or both."></asp:Label>
                                </li>
                                    <ul>
                                                <li><asp:Label ID="Label25" runat="server" Text="In-bound." Font-Italic="true" Font-Underline="true"></asp:Label>
                                                In this approach, shipments from different origins travel separately by higher-priced modes to consolidation or pooling points and then pin together for line-haul by a lower-priced mode.</li>
                                                <li><asp:Label ID="Label26" runat="server" Text="Out-bound." Font-Italic="true" Font-Underline="true"></asp:Label>
                                                The concept of inbound pooling may occur in reverse, with local deconsolidation after line-haul for final delivery by higher-priced mode. This is called outbound pooling.</li>
                                    </ul>
                                

                                    </ul>
                                </tr>
                                
                                
                                <tr>
                                    <td>
                                        <strong>Option</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: justify">
                                    
                            <ul>
                                <li><asp:Label ID="Label27" runat="server" Text="Accept." Font-Italic="true" Font-Underline="true"></asp:Label>
                                When this option is selected, the user chooses a listed carrier to accomplish the consolidation strategy. Shipment parameters are reconfigured to reflect those of the consolidation strategy. Shipment update and/or cancellation messages are transmitted to the applicable carrier(s). The aforementioned is contingent upon the carrier(s) having EDI or XML capability. For carriers without EDI or XML capability, updates may be viewed via a portal. 
                                <br>When Consolidations are processed, the "default" ship date is based upon the shipper's hours of operation. For instance, if a user's hours of operation are 07:00 to 15:00 Monday through Friday and a Consolidation is processed at 10:30 on Monday, the ship date will be Monday. If a Consolidation is processed on Monday at 16:15, the ship date will be Tuesday. Users may go to the Shipments module in order to update the ship date.</br> 
                                If the shipper's hours of operation are not in the system, the "default" is 06:30 to 17:00 Monday through Friday. 
                                <br>The equidistance (the road distance between the shipper and the farthest point) which comprises the rate basis is displayed as:</br> 
                                    <ul>
                                                <li><asp:Label ID="Label28" runat="server" Text="Optimal." Font-Italic="true" Font-Underline="true"></asp:Label>
                                                Address to address road distance and drive time calculation.</li>
                                                <li><asp:Label ID="Label29" runat="server" Text="Good." Font-Italic="true" Font-Underline="true"></asp:Label>
                                                Address to Postal Code (or vice versa) reckoning. This is indicative of an inaccurate address in the Leg.</li>
                                                <li><asp:Label ID="Label30" runat="server" Text="Fair." Font-Italic="true" Font-Underline="true"></asp:Label>
                                                Postal Code to Postal Code enumeration. Denotes errors in the address pair.</li>
                                    </ul>
                                <asp:Label ID="Label31" runat="server" Text="Allocating Truckload Costs to Deliveries." Font-Italic="true" Font-Underline="true"></asp:Label>
                                All loading, unloading, and handling costs, including both carrier and facility charges, which are accumulated on a piece, pallet, unit weight, or unit cube basis are assigned to deliveries loaded and unloaded on the basis of the actual pieces, pallets, weight, or cube of the deliveries.
                                <br>Sum of all stop charges divided evenly over all pickup or delivery:</br> 
                                Stop charges may not accrue evenly across stops. The first and last stops are generally included in the base rate for a move. Additional stops typically accrue additional charges. These charges often increase with each subsequent stop. For example, the first, second, third, and any further additional stops may cost, respectively, $50, $60, $70, $75. All of these charges are summed up and then divided the charges equally over all the stops of the selected category (pickup stops or delivery stops). For instance, if a trip with one pick-up stop and four drop-off stops incurs charges of $0, $50, $60, and $70 for the four drop-off stops and you have chosen to allocate costs over delivery stops, then each delivery stop is assigned ($180/4) = $45 worth of stop charges.
                                <br>The system allocates the cost of each delivery down to its constituent delivery lines on the basis of cube-distance. For example, suppose that a multi-stop truckload traverses the route A-B-C-D with the following distances:</br> 
                                    <ul>
                                                <li>A-B: 50 miles (cumulatively 50).</li>
                                                <li>B-C: 75 miles (cumulatively 125).</li>
                                                <li>C-D: 25 miles (cumulatively 150).</li>
                                                The truckload carries three deliveries:
                                                <li>A-B: 100 pounds, 30 cubic feet, 50 route miles, direct 50 miles.</li>
                                                <li>A-C: 150 pounds, 50 cubic feet, 125 route miles, direct 75 miles.</li>
                                                <li>A-D: 50 pounds, 10 cubic feet, 150 route miles, direct 115 miles.</li>
                                                Using cube-distance allocation, each delivery’s proportion of the total cost equals the product of its cubic volume with either the distance it actually travels or its direct route distance as indicated by the preferences, divided by the sum of all such products.
                                                <br>Using actual distance traveled, the following is Shipment A’s allocation:</br>
                                                <li>(30 x 50) / [(30 x 50) + (50 x 125) + (10 x 150)] = 16%</li>
                                                Using direct route distance, the following is Shipment A’s allocation:
                                                <li>(30 x 50) / [(30 x 50) + (50 x 75) + (10 x 115)] = 23%</li>
                                    </ul>
                                    
                                <li><asp:Label ID="Label32" runat="server" Text="Details." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Displays the stop sequence in the Lane Group (if a multi-stop truckload) and the following shipment detail from the Shipments queue; Carrier, Waybill/Pro Number, Shipment Charges.</li> 
                                
                                <li><asp:Label ID="Label33" runat="server" Text="Lane Group." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Tabulates the stop sequence and addresses in the route. The stop sequence may be modified by "dragging-and-dropping" relevant records.</li> 
                                
                                <li><asp:Label ID="Label34" runat="server" Text="Map." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Geospatial view of the route for multi-stop consolidations, coupled with address details and shipments content summary.</li> 
                                
                                <li><asp:Label ID="Label35" runat="server" Text="Itinerary." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Sequenced series of Legs. The Itinerary consists of one or more Delivery Legs each of which, typically, corresponds to a different Trip. Phalanx™ automatically creates itineraries which comply with DOT Hours-of-Service rules of the origin country. Phalanx™ also takes into consideration the loading and unloading times at each "point."
                                <br>The equidistance (the road distance between the preceding stop and the current) "accuracy" is also displayed:</br>
                                    <ul>
                                                <li><asp:Label ID="Label36" runat="server" Text="Optimal." Font-Italic="true" Font-Underline="true"></asp:Label>
                                                Address to address road distance and drive time calculation.</li>
                                                <li><asp:Label ID="Label37" runat="server" Text="Good." Font-Italic="true" Font-Underline="true"></asp:Label>
                                                Address to Postal Code (or vice versa) reckoning. This is indicative of an inaccurate address in the Leg.</li>
                                                <li><asp:Label ID="Label38" runat="server" Text="Fair." Font-Italic="true" Font-Underline="true"></asp:Label>
                                                Postal Code to Postal Code enumeration. Denotes errors in the address pair.</li>
                                    </ul>
                                    Throughout the driver’s hours are factored in accordance to DOT regulations. Hours are logged in one of four categories:
                                    <ul>
                                                <li><asp:Label ID="Label39" runat="server" Text="Off-duty." Font-Italic="true" Font-Underline="true"></asp:Label>
                                                General off-duty.</li>
                                                <li><asp:Label ID="Label40" runat="server" Text="Off-duty." Font-Italic="true" Font-Underline="true"></asp:Label>
                                                Driver in sleeper berth.</li>
                                                <li><asp:Label ID="Label41" runat="server" Text="On-duty." Font-Italic="true" Font-Underline="true"></asp:Label>
                                                Driving.</li>
                                                <li><asp:Label ID="Label42" runat="server" Text="On-duty." Font-Italic="true" Font-Underline="true"></asp:Label>
                                                Not driving. Loading/unloading.</li>
                                    </ul>
                                    <asp:Label ID="Label43" runat="server" Text="Driver Hours of Operation Disclaimer." Font-Italic="true" Font-Underline="true"></asp:Label>
                                    Although every effort is made to assure that the information we provide is complete and accurate, it is not intended to take the place of published agency regulations. Regulations issued by the U.S. Department of Transportation and its Operating Administrations are published in the Federal Register and compiled in the U.S. Code of Federal Regulations (CFR).
                                    
                                </li> 
                                
                                <li><asp:Label ID="Label44" runat="server" Text="Trailer." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Graphical display of routed shipments loaded onto a container (consolidations with more than two hundred [200] handling units will not be displayed). Complies with the United States Federal Bridge Gross Weight Formula; the maximum allowable weight that any set of axles on a motor vehicle may carry on the Interstate highway system. Assumptions:
                                    <ul>
                                                <li>Unloaded trailer weight of 13,000 lbs.</li>
                                                <li>Truck cab weight of 15,000 lbs.</li>
                                                <li>Total Weight: 80,000 lbs.</li>
                                                <li>Steer Axle: 12,000.</li>
                                                <li>Drive and Rear Axles: 34,000 lbs each.</li>
                                    </ul>
                                The axle weights are the total forces on each axle and include the weight of the tractor, trailer and load. The load size limit is 45,000 lbs, the trailer weight being approximately 13,000 lbs. The default weight of the truck cab is 15,000 lbs. The weight of the trailer is distributed over the drive and rear axles, and the weight of the cab is spread over the steer and drive axles. Since the drive axle carriers a proportion of the cab weight as well as the trailer weight, the overall weight tolerance of the drive axle is lower than the weight tolerance of the rear axle. Since the default trailer weight is 13,000 lbs and that of the cab weight is 15,000 lbs, the drive axle has an overall working load tolerance of 20,000 lbs, and the rear axle has a working tolerance of 27,500 lbs.
                                <br>Weight distribution is paramount since a load with a weight of less than 45,000 lbs can still be illegal if it is poorly distributed (e.g., on drive axle).</br>
                                
                                <li><asp:Label ID="Label45" runat="server" Text="Drivers." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Select a single or two (team) drivers in order to precisely calculate Hours of Operation for the driver(s) as well as pick-up and delivery commitment date(s) and time(s).
                                
                            </ul>
                                
                                <tr>
                                    <td>
                                        <strong>Grid</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: justify">
                                    
                                <ul>
                                <li><asp:Label ID="Label46" runat="server" Text="Delete." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Deletes the selected consolidation. Thereby enabling users to process shipments in the Shipments module. When shipments are in the Consolidation queue, users are not authorized to "Close-out" shipments unless the following occurs in the Load Consolidation module; (1) the consolidation strategy is "deleted" or "accepted."
                                
                                <li><asp:Label ID="Label47" runat="server" Text="Ship Date." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Carrier's contractual pick-up date. 
                                    <ul>
                                                <li>If more than one date applies, the aforementioned will be listed in ranges.</li>
                                                <li>The "Ship Date Range" and "Delivery Date Cluster" constraints are factored.</li>
                                                <li>The calculation of the "departure" date (ship date) in the Itinerary is as follow:.</li>
                                                    <ul>
                                                        <li>"Start" date comprises the maximum ship date of the consolidation array, contingent upon the shipper.</li>
                                                        <li>If the "Start" date is less than the current date, the end of the next "operational" date (or current date if the date and time of the selection falls within the "operational" schedule) is listed.</li>
                                                        <li>If the "Start" date is greater than the current date and falls within the "operational" schedule of the shipper, the beginning of the "operational" date is listed.</li>
                                                        <li>"Operational" dates are obtained by analyzing the Hours of Operation and Holiday Schedules of the contacts contained in the consolidation array.</li>
                                                        <li>The above-listed is applicable to delivery dates as well.</li>
                                                    </ul>
                                     </ul>
                                
                                <li><asp:Label ID="Label73" runat="server" Text="Axle Configuration." Font-Italic="true" Font-Underline="true"></asp:Label>
                                    <ul>
                                <li><asp:Label ID="Label74" runat="server" Text="SDA." Font-Italic="true" Font-Underline="true"></asp:Label>
                                    Single Drive Axle.</li>
                                <li><asp:Label ID="Label75" runat="server" Text="TDA." Font-Italic="true" Font-Underline="true"></asp:Label>
                                    Tandem Drive Axle.</li>
                                <li><asp:Label ID="Label76" runat="server" Text="STA." Font-Italic="true" Font-Underline="true"></asp:Label>
                                    Single Trailer Axle.</li>
                                <li><asp:Label ID="Label77" runat="server" Text="TTA." Font-Italic="true" Font-Underline="true"></asp:Label>
                                    Tandem Trailer Axle.</li>
                                     </ul>
                               
                                <li><asp:Label ID="Label48" runat="server" Text="Shipper." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Location from which the shipment will be depart.</li> 
                               
                                <li><asp:Label ID="Label49" runat="server" Text="''Ultimate'' Consignee." Font-Italic="true" Font-Underline="true"></asp:Label>
                                "Final" recipient.</li> 
                                
                                <ul>
                                <li><asp:Label ID="Label78" runat="server" Text="Note." Font-Italic="true" Font-Underline="true"></asp:Label>
                                    ''Assorted Entities'' denotes multiple shipments wherein the Shipper and/or Consignee address elements comprise various ''names.''</li>
                               </ul>
                               
                                <li><asp:Label ID="Label50" runat="server" Text="Savings." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Sum savings of resulting from consolidation; original shipment charges versus consolidation cost. Cost allocation methodologies include:</li> 
                                    <ul>
                                                <li><asp:Label ID="Label51" runat="server" Text="Freight Cost per Unit Cube Distance." Font-Italic="true" Font-Underline="true"></asp:Label>
                                                Freight Cost per Unit Cube-Distance is equal to the Total Truckload Cost divided by the truckload cube-distance. This is an allocated measure of cost-efficiency. Cube distance is calculated by summing, over all shipments sent by truckload, the product of cubic volume and either (a) actual distance traveled or (b) direct route distance. In addition to cost allocation, this distance specification applies to calculation of Truckload Cost per Unit Cube-Distance and other key performance indicators. As an example of calculating total cube distance using method (a) actual distance traveled, suppose that a multi-stop truckload leaves city A for, sequentially, cities B, C, and D. the road distance of each leg is:
                                                </li>
                                                    <ul>
                                                        <li>A-B: 50 miles (cumulatively 50 miles).</li>
                                                        <li>B-C: 75 miles (cumulatively 125 miles).</li>
                                                        <li>C-D: 25 miles (cumulatively 150 miles).</li>
                                                Suppose also that the truckload carries the following shipments to B, C, and D. 
                                                        <li>A-B: 30 cubic feet.</li>
                                                        <li>A-C: 50 cubic feet.</li>
                                                        <li>A-D: 10 cubic feet.</li>
                                                If this is the case, the total cube-distance based on actual distance traveled for the delivery lines constituting the truckload is:
                                                <br>(30 x 50) + (50 x 125) + (10 x 150) = 9250 cube-foot-miles.</br>        
                                                To compute the total cube-distance for use in this key performance indicator, you must sum this calculation over all the truckloads in the plan.        
                                                <br>In the same example, assume that the distance to carry the shipments, individually and directly (without any other stops) from their origins to their destinations, are:</br>        
                                                        <li>A-B: 50 miles.</li>
                                                        <li>A-C: 75 miles.</li>
                                                        <li>A-D: 115 miles.</li>
                                                Then the total cube-distance using method (b), direct route distance, is:
                                                <br>(30 x 50) + (50 x 75) + (10 x 115) = 6400 cube-miles.</br>     
                                                To compute the total cube-distance for use in this key performance indicator, you must sum this calculation over all of the truckloads in the plan.
                                                    </ul>

                                                <li><asp:Label ID="Label52" runat="server" Text="Freight Cost per Unit Weight Distance." Font-Italic="true" Font-Underline="true"></asp:Label>
                                                Freight Cost per Unit Weight Distance is equal to the Total Truckload Cost divided by the truckload weight distance. This value is an allocated measure of cost-efficiency. The calculation of weight distance is exactly analogous to the calculation of cube distance for the Truckload Cost per Unit Cube-Distance performance indicator, except for the substitution of weight for cubic volume. The same choice of distance calculation method (actual distance traveled or direct route distance) applies for this key performance indicator as for the Truckload Cost per Unit Cube-Distance performance indicator.
                                                <br>As an example of calculating total weight distance using method (a) actual distance traveled, suppose that a multi-stop truckload leaves city A for, sequentially, cities B, C, and D. The road distance of each leg is:</br>        
                                                </li>
                                                    <ul>
                                                        <li>A-B: 50 miles (cumulatively 50 miles).</li>
                                                        <li>B-C: 75 miles (cumulatively 125 miles).</li>
                                                        <li>C-D: 25 miles (cumulatively 150 miles).</li>
                                                Suppose also that the truckload carries the following shipments to, respectively, B, C, and D. 
                                                        <li>A-B: 100 lbs.</li>
                                                        <li>A-C: 150 lbs.</li>
                                                        <li>A-D: 50 lbs.</li>
                                                If this is the case, the total weight-distance based on actual distance traveled for delivery lines constituting the truckload is:
                                                <br>(100 x 50) + (150 x 125) + (50 x 150) = 31250 pounds-miles.</br>        
                                                To compute the total weight-distance for use in this key performance indicator, you must sum this calculation over all of the truckloads in the plan.        
                                                <br>In the same example, assume that the distance to carry the shipments, individually and directly (without any other stops) from their origins to their destinations, are:</br>        
                                                        <li>A-B: 50 miles.</li>
                                                        <li>A-C: 75 miles.</li>
                                                        <li>A-D: 115 miles.</li>
                                                Then the total weight-distance using method (b), direct route distance, is 
                                                <br>(100 x 50) + (150 x 75) + (50 x 115) = 22000 pound-miles.</br>     
                                                To compute the total weight-distance for use in this key performance indicator, you must sum this calculation over all of the truckloads in the plan.
                                                    </ul>
                                                    </ul>
                               
                                 <li><asp:Label ID="Label53" runat="server" Text="Weight." Font-Italic="true" Font-Underline="true"></asp:Label>
                                 Total weight of combined shipments.</li>
                               
                                 <li><asp:Label ID="Label54" runat="server" Text="Cube." Font-Italic="true" Font-Underline="true"></asp:Label>
                                 Cubic volume aggregate.</li>

                                </tr>

                                <tr>
                                    <td>
                                        <strong>Shipments</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: justify">
                                    
                                                    <ul>
                                Summary of all shipments for the selected Bill-to locations.
                                                    </ul>

                                <tr>
                                    <td>
                                        <strong>Pool Points</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: justify">
                                    
                                                    <ul>
                                Consolidation point(s) for the selected Cost Center. Multiple Less-than-Truckload (LTL) shipments may be combined into truckloads, by breaking truckloads into multiple Less-than-Truckloads (LTLs) for local delivery, or both.
                                                <br>Pool Points comprise Cost Centers and/or Facilities "defined" in the Discounts module.</br>     
                                                    </ul>

                                <tr>
                                    <td>
                                        <strong>Constraints</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: justify">
                                                    <ul>
                                 <li><asp:Label ID="Label55" runat="server" Text="Ship Date ''Span'' (in Business Days)." Font-Italic="true" Font-Underline="true"></asp:Label>
                                 The maximum value which may be entered is 15 business days.</li>
                                 <li><asp:Label ID="Label56" runat="server" Text="Delivery Date ''Cluster'' (Business Days)." Font-Italic="true" Font-Underline="true"></asp:Label>
                                 The maximum value which may be entered is 15 business days.</li>
                                 <li><asp:Label ID="Label57" runat="server" Text="Route Circuitous Distance." Font-Italic="true" Font-Underline="true"></asp:Label>
                                 The uttermost expanse from the vector of a trip in which a stop-off may occur; "out-of-route" miles in relation to the Shipper and "Ultimate" Consignee. Listed in Miles or Kilometers, contingent upon the user's default measure units (English or Metric). The maximum value which may be entered is 150 miles (241.4 kilometers).</li>
                                 <li><asp:Label ID="Label58" runat="server" Text="Pool Point Circuitous Distance." Font-Italic="true" Font-Underline="true"></asp:Label>
                                 The uttermost expanse from the vector of a shipment which intersects with a given set of Pool Points. Listed in Miles or Kilometers, contingent upon the user's default measure units (English or Metric). The maximum value which may be entered is 1000 miles (1609 kilometers).</li>
                                 <li><asp:Label ID="Label59" runat="server" Text="Maximum Number of Stops." Font-Italic="true" Font-Underline="true"></asp:Label>
                                 The upper limit of stop-offs which may occur during a multi-stop truckload trip. The maximum value which may be entered is 20 stops.</li>
                                                    </ul>
                                </tr>
                        </div>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
     
                      </telerik:RadPageView>
     
                    <telerik:RadPageView ID="RadPageView2" runat="server">
            <table style="font-family: Verdana; font-size: 11px;">
                <tr>
                    <td>
                        <div style="height: 545px; overflow-y: scroll; width: 860px;">
                        
                        
                        
                            <table>
                            
                                <tr>
                                    <td style="text-align: justify">
                                        <br/>
                                    </td>
                                </tr>

                                        <strong>Basic Data Elements</strong>
                                     <br><br/>
                                        An order may contain multiple Order Lines. An Order Line belongs to exactly one order and can contain one or more Delivery Lines. One or more Delivery Lines make up a Delivery. A Delivery Line can belong to no more than one Delivery. A Delivery can have one or more Delivery Legs. Any number of Delivery Legs can be assigned to a trip. Multiple Trips make up a Continuous Move.<br/>
                            <ul>
                                                <asp:Image ID="Image2" runat="server" ImageUrl="../Images/LoadConsolidation_image001.jpg" Visible="true"/>
                                                <br>Figure 1. Basic Data Elements.<br/> 
                            </ul>

                            <ul>
                                <li><asp:Label ID="Label5" runat="server" Text="Order." Font-Italic="true" Font-Underline="true"></asp:Label>
                                An Order is a collection of various items in various quantities to be transported from originating locations to destination locations. An Order is a collection of one or more Order Lines. An Order may be a purchase order, sales order, or internal move order.</li>
                                <li><asp:Label ID="Label6" runat="server" Text="Order Line." Font-Italic="true" Font-Underline="true"></asp:Label>
                                An Order Line is an element of an Order and represents a specified quantity of a specified item to transport from a specific location to another specific location. An Order Line belongs to exactly one Order. An Order may include one or more Order Lines.</li>
                                <li><asp:Label ID="Label7" runat="server" Text="Delivery Line." Font-Italic="true" Font-Underline="true"></asp:Label>
                                A Delivery Line represents a specified quantity of a specified item to transport from a specific location to another, with potentially, a specific availability date and time or delivery deadline. A Delivery Line belongs to exactly one Order Line. An Order Line consists of one or more Delivery Lines, but, typically, a one-to-one correspondence exists between Order Lines and Delivery Lines.</li>
                                An Order Line is usually split into multiple Delivery Lines only in specific circumstances that require doing so. For example, when an Order Line is too voluminous to fit into a single truck or when sufficient inventory availability does not exist for the entire Order Line quantity to be fulfilled at the same time, the Order Line may be split into multiple Delivery Lines.    
                                         <ul>
                                            <li><asp:Label ID="Label8" runat="server" Text="Delivery." Font-Italic="true" Font-Underline="true"></asp:Label>
                                            A Delivery is a collection of Delivery Lines that share a specific common origin and destination and travel together from that origin to that destination. A Delivery contains one or more Delivery Lines that correspond to Order Lines from one or more Orders. A Delivery Line can belong to no more than one Delivery.</li>
                                            <li><asp:Label ID="Label9" runat="server" Text="Delivery Leg." Font-Italic="true" Font-Underline="true"></asp:Label>
                                            A Delivery Leg represents a direct traversal by a Delivery between two locations through a consistent means of transport, where consistent indicates that any change of vehicle is transparent to the shipper. This may be transportation by less-than-truckload or parcel carrier, a direct truckload movement, or one or more stop-to-stop legs of a multi-stop truckload movement. A Delivery Leg associates exactly one Delivery to exactly two stops (an origin and a destination) on a Trip.</li>
                                            <li><asp:Label ID="Label10" runat="server" Text="Delivery Itinerary." Font-Italic="true" Font-Underline="true"></asp:Label>
                                            A delivery Itinerary represents the sequenced series of Delivery Legs through which any Delivery is transported. A Delivery Itinerary consists of one or more Delivery Legs each of which typically, corresponds to a different trip.</li>
                                            <li><asp:Label ID="Label11" runat="server" Text="Trip Leg." Font-Italic="true" Font-Underline="true"></asp:Label>
                                            A Trip Leg refers to a direct non-stop traversal between two locations by a consistent means of transport. This may mean a direct origin-to-destination transit by less-than-truckload or parcel carrier, a direct truckload move, or the transit between consecutive stops of a multi-stop truckload movement. </li>
                                            <li><asp:Label ID="Label12" runat="server" Text="Trip." Font-Italic="true" Font-Underline="true"></asp:Label>
                                            A Trip is a sequenced series of one or more Trip Legs constituting a continuous movement by a consistent means of transport. In reality, every Trip Leg constitutes an entire Trip except that a multi-stop truckload includes multiple sequenced Trip Legs. Every Trip Leg, therefore, belongs to exactly one Trip and a Trip consists of one or more Trip Legs.</li>
                                        </ul>
                                    </ul>
                                        
                            </table>
                               
                               
                               
                            <table>
                            
                                <tr>
                                    <td style="text-align: justify">
                                        <br/>
                                    </td>
                                </tr>

                                        <strong>Continuous Move</strong>
                                     <br><br/>
                                        A Continuous Move is sequenced series of two or more Trips that a single truck makes. Empty Trips (Trips not bearing any cargo) can be present in a Continuous Move. Every Trip in a Continuous Move belongs to exactly one Continuous Move. Not every Trip needs to be part of a Continuous Move. Example: <br/>
                                        
                            <ul>
                                <li>Consider four deliveries: A, B, C, and D. Figure 2 illustrates this example.</li>
                                <li>Delivery A travels from origin 1 to stop 3 by a less-than-truckload carrier and delivery C travels from origin 2 to stop 3 by a less-than-truckload carrier. Delivery B joins deliveries A and C at pool point 3 and they are consolidated to form a truckload. The truckload proceeds to stop 4, which is the destination point for delivery C. the truckload containing deliveries A and B proceeds to stop 5, where delivery D joins it. The truckload, now containing deliveries A, B, and D, proceeds to stop 6, which is the final destination point for deliveries B and D. from stop 6, delivery A is shipped through parcel mode to its destination point 7.</li> 
                                The path 3-4-5-6 represents a multiple-stop truckload.

                                                <asp:Image ID="Image1" runat="server" ImageUrl="../Images/LoadConsolidation_image002.jpg" Visible="true"/>
                                <br>Figure 2. Example for Deliveries, Delivery Lines, Orders, and Trips.<br/> 
                                <br><br/>            

                                                <asp:Image ID="Image3" runat="server" ImageUrl="../Images/LoadConsolidation_image003.jpg" Visible="true"/>
                                <br>Table-1. Origins and destinations of deliveries A, B, C, and D.<br/> 
                                <br><br/>            
                                <li>A multi-stop truckload 3-4-5-6 travels from origin 3 to destination 6 with stops at locations 4 and 5. This constitutes a Trip with three Trip Legs.</li>
                                <br><br/>            

                                                <asp:Image ID="Image4" runat="server" ImageUrl="../Images/LoadConsolidation_image004.jpg" Visible="true"/>
                                <br>Table-2. Trip legs in the multi-stop truckload.<br/> 
                                <br><br/>            
                            
                                <li>Apart from the multi-stop truckload, the moves contain three Trips, each consisting of exactly one Trip Leg. The following Table-3 shows the other Trips involved in the movement of deliveries A, B, C, and D.</li>
                                <br><br/>            

                                                <asp:Image ID="Image5" runat="server" ImageUrl="../Images/LoadConsolidation_image005.jpg" Visible="true"/>
                                <br>Table-3. Other Trips involved in the movement of deliveries A, B, C, and D.<br/> 
                                <br><br/>            
                            
                                <li>The delivery itineraries for the four Deliveries consist of the following Delivery Legs. Table-4 shows the Delivery Legs in the itineraries of Deliveries A, B, C, and D.</li>
                                <br><br/>            

                                                <asp:Image ID="Image6" runat="server" ImageUrl="../Images/LoadConsolidation_image006.jpg" Visible="true"/>
                                <br>Table-4. Delivery Legs in the itineraries of Deliveries A, B, C, and D.<br/> 
                                <br><br/>            
                            
                                <li>Delivery Leg 2 of Delivery A, Delivery Leg 1 of Delivery B, and Delivery Leg 2 of Delivery C are on board Trip Leg 1 of the multiple-stop trip.</li>
                                        
                            </table>
                            
                            
                            <table>
                            
                                <tr>
                                    <td style="text-align: justify">
                                        <br/>
                                    </td>
                                </tr>

                                        <strong>Modes and Carrier Services</strong>
                                     <br><br/>
                                        Phalanx™ supports decisions among Air Freight, Lineal, Less-than-Truckload (LTL), Ocean, Parcel, Truckloads and Rail.<br/>
                                        
                            <ul>
                                <li><asp:Label ID="Label14" runat="server" Text="Less-than-Truckload (LTL)." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Less-than-truckload carriers typically operate fixed, scheduled, hub-and-spoke truck networks over which individual pieces of cargo can travel between various origins and destinations.</li>
                                    <ul>
                                            <li>In less-than-truckload moves, the shipper does not manage the transportation assets. The shipper only has cargo picked-up and delivered. The actual routing of goods between the origin and destination is not controlled by the shipper. Less-than-truckload carriers pick up the cargo, route it through their own scheduled network of trips and hubs, and deliver it at the destination.</li>
                                            <li>Less-than-truckload rating is based largely on unit of weight. Less-than-truckload carriers define weight breaks and apply deficit rating to fill in differences between weight breaks. Rates per unit vary by origin and destination pair as well as by freight class.</li>
                                    </ul>
                                Cost per unit of cargo for less-than-truckload movements, while significantly higher than those for nearly full truckload moves, are much lower than those for parcel carriers. As less-than-truckload carriers optimize their pick-up, delivery, and handling systems for relatively large pieces, they apply minimum charges per shipment. This makes parcel carriers advantageous for the smallest shipments.
                                <li><asp:Label ID="Label15" runat="server" Text="Parcel." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Parcel carriers operate in a manner similar to less-than-truckload carriers in that they carry distinct pieces over hub-and-spoke networks. The handling systems, however, are destined to carry very high volumes of very small packages.</li>
                                    <ul>
                                            <li>Parcel carriers charge the shipper based on quantity of cargo shipped. Shippers generally pay for each package separately. The parcel rate for a package is based on weight, origin and destination, and service. Examples for services offered are Overnight, Second Day, and Third Day. For groups of packages over 150 pounds, hundredweight (cwt) service rates are sometimes available. In these schemes, the cost is calculated per 100 pounds of cargo, the number of packages is not considered.</li>
                                            <li>Due to the intense cost of small package handling, parcel carriers demand a high cost per unit of cargo weight. Most corporate shippers make use of parcel services for only the smaller of shipments.</li>
                                    </ul>
                                <li><asp:Label ID="Label16" runat="server" Text="Truckload." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Truckload carrier services involve a shipper who hires a truck and driver to travel between two points. This shipper decides how the truck reaches the destination from the origin: the route, the stops made along the way, and what needs to be done at each stop.</li>
                                    <ul>
                                            <li>The carrier may charge the shipper based on flat rates or per unit of distance, time, weight, or volume. The shipper may incur additional charges that include the following:</li>
                                        <ul>
                                                <li>Stop charges.</li>
                                                <li>Unloading and loading charges.</li>
                                                <li>Origin and destination surcharges.</li>
                                        </ul>
                                            <li>This mode becomes most economical when the truck is fully loaded and the deviation from a direct route is "minimum." While truckload transportation offers the lowest rate per unit of cargo when the hired equipment is well utilized, a shipper needs to pay for the entire truck or trailer even if the amount of cargo carried is small. For this reason, smaller shipments or loads can travel more economically through less-than-truckload carriers.</li>
                                    </ul>
                                <li><asp:Label ID="Label13" runat="server" Text="Carrier Services." Font-Italic="true" Font-Underline="true"></asp:Label>
                                In the less-than-truckload and parcel moves, various service levels constitute an important component of the carrier’s value offering. Most often, service levels indicate various transit or delivery commitments that a carrier makes to a shipper. For example, a parcel carrier may offer the following kinds of services.</li>
                                    <ul>
                                            <li>Same Day.</li>
                                            <li>Priority Overnight.</li>
                                            <li>Standard Overnight.</li>
                                            <li>Second Day.</li>
                                            <li>Third Day.</li>
                                    </ul>
                                Similarly, a less-than-truckload carrier’s services may include:
                                    <ul>
                                            <li>Standard.</li>
                                            <li>Expedited.</li>
                                            <li>Deferred.</li>
                                            <li>Definite.</li>
                                    </ul>
                            
                                        
                            </table>
                            
                            <table>
                            
                                <tr>
                                    <td style="text-align: justify">
                                        <br/>
                                    </td>
                                </tr>

                                        <strong>Load Consolidation Strategies</strong>
                                     <br><br/>
                                        Load consolidation groups smaller shipments or pieces of split-up shipments together in order for them to travel by a mode priced lower than the best available if these shipments were to travel separately. The optimization process may also combine such trips into continuous moves.<br/>

                                        While simple consolidation involves grouping shipments with the same origin, destination, and time-frames; more complex strategies can group more disparate shipments. Pooling, Cross-Docking, and Multiple-Stop Truckloads are consolidation methods that Phalanx™ planning may apply to meet such requirements.<br/>
                                        
                            <ul>
                                <li><asp:Label ID="Label17" runat="server" Text="Simple Consolidation." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Simple consolidation refers to an optimization process that groups shipments traveling from the same origin to the same destination in the same time frame. While this strategy gains economies with the least amount of effort and disruption, it is limited in the value it can create.
                                      
                               <br>Figure 3 illustrates this optimization method. Several shipments travel from a common origin ("O") to a common destination ("D") in a single trip.<br/>
                                </li>
                                
                                <br><br/>            

                                                <asp:Image ID="Image7" runat="server" ImageUrl="../Images/LoadConsolidation_image007.jpg" Visible="true"/>
                                <br>Figure 3. Simple Consolidation.<br/> 
                                <br><br/>            
                                
                                <li><asp:Label ID="Label18" runat="server" Text="Pooling." Font-Italic="true" Font-Underline="true"></asp:Label>
                                The pooling strategy reduces transportation costs by combining multiple less-than-truckload shipments into truckloads either by bringing less-than-truckload pick-ups together at a consolidation point, by breaking truckloads into multiple less-than-truckloads for local delivery, or both.</li>
                                <li><asp:Label ID="Label24" runat="server" Text="Inbound Pooling." Font-Italic="true" Font-Underline="true"></asp:Label>
                                In this approach, shipments from different origins travel separately by higher-priced modes to consolidation or pooling points and then pin together for line-haul by a lower-priced mode.
                                <br>Figure 4 illustrates inbound pooling. Shipments from origins O1, O2, and O3 travel separately to pool point P where they are consolidated for line haul to a common destination D.<br/>
                                </li>
                                
                                <br><br/>            

                                                <asp:Image ID="Image8" runat="server" ImageUrl="../Images/LoadConsolidation_image008.jpg" Visible="true"/>
                                <br>Figure 4. Inbound Pooling.<br/> 
                                <br><br/>            

                                <li><asp:Label ID="Label19" runat="server" Text="Outbound Pooling." Font-Italic="true" Font-Underline="true"></asp:Label>
                                The concept of inbound pooling may occur in reverse, with local deconsolidation after line-haul for final delivery by higher-priced mode. This is called outbound pooling.</li>
                                Figure 5 illustrates outbound pooling. A truck carrying shipments from a common origin O travels to a pool point P where the load is deconsolidated. The shipments then travel separately by other modes to their separate destinations D1, D2, and D3.
                                
                                <br><br/>            

                                                <asp:Image ID="Image9" runat="server" ImageUrl="../Images/LoadConsolidation_image009.jpg" Visible="true"/>
                                <br>Figure 5. Outbound Pooling.<br/> 
                                <br><br/>            

                                <li><asp:Label ID="Label20" runat="server" Text="Multi-Tier Pooling." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Combining inbound and outbound pooling approaches and applying both outbound consolidation and inbound deconsolidation to build a line-haul load is known as multi-tier pooling.</li>
                                Figure 6 illustrates multi-tier pooling. Shipments traveling separately from origins O1, O2, and O3 are consolidated for line haul at pool point P1. The line haul carries the shipments to pool point P2 where the load is deconsolidated. The shipments then travel separately to their respective destinations D1, D2, and D3 by other modes.
                                
                                <br><br/>            

                                                <asp:Image ID="Image10" runat="server" ImageUrl="../Images/LoadConsolidation_image010.jpg" Visible="true"/>
                                <br>Figure 6. Multi-Tier Pooling.<br/> 
                                <br><br/>            

                                <li><asp:Label ID="Label21" runat="server" Text="Hub-and-Spoke Cross-Docking." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Multiple consolidations and deconsolidations may occur at the same pooling point. This may allow small shipments traveling on different line-haul loads to be consolidated at their common origin so that they together comprise a full truckload. If this occurs, both inbound and outbound, the consolidation and deconsolidation, or reconsolidation, occur at the same point. This yields a hub-and-spoke or cross-docking scenario, similar to the typical operations of hubbed passenger airlines or the internal operations of less-than-truckload companies. Companies applying this strategy internally, effectively in-source their less-than-truckload business.</li>
                                Figure 7 illustrates a hub and spoke cross-docking scenario. A-X, A-Y, and A-Z are shipments that originate from A and are consolidated together. B-X, B-Y, and B-Z are shipments that originate from C and are consolidated together. Note that the notation A-X indicates a shipment bound for destination X from origin A, A-Y indicates a shipment bound for destination Y from origin A, and so on. The shipments, consolidated at each origin, arrive at the cross-dock facility. At the cross-dock facility, the shipments are deconsolidated and then consolidated based on their destinations into the following loads:
                                    <ul>
                                            <li>A-X, B-X, C-X</li>
                                            <li>A-Y, B-Y, C-Y</li>
                                            <li>A-Z, B-Z, C-Z</li>
                                   </ul>
                                   The newly consolidated loads travel to destinations X, Y, and Z.
                                <br><br/>            

                                                <asp:Image ID="Image11" runat="server" ImageUrl="../Images/LoadConsolidation_image011.jpg" Visible="true"/>
                                <br>Figure 7. Pure Hub and Spoke Cross Docking.<br/> 
                                <br><br/>            

                                <li><asp:Label ID="Label22" runat="server" Text="Multi-Stop Truckloads." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Combines heterogeneous shipments into multi-stop truckloads. This involves missions that pick-up goods or drop them off in more than one location. While the truck may move less than fully loaded for some part of its trip, this method can still bring great economies in comparison with less-than-truckload moves are greater as the truck’s overall utilization rises and as the deviation from a direct route between the first origin and the final destination decreases. Some carriers permit interspersing of loading and unloading points while others require that all loading stops occur before the first unloading stop.</li>
                                Figure 8 shows a multi-stop truckload move with a number of pick-up and drop-off stops. The truckload picks up three shipments bound for stops W, X, and Y at origin stop A. at stop B, the truck picks up another shipment traveling to stop W. The truck proceeds with the remaining shipments picked up from A, bound for stops X and Y. At stop C, the truck picks up another shipment bound for stop Z. At stop X, the truck proceeds with the remaining shipments to stop D, where it picks up another shipment bound for stop Y. At stop Y, the truck drops off the two shipments, one from A and the other from D, which were bound for Y. The truck then proceeds to stop Z where it drops off the shipment picked up from C that was bound for Z.
                                
                                <br><br/>            

                                                <asp:Image ID="Image12" runat="server" ImageUrl="../Images/LoadConsolidation_image012.jpg" Visible="true"/>
                                <br>Figure 8. Multi-pickup, multi-drop-Off loads.<br/> 
                                <br><br/>            

                                <li>Phalanx™ applies all of the consolidation strategies separately, as well as in combination. A fully optimized solution may include complex combinations of pooling and multi-pick or multi-drop trips.</li>
                                Figure 9 shows a combined multi-stop and pooling scenario in which a truck makes several pick-ups and then several drop-offs. One such drop-off stop is at a deconsolidation center, from where several orders continue to final delivery by less-than-truckload trips.
                                
                                <br><br/>            

                                                <asp:Image ID="Image13" runat="server" ImageUrl="../Images/LoadConsolidation_image013.jpg" Visible="true"/>
                                <br>Figure 9. Combined multi-stop/pooling scenario.<br/> 
                                <br><br/>            

                                <li><asp:Label ID="Label23" runat="server" Text="Continuous Moves." Font-Italic="true" Font-Underline="true"></asp:Label>
                                After constructing optimized trips, the transportation planning process considers combining the trips into continuous moves. A continuous move consists of a sequence of trips that a single truck may serve one mission.</li>
                                Truckload carriers often give preferential pricing for continuous moves, relative to the sum of the individual trips making-up the move. This is because the combination of movements helps the carrier to address geographical equipment imbalances and the massed business volume helps the carrier to increase resource utilization. Pricing advantages often reach significant enough levels to justify the inclusion of empty movements between loaded legs, as part of the continuous move building process. These empty trips are called deadheads.
                                Phalanx™ supports various pricing schemes for continuous moves.
                                Figure 10 illustrates a continuous move. A truck carries a shipment from its origin A to its destination B. the truck then proceeds without any cargo from point B to point C. At C, the truck picks-up another shipment and carries the shipment to its destination D. The truck picks up another shipment and carries the shipment to its destination D. The truck then travels unloaded from point D to point E. At E, the truck picks-up a shipment and carries the shipment to its destination F. A-B-C-D-E-F is a continuous move. A-B, C-D, and E-F are loaded trips and B-C and D-E are empty trips.
                                In figure 10, the bold arrows indicate loaded trips and the dotted arrows indicate empty trips.
                                
                                <br><br/>            

                                                <asp:Image ID="Image14" runat="server" ImageUrl="../Images/LoadConsolidation_image014.jpg" Visible="true"/>
                                <br>Figure 10. Continuous moves.<br/> 
                                <br><br/>            

                                                    </ul>
                                </tr>
                        </div>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
     
                      </telerik:RadPageView>
     


                    <telerik:RadPageView ID="RadPageView3" runat="server">
            <table style="font-family: Verdana; font-size: 11px;">
                <tr>
                    <td>
                        <div style="height: 545px; overflow-y: scroll; width: 860px;">
                            <table>
                            
                                <tr>
                                    <td style="text-align: justify">
                                        Phalanx™ considers vehicle type and availability constraints coupled with attributes such as payload capacity and dimensions during the consolidation process.
                            <br><br/>
                                        <br>Figure 1 summarizes the implications of the effective volume capacities:
                                        <br/>

                                                <asp:Image ID="Image15" runat="server" ImageUrl="../Images/LoadConsolidation_image015.jpg" Visible="true"/>
                                                <br>Figure 1. The implications of the effective volume capacities on planning.<br/> 
                                        <br>The interpretation of Figure 1 is as follow. Note, for this example, stop count includes the origin and the destination.<br/>
                                        
                            <ul>
                                <li>No valid trip exists with no pool stops and no non-pool stops, or just one pool stop, or one non-pool stop, that is, at least two stops are required to make a trip.</li>
                                <li>If a trip has two stops and both are non-pool stops, then the effective volume capacity of the vehicle is the effective volume capacity of a direct move. In Figure 1, consider the intersection cell of 0 pool stops and 2 non-pools.</li>
                                <li>If a trip has two stops and both are pool stops, then the effective volume capacity of the vehicle is effective volume capacity of a two-pool move.</li>
                                <li>If a trip has two stops and one was a pool stop and the other a non-pool stop, then the effective volume capacity of the container is effective volume capacity of a pool move.</li>
                                <li>For any trip with more than two pool stops, the effective volume capacity is that of the volume capacity of a two pool move.</li>
                                <li>If a trip has three stops and all of them are non-pool stops, then the effective volume capacity of the volume capacity of the container is the effective volume capacity of a one stop move.</li>
                                <li>If a trip includes four stops and all of them are non-pool stops, then the effective volume capacity of the vehicle capacity of the vehicle is the effective volume capacity of a two stop move.</li>
                                <li>For any trip with more than three non-pool stops (and no non-pool stop or one non-pool stop), the effective volume capacity is that of the volume capacity of a two stop move.</li>
                                <li>If three stops are present on a trip, and two of the stops are non-pool stops and one is a pool stop, then the effective volume capacity of the vehicle is the minimum of the effective volume capacity of a pool move and the effective volume capacity of a two stop move.</li>
                                <li><asp:Label ID="Label99" runat="server" Text="Note:" Font-Italic="true" Font-Underline="true"></asp:Label>
                                Mission dependent capacity applies only to non-palletized planning. For palletized planning, the effective volume capacity is the direct move capacity, regardless of the type of move involved.</li>
                                    </ul>
                                        
                                    </td>
                                </tr>
                                
                                
                                
                                
                                <tr>
                                    <td>
                                        <strong>Trailer Types</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: justify">
                                    
                                <br>
                                There are, however, ten basic types of trailers used in international trade. Almost all trailers in existence are a variation of these trailer types. They are:<br/>
                            <ul>
                                <li>Freight Van.</li>
                                <li>Refrigerated Van (Reefer).</li>
                                <li>Container Carrier.</li>
                                <li>Platform Trailer.</li>
                                <li>Tanker.</li>
                                <li>Livestock Trailer.</li>
                                <li>Dry Bulk Trailer.</li>
                                <li>Furniture Van.</li>
                                <li>Auto Transporter.</li>
                                <li>Timber Trailer.</li>

                                                <asp:Image ID="Image16" runat="server" ImageUrl="../Images/LoadConsolidation_image016.jpg" Visible="true"/>
                                                <br>Figure 2. Guide to truck trailer dimensions.<br/> 
                            <br><br/>
                            <li>Freight (Van, Box) Trailer.</li>
                            <ul>
                                <li><asp:Label ID="Label60" runat="server" Text="Use." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Freight trailers (also called dry vans or simply "boxes") are designed to carry virtually any kind of boxed, crated, or palletized freight.</li>
                                <li><asp:Label ID="Label61" runat="server" Text="Configurations." Font-Italic="true" Font-Underline="true"></asp:Label></li>
                                    <ul>
                                        <li>Standard lengths: 28', 32', 36', 40', 42', 43', 45', 48' and 53'.</li>
                                        <li>Standard widths: 96"-102".</li>
                                        <li>Standard heights: 12.5'-13.5' overall.</li>
                                        <li>Shorter trailers are typically used for local deliveries or in tandem "truck trains."</li>
                                        <li>Standard axle/wheel configuration: 2-axle/8-wheel. For heavier loads: 3-axle/12-wheel or 4-axle/16-wheel configurations are also available.</li>
                                    </ul>
                                <li><asp:Label ID="Label62" runat="server" Text="Features and Options." Font-Italic="true" Font-Underline="true"></asp:Label></li>
                                    <ul>
                                        <li>Rear swing doors or roll up doors.</li>
                                        <li>One or two side doors, rollerbeds.</li>
                                    </ul>
                                <li><asp:Label ID="Label63" runat="server" Text="Notes." Font-Italic="true" Font-Underline="true"></asp:Label></li>
                                    <ul>
                                        <li>Freight trailers are manufactured worldwide by a multitude of local and international firms.</li>
                                        <li>Dimensional, weight and capacity data are a function of cargo requirements, trailer manufacturer, trailer model and national, state and provincial roadway requirements.</li>
                                    </ul>
                            </ul>
                          
                          <asp:Image ID="Image17" runat="server" ImageUrl="../Images/LoadConsolidation_image017.jpg" Visible="true"/>
                          <asp:Image ID="Image18" runat="server" ImageUrl="../Images/LoadConsolidation_image018.jpg" Visible="true"/>
                          <br>Figure 3. Freight (Van, Box) Trailer.<br/> 
                            <br><br/>
                                <li><asp:Label ID="Label64" runat="server" Text="Reefer (Refrigerated) Van." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Use.</li>
                                    <ul>
                                        <li>Reefers are insulated and refrigerated trailers designed to transport perishable items. </li>
                                        <li>Commodities transported include vegetables, fruits, milk, juices, meats and poultry.</li>
                                    </ul>
                                <li><asp:Label ID="Label65" runat="server" Text="Configurations." Font-Italic="true" Font-Underline="true"></asp:Label>
                                    <ul>
                                        <li>Standard lengths: 28', 32', 36', 40', 48' and 53'.</li>
                                        <li>Standard widths: 96"-102".</li>
                                        <li>Standard heights: 12.5'-13.5' overall.</li>
                                        <li>Shorter trailers are typically used for local deliveries or in tandem "truck trains."</li>
                                        <li>Standard axle/wheel configuration: 2-axle/8-wheel. For heavier loads: 3-axle/12-wheel or 4-axle/16-wheel configurations are also available.</li>
                                    </ul>
                                <li><asp:Label ID="Label66" runat="server" Text="Features and Options." Font-Italic="true" Font-Underline="true"></asp:Label></li>
                                    <ul>
                                        <li>Rear swing doors or roll up doors.</li>
                                        <li>One or two side doors.</li>
                                        <li>Moveable bulkheads, liftgates, and temperature recording and monitoring systems.</li>
                                        <li>Single or multi-temperature models.</li>
                                        <li>A wide variety of refrigeration units are available.</li>
                                    </ul>
                                <li><asp:Label ID="Label67" runat="server" Text="Notes." Font-Italic="true" Font-Underline="true"></asp:Label></li>
                                    <ul>
                                        <li>Freight trailers are manufactured worldwide by a multitude of local and international firms.</li>
                                        <li>Dimensional, weight and capacity data are a function of cargo requirements, trailer manufacturer, trailer model and national, state and provincial roadway requirements.</li>
                                    </ul>
                          <asp:Image ID="Image19" runat="server" ImageUrl="../Images/LoadConsolidation_image019.jpg" Visible="true"/>
                          <asp:Image ID="Image20" runat="server" ImageUrl="../Images/LoadConsolidation_image020.jpg" Visible="true"/>
                          <br>Figure 4. Reefer (Refrigerated) Van.<br/> 
                            <br><br/>
                                <li><asp:Label ID="Label68" runat="server" Text="Dry Bulk Trailer (Hopper)." Font-Italic="true" Font-Underline="true"></asp:Label>
                                Dry bulk trailers are designed to carry dry free-flowing commodities including grain, shelled corn, cornmeal, feeds, hulled rice, beans, gravel, limestone (loose and pulverized), and sand.</li>
                                <li><asp:Label ID="Label69" runat="server" Text="Configurations." Font-Italic="true" Font-Underline="true"></asp:Label>
                                    <ul>
                                        <li>Standard lengths: 26' to 42'.</li>
                                        <li>Standard widths: 96"-102".</li>
                                        <li>Hopper configurations: single, double and triple.</li>
                                        <li>Open and closed end configurations.</li>
                                        <li>Steel and aluminum models.</li>
                                        <li>Available as singles, tandems, and three trailer truck "trains".</li>
                                    </ul>
                                <li><asp:Label ID="Label70" runat="server" Text="Notes." Font-Italic="true" Font-Underline="true"></asp:Label></li>
                                    <ul>
                                        <li>Dry bulk trailers use rolled tarpaulin tops rather than rigid tops.</li>
                                        <li>Typical dry bulk trailers use hoppers to unload, however, others empty conveyor systems.</li>
                                        <li>Different trailer manufacturers worldwide produce a variety of models designed for different freight configurations.</li>
                                    </ul>
                           Dimensional, weight and capacity data are a function of cargo requirements, trailer manufacturer and trailer model.
                                    
                                </tr>
                                
                        </div>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
     
                      </telerik:RadPageView>
     


                    <telerik:RadPageView ID="RadPageView1" runat="server">
            
                            <div style="margin-top: 5px;" ></div>

        <div>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblStatus" runat="server" BackColor="Transparent"
                            Font-Size="Large">
								<Blink>The Help File Animation for this module (coupled with sound) will be placed here</Blink>
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"  codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0"
                            width="250" height="200" id="../Flash/lift_truck_intro_RevA_3-1-09" align="middle" >
                            <param name="allowScriptAccess" value="sameDomain" />
                            <param name="movie" value="../Flash/lift_truck_intro_RevA_3-1-09.swf" />
                            <param name="quality" value="high" />
                            <param name="bgcolor" value="#ffffff" />
                            <embed src="../Flash/lift_truck_intro_RevA_3-1-09.swf" quality="high" bgcolor="#ffffff" 
                                width="430px" height="250px" name="../Flash/lift_truck_intro_RevA_3-1-09" align="middle" 
                                allowscriptaccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" /></object>
                    </td>
                </tr>
            </table>
        </div>


           </object> 
            
                   </telerik:RadPageView>
     
        </telerik:RadMultiPage>
     

 
 
    </form>
</body>
</html>
