<%@ page language="VB" autoeventwireup="false" inherits="LoadConsolidation_Accept, App_Web_accept.aspx.241f34d1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rate Results</title>
</head>
    
    <style type="text/css">  
        .rgRow td, .rgAltRow td, .rgHeader td, .rgFilterRow td  
        {  
            border-left: solid 1px lightgray !important;  
        }  
    </style>  

    <style type="text/css">  
        .RadComboBoxDropDown .rcbScroll {   
        overflow-x: auto !important;   
        overflow-y: hidden !important;   
        } 
    </style>  
  
<style type="text/css">       
   div.RadGrid .rgPager .rgAdvPart      
   {      
    display:none;         
   }       
</style>  
    <asp:UpdateProgress ID="updateProgress" runat="server">
        <ProgressTemplate>
            <div id="wait1" IsSticky="true" Skin="Telerik" EnableSkinTransparency="true" Transparency="25" style="z-index: 10000; left: 0px; position: absolute; top: 0px; 
                 background-color: Transparent;
                display: none; height: 100%; width: 100%; class="modalBox_backdrop">
                <img src="../Images/LoadingProgressBar.gif" alt="" style="position: absolute; top: 50%; left: 50%;" width="64px" height="64px" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="grdConsolidationRates">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="grdConsolidationRates" LoadingPanelID="RadAjaxLoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" IsSticky="true" runat="server" Skin="Telerik"   
            EnableSkinTransparency="true" Transparency="25" BackColor="Transparent"  style="z-index: 10000; left: 23%; position: absolute; top: 50%; left: 50%;">  
            <asp:Image ID="Image1" runat="server" ImageUrl="../Images/LoadingProgressBar.gif" style="border: 0px;" width="64px" height="64px" >   
            </asp:Image>  
        </telerik:RadAjaxLoadingPanel>  
        
        <div>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="top">
                        <telerik:RadGrid runat="server" ID="grdConsolidationRates" AllowPaging="True" PageSize="10"
                            Skin="Sitefinity" AutoGenerateColumns="false">
                            <MasterTableView>
                                <Columns>
                                    <telerik:GridBoundColumn HeaderText="ListItem" DataField="ListItem" UniqueName="ListItem"
                                        HeaderButtonType="TextButton" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn HeaderText="Service Base" UniqueName="Service Base">
                                        <ItemTemplate>
                                            <asp:Label ID="lblServiceBase" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Detail1")%>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridTemplateColumn HeaderText="Rate" UniqueName="Rate">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Detail2")%>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn HeaderText="Rate Basis" DataField="Detail3" UniqueName="Detail3"
                                        HeaderButtonType="TextButton">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Days" DataField="Detail4" UniqueName="Detail4"
                                        HeaderButtonType="TextButton" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Time" DataField="Detail5" UniqueName="Detail5"
                                        HeaderButtonType="TextButton" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Pick-up" DataField="Detail6" UniqueName="Detail6"
                                        HeaderButtonType="TextButton" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Delivery" DataField="Detail7" UniqueName="Detail7"
                                        HeaderButtonType="TextButton" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn HeaderText="Detail8" UniqueName="Detail8" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDetail8" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Detail8")%>'></asp:Label>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn HeaderText="Detail9" DataField="Detail9" UniqueName="Detail9"
                                        HeaderButtonType="TextButton" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Detail10" DataField="Detail10" UniqueName="Detail10"
                                        HeaderButtonType="TextButton" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Detail11" DataField="Detail11" UniqueName="Detail11"
                                        HeaderButtonType="TextButton" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Detail12" DataField="Detail12" UniqueName="Detail12"
                                        HeaderButtonType="TextButton" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Detail13" DataField="Detail13" UniqueName="Detail13"
                                        HeaderButtonType="TextButton" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Detail14" DataField="Detail14" UniqueName="Detail14"
                                        HeaderButtonType="TextButton" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Header" DataField="Header" UniqueName="Header"
                                        HeaderButtonType="TextButton" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn HeaderText="">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnDetails" runat="server" Text="Details"></asp:LinkButton>
                                            |
                                            <asp:LinkButton ID="lbtnProcess" runat="server" Text="Process" CommandName="Update" ></asp:LinkButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView>
                              <ClientSettings EnableRowHoverStyle="true">
                                                    <Selecting AllowRowSelect="True" />
                            </ClientSettings> 
                        </telerik:RadGrid>
                    </td>
                </tr>
            </table>
        </div>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableViewState="false"
            Style="z-index: 20000" ReloadOnShow="true" ShowContentDuringLoad="false" Modal="true"
            VisibleStatusbar="false" Skin="Telerik">
        </telerik:RadWindowManager>

        <script language="javascript" type="text/javascript">
	    function ShowConsolidationRatesDetails(ConsolidationNumber,LoadNumber,ServiceBase,Rate)
		{
			var wnd = window.radopen("ConsolidationRatesDetails.aspx?LoadNumber="+ LoadNumber +"&ConsolidationNumber="+ ConsolidationNumber +"&ServiceBase="+ ServiceBase +"&Rate="+ Rate +"", "winDetails");
            wnd.setSize(400,400);
            return false;
		}
        </script>

    </form>
</body>
</html>
