Imports BusinessManagers.Implementation
Imports BusinessManagers.Interfaces
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Web
Imports System.Web.UI.WebControls
Imports Telerik.Web.UI
Imports System.Collections.Generic
Partial Class LoadConsolidation_Accept
    Inherits System.Web.UI.Page
    Dim obj As New CCommon
    Dim objloadConsolidationManager As LoadConsolidationManager
    Dim objFileTransferUtilityManager As FileTransferUtilityManager
#Region "Public Read Only Property"
    Public ReadOnly Property userCode() As Double
        Get
            Try
                Return Convert.ToDouble(obj.gblUserCode)
            Catch ex As Exception
                Return 0.0
            End Try
        End Get
    End Property
    Public ReadOnly Property ConsolidationNumber() As Double
        Get
            Try
                Return Convert.ToDouble(Request.QueryString("ConsolidationNumber"))
            Catch ex As Exception
                Return 0.0
            End Try
        End Get
    End Property
    Public ReadOnly Property DefaultCurrencyCode() As String
        Get
            Try
                Return obj.gblDefaultCurrencyCode
            Catch ex As Exception
                Return String.Empty
            End Try
        End Get
    End Property
#End Region
    Protected Overrides Sub OnInit(ByVal e As System.EventArgs)

        If (Session.IsNewSession) Then
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('Your session has ended!');", True)
            ClientScript.RegisterClientScriptBlock(GetType(Page), "PopupClose", "<script type='text/javascript'>window.frameElement.radWindow.Close()</script>")
            Exit Sub
        End If

        Try
            obj = Session("COMMON_OBJ")
            objloadConsolidationManager = New BusinessManagers.Implementation.LoadConsolidationManager()
            objFileTransferUtilityManager = New BusinessManagers.Implementation.FileTransferUtilityManager()
            MyBase.OnInit(e)
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred!');", True)
        End Try
    End Sub

    Protected Sub grdConsolidationRates_NeedDataSource(ByVal source As Object, ByVal e As Telerik.Web.UI.GridNeedDataSourceEventArgs) Handles grdConsolidationRates.NeedDataSource

        If (Session.IsNewSession) Then
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('Your session has ended!');", True)
            ClientScript.RegisterClientScriptBlock(GetType(Page), "PopupClose", "<script type='text/javascript'>window.frameElement.radWindow.Close()</script>")
            Exit Sub
        End If

        Try
            If Not e.IsFromDetailTable Then
                BindConsolidationRatesGrid()
            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred!');", True)
        End Try
    End Sub
    Private Sub BindConsolidationRatesGrid()
        Dim dtShipmentConsolidationRates_Display As DataTable = objloadConsolidationManager.getShipmentConsolidationRates_Display(ConsolidationNumber)
        grdConsolidationRates.DataSource = dtShipmentConsolidationRates_Display
    End Sub

    Protected Sub grdConsolidationRates_ItemDataBound(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs) Handles grdConsolidationRates.ItemDataBound

        If (Session.IsNewSession) Then
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('Your session has ended!');", True)
            ClientScript.RegisterClientScriptBlock(GetType(Page), "PopupClose", "<script type='text/javascript'>window.frameElement.radWindow.Close()</script>")
            Exit Sub
        End If

        Try
            If (TypeOf e.Item Is GridDataItem) Then
                Dim LoadNumber As Label = CType(e.Item.FindControl("lblDetail8"), Label)
                Dim ServiceBase As Label = CType(e.Item.FindControl("lblServiceBase"), Label)
                Dim Rate As Label = CType(e.Item.FindControl("lblRate"), Label)

                Dim lbtnDetails As LinkButton = CType(e.Item.FindControl("lbtnDetails"), LinkButton)
                lbtnDetails.Attributes.Add("onclick", "return ShowConsolidationRatesDetails('" + ConsolidationNumber.ToString() + "','" + LoadNumber.Text + "','" + ServiceBase.Text + "','" + Rate.Text + "');")

                'Dim lbtnProcess As LinkButton = CType(e.Item.FindControl("lbtnProcess"), LinkButton)
                'lbtnProcess.Attributes.Add("onclick", "alert('This feature has been disabled!');return false;")
            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred!');", True)
        End Try
    End Sub

    Protected Sub grdConsolidationRates_UpdateCommand(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles grdConsolidationRates.UpdateCommand

        If (Session.IsNewSession) Then
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('Your session has ended!');", True)
            ClientScript.RegisterClientScriptBlock(GetType(Page), "PopupClose", "<script type='text/javascript'>window.frameElement.radWindow.Close()</script>")
            Exit Sub
        End If

        Try
            'Dim dtFileTransferUtilityParameters As DataTable = objFileTransferUtilityManager.getFileTransferUtilityParameters(userCode).Tables(0)

            'Dim editedItem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
            Dim LoadNumber As Label = CType(e.Item.FindControl("lblDetail8"), Label)
            Dim dtShipmentConsolidation_Append As DataTable = objloadConsolidationManager.getShipmentConsolidation_Append(ConsolidationNumber, LoadNumber.Text)
            If (dtShipmentConsolidation_Append.Rows(0)(0).ToString().Trim().Equals("NO DATA")) Then
                ScriptManager.RegisterStartupScript(Page, GetType(Page), "NoData", "alert('This consolidation strategy is not available for processing!');", True)
                Exit Sub
            ElseIf (dtShipmentConsolidation_Append.Rows(0)(0).ToString().Trim().Equals("ERROR")) Then
                ScriptManager.RegisterStartupScript(Page, GetType(Page), "err", "alert('An error occurred!');", True)
                Exit Sub
            ElseIf (dtShipmentConsolidation_Append.Rows(0)(0).ToString().Trim().Equals("NO TRACKING NUMBERS")) Then
                ScriptManager.RegisterStartupScript(Page, GetType(Page), "err", "alert('There are no Waybill/Tracking Numbers for the selected service base!');", True)
                Exit Sub
            ElseIf (dtShipmentConsolidation_Append.Rows(0)(0).ToString().Trim().Equals("NO ITINERARY")) Then
                ScriptManager.RegisterStartupScript(Page, GetType(Page), "err", "alert('The itinerary log cannot be viewed as there is no listed data. The likely cause for this error is an invalid address in the Lane Group array!');", True)
                Exit Sub
            ElseIf (dtShipmentConsolidation_Append.Rows(0)(0).ToString().Trim().Equals("SUCCESS")) Then
                Session("Process") = "SUCCESS"
                ScriptManager.RegisterStartupScript(Page, GetType(Page), "Close", "window.frameElement.radWindow.Close();", True)
            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred!');", True)
        End Try
    End Sub
End Class
