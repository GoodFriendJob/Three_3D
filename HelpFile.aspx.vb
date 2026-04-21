Imports BusinessManagers.Implementation
Imports BusinessManagers.Interfaces
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Web
Imports System.Web.UI.WebControls
Imports Telerik.Web.UI
Imports Telerik.Web.UI.Calendar
Partial Class Common_HelpFile
    Inherits System.Web.UI.Page
    Dim obj As New CCommon
    Dim comManager As CommonManager
    Dim upsManager As UPSManager
    Public ReadOnly Property SessionID() As Double
        Get
            Try
                Return Convert.ToDouble(obj.gblUserCode)
            Catch ex As Exception
                Return 0.0
            End Try
        End Get
    End Property
    Protected Overrides Sub OnInit(ByVal e As System.EventArgs)
        Try
            obj = Session("COMMON_OBJ")
            comManager = New BusinessManagers.Implementation.CommonManager()
            upsManager = New BusinessManagers.Implementation.UPSManager()
            MyBase.OnInit(e)
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred!');", True)
        End Try
    End Sub
End Class
