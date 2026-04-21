<%@ page language="VB" autoeventwireup="false" inherits="OrderRouting_AspData, App_Web_aspdata.aspx.62c128f4" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Asp Data</title>

    <script language="javascript" type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <telerik:RadListView ID="rlvTest" runat="server">
            <ItemTemplate></ItemTemplate> 
            </telerik:RadListView>
        </div>
    </form>
</body>
</html>
