Imports BusinessManagers.Implementation
Imports BusinessManagers.Interfaces
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Web
Imports System.Web.UI.WebControls
Imports Telerik.Web.UI
Imports System.Collections.Generic
Partial Class LoadConsolidation_Details
    Inherits System.Web.UI.Page
    Dim obj As New CCommon
    Dim objloadConsolidationManager As LoadConsolidationManager
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
            MyBase.OnInit(e)
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred!');", True)
        End Try
    End Sub

    Protected Sub grdDetails_NeedDataSource(ByVal source As Object, ByVal e As Telerik.Web.UI.GridNeedDataSourceEventArgs) Handles grdDetails.NeedDataSource

        If (Session.IsNewSession) Then
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('Your session has ended!');", True)
            ClientScript.RegisterClientScriptBlock(GetType(Page), "PopupClose", "<script type='text/javascript'>window.frameElement.radWindow.Close()</script>")
            Exit Sub
        End If

        Try
            If Not e.IsFromDetailTable Then
                BindSummaryGrid()
            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred!');", True)
        End Try
    End Sub
    Private Sub BindSummaryGrid()

        If (Session.IsNewSession) Then
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('Your session has ended!');", True)
            ClientScript.RegisterClientScriptBlock(GetType(Page), "PopupClose", "<script type='text/javascript'>window.frameElement.radWindow.Close()</script>")
            Exit Sub
        End If

        Dim dtShipmentConsolidationDetails As DataTable = objloadConsolidationManager.getShipmentConsolidationDetails(ConsolidationNumber, DefaultCurrencyCode)
        grdDetails.DataSource = dtShipmentConsolidationDetails
    End Sub
End Class
