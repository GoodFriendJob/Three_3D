<%@ page language="VB" autoeventwireup="false" inherits="OrderRouting_Overflow, App_Web_overflow.aspx.62c128f4" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Overflow</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="scr" runat="server">
            </asp:ScriptManager>
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="grdOverflow">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="grdOverflow" LoadingPanelID="RadAjaxLoadingPanel1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Transparency="30"
                BackColor="#E0E0E0" InitialDelayTime="500">
                <asp:Image ID="Image1" Style="margin-top: 10px" runat="server" ImageUrl="../Images/ajax_LoadingProgressBar.gif"
                    BorderWidth="0px" ></asp:Image>
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadGrid ID="grdOverflow" Skin="Telerik" ShowStatusBar="True" runat="server"
                AutoGenerateColumns="False" AllowPaging="True" PageSize="15" AllowSorting="True">
                <MasterTableView Width="100%" DataKeyNames="ContactCode" Name="Parent" DataMember="Parent">
                    <DetailTables>
                        <telerik:GridTableView Width="100%" runat="server" Name="Child" DataMember="Child">
                            <DetailTables>
                                <telerik:GridTableView Width="100%" runat="server" Name="GrandChild" DataMember="GrandChild">
                                    <Columns>
                                        <telerik:GridBoundColumn HeaderText="SKU" HeaderButtonType="TextButton" DataField="SKU"
                                            UniqueName="SKU" SortExpression="SKU">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Description" HeaderButtonType="TextButton" DataField="Description"
                                            UniqueName="Description" SortExpression="Description">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Quantity" HeaderButtonType="TextButton" DataField="Quantity"
                                            UniqueName="Quantity" SortExpression="Quantity">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                    <RowIndicatorColumn Visible="False">
                                        <HeaderStyle Width="20px" />
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn Resizable="False" Visible="False">
                                        <HeaderStyle Width="20px" />
                                    </ExpandCollapseColumn>
                                </telerik:GridTableView>
                            </DetailTables>
                            <Columns>
                                <telerik:GridBoundColumn HeaderText="Date" HeaderButtonType="TextButton" DataField="Date"
                                    UniqueName="Date" SortExpression="Date">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="P.O. Number" HeaderButtonType="TextButton" DataField="P.O. Number"
                                    UniqueName="P.O. Number" SortExpression="P.O. Number">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="S.O. Number" HeaderButtonType="TextButton" DataField="S.O. Number"
                                    UniqueName="S.O.Number" SortExpression="S.O. Number">
                                </telerik:GridBoundColumn>
                            </Columns>
                            <RowIndicatorColumn Visible="False">
                                <HeaderStyle Width="20px" />
                            </RowIndicatorColumn>
                            <ExpandCollapseColumn Resizable="False">
                                <HeaderStyle Width="20px" />
                            </ExpandCollapseColumn>
                        </telerik:GridTableView>
                    </DetailTables>
                    <Columns>
                        <telerik:GridBoundColumn HeaderText="Company" HeaderButtonType="TextButton" DataField="Company"
                            UniqueName="Company" SortExpression="Company">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Street Address" HeaderButtonType="TextButton"
                            DataField="Street Address" UniqueName="Street Address" SortExpression="Street Address">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="City and Province" HeaderButtonType="TextButton"
                            DataField="City and Province" UniqueName="City and Province" SortExpression="City and Province">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="CountryandPostalCode" HeaderButtonType="TextButton"
                            DataField="CountryandPostalCode" UniqueName="CountryandPostalCode" SortExpression="CountryandPostalCode">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="ContactCode" HeaderButtonType="TextButton" DataField="ContactCode"
                            UniqueName="ContactCode" SortExpression="ContactCode" Visible="false">
                        </telerik:GridBoundColumn>
                    </Columns>
                    <RowIndicatorColumn Visible="False">
                        <HeaderStyle Width="20px" />
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn Resizable="False">
                        <HeaderStyle Width="20px" />
                    </ExpandCollapseColumn>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </form>
</body>
</html>
