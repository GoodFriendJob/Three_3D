<%@ page language="VB" autoeventwireup="false" inherits="LoadConsolidation_Details, App_Web_details.aspx.241f34d1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Details</title>
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

<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <table>
                <tr>
                    <td>
                        <telerik:RadGrid runat="server" ID="grdDetails" Skin="Telerik" AutoGenerateColumns="false"
                            AllowPaging="true" PageSize="10">
                            <MasterTableView>
                                <Columns>
                                    <telerik:GridBoundColumn HeaderText="Stop" HeaderButtonType="TextButton" DataField="Stop"
                                        UniqueName="Stop" HeaderStyle-Wrap ="False" ItemStyle-Wrap = "false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Carrier" HeaderButtonType="TextButton" DataField="Carrier"
                                        UniqueName="Carrier" HeaderStyle-Wrap ="False" ItemStyle-Wrap = "false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Waybill/Pro Number" HeaderButtonType="TextButton"
                                        DataField="Waybill/Pro Number" UniqueName="Waybill/Pro Number" HeaderStyle-Wrap ="False" ItemStyle-Wrap = "false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn HeaderText="Charges" HeaderButtonType="TextButton" DataField="Charges"
                                        UniqueName="Charges" HeaderStyle-Wrap ="False" ItemStyle-Wrap = "false">
                                    </telerik:GridBoundColumn>
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
    </form>
</body>
</html>
