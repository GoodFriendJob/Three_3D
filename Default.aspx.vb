Imports BusinessManagers.Implementation
Imports BusinessManagers.Interfaces
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Web
Imports System.Web.UI.WebControls
Imports Telerik.Web.UI
Imports Subgurim.Controles
Imports System.Collections.Generic
Imports TrailerLoading
Imports System.Web.Security
Imports System.Web.Mail
Imports System.Net
Imports System.Text
Imports System.Reflection
Imports System
Imports System.Collections
Imports Org.BouncyCastle.Asn1.X509.Qualified
Imports System.Diagnostics




Partial Class LoadConsolidation_Default
    Inherits System.Web.UI.Page
    Dim sameNode As String = ""
    Dim dtNow As DateTime = DateTime.Now
    Dim RefreshDS As String
    Dim isUpdated As Integer = 0
    Dim _status As String = ""
    Dim _queue As String = ""
    Dim obj As New CCommon
    Dim loadConsolidationManager As LoadConsolidationManager
    Dim accessorialsManager As AccessorialsManager
    Dim orderRoutingManager As OrderRoutingManager
    Dim objShipmentsManager As ShipmentsManager
    Dim objCommonManager As CommonManager
    Dim shipManager As ShipmentsManager
    Dim iCal As Integer = 0
    Public rNumb As New Random
    Public val As Decimal


    Public Shared noOfAxles
    Public Shared axleSpacing
    Public Shared MovieName As String
    Public Shared drawMCTop
    Public Shared drawMCSide
    Public Shared drawMCEnd
    Public Shared FAlpha = 100
    Public Shared ColorName = "green"
    Public Shared c = 0
    Public Shared nextCntBurstWgt = 10000
    Public Shared posW As Decimal = 0
    Public Shared posWE As Decimal = 0
    Public Shared posL As Decimal = 0
    Public Shared posH As Decimal = 0
    Public Shared trailerRow = 1
    Public Shared cntBurstWeight = 10000
    Public Shared prevCntArea = 61056
    Public Shared cntArea = 0
    Public Shared cntRemainArea = 10000
    Public Shared contactArea  '= 0
    Public Shared contactAreaBurstPsiGood = True
    Public Shared noCntLoaded = 0
    Public Shared noCntOnTruck = 0
    Public Shared noSurfLoaded = 0
    Public Shared noSurfRemoved = 0
    Public Shared noSurfChecked = 0
    Public Shared nextCntWidth As Decimal = 0
    Public Shared nextCntLength As Decimal = 0
    Public Shared nextCntHeight As Decimal = 0
    Public Shared nextCntID
    Public Shared cntLoading = 0
    Public Shared prevCntID = 0
    Public Shared widthRemain As Decimal = 0
    Public Shared nextCntBurstWeight = 0
    Public Shared nextCntWgt = 0
    Public Shared loadedTrailerWgt = 0
    Public Shared maxTrailerW = 97  'pull from web later
    Public Shared maxTrailerL = 636  'pull from web later
    Public Shared maxTrailerH = 109  'pull from web later
    Public Shared truckNetWeight = 15000
    Public Shared trailerNetWeight = 13000
    Public Shared driveAxleNetLoad = (truckNetWeight / 2) + (trailerNetWeight / 2)
    Public Shared rearAxleNetLoad = trailerNetWeight / 2
    Public Shared maxTrailerWgt = 54000  'pull from web later
    Public Shared singleDriveAxle As Boolean = False
    Public Shared tandemDriveAxle As Boolean = False
    Public Shared singleRearAxle As Boolean = False
    Public Shared tandemRearAxle As Boolean = False

    Public Shared minTrailerLength As Decimal = 0
    Public Shared minTrailerLengthFeet = 0
    Public Shared minTrailerlengthInches = 0
    Public Shared totalNoOfCnts = 16  'pull from web later
    Public Shared hitFlagTop = False
    Public Shared hitFlagSide = False

    Public Shared hitFlagEnd = False
    Public Shared hitFlagTrailer = False
    Public Shared hitFlagCnt = False
    Public Shared p2HitFlag As Boolean = False
    Public Shared p1HitFlag As Boolean = False
    Public Shared heightPln = 0
    Public Shared topOffsetX = 40
    Public Shared topOffsetY = 80
    Public Shared sideOffsetX = 40
    Public Shared sideOffsetY = 351 + 109
    Public Shared endOffsetX = 867
    Public Shared endOffsetY = 460

    Public Shared cntSeqNoInHeightPln = 0
    Public Shared p8x As Decimal
    Public Shared p8y As Decimal
    Public Shared p8z As Decimal
    Public Shared p2x As Decimal
    Public Shared p2y As Decimal
    Public Shared p2z As Decimal
    Public Shared p3x As Decimal
    Public Shared p3y As Decimal
    Public Shared p3z As Decimal
    Public Shared p4x As Decimal
    Public Shared p4y As Decimal
    Public Shared p4z As Decimal
    Public Shared p5x As Decimal
    Public Shared p5y As Decimal
    Public Shared p5z As Decimal
    Public Shared p6x As Decimal
    Public Shared p6y As Decimal
    Public Shared p6z As Decimal
    Public Shared p7x As Decimal
    Public Shared p7y As Decimal
    Public Shared p7z As Decimal


    Public Shared p1xHit = False
    Public Shared p1yHit = False
    Public Shared p1zHit = False
    Public Shared p2xHit = False
    Public Shared p2yHit = False
    Public Shared p2zHit = False
    Public Shared p3xHit = False
    Public Shared p3yHit = False
    Public Shared p3zHit = False
    Public Shared p4xHit = False
    Public Shared p4yHit = False
    Public Shared p4zHit = False
    Public Shared p5xHit = False
    Public Shared p5yHit = False
    Public Shared p5zHit = False
    Public Shared p6xHit = False
    Public Shared p6yHit = False
    Public Shared p6zHit = False
    Public Shared p7xHit = False
    Public Shared p7yHit = False
    Public Shared p7zHit = False
    Public Shared p8xHit = False
    Public Shared p8yHit = False
    Public Shared p8zHit = False

    Public Shared tmpp1xHit = False
    Public Shared tmpp1yHit = False
    Public Shared tmpp1zHit = False
    Public Shared tmpp2xHit = False
    Public Shared tmpp2yHit = False
    Public Shared tmpp2zHit = False
    Public Shared tmpp3xHit = False
    Public Shared tmpp3yHit = False
    Public Shared tmpp3zHit = False
    Public Shared tmpp4xHit = False
    Public Shared tmpp4yHit = False
    Public Shared tmpp4zHit = False
    Public Shared tmpp5xHit = False
    Public Shared tmpp5yHit = False
    Public Shared tmpp5zHit = False
    Public Shared tmpp6xHit = False
    Public Shared tmpp6yHit = False
    Public Shared tmpp6zHit = False
    Public Shared tmpp7xHit = False
    Public Shared tmpp7yHit = False
    Public Shared tmpp7zHit = False
    Public Shared tmpp8xHit = False
    Public Shared tmpp8yHit = False
    Public Shared tmpp8zHit = False

    Public Shared tmpP8x As Decimal
    Public Shared topFrontCheck = False
    Public Shared contactAreaSizeOk = False
    Public Shared checkTopNextCounter = 0
    Public Shared minBurstStrength = 0
    Public Shared tmpMinBurstStrength = 0

    Public Shared tmpP8xVal As Decimal = 0
    Public Shared kingPinOverHang = 60
    Public Shared driveAxleWgt = driveAxleNetLoad
    Public Shared rearAxleWgt = rearAxleNetLoad
    Public Shared txtInit = 0
    Public Shared startTime
    Public Shared endTime
    Public Shared nowTime
    Public Shared lX = 0

    Public Const gridSizeS = 34
    Public Const ArrayNumberS = 1000
    Public Const gridSizeC = 13
    Public Const ArrayNumberC = 1000
    Public Shared loadArrC(ArrayNumberC, gridSizeC) As String
    Public Shared surfaceArr(ArrayNumberS, gridSizeS) As String
    Public Shared p2HitFlagArr(100, 3) As String
    Public Shared p1HitFlagArr(100, 3) As String
    Public Shared surfFound As Boolean = False
    Public Shared verticalContact As Boolean = False
    Public Shared verticalContactRight As Boolean = False
    Public Shared surfaceContact As Boolean = False
    Public Shared foundMatch As Boolean = False
    Public Shared burstStrength = 0
    Public Shared p2HitFlagCounter As Integer = 0
    Public Shared p1HitFlagCounter As Integer = 0
    Public Shared driveAxleNoTxt As String
    Public Shared rearAxleNoTxt As String



#Region "ReadOnly Property"
    Public ReadOnly Property userCode() As Double
        Get
            Try
                Return Convert.ToDouble(obj.gblUserCode)
            Catch ex As Exception
                Return 0.0
            End Try
        End Get
    End Property
    Public ReadOnly Property TimeZoneCode() As Double
        Get
            Try
                Return Convert.ToDouble(obj.gblLocalComputerTimeZoneCode)
            Catch ex As Exception
                Return 0.0
            End Try
        End Get
    End Property
    Public ReadOnly Property DefaultShipper() As Double
        Get
            Try
                Return Convert.ToDouble(obj.gblDefaultShipper)
            Catch ex As Exception
                Return 0.0
            End Try
        End Get
    End Property
    Public ReadOnly Property MultipleFOBSelection() As Double
        Get
            Try
                Return Convert.ToDouble(obj.gblMultipleFOBSelection)
            Catch ex As Exception
                Return 0.0
            End Try
        End Get
    End Property
    Public ReadOnly Property defaultMeasure() As Double
        Get
            Try
                Return Convert.ToDouble(obj.gblDefaultMeasure)
            Catch ex As Exception
                Return 0.0
            End Try
        End Get
    End Property
    Public ReadOnly Property Origin_Destination() As String
        Get
            Try
                If hdnSelectedRegion IsNot Nothing AndAlso Not String.IsNullOrWhiteSpace(hdnSelectedRegion.Value) Then
                    Return hdnSelectedRegion.Value.Trim() + "$%?|*"
                End If
                Return Me.grdLoadConsolidation.MasterTableView.GetColumn("Origin").CurrentFilterValue + "$%?|*" + Me.grdLoadConsolidation.MasterTableView.GetColumn("Destination").CurrentFilterValue
            Catch ex As Exception
                Return String.Empty
            End Try
        End Get
    End Property
#End Region
    Protected Sub grdLoadConsolidation_CustomAggregate(ByVal sender As Object, ByVal e As GridCustomAggregateEventArgs)
        Dim str As String = ""
        If (grdLoadConsolidation.Items.Count > 0) Then
            Dim item = DirectCast(grdLoadConsolidation.Items(0), GridDataItem)
            If item IsNot Nothing Then
                str += item.GetDataKeyValue("Summary_Current")
            End If
        End If
        e.Result = str
    End Sub

    Private Sub RedirectToMainLoginPage()
        Const loginUrl As String = "~/Common/Login.aspx"

        If ScriptManager.GetCurrent(Me) IsNot Nothing AndAlso ScriptManager.GetCurrent(Me).IsInAsyncPostBack Then
            ScriptManager.RegisterStartupScript(Me, Me.GetType(), "SessionTimeoutRedirect", "window.top.location='" & ResolveUrl(loginUrl) & "';", True)
            Context.ApplicationInstance.CompleteRequest()
        Else
            Response.Redirect(loginUrl, False)
            Context.ApplicationInstance.CompleteRequest()
        End If
    End Sub
    Protected Sub btnApprove_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        If (Session.IsNewSession) Then
            RedirectToMainLoginPage()
            Exit Sub
        End If

        Try


            Dim isSelectedCheckbox As Boolean = False
            If (obj.gblInvoiceAdjustments = -1) Then
                ScriptManager.RegisterStartupScript(Page, GetType(Page), "Msg", "alert('You are not authorized to approve invoices!')", True)
                Exit Sub
            End If

            For Each grdItem As GridDataItem In grdLoadConsolidation.Items
                Dim chkTender As CheckBox = DirectCast(grdItem.FindControl("chkTender"), CheckBox)
                If (chkTender.Checked = True) Then
                    isSelectedCheckbox = True
                End If
            Next

            If isSelectedCheckbox = False Then
                ScriptManager.RegisterStartupScript(Page, GetType(Page), "Msg", "alert('Please make a selection.');", True)
                UnCheckedChk()
                Exit Sub



                For Each grdItem As GridItem In grdLoadConsolidation.Items
                    Dim chkTender As CheckBox = DirectCast(grdItem.FindControl("chkTender"), CheckBox)
                    If (chkTender.Checked = True) Then
                        Dim LoadNumberDetails As Double = 0
                        LoadNumberDetails = grdItem.OwnerTableView.DataKeyValues(grdItem.ItemIndex)("LoadNumber")
                        Dim dtShipmentTender As DataTable = shipManager.getShipmentTender(LoadNumberDetails, userCode)

                    End If
                Next
            Else
                Dim LoadNumberDetails As Double = 0
                For Each grdItem As GridItem In grdLoadConsolidation.Items
                    Dim chkTender As CheckBox = DirectCast(grdItem.FindControl("chkTender"), CheckBox)
                    If (chkTender.Checked = True) Then
                        Dim cmd As New SqlCommand
                        Dim db As New CDatabase
                        Dim dtShipmentTender As New DataTable
                        Dim proNumber As String = grdItem.Cells(12).Text
                        'LoadNumberDetails = grdItem.OwnerTableView.DataKeyValues(grdItem.ItemIndex)("LoadNumber")
                        'objcmd.CommandTimeout = 50000
                        'cmd.Parameters.Add(New SqlParameter("@SessionID", userCode))
                        'cmd.Parameters.Add(New SqlParameter("@LoadNumber", LoadNumberDetails))
                        'dtShipmentTender = db.FillDataSql("spInvoiceSummaryApproval", cmd).Tables(0)

                        ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('You are not authorized to print Proof of Deliveries!');", True)

                    End If
                Next




            End If

        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred_1!');", True)
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session.IsNewSession) Then
            RedirectToMainLoginPage()
        Else

            Try
                MenuImage()
                If Not Page.IsPostBack Then
                    hdnAllowedRegionIds.Value = GetAllowedRegionIdsCsv()
                    ' Req 9: Skip Selection Criteria overlay, load grid directly
                    Session.Remove("grdLoadConsolidationData")
                    Session.Remove("childDataCache")
                    loadConsolidation_MainGrid()
                Else
                    loadConsolidation_MainGrid()
                End If
            Catch ex As Exception
                ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred_2!');", True)
            End Try

        End If

    End Sub

    Private Function GetAllowedRegionIdsCsv() As String
        Try
            If obj Is Nothing Then
                obj = TryCast(Session("COMMON_OBJ"), CCommon)
            End If

            If obj Is Nothing Then
                Return String.Empty
            End If

            Using connection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConStr").ConnectionString)
                Using command As New SqlCommand("sp000001942514572", connection)
                    command.CommandType = CommandType.StoredProcedure
                    command.Parameters.AddWithValue("@P001", obj.gblUserCode)
                    Dim outputParam As New SqlParameter("@P002", SqlDbType.VarChar, -1)
                    outputParam.Direction = ParameterDirection.Output
                    command.Parameters.Add(outputParam)

                    connection.Open()
                    command.ExecuteNonQuery()

                    If outputParam.Value Is Nothing OrElse outputParam.Value Is DBNull.Value Then
                        Return String.Empty
                    End If

                    Return Convert.ToString(outputParam.Value).Trim()
                End Using
            End Using
        Catch ex As Exception
            Return String.Empty
        End Try
    End Function

    'Protected Sub btnProcess_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcess.Click
    '    If (Session.IsNewSession) Then
    '        Response.Redirect("~/Common/Login.aspx")
    '        Exit Sub
    '    End If
    'End Sub

    Protected Overrides Sub OnInit(ByVal e As System.EventArgs)
        Try
            obj = Session("COMMON_OBJ")
            loadConsolidationManager = New BusinessManagers.Implementation.LoadConsolidationManager()
            accessorialsManager = New BusinessManagers.Implementation.AccessorialsManager
            orderRoutingManager = New BusinessManagers.Implementation.OrderRoutingManager()
            objShipmentsManager = New BusinessManagers.Implementation.ShipmentsManager()
            objCommonManager = New BusinessManagers.Implementation.CommonManager()
            MyBase.OnInit(e)
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred_3!');", True)
        End Try
    End Sub
    'Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

    '    If (Session.IsNewSession) Then
    '        Response.Redirect("~/Common/Login.aspx")
    '        Exit Sub
    '    End If

    '    Try
    '        If Not Page.IsPostBack Then
    '            If (iCal = 0) Then
    '                If (Session("login") IsNot Nothing) Then
    '                    If (Session("login") = "Y") Then
    '                        MPLoadConsolidation.Show()
    '                    End If
    '                End If
    '            End If
    '        End If
    '    Catch ex As Exception
    '        ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred_4!');", True)
    '    End Try
    'End Sub
    Private Sub UnCheckedChk()

        If (Session.IsNewSession) Then
            RedirectToMainLoginPage()
            Exit Sub
        End If

        For Each grdItem As GridDataItem In grdLoadConsolidation.Items
            Dim chkTender As CheckBox = DirectCast(grdItem.FindControl("chkTender"), CheckBox)
            chkTender.Checked = False
        Next

    End Sub

    Private Sub MenuImage()
        Dim RadMenuCtrl As New RadMenu
        RadMenuCtrl = Me.Master.FindControl("Menu1")
        RadMenuCtrl.Visible = False

        Dim RadMenuCtrl2 As New RadMenu
        RadMenuCtrl2 = Me.Master.FindControl("menu2")
        RadMenuCtrl2.Visible = True

        Dim ctrl As New System.Web.UI.WebControls.Image
        ctrl = Me.Master.FindControl("Image2")
        ctrl.ImageUrl = "~/Images/caption_load_consolidation.png"
    End Sub
    'Private Sub LoadCostCenter(ByVal filter As String)

    '    If (Session.IsNewSession) Then
    '        Response.Redirect("~/Common/Login.aspx")
    '        Exit Sub
    '    End If

    '    Try
    '        Dim cmd As New SqlCommand
    '        Dim dt As New DataTable
    '        Dim db1 As New CDatabase
    '        cmd.Parameters.Add(New SqlParameter("@start", filter))
    '        cmd.Parameters.Add(New SqlParameter("@MultipleFOBSelection", MultipleFOBSelection))
    '        cmd.Parameters.Add(New SqlParameter("@DefaultFOBPoint", DefaultShipper))
    '        cmd.Parameters.Add(New SqlParameter("@SessionID", userCode))
    '        ddlCostCenter.DataSource = db1.FillDataSql("spFOBList", cmd).Tables(0)
    '        ddlCostCenter.DataTextField = "ContactAddress"
    '        ddlCostCenter.DataValueField = "ContactCode"
    '        ddlCostCenter.DataBind()
    '    Catch ex As Exception
    '        ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred!');", True)
    '    End Try
    'End Sub

    'Protected Sub ddlCostCenter_ItemsRequested(ByVal o As Object, ByVal e As Telerik.Web.UI.RadComboBoxItemsRequestedEventArgs) Handles ddlCostCenter.ItemsRequested

    '    If (Session.IsNewSession) Then
    '        Response.Redirect("~/Common/Login.aspx")
    '        Exit Sub
    '    End If

    '    Try
    '        LoadCostCenter(e.Text)
    '    Catch ex As Exception
    '        ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred!');", True)
    '    End Try
    'End Sub

    'Protected Sub btnProcess_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcess.Click

    '    If (Session.IsNewSession) Then
    '        Response.Redirect("~/Common/Login.aspx")
    '        Exit Sub
    '    End If

    '    Try

    '        Dim cmd As New SqlCommand
    '        Dim db As New CDatabase

    '        Dim obj As New CCommon
    '        obj = Session("COMMON_OBJ")

    '        Dim dt As New DataTable
    '        Dim objcmd As New SqlCommand

    '        cmd.CommandTimeout = 50000
    '        Dim isCalculation As Integer = 0

    '        Dim connection As SqlConnection = New SqlConnection()
    '        connection.ConnectionString = ConfigurationManager.ConnectionStrings("ConStr").ConnectionString

    '        Dim command As New SqlCommand("sp000000777217971", connection)
    '        command.CommandType = CommandType.StoredProcedure
    '        command.Parameters.Add("@P001", SqlDbType.Bit).Direction = ParameterDirection.Output
    '        connection.Open()
    '        command.ExecuteNonQuery()
    '        isCalculation = Convert.ToInt32(command.Parameters("@P001").Value)
    '        connection.Close()


    '        If (isCalculation <> 1) Then
    '            objcmd.Parameters.Clear()
    '            objcmd.Parameters.Add(New SqlParameter("@P001", obj.gblUserCode))
    '            objcmd.Parameters.Add(New SqlParameter("@P002", obj.gblDefaultMeasure))
    '            objcmd.Parameters.Add(New SqlParameter("@P003", obj.gblDefaultMeasure))
    '            dt = db.FillDataSql("sp000001741100755", objcmd).Tables(0)

    '            grdLoadConsolidation.Visible = False

    '            grdLoadConsolidation.DataSource = dt
    '            grdLoadConsolidation.Visible = True
    '            grdLoadConsolidation.Rebind()
    '        Else
    '            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('Calculations are in progress!');", True)
    '            grdLoadConsolidation.Visible = False
    '            menuLoadConsolidation.Visible = False
    '        End If
    '    Catch ex As Exception
    '        ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred_5!');", True)
    '        iCal = 0
    '    End Try
    'End Sub

    Protected Sub loadConsolidation_MainGrid()
        If (Session.IsNewSession) Then
            RedirectToMainLoginPage()
            Exit Sub
        End If

        Try
            If (iCal = 0) Then
                ' If data is already cached in session, skip DB call and let NeedDataSource handle pagination
                If Session("grdLoadConsolidationData") IsNot Nothing Then
                    grdLoadConsolidation.Visible = True
                    dropdownTreeContainer.Visible = True
                    Exit Sub
                End If

                If (Session("login") IsNot Nothing) Then
                    If (Session("login") = "Y") Then
                        Dim cmd As New SqlCommand
                        Dim db As New CDatabase

                        Dim obj As New CCommon
                        obj = Session("COMMON_OBJ")

                        Dim dt As New DataTable
                        Dim objcmd As New SqlCommand

                        cmd.CommandTimeout = 50000
                        Dim isCalculation As Integer = 0

                        Dim connection As SqlConnection = New SqlConnection()
                        connection.ConnectionString = ConfigurationManager.ConnectionStrings("ConStr").ConnectionString

                        Dim command As New SqlCommand()
                        command.Connection = connection
                        command.CommandText = "sp000000777217971"
                        command.CommandType = CommandType.StoredProcedure
                        command.Parameters.Add("@P001", SqlDbType.Bit).Direction = ParameterDirection.Output
                        connection.Open()
                        command.ExecuteNonQuery()
                        isCalculation = Convert.ToInt32(command.Parameters("@P001").Value)
                        connection.Close()

                        Select Case isCalculation
                            Case Is <> 1
                                command.Parameters.Clear()
                                command.CommandText = "sp000001812195728"
                                command.CommandType = CommandType.StoredProcedure
                                command.Parameters.AddWithValue("@P001", obj.gblUserCode)
                                command.Parameters.AddWithValue("@P002", System.Web.HttpContext.Current.Session.SessionID)
                                connection.Open()
                                command.ExecuteNonQuery()
                                connection.Close()


                                objcmd.Parameters.Add(New SqlParameter("@P001", obj.gblUserCode))
                                objcmd.Parameters.Add(New SqlParameter("@P002", obj.gblDefaultMeasure))
                                objcmd.Parameters.Add(New SqlParameter("@P003", obj.gblDefaultMeasure))
                                dt = db.FillDataSql("sp000001741100755", objcmd).Tables(0)

                                Session("grdLoadConsolidationData") = dt
                                Session.Remove("childDataCache")

                                grdLoadConsolidation.Visible = False

                                grdLoadConsolidation.DataSource = dt
                                grdLoadConsolidation.Visible = True
                                dropdownTreeContainer.Visible = True
                                grdLoadConsolidation.Rebind()
                            Case Else
                                ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('Calculations are in progress!');", True)
                                grdLoadConsolidation.Visible = False
                                dropdownTreeContainer.Visible = False
                        End Select
                    End If
                End If
            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred_5!');", True)
            iCal = 0
        End Try
    End Sub

    Protected Sub grdLoadConsolidation_detailDataBind(ByVal source As Object, ByVal e As Telerik.Web.UI.GridDetailTableDataBindEventArgs)

        If (Session.IsNewSession) Then
            RedirectToMainLoginPage()
            Exit Sub
        End If

        Try
            Dim FOBCodeData As GridDataItem = DirectCast(e.DetailTableView.ParentItem, GridDataItem)
            Dim FOBCode As String = FOBCodeData.GetDataKeyValue("COL_1999870249").ToString()

            Dim currentItemIndex = FOBCodeData.ItemIndexHierarchical

            If (FOBCode.Equals("Calculating...")) Then
                FOBCodeData.Expanded = False
            Else
                For Each item As GridDataItem In grdLoadConsolidation.MasterTableView.Items
                    If item.ItemIndexHierarchical <> currentItemIndex.ToString() AndAlso item.Expanded Then
                        item.Expanded = False
                    End If
                Next

                ' Use cached child data if available, otherwise fetch from DB and cache (max 500 rows)
                Dim childCache As Dictionary(Of String, DataTable) = TryCast(Session("childDataCache"), Dictionary(Of String, DataTable))
                If childCache Is Nothing Then
                    childCache = New Dictionary(Of String, DataTable)()
                    Session("childDataCache") = childCache
                End If

                Dim dtChild As DataTable = Nothing
                If childCache.ContainsKey(FOBCode) Then
                    dtChild = childCache(FOBCode)
                Else
                    dtChild = loadConsolidationManager.getShipmentConsolidation_Output_Grid(0, System.Web.HttpContext.Current.Session.SessionID, FOBCode, defaultMeasure, Origin_Destination, TimeZoneCode, userCode)
                    ' Limit to 500 rows
                    If dtChild IsNot Nothing AndAlso dtChild.Rows.Count > 500 Then
                        Dim dtLimited As DataTable = dtChild.Clone()
                        For i As Integer = 0 To 499
                            dtLimited.ImportRow(dtChild.Rows(i))
                        Next
                        dtChild = dtLimited
                    End If
                    If dtChild IsNot Nothing Then
                        childCache(FOBCode) = dtChild
                        Session("childDataCache") = childCache
                    End If
                End If

                e.DetailTableView.DataSource = dtChild

                ' Hide/show Trailers column based on COL_1192779487
                Dim colValue As String = FOBCodeData.GetDataKeyValue("COL_1192779487").ToString()
                Dim trailersCol As GridColumn = e.DetailTableView.GetColumnSafe("Action")
                If trailersCol IsNot Nothing Then
                    trailersCol.Visible = (colValue <> "0")
                End If

                ' Rename headers based on Consolidation (Strategies) value
                If FOBCode.Trim() = "Pooling, Inbound" Then
                    Dim shipperCol As GridColumn = e.DetailTableView.GetColumnSafe("Shipper")
                    If shipperCol IsNot Nothing Then
                        shipperCol.HeaderText = "Shippers, Count"
                    End If
                ElseIf FOBCode.Trim() = "Pooling, Outbound" Then
                    Dim consigneeCol As GridColumn = e.DetailTableView.GetColumnSafe("TemplateColumn")
                    If consigneeCol IsNot Nothing Then
                        consigneeCol.HeaderText = "Consignees, Count"
                    End If
                End If
            End If

        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred!');", True)
            iCal = 0
        End Try
    End Sub

    Protected Sub grdLoadConsolidation_itemDataBound(sender As Object, e As GridItemEventArgs)
        ' Replace pager text for child table
        If TypeOf e.Item Is GridPagerItem Then
            Dim pager As GridPagerItem = CType(e.Item, GridPagerItem)
            If pager.OwnerTableView.ParentItem IsNot Nothing AndAlso pager.OwnerTableView.Name = "ShippingDetails" Then
                For Each ctrl As Control In pager.Controls
                    ReplacePagerText(ctrl)
                Next
            End If
        End If
    End Sub

    Private Sub ReplacePagerText(ctrl As Control)
        If TypeOf ctrl Is LiteralControl Then
            Dim lit As LiteralControl = CType(ctrl, LiteralControl)

            If lit.Text.Contains(" items in ") Then
                lit.Text = lit.Text.Replace(" items in ", " Consolidations in ")
            End If
        End If

        For Each child As Control In ctrl.Controls
            ReplacePagerText(child)
        Next
    End Sub

    'Protected Sub btnProcess_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnProcess.Click

    '    If (Session.IsNewSession) Then
    '        Response.Redirect("~/Common/Login.aspx")
    '        Exit Sub
    '    End If

    '    Try


    '        'If ddlCostCenter.SelectedValue = "" Then
    '        '    Dim dtSelectionCriteriaCostCenterCheckData As DataTable = objCommonManager.getSelectionCriteriaCostCenterCheckData(userCode)
    '        '    If dtSelectionCriteriaCostCenterCheckData.Rows.Count > 0 Then
    '        '        If dtSelectionCriteriaCostCenterCheckData.Rows(0)(0).ToString().Equals("NO") Then
    '        '            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('Please select a Cost Center!');", True)
    '        '            Exit Sub
    '        '        End If
    '        '    End If
    '        'End If

    '        Dim cmd As New SqlCommand
    '        Dim db As New CDatabase

    '        Dim obj As New CCommon
    '        obj = Session("COMMON_OBJ")

    '        Dim dt As New DataTable
    '        Dim objcmd As New SqlCommand

    '        cmd.CommandTimeout = 50000
    '        objcmd.Parameters.Add(New SqlParameter("@SessionID", obj.gblUserCode))
    '        objcmd.Parameters.Add(New SqlParameter("@FOBCode", IIf(ddlCostCenter.SelectedValue = String.Empty, 0, ddlCostCenter.SelectedValue)))
    '        objcmd.Parameters.Add(New SqlParameter("@GlobalSessionID", System.Web.HttpContext.Current.Session.SessionID))
    '        dt = db.FillDataSql("sp000000163445969", objcmd).Tables(0)

    '        pnlLoadDetails.Visible = False

    '        iCal = 1
    '        Dim dtShipmentsSummary_Parameters As DataTable = objShipmentsManager.getShipmentsSummary_Parameters(userCode, TimeZoneCode, defaultMeasure, IIf(ddlCostCenter.SelectedValue = String.Empty, 0, ddlCostCenter.SelectedValue))

    '        Dim dtShipmentConsolidation_Output_PanelBarHeader As DataTable = loadConsolidationManager.getShipmentConsolidation_Output_PanelBarHeader(IIf(ddlCostCenter.SelectedValue = String.Empty, 0, ddlCostCenter.SelectedValue), userCode)
    '        If (dtShipmentConsolidation_Output_PanelBarHeader.Rows.Count > 0) Then
    '            Dim i As Integer = 0
    '            For i = 0 To dtShipmentConsolidation_Output_PanelBarHeader.Rows.Count - 1
    '                Dim PanelBarHeader As String = dtShipmentConsolidation_Output_PanelBarHeader.Rows(i)("Descriptions").ToString()
    '                Dim HeaderItem As New RadPanelItem()
    '                HeaderItem.Text = PanelBarHeader
    '                radPnlbarLoad.Items.Add(HeaderItem)
    '                Dim dtShipmentConsolidation_Output_PanelBarBody As DataTable = loadConsolidationManager.getShipmentConsolidation_Output_PanelBarBody(IIf(ddlCostCenter.SelectedValue = String.Empty, 0, ddlCostCenter.SelectedValue), System.Web.HttpContext.Current.Session.SessionID, userCode)
    '                If (dtShipmentConsolidation_Output_PanelBarBody.Rows.Count > 0) Then
    '                    Dim j As Integer = 0
    '                    For j = 0 To dtShipmentConsolidation_Output_PanelBarBody.Rows.Count - 1
    '                        Dim PanelBarBody As String = dtShipmentConsolidation_Output_PanelBarBody.Rows(j)("BodyDescriptions").ToString()
    '                        Dim BodyItem As New RadPanelItem()
    '                        BodyItem.Text = PanelBarBody
    '                        HeaderItem.Items.Add(BodyItem)
    '                    Next
    '                End If
    '            Next
    '        End If

    '        pnlLoadDetails.Visible = True

    '    Catch ex As Exception
    '        ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred_5!');", True)
    '        iCal = 0
    '    End Try
    'End Sub

    'Protected Sub grdLoadConsolidation_NeedDataSource(ByVal source As Object, ByVal e As Telerik.Web.UI.GridNeedDataSourceEventArgs) Handles grdLoadConsolidation.NeedDataSource

    '    If (Session.IsNewSession) Then
    '        Response.Redirect("~/Common/Login.aspx")
    '        Exit Sub
    '    End If

    '    'Try
    '    If Not e.IsFromDetailTable Then
    '        Dim BodyItem As String = radPnlbarLoad.SelectedItem.Text
    '        Dim Header As New RadPanelItem()
    '        Header = DirectCast(radPnlbarLoad.SelectedItem.Parent, RadPanelItem)
    '        Dim HeaderItem As String = Header.Text
    '        BindGridLoad(BodyItem, HeaderItem)

    '    End If
    '    'Catch ex As Exception
    '    '    ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred_6!');", True)
    '    'End Try
    'End Sub

    'Private Sub BindGridLoad(ByVal BodyItem As String, ByVal HeaderItem As String)

    '    Me.grdLoadConsolidation.Visible = False
    '    Dim dtShipmentConsolidation_Output_Grid As DataTable = loadConsolidationManager.getShipmentConsolidation_Output_Grid(IIf(ddlCostCenter.SelectedValue = String.Empty, 0, ddlCostCenter.SelectedValue), System.Web.HttpContext.Current.Session.SessionID, BodyItem, defaultMeasure, Origin_Destination, TimeZoneCode, userCode)
    '    grdLoadConsolidation.DataSource = dtShipmentConsolidation_Output_Grid
    '    grdLoadConsolidation.DataBind()
    '    Me.grdLoadConsolidation.Visible = True


    'End Sub

    Protected Sub grdLoadConsolidation_NeedDataSource(ByVal source As Object, ByVal e As Telerik.Web.UI.GridNeedDataSourceEventArgs) Handles grdLoadConsolidation.NeedDataSource
        Try
            If Session.IsNewSession Then
                RedirectToMainLoginPage()
                Exit Sub
            End If

            If Not e.IsFromDetailTable Then
                Dim dt As DataTable = TryCast(Session("grdLoadConsolidationData"), DataTable)
                If dt IsNot Nothing Then
                    grdLoadConsolidation.DataSource = dt
                End If
            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred while loading data.');", True)
        End Try
    End Sub

    Private Sub BindGridLoad(ByVal BodyItem As String, ByVal HeaderItem As String)
        Try
            ' Fetch data from the data source
            Dim dtShipmentConsolidation_Output_Grid As DataTable = loadConsolidationManager.getShipmentConsolidation_Output_Grid(0, System.Web.HttpContext.Current.Session.SessionID, BodyItem, defaultMeasure, Origin_Destination, TimeZoneCode, userCode)

            ' Check if data source is not null
            If dtShipmentConsolidation_Output_Grid IsNot Nothing AndAlso dtShipmentConsolidation_Output_Grid.Rows.Count > 0 Then
                ' Cache data and clear child cache
                Session("grdLoadConsolidationData") = dtShipmentConsolidation_Output_Grid
                Session.Remove("childDataCache")

                ' Assign the fetched data to the DataSource property of the grid and bind data
                grdLoadConsolidation.DataSource = dtShipmentConsolidation_Output_Grid

                ' Make the grid and dropdown visible after data binding
                grdLoadConsolidation.Visible = True
                dropdownTreeContainer.Visible = True
                grdLoadConsolidation.DataBind()
            Else
                ' If data source is empty, display a message or handle accordingly
                ScriptManager.RegisterStartupScript(Page, GetType(Page), "NoData", "alert('No data available.');", True)
            End If
        Catch ex As Exception
            ' Handle any exceptions that occur during data binding
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred while binding data: " & ex.Message & "');", True)
        End Try
    End Sub

    'Protected Sub radPnlbarLoad_ItemClick(ByVal sender As Object, ByVal e As Telerik.Web.UI.RadPanelBarEventArgs) Handles radPnlbarLoad.ItemClick

    '    If (Session.IsNewSession) Then
    '        Response.Redirect("~/Common/Login.aspx")
    '        Exit Sub
    '    End If

    '    'Try
    '    iCal = 1
    '    grdLoadConsolidation.Visible = False

    '    If (e.Item.Level > 0) Then
    '        grdLoadConsolidation.Visible = True
    '        grdLoadConsolidation.CurrentPageIndex = 0
    '        grdLoadConsolidation.EditIndexes.Clear()
    '        grdLoadConsolidation.Rebind()
    '    End If
    '    'Catch ex As Exception
    '    '    ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred_7!');", True)
    '    'End Try
    'End Sub

    'Protected Sub grdLoadConsolidation_ItemDataBound(ByVal sender As Object, ByVal e As GridItemEventArgs)

    '    If (Session.IsNewSession) Then
    '        Response.Redirect("~/Common/Login.aspx")
    '        Exit Sub
    '    End If

    '    Try
    '        If TypeOf e.Item Is GridDataItem Then
    '            Dim lbtnDelete As LinkButton = DirectCast(e.Item.FindControl("lbtnDelete"), LinkButton)

    '            Dim lblMakeLineRed As Label = DirectCast(e.Item.FindControl("lblMakeLineRed"), Label)
    '            If lblMakeLineRed.Text.Equals("YES") Then
    '                e.Item.ForeColor = Drawing.Color.Red
    '                lbtnDelete.ForeColor = Drawing.Color.Red
    '            End If

    '            Dim BodyItem As String = radPnlbarLoad.SelectedItem.Text
    '            Dim Header As New RadPanelItem()
    '            Header = DirectCast(radPnlbarLoad.SelectedItem.Parent, RadPanelItem)
    '            Dim HeaderItem As String = Header.Text
    '            'Option
    '            Dim lbtnAccept As LinkButton = DirectCast(e.Item.FindControl("lbtnAccept"), LinkButton)

    '            Dim lblDetailsSep As Label = DirectCast(e.Item.FindControl("lblDetailsSep"), Label)
    '            Dim lbtnDetails As LinkButton = DirectCast(e.Item.FindControl("lbtnDetails"), LinkButton)

    '            Dim lblLaneGroupSep As Label = DirectCast(e.Item.FindControl("lblLaneGroupSep"), Label)
    '            Dim lbtnLaneGroup As LinkButton = DirectCast(e.Item.FindControl("lbtnLaneGroup"), LinkButton)

    '            Dim lblMapSep As Label = DirectCast(e.Item.FindControl("lblMapSep"), Label)
    '            Dim lbtnMap As LinkButton = DirectCast(e.Item.FindControl("lbtnMap"), LinkButton)


    '            Dim lblItinerarySep As Label = DirectCast(e.Item.FindControl("lblItinerarySep"), Label)
    '            Dim lbtnItinerary As LinkButton = DirectCast(e.Item.FindControl("lbtnItinerary"), LinkButton)

    '            Dim lblTrailerSep As Label = DirectCast(e.Item.FindControl("lblTrailerSep"), Label)
    '            Dim lbtnTrailer As LinkButton = DirectCast(e.Item.FindControl("lbtnTrailer"), LinkButton)

    '            Dim lblDriversSep As Label = DirectCast(e.Item.FindControl("lblDriversSep"), Label)
    '            Dim lbtnDrivers As LinkButton = DirectCast(e.Item.FindControl("lbtnDrivers"), LinkButton)

    '            If (HeaderItem = "Parcel to Less-than-Truckload") Then
    '                lblLaneGroupSep.Visible = False
    '                lbtnLaneGroup.Visible = False

    '                lblMapSep.Visible = False
    '                lbtnMap.Visible = False

    '                lblItinerarySep.Visible = False
    '                lbtnItinerary.Visible = False

    '                lblTrailerSep.Visible = False
    '                lbtnTrailer.Visible = False

    '                lblDriversSep.Visible = False
    '                lbtnDrivers.Visible = False
    '            ElseIf (HeaderItem = "Consolidation") Then
    '                lblLaneGroupSep.Visible = False
    '                lbtnLaneGroup.Visible = False

    '                lblMapSep.Visible = False
    '                lbtnMap.Visible = False

    '            ElseIf (HeaderItem = "Load-and-Hods") Then
    '                lblMapSep.Visible = False
    '                lbtnMap.Visible = False

    '                lblDriversSep.Visible = False
    '                lbtnDrivers.Visible = False
    '            End If

    '            'Delete
    '            lbtnDelete.Attributes("onclick") = "javascript:var answer=confirm('Are you certain that you wish to delete this selection?'); if(answer){return true;}else{return false;}"

    '            'Lane Group
    '            'Dim lblConsolidationNumber As Label = DirectCast(e.Item.FindControl("lblConsolidationNumber"), Label)
    '            'lbtnLaneGroup.Attributes.Add("onclick", "return OpenWindowLaneGroup('" + lblConsolidationNumber.Text + "');")
    '        End If
    '        If TypeOf e.Item Is GridFilteringItem Then

    '            Dim combobox As RadComboBox = TryCast(e.Item.FindControl("RadComboBoxOrigin"), RadComboBox)

    '            Dim dt As New DataTable
    '            Dim objcmd As New SqlCommand
    '            Dim obj As New CCommon
    '            obj = Session("COMMON_OBJ")
    '            Dim db As New CDatabase
    '            Dim cmd = New SqlCommand

    '            cmd.CommandTimeout = 50000
    '            objcmd.Parameters.Add(New SqlParameter("@SessionID", Math.Abs(userCode)))
    '            objcmd.Parameters.Add(New SqlParameter("@GlobalSessionID", System.Web.HttpContext.Current.Session.SessionID))
    '            dt = db.FillDataSql("spTrackingAnalyst_Filters_Shipper_Output", objcmd).Tables(0)
    '            combobox.DataSource = dt
    '            combobox.DataBind()

    '            combobox = TryCast(e.Item.FindControl("RadComboBoxDestination"), RadComboBox)
    '            objcmd = New SqlCommand
    '            db = New CDatabase

    '            cmd.CommandTimeout = 50000
    '            objcmd.Parameters.Add(New SqlParameter("@SessionID", Math.Abs(userCode)))
    '            objcmd.Parameters.Add(New SqlParameter("@GlobalSessionID", System.Web.HttpContext.Current.Session.SessionID))
    '            dt = db.FillDataSql("spTrackingAnalyst_Filters_Consignee_Output", objcmd).Tables(0)
    '            combobox.DataSource = dt
    '            combobox.DataBind()

    '        End If

    '        If TypeOf e.Item Is GridFooterItem Then
    '            Dim footer = DirectCast(e.Item, GridFooterItem)
    '            footer.Cells(2).ColumnSpan = 10
    '            footer.Cells(3).Visible = False
    '            footer.Cells(4).Visible = False
    '            footer.Cells(5).Visible = False
    '            footer.Cells(6).Visible = False
    '            footer.Cells(7).Visible = False
    '            footer.Cells(8).Visible = False
    '            footer.Cells(9).Visible = False
    '            footer.Cells(10).Visible = False
    '            footer.Cells(11).Visible = False
    '        End If
    '    Catch ex As Exception
    '        ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred_8!');", True)
    '    End Try
    'End Sub

    Protected Sub menuLoadConsolidation_ItemClick(ByVal sender As Object, ByVal e As Telerik.Web.UI.RadMenuEventArgs) Handles menuLoadConsolidation.ItemClick

        If (Session.IsNewSession) Then
            RedirectToMainLoginPage()
            Exit Sub
        End If

        Try
            iCal = 1
            Select Case Trim(UCase(e.Item.Text.ToString()))
                Case "CLOSE"

                    Dim cmd As New SqlCommand
                    Dim db As New CDatabase
                    Dim dsShipmentReport As New DataSet

                    cmd.CommandTimeout = 50000
                    cmd.Parameters.Add(New SqlParameter("@SessionID", Math.Abs(userCode)))
                    cmd.Parameters.Add(New SqlParameter("@GlobalSessionID", System.Web.HttpContext.Current.Session.SessionID))

                    dsShipmentReport = db.FillDataSql("sp000001546230557", cmd)

                    'loadConsolidationManager.getShipmentConsolidationCleanup(CLng(Math.Round(Me.userCode)), System.Web.HttpContext.Current.Session.SessionID).Tables.Item(0)
                    Response.Redirect("~/Common/Main.aspx")
                Case "REFRESH"
                    Response.Redirect("~/LoadConsolidation/Default.aspx")
                Case "HELP"
                    Dim newwindow As New Telerik.Web.UI.RadWindow()
                    newwindow.ID = "RadWindowHelp"
                    newwindow.NavigateUrl = "HelpFile.aspx"
                    newwindow.VisibleOnPageLoad = True
                    newwindow.Width = 900
                    newwindow.Height = 635
                    newwindow.Modal = True
                    newwindow.VisibleStatusbar = False
                    newwindow.Skin = "Telerik"
                    newwindow.Behaviors = WindowBehaviors.Reload Or WindowBehaviors.Pin Or WindowBehaviors.Close
                    RadWindowManager1.Windows.Clear()
                    RadWindowManager1.Windows.Add(newwindow)
                    newwindow.Behaviors = WindowBehaviors.Close
                    newwindow.IconUrl = "../Images/HelpFile.png"
                    Me.Page.ClientScript.RegisterClientScriptBlock(GetType(Page), "CUSTOMSpopup", " ", True)
                Case "FACILITIES"
                    Dim newwindow As New Telerik.Web.UI.RadWindow()
                    newwindow.ID = "RadWindowFacilities"
                    newwindow.NavigateUrl = "~/Common/Facilities.aspx"
                    newwindow.VisibleOnPageLoad = True
                    newwindow.Width = 600
                    newwindow.Height = 500
                    newwindow.Modal = True
                    newwindow.VisibleStatusbar = False
                    newwindow.Skin = "Telerik"
                    RadWindowManager1.Windows.Add(newwindow)
                    newwindow.Behaviors = WindowBehaviors.Close

                    Me.Page.ClientScript.RegisterClientScriptBlock(GetType(Page), "523", " <script type='text/javascript'>//<![CDATA[ alert('Phalanx'); OpenWindow('Phalanx'); //]]></script> ")
            End Select
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred_9!');", True)
        End Try
    End Sub

    Protected Sub grdLoadConsolidation_ItemCommand(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles grdLoadConsolidation.ItemCommand

        If (Session.IsNewSession) Then
            RedirectToMainLoginPage()
            Exit Sub
        End If

        Try
            iCal = 1
            If e.CommandName = "ChangePageSize" Then
                Exit Sub
            End If
            'Dim lblConsolidationNumber As Label = DirectCast(e.Item.FindControl("lblConsolidationNumber"), Label)
            Dim lblConsolidationNumber As Label = (TryCast(e.Item.FindControl("lblConsolidationNumber"), Label))

            If lblConsolidationNumber IsNot Nothing Then
                hdnConsolidationNum.Value = lblConsolidationNumber.Text
            End If

            If e.CommandArgument.ToString().StartsWith("Trailer") Then
                Dim args() As String = e.CommandArgument.ToString().Split("|"c)
                Dim consolidationID As String = If(args.Length > 1, args(1), "")
                iCal = 1

                ' Get COL_1999870249 from the Parent Node (it is a DataKey)
                Dim p001Value As String = ""
                Dim detailItem As GridDataItem = TryCast(e.Item, GridDataItem)
                If detailItem IsNot Nothing AndAlso detailItem.OwnerTableView.ParentItem IsNot Nothing Then
                    Dim parentItem As GridDataItem = DirectCast(detailItem.OwnerTableView.ParentItem, GridDataItem)
                    p001Value = parentItem.GetDataKeyValue("COL_1999870249").ToString()
                End If

                ' Build URL for TrailerAnimation.aspx with SP parameters
                Dim animationUrl As String = "TrailerAnimation.aspx?P001=" & Server.UrlEncode(p001Value) & "&P002=" & Server.UrlEncode(consolidationID)
                Dim truckloader_script As String = "openNewWindow('" & animationUrl.Replace("'", "\'") & "');"
                ScriptManager.RegisterStartupScript(Page, GetType(Page), "OpenWindowScript", truckloader_script, True)
                Exit Sub
            ElseIf e.CommandArgument = "Accept" Then
                Dim dtShipmentConsolidationRates_Validation As DataTable = loadConsolidationManager.getShipmentConsolidationRates_Validation(lblConsolidationNumber.Text)
                If (dtShipmentConsolidationRates_Validation.Rows(0)(0).ToString().Trim().Equals("NULL") Or dtShipmentConsolidationRates_Validation.Rows(0)(0).ToString().Trim().Equals("")) Then
                    ScriptManager.RegisterStartupScript(Page, GetType(Page), "NoData", "alert('Carrier base is unable to fulfill service requirements!');", True)
                    Exit Sub
                ElseIf (dtShipmentConsolidationRates_Validation.Rows(0)(0).ToString().Trim().Equals("SUCCESS")) Then
                    Dim newwindow As New Telerik.Web.UI.RadWindow()
                    newwindow.ID = "RadWindowAccept"
                    newwindow.NavigateUrl = "Accept.aspx?ConsolidationNumber=" + lblConsolidationNumber.Text
                    newwindow.VisibleOnPageLoad = True
                    newwindow.Width = 700
                    newwindow.Height = 500
                    newwindow.Modal = True
                    newwindow.VisibleStatusbar = False
                    newwindow.Skin = "Telerik"
                    newwindow.ShowContentDuringLoad = False
                    RadWindowManager2.Windows.Add(newwindow)
                End If
                Exit Sub
            ElseIf e.CommandArgument = "Details" Then
                Dim newwindow As New Telerik.Web.UI.RadWindow()
                newwindow.ID = "RadWindowDetails"
                newwindow.NavigateUrl = "Details.aspx?ConsolidationNumber=" + lblConsolidationNumber.Text
                newwindow.VisibleOnPageLoad = True
                newwindow.Width = 500
                newwindow.Height = 500
                newwindow.Modal = True
                newwindow.VisibleStatusbar = False
                newwindow.Skin = "Telerik"
                RadWindowManager1.Windows.Add(newwindow)
                newwindow.Behaviors = WindowBehaviors.Close
            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred_10!');", True)
        End Try
    End Sub

    Private Sub openTrailerFlash()

        If (Session.IsNewSession) Then
            RedirectToMainLoginPage()
            Exit Sub
        End If

        Try
            'ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('load started....!');", True)
            getShipment()
            'calcLoad()
            'callLoadTrailer()


            ''********** Code not in use**************

            'Dim drOrderRoutingTruckDataValidation As DataRow = orderRoutingManager.getOrderRoutingTruckDataValidation(userCode)
            'If (drOrderRoutingTruckDataValidation(0).ToString().Equals("NO DATA")) Then
            '    ScriptManager.RegisterStartupScript(Page, GetType(Page), "NO DATA", "alert('No data to allow for the generation a container spatial solution!');", True)
            '    Exit Sub
            'ElseIf (drOrderRoutingTruckDataValidation(0).ToString().Equals("NOT LOADED")) Then
            '    ScriptManager.RegisterStartupScript(Page, GetType(Page), "NO LOADED", "alert('shipping data not loaded in container');", True)
            '    Exit Sub
            'ElseIf (drOrderRoutingTruckDataValidation(0).ToString().Equals("SUCCESS")) Then
            'Open Load Trailer


            'Begin---
            'getShipment()
            'SetLoadInProcess()
            'Dim shipmentID As String = hdnConsolidationNum.Value
            'loadTempTable(shipmentID)
            'ShowData(shipmentID, shipmentID)
            'end---

            'cntPosition.initVars()


            'Dim db As New CDatabase

            'ScriptManager.RegisterStartupScript(Page, GetType(Page), "NO LOADED", "alert('" & db.ConnectionString() & "');", True)
            'Exit Sub
            ' start showdata
            'initVars()


            'Dim connection As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("connectionstring"))
            'Dim command As SqlCommand = New SqlCommand("getLoadData", connection)

            'command.CommandType = CommandType.StoredProcedure
            'command.Parameters.Add("@shipmentID", shipmentID)
            'command.Parameters.Add("@cSessionID", shipmentID)

            'connection.Open()

            'Dim cntReader As SqlDataReader = command.ExecuteReader

            'Dim x As Integer = 0


            'While cntReader.Read


            '    loadArrC(x, 0) = trailerRow
            '    loadArrC(x, 1) = posW
            '    loadArrC(x, 2) = posL
            '    loadArrC(x, 3) = posH
            '    loadArrC(x, 10) = heightPln
            '    loadArrC(x, 12) = posWE
            '    Dim nextCntShipmentID = cntReader("shipmentID")
            '    Dim nextCntShipmentStopNumber = cntReader("shipmentStopNumber")

            '    Dim varPalletLength As Decimal = CDec(cntReader("palletLength"))
            '    Dim varPalletWidth As Decimal = CDec(cntReader("palletWidth"))

            '    If varPalletLength > varPalletWidth Then



            '        nextCntLength = CDec(cntReader("palletWidth"))
            '        nextCntWidth = CDec(cntReader("palletLength"))
            '        loadArrC(x, 5) = CStr(nextCntLength)
            '        loadArrC(x, 6) = CStr(nextCntWidth)

            '    Else

            '        nextCntLength = CDec(cntReader("palletLength"))
            '        nextCntWidth = CDec(cntReader("palletWidth"))
            '        loadArrC(x, 6) = CStr(nextCntWidth)
            '        loadArrC(x, 5) = CStr(nextCntLength)
            '    End If

            '    Dim varLoadArrc6 As Decimal = CDec(loadArrC(x, 6))
            '    Dim varLoadArrc5 As Decimal = CDec(loadArrC(x, 5))


            '    If nextCntLength = 78 Then
            '        Dim debugStop As String = "stop"
            '    End If

            '    nextCntHeight = cntReader("palletHeight")
            '    loadArrC(x, 7) = nextCntHeight
            '    Dim varLoadArr7 As Decimal = CDec(loadArrC(x, 7))
            '    nextCntWgt = cntReader("palletWeight")
            '    loadArrC(x, 8) = nextCntWgt
            '    loadedTrailerWgt = loadedTrailerWgt + nextCntWgt
            '    If loadedTrailerWgt > maxTrailerWgt Then

            '        Exit Sub
            '    End If

            '    Dim nextTypeOfContainer = cntReader("typeOfContainer")
            '    nextCntBurstWgt = cntReader("burstWeight")
            '    loadArrC(x, 9) = nextCntBurstWgt
            '    Dim nextSessionID = cntReader("sessionid")
            '    nextCntID = cntReader("containerID")
            '    loadArrC(x, 4) = nextCntID
            '    loadArrC(x, 11) = nextCntWidth * nextCntLength
            '    cntArea = nextCntWidth * nextCntLength



            '    noCntLoaded = noCntLoaded + 1
            '    loadSurface()
            '    x = x + 1

            'End While


            'connection.Close()

            ' end show data
            'ScriptManager.RegisterStartupScript(Page, GetType(Page), "NO LOADED", "alert('2');", True)

            ''cntPosition.mainMovie(shipmentID, shipmentID)
            'Begin
            'mainMovie(shipmentID, shipmentID)
            'End

            'ScriptManager.RegisterStartupScript(Page, GetType(Page), "NO LOADED", "alert('3');", True)



            'calcLoad()
            'callLoadTrailer()
            '  End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred....!');", True)
            Exit Sub
        End Try

    End Sub

    Private Sub getShipment()

        If (Session.IsNewSession) Then
            RedirectToMainLoginPage()
            Exit Sub
        End If

        'Get ShipmentID

        Try


            Dim dtOrderRoutingPackingCoordinatesDataValidation As DataTable = orderRoutingManager.getOrderRoutingPackingCoordinatesDataValidation(hdnConsolidationNum.Value)
            If (dtOrderRoutingPackingCoordinatesDataValidation.Rows(0)(0).ToString().Trim().Equals("NULL")) Then
                ScriptManager.RegisterStartupScript(Page, GetType(Page), "null", "alert('No data to effect loading!');", True)
                Exit Sub
            ElseIf (dtOrderRoutingPackingCoordinatesDataValidation.Rows(0)(0).ToString().Trim().Equals("ERROR")) Then
                ScriptManager.RegisterStartupScript(Page, GetType(Page), "err", "alert('An error occurred!');", True)
                Exit Sub
            End If
            Dim shipmentID As String = ""
            If (dtOrderRoutingPackingCoordinatesDataValidation.Rows.Count > 0) Then
                shipmentID = Convert.ToString((dtOrderRoutingPackingCoordinatesDataValidation.Rows(0)(0)))
            End If

            Context.Session("shipmentID") = shipmentID
            Context.Session("sessionID") = shipmentID
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred_11!');", True)
            Exit Sub
        End Try


    End Sub

    Private Sub calcLoad()

        If (Session.IsNewSession) Then
            RedirectToMainLoginPage()
            Exit Sub
        End If

        SetLoadInProcess()

        Dim shipmentID As String = hdnConsolidationNum.Value

        loadTempTable(shipmentID)

        ShowData(shipmentID, shipmentID)

        mainMovie(shipmentID, shipmentID)
        'cntPosition.initVars()
        'cntPosition.showData(shipmentID, shipmentID)
        'cntPosition.mainMovie(shipmentID, shipmentID)

        'initVars()
        'ShowData(shipmentID, shipmentID)
        'mainMovie(shipmentID, shipmentID)

    End Sub

    Private Sub SetLoadInProcess()

        If (Session.IsNewSession) Then
            RedirectToMainLoginPage()
            Exit Sub
        End If

        'Dim cmd As New SqlCommand
        'Dim db As New CDatabase
        'Dim dsShipmentReport As New DataSet

        'cmd.CommandTimeout = 50000
        'cmd.Parameters.Add(New SqlParameter("@shipmentID", hdnConsolidationNum.Value))

        'dsShipmentReport = db.FillDataSql("SetLoadInProcess", cmd)


        Dim shipmentID As String = hdnConsolidationNum.Value 'Context.Session("shipmentID")
        'Dim connection As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("connectionstring"))
        Dim connection As SqlConnection = New SqlConnection()
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("MyGlobalString").ConnectionString

        Dim command As New SqlCommand("SetLoadInProcess", connection)
        command.CommandType = CommandType.StoredProcedure
        command.Parameters.Add("@shipmentID", shipmentID)
        connection.Open()
        command.ExecuteNonQuery()
        connection.Close()

    End Sub

    Private Sub loadTempTable(ByVal shipmentID As String)

        If (Session.IsNewSession) Then
            RedirectToMainLoginPage()
            Exit Sub
        End If

        'Dim cmd As New SqlCommand
        'Dim db As New CDatabase
        'Dim dsShipmentReport As New DataSet
        'cmd.CommandTimeout = 50000
        'cmd.Parameters.Add(New SqlParameter("@shipmentID", hdnConsolidationNum.Value))
        'cmd.Parameters.Add(New SqlParameter("@cSessionID", hdnConsolidationNum.Value))
        'dsShipmentReport = db.FillDataSql("createLoadPos", cmd)

        Dim connection As SqlConnection = New SqlConnection()
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("MyGlobalString").ConnectionString

        Dim command As New SqlCommand("createLoadPos", connection)
        command.CommandType = CommandType.StoredProcedure
        command.Parameters.Add("@shipmentID", shipmentID)
        ''command.Parameters.Add("@cSessionID", Session.SessionID.ToString)
        connection.Open()
        command.ExecuteNonQuery()
        connection.Close()

    End Sub


    Protected Sub grdLoadConsolidation_PageIndexChanged(ByVal source As Object, ByVal e As Telerik.Web.UI.GridPageChangedEventArgs) Handles grdLoadConsolidation.PageIndexChanged
        iCal = 1
        ' Pagination is handled by NeedDataSource using cached Session data — no DB callback
    End Sub

    Protected Sub grdLoadConsolidation_DeleteCommand(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles grdLoadConsolidation.DeleteCommand

        If (Session.IsNewSession) Then
            RedirectToMainLoginPage()
            Exit Sub
        End If

        Try
            iCal = 1
            Dim editedItem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
            Dim lblConsolidationNumber As Label = DirectCast(e.Item.FindControl("lblConsolidationNumber"), Label)
            Dim dtShipmentConsolidation_Delete = loadConsolidationManager.getShipmentConsolidation_Delete(lblConsolidationNumber.Text)
            If (dtShipmentConsolidation_Delete.Rows(0)(0).ToString().Trim().Equals("NOT EXISTS")) Then
                ScriptManager.RegisterStartupScript(Page, GetType(Page), "NoData", "alert('This array cannot be deleted as it does not exist in the database!');", True)
                Exit Sub
            ElseIf (dtShipmentConsolidation_Delete.Rows(0)(0).ToString().Trim().Equals("ERROR")) Then
                ScriptManager.RegisterStartupScript(Page, GetType(Page), "Err", "alert('An error occurred!');", True)
                Exit Sub
            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred_12!');", True)
        End Try
    End Sub

    ' Req 9: Selection Criteria overlay eliminated - all handlers commented out
    'Protected Sub grdSelectionCriteriaCostCenter_NeedDataSource(ByVal source As Object, ByVal e As Telerik.Web.UI.GridNeedDataSourceEventArgs) Handles grdSelectionCriteriaCostCenter.NeedDataSource
    '    If Not e.IsFromDetailTable Then
    '        Dim dtSelectionCriteriaCostCenterGrid As DataTable = objCommonManager.getSelectionCriteriaCostCenterGrid(userCode, System.Web.HttpContext.Current.Session.SessionID)
    '        grdSelectionCriteriaCostCenter.DataSource = dtSelectionCriteriaCostCenterGrid
    '    End If
    'End Sub

    'Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
    'End Sub

    'Protected Sub grdSelectionCriteriaCostCenter_DeleteCommand(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles grdSelectionCriteriaCostCenter.DeleteCommand
    'End Sub

    Protected Sub RadAjaxManager1_AjaxRequest(ByVal sender As Object, ByVal e As Telerik.Web.UI.AjaxRequestEventArgs)
        If (Session.IsNewSession) Then
            RedirectToMainLoginPage()
            Exit Sub
        End If

        Try
            If String.Equals(Convert.ToString(e.Argument), "RegionChanged", StringComparison.OrdinalIgnoreCase) Then
                iCal = 0
                Session.Remove("grdLoadConsolidationData")
                Session.Remove("childDataCache")
                grdLoadConsolidation.CurrentPageIndex = 0
                loadConsolidation_MainGrid()
                grdLoadConsolidation.Rebind()
            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred while refreshing region data.');", True)
        End Try
    End Sub

    Protected Sub btnDummy_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDummy.Click

        If (Session.IsNewSession) Then
            RedirectToMainLoginPage()
            Exit Sub
        End If

        Try
            iCal = 1
            If Convert.ToString(Session("Process")) <> "" Then
                grdLoadConsolidation.CurrentPageIndex = 0
                grdLoadConsolidation.Rebind()
                Session.Remove("Process")
            End If
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Page, GetType(Page), "Error", "alert('An error occurred!');", True)
        End Try
    End Sub
    Public Shared Function InitVars()


        driveAxleNoTxt = ""
        rearAxleNoTxt = ""
        FAlpha = 100

        ColorName = "green"
        c = 0
        nextCntBurstWgt = 10000
        posW = 0
        posWE = 0
        posL = 0
        posH = 0
        trailerRow = 1
        cntBurstWeight = 10000
        prevCntArea = 61056
        cntArea = 0
        cntRemainArea = 10000

        contactAreaBurstPsiGood = True
        noCntLoaded = 0
        noCntOnTruck = 0
        noSurfLoaded = 0
        noSurfChecked = 0
        nextCntWidth = 0
        nextCntLength = 0
        nextCntHeight = 0

        cntLoading = 0
        prevCntID = 0
        widthRemain = 0
        nextCntBurstWeight = 0
        nextCntWgt = 0
        loadedTrailerWgt = 0
        maxTrailerW = 97  'pull from web later
        maxTrailerL = 636  'pull from web later
        maxTrailerH = 109  'pull from web later
        truckNetWeight = 15000
        trailerNetWeight = 13000
        driveAxleNetLoad = (truckNetWeight / 2) + (trailerNetWeight / 2)
        rearAxleNetLoad = trailerNetWeight / 2
        maxTrailerWgt = 54000  'pull from web later
        singleDriveAxle = False
        tandemDriveAxle = False
        singleRearAxle = False
        tandemRearAxle = False
        driveAxleWgt = driveAxleNetLoad
        rearAxleWgt = rearAxleNetLoad
        minTrailerLength = 0
        minTrailerLengthFeet = 0
        minTrailerlengthInches = 0
        totalNoOfCnts = 16  'pull from web later
        hitFlagTop = False
        hitFlagSide = False

        hitFlagEnd = False
        hitFlagTrailer = False
        hitFlagCnt = False
        p2HitFlag = False
        p1HitFlag = False
        heightPln = 0

        topOffsetX = 40
        topOffsetY = 80
        sideOffsetX = 40
        sideOffsetY = 351 + 109
        endOffsetX = 867
        endOffsetY = 460

        cntSeqNoInHeightPln = 0
        p8x = 0
        p8y = 0
        p8z = 0
        p2x = 0
        p2y = 0
        p2z = 0
        p3x = 0
        p3y = 0
        p3z = 0
        p4x = 0
        p4y = 0
        p4z = 0
        p5x = 0
        p5y = 0
        p5z = 0
        p6x = 0
        p6y = 0
        p6z = 0
        p7x = 0
        p7y = 0
        p7z = 0


        p1xHit = False
        p1yHit = False
        p1zHit = False
        p2xHit = False
        p2yHit = False
        p2zHit = False
        p3xHit = False
        p3yHit = False
        p3zHit = False
        p4xHit = False
        p4yHit = False
        p4zHit = False
        p5xHit = False
        p5yHit = False
        p5zHit = False
        p6xHit = False
        p6yHit = False
        p6zHit = False
        p7xHit = False
        p7yHit = False
        p7zHit = False
        p8xHit = False
        p8yHit = False
        p8zHit = False
        tmpP8x = 0
        topFrontCheck = False
        contactAreaSizeOk = False
        checkTopNextCounter = 0
        minBurstStrength = 0
        tmpMinBurstStrength = 0
        p1HitFlag = False
        tmpP8xVal = 0
        kingPinOverHang = 60

        txtInit = 0

        lX = 0

        surfFound = False
        verticalContact = False
        surfaceContact = False
        foundMatch = False
        burstStrength = 0
        noSurfRemoved = 0
    End Function

    Public Shared Function checkContainerInt()
        Dim sDx = 0
        tmpP8xVal = 0
        p2HitFlagCounter = 0
        p1HitFlagCounter = 0





        For sDx = noSurfRemoved To noSurfLoaded


            If surfaceArr(sDx, 4) <> cntLoading Then

                Dim tmpPosW As Decimal = CDec((surfaceArr(sDx, 1)))
                Dim tmpPosL As Decimal = CDec((surfaceArr(sDx, 2)))



                Dim tmpPosH As Decimal = CDec(surfaceArr(sDx, 3))
                tmpP8x = CDec(surfaceArr(sDx, 13))

                Dim tmpP8y As Decimal = CDec(surfaceArr(sDx, 14))
                Dim tmpP8z As Decimal = CDec(surfaceArr(sDx, 15))
                Dim tmpP2x As Decimal = CDec(surfaceArr(sDx, 16))
                Dim tmpP2y As Decimal = CDec(surfaceArr(sDx, 17))
                Dim tmpP2z As Decimal = CDec(surfaceArr(sDx, 18))
                Dim tmpP3x As Decimal = CDec(surfaceArr(sDx, 19))

                If posL >= tmpPosL And posL < tmpP3x Or p8x > posL And p8x <= tmpP8x Or posL < tmpPosL And p3x > tmpP3x Then

                    Dim tmpP3y As Decimal = CDec(surfaceArr(sDx, 20))
                    Dim tmpP3z As Decimal = CDec(surfaceArr(sDx, 21))
                    Dim tmpP4x As Decimal = CDec(surfaceArr(sDx, 22))
                    Dim tmpP4y As Decimal = CDec(surfaceArr(sDx, 23))
                    Dim tmpP4z As Decimal = CDec(surfaceArr(sDx, 24))
                    Dim tmpP5x As Decimal = CDec(surfaceArr(sDx, 25))
                    Dim tmpP5y As Decimal = CDec(surfaceArr(sDx, 26))
                    Dim tmpP5z As Decimal = CDec(surfaceArr(sDx, 27))
                    Dim tmpP6x As Decimal = CDec(surfaceArr(sDx, 28))
                    Dim tmpP6y As Decimal = CDec(surfaceArr(sDx, 29))
                    Dim tmpP6z As Decimal = CDec(surfaceArr(sDx, 30))
                    Dim tmpP7x As Decimal = CDec(surfaceArr(sDx, 31))
                    Dim tmpP7y As Decimal = CDec(surfaceArr(sDx, 32))
                    Dim tmpP7z As Decimal = CDec(surfaceArr(sDx, 33))




                    resetPHit()

                    Dim cntSurfID = surfaceArr(sDx, 4)
                    Dim varDebugCID = cntLoading

                    If posL >= tmpPosL And posL < tmpP8x Then

                        p1xHit = True

                    End If
                    If posW >= tmpPosW And posW < tmpP8y Then
                        p1yHit = True
                    End If
                    If posH >= tmpPosH And posH < tmpP8z Then
                        p1zHit = True
                    End If


                    If p1xHit = True And p1yHit = True And p1zHit = True Then
                        hitFlagCnt = True
                        p1HitFlagCounter = p1HitFlagCounter + 1
                        p1HitFlagArr(p1HitFlagCounter, 0) = CDec(surfaceArr(sDx, 13))
                        p1HitFlagArr(p1HitFlagCounter, 1) = CDec(surfaceArr(sDx, 1))
                        p1HitFlagArr(p1HitFlagCounter, 2) = CDec(surfaceArr(sDx, 3))

                        p1HitFlag = True
                    Else

                    End If


                    '----------------------------------- 
                    If p8x > tmpPosL And p8x < tmpP8x Then
                        p8xHit = True
                    End If
                    If p8y > tmpPosW And p8y < tmpP8y Then
                        p8yHit = True
                    End If
                    If p8z >= tmpPosH And p8z < tmpP8z Then
                        p8zHit = True
                    End If

                    If p8xHit = True And p8yHit = True And p8zHit = True Then
                        hitFlagCnt = True
                    End If
                    '----------------------------------- 
                    If p2x >= tmpPosL And p2x < tmpP8x Then
                        p2xHit = True
                    End If
                    If p2y >= tmpPosW And p2y < tmpP8y Then
                        p2yHit = True
                    End If
                    If p2z >= tmpPosH And p2z < tmpP8z Then
                        p2zHit = True
                    End If

                    If p2xHit = True And p2yHit = True And p2zHit = True Then
                        hitFlagCnt = True
                        p2HitFlagCounter = p2HitFlagCounter + 1
                        p2HitFlagArr(p2HitFlagCounter, 0) = CDec(surfaceArr(sDx, 13))
                        p2HitFlagArr(p2HitFlagCounter, 1) = CDec(surfaceArr(sDx, 1))
                        p2HitFlagArr(p2HitFlagCounter, 2) = CDec(surfaceArr(sDx, 3))

                        p2HitFlag = True
                    Else

                    End If

                    '----------------------------------- 
                    If p3x > tmpPosL And p3x < tmpP8x Then
                        p3xHit = True
                    End If
                    If p3y >= tmpPosW And p3y < tmpP8y Then
                        p3yHit = True
                    End If
                    If p3z >= tmpPosH And p3z < tmpP8z Then
                        p3zHit = True
                    End If

                    If p3xHit = True And p3yHit = True And p3zHit = True Then
                        hitFlagCnt = True
                    End If
                    '----------------------------------- 
                    If p4x > tmpPosL And p4x < tmpP8x Then
                        p4xHit = True
                    End If
                    If p4y >= tmpPosW And p4y < tmpP8y Then
                        p4yHit = True
                    End If
                    If p4z >= tmpPosH And p4z < tmpP8z Then
                        p4zHit = True
                    End If

                    If p4xHit = True And p4yHit = True And p4zHit = True Then
                        hitFlagCnt = True
                    End If
                    '----------------------------------- 
                    If p5x >= tmpPosL And p5x < tmpP8x Then
                        p5xHit = True
                    End If

                    If p5y > tmpPosW And p5y < tmpP8y Then

                        p5yHit = True
                    End If
                    If p5z >= tmpPosH And p5z < tmpP8z Then
                        p5zHit = True
                    End If

                    If p5xHit = True And p5yHit = True And p5zHit = True Then
                        hitFlagCnt = True
                    End If
                    '----------------------------------- 
                    If p6x >= tmpPosL And p6x < tmpP8x Then
                        p6xHit = True
                    End If
                    If p6y > tmpPosW And p6y < tmpP8y Then
                        p6yHit = True
                    End If
                    If p6z >= tmpPosH And p6z < tmpP8z Then
                        p6zHit = True
                    End If

                    If p6xHit = True And p6yHit = True And p6zHit = True Then
                        hitFlagCnt = True
                    End If
                    '----------------------------------- 
                    If p7x > tmpPosL And p7x < tmpP8x Then
                        p7xHit = True
                    End If
                    If p7y > tmpPosW And p7y < tmpP8y Then
                        p7yHit = True
                    End If
                    If p7z >= tmpPosH And p7z < tmpP8z Then
                        p7zHit = True
                    End If

                    If p7xHit = True And p7yHit = True And p7zHit = True Then
                        hitFlagCnt = True
                    End If
                    '----------------------------------- 
                    Dim tmpID = surfaceArr(sDx, 4)
                    Dim surfPosL = CDec(surfaceArr(sDx, 2))
                    Dim surfP3x = CDec(surfaceArr(sDx, 19))
                    Dim surfPosW = CDec(surfaceArr(sDx, 1))
                    Dim surfP5y = CDec(surfaceArr(sDx, 26))
                    Dim surfP2z = CDec(surfaceArr(sDx, 18))
                    If posL >= surfPosL And posL < surfP3x And
                                    posW >= surfPosW And posW < surfP5y And
                                    posH < surfP2z And p2z > tmpPosH Then
                        hitFlagCnt = True
                    End If

                    tmpID = surfaceArr(sDx, 4)
                    surfPosL = CDec(surfaceArr(sDx, 2))
                    surfP3x = CDec(surfaceArr(sDx, 19))
                    surfPosW = CDec(surfaceArr(sDx, 1))
                    surfP5y = CDec(surfaceArr(sDx, 26))
                    surfP2z = CDec(surfaceArr(sDx, 18))
                    If p3x > surfPosL And p3x <= surfP3x And
                                        p3y >= surfPosW And p3y < surfP5y And
                                        posH < surfP2z And p2z > tmpPosH Then
                        hitFlagCnt = True
                    End If

                    tmpID = surfaceArr(sDx, 4)
                    surfPosL = CDec(surfaceArr(sDx, 2))
                    surfP3x = CDec(surfaceArr(sDx, 19))
                    Dim surfP5x = CDec(surfaceArr(sDx, 25))
                    surfPosW = CDec(surfaceArr(sDx, 1))
                    surfP5y = CDec(surfaceArr(sDx, 26))
                    surfP2z = CDec(surfaceArr(sDx, 18))
                    If p5x >= surfPosL And p5x < surfP3x And
                        p5y > surfPosW And p5y < surfP5y And
                        posH < surfP2z And p2z > tmpPosH Then
                        hitFlagCnt = True
                    End If

                    tmpID = surfaceArr(sDx, 4)
                    surfPosL = CDec(surfaceArr(sDx, 2))
                    surfP3x = CDec(surfaceArr(sDx, 19))
                    surfP5x = CDec(surfaceArr(sDx, 25))
                    surfPosW = CDec(surfaceArr(sDx, 1))
                    surfP5y = CDec(surfaceArr(sDx, 26))
                    surfP2z = CDec(surfaceArr(sDx, 18))

                    If p7x > surfPosL And p7x < surfP3x And p7y > surfPosW And
                        p7y < surfP5y And posH = surfP2z Then
                        hitFlagCnt = True
                    End If

                    If posH = tmpPosH And posL = tmpPosL And posW = tmpPosW Then
                        hitFlagCnt = True
                    End If

                    If p2x = tmpP2x And p2y = tmpP2y And p2z = tmpP2z Then
                        hitFlagCnt = True
                    End If

                    If p3x = tmpP3x And p3y = tmpP3y And p3z = tmpP3z Then
                        hitFlagCnt = True
                    End If

                    If p4x = tmpP4x And p4y = tmpP4y And p4z = tmpP4z Then
                        hitFlagCnt = True
                    End If

                    If p5x = tmpP5x And p5y = tmpP5y And p5z = tmpP5z Then
                        hitFlagCnt = True
                    End If

                    If p6x = tmpP6x And p6y = tmpP6y And p6z = tmpP6z Then
                        hitFlagCnt = True
                    End If

                    If p7x = tmpP7x And p7y = tmpP7y And p7z = tmpP7z Then
                        hitFlagCnt = True
                    End If

                    If p8x = tmpP8x And p8y = tmpP8y And p8z = tmpP8z Then
                        hitFlagCnt = True
                    End If
                    '----------------------------------- 

                    If (tmpP2z > posH And tmpPosH < p2z And tmpPosW >= posW And tmpPosW < p8y And tmpP3x > posL) Or (tmpP2z > posH And tmpPosH < p2z And tmpP8y <= p8y And tmpP8y > posW And tmpP3x > posL) Then
                        hitFlagCnt = True
                    End If
                    '------------------------------------
                    If posW >= tmpPosW And p5y <= tmpP5y And posL >= tmpPosL And posL < tmpP3x And posH < tmpPosH And p2z > tmpP2z Then
                        hitFlagCnt = True
                    End If

                    If posL > tmpPosL And posL < tmpP3x And p5y > tmpPosW And p5y < tmpP5y And posH >= tmpPosH And p2z > tmpP2z Then
                        hitFlagCnt = True
                    End If

                    If posL < tmpPosL And p3x > tmpP3x And posW >= tmpPosW And p5y < tmpP5y And posH >= tmpPosH And p2z < tmpP2z Then
                        hitFlagCnt = True
                    End If


overReverse:
                End If
            End If

            If hitFlagCnt = True Then
                Exit Function
            End If
        Next sDx

    End Function

    Public Shared Function updateLoadData(ByVal sessionID As String, ByVal varShipmentID As String)

        'Dim connection As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("connectionstring"))
        'Dim command As New SqlCommand("updateLoadData", connection)
        'command.CommandType = CommandType.StoredProcedure

        Dim connection As SqlConnection = New SqlConnection()
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("MyGlobalString").ConnectionString
        Dim command As New SqlCommand("updateLoadData", connection)
        command.CommandType = CommandType.StoredProcedure

        Dim x As Integer


        For x = 0 To noCntLoaded - 1

            Dim varCntID = surfaceArr(x, 4)
            Dim varCSessionID = varShipmentID
            Dim varCPosL = surfaceArr(x, 2)
            Dim varCPosW = surfaceArr(x, 1)
            Dim varCPosH = surfaceArr(x, 3)
            Dim varCPalletWidth = surfaceArr(x, 6)
            Dim varCPalletLength = surfaceArr(x, 5)
            Dim ifUsed = surfaceArr(x, 12)

            If ifUsed = "used" Then
                'command.Parameters.Clear()

                'Dim cmd As New SqlCommand
                'Dim db As New CDatabase
                'Dim dsShipmentReport As New DataSet

                'cmd.CommandTimeout = 50000
                'cmd.Parameters.Add(New SqlParameter("@shipmentID", varShipmentID))
                'cmd.Parameters.Add(New SqlParameter("@cntID", varCntID))
                'cmd.Parameters.Add(New SqlParameter("@cSessionID", varShipmentID))
                'cmd.Parameters.Add(New SqlParameter("@cPosL", varCPosL))
                'cmd.Parameters.Add(New SqlParameter("@cPosW", varCPosW))
                'cmd.Parameters.Add(New SqlParameter("@cPosH", varCPosH))
                'cmd.Parameters.Add(New SqlParameter("@cPalletWidth", varCPalletWidth))
                'cmd.Parameters.Add(New SqlParameter("@cPalletLength", varCPalletLength))

                'dsShipmentReport = db.FillDataSql("updateLoadData", cmd)


                command.Parameters.Clear()

                command.Parameters.Add("@shipmentID", varShipmentID)
                command.Parameters.Add("@cntID", varCntID)
                command.Parameters.Add("@cSessionID", varShipmentID)
                command.Parameters.Add("@cPosL", varCPosL)
                command.Parameters.Add("@cPosW", varCPosW)
                command.Parameters.Add("@cPosH", varCPosH)
                command.Parameters.Add("@cPalletWidth", varCPalletWidth)
                command.Parameters.Add("@cPalletLength", varCPalletLength)

                Try
                    connection.Open()
                    command.ExecuteNonQuery()
                    connection.Close()
                Catch ex As Exception
                    Return ex
                End Try

            End If
        Next x
    End Function
    Public Shared Function ShowData(ByVal shipmentID As String, ByVal cSessionID As String) As Nullable
        initVars()
        Dim connection As SqlConnection = New SqlConnection()
        connection.ConnectionString = ConfigurationManager.ConnectionStrings("MyGlobalString").ConnectionString

        Dim command As SqlCommand = New SqlCommand("getLoadData", connection)

        command.CommandType = CommandType.StoredProcedure
        command.Parameters.Add("@shipmentID", shipmentID)
        command.Parameters.Add("@cSessionID", cSessionID)

        connection.Open()
        Dim cntReader As SqlDataReader = command.ExecuteReader

        Dim x As Integer = 0

        While cntReader.Read
            loadArrC(x, 0) = trailerRow
            loadArrC(x, 1) = posW
            loadArrC(x, 2) = posL
            loadArrC(x, 3) = posH
            loadArrC(x, 10) = heightPln
            loadArrC(x, 12) = posWE
            Dim nextCntShipmentID = cntReader("shipmentID")
            Dim nextCntShipmentStopNumber = cntReader("shipmentStopNumber")

            Dim varPalletLength As Decimal = CDec(cntReader("palletLength"))
            Dim varPalletWidth As Decimal = CDec(cntReader("palletWidth"))

            If varPalletLength > varPalletWidth Then



                nextCntLength = CDec(cntReader("palletWidth"))
                nextCntWidth = CDec(cntReader("palletLength"))
                loadArrC(x, 5) = CStr(nextCntLength)
                loadArrC(x, 6) = CStr(nextCntWidth)

            Else

                nextCntLength = CDec(cntReader("palletLength"))
                nextCntWidth = CDec(cntReader("palletWidth"))
                loadArrC(x, 6) = CStr(nextCntWidth)
                loadArrC(x, 5) = CStr(nextCntLength)
            End If

            Dim varLoadArrc6 As Decimal = CDec(loadArrC(x, 6))
            Dim varLoadArrc5 As Decimal = CDec(loadArrC(x, 5))


            If nextCntLength = 78 Then
                Dim debugStop As String = "stop"
            End If

            nextCntHeight = cntReader("palletHeight")
            loadArrC(x, 7) = nextCntHeight
            Dim varLoadArr7 As Decimal = CDec(loadArrC(x, 7))
            nextCntWgt = cntReader("palletWeight")
            loadArrC(x, 8) = nextCntWgt
            loadedTrailerWgt = loadedTrailerWgt + nextCntWgt
            If loadedTrailerWgt > maxTrailerWgt Then

                Exit Function
            End If

            Dim nextTypeOfContainer = cntReader("typeOfContainer")
            nextCntBurstWgt = cntReader("burstWeight")
            loadArrC(x, 9) = nextCntBurstWgt
            Dim nextSessionID = cntReader("sessionid")
            nextCntID = cntReader("containerID")
            loadArrC(x, 4) = nextCntID
            loadArrC(x, 11) = nextCntWidth * nextCntLength
            cntArea = nextCntWidth * nextCntLength



            noCntLoaded = noCntLoaded + 1
            loadSurface()
            x = x + 1

        End While


        connection.Close()

    End Function
    Public Shared Sub NumberCntLoaded()

    End Sub
    Public Shared Function mainMovie(ByVal varSessionID As String, ByVal varShipmentID As String)

        noSurfLoaded = 0



        Dim x As Integer
        For x = 0 To noCntLoaded - 1

            nextCntWidth = CDec(loadArrC(x, 6))
            nextCntLength = CDec(loadArrC(x, 5))
            If nextCntLength > nextCntWidth Then
                Dim debugStop As String = "stop"
            End If
            nextCntID = loadArrC(x, 4)
            cntLoading = nextCntID
            If cntLoading = "832" Then
                Dim stopHere As String
                stopHere = "now"
            End If

            nextCntHeight = CDec(loadArrC(x, 7))
            cntArea = CDec(loadArrC(x, 11))
            nextCntWgt = CDec(loadArrC(x, 8))
            '*************************************************************************************************************************

            If noSurfLoaded = 0 Then
                setContainerPosVal()
                nextCntID = cntLoading
                addSurfaceData(varShipmentID, varShipmentID)

                calcAxleWeight()
                noSurfLoaded = noSurfLoaded + 1

                prevCntID = nextCntID
                removeSurface(nextCntID, varShipmentID, varShipmentID)
                GoTo EndOfLoop
            End If

            '**********************************************************************************************************************************************
            resetHitFlags()
            '**********************************************************************************************************************************************

            Dim xT As Integer = 0
            xT = xT + noSurfRemoved
            xT = xT
            surfFound = False
            While xT < noSurfLoaded And surfFound = False
                setNextTestPos(xT)
                Dim xTsub As Integer = 0
                xTsub = xTsub + noSurfRemoved
                xTsub = xTsub
                While xTsub < noSurfLoaded
                    setNextTestPosShiftDown(xTsub)
                    checkContainerInt()
                    checkTrailerInt()
                    checkLoadPath()
                    checkSurfaceContact()
                    If hitFlagCnt = False And hitFlagTrailer = False And surfaceContact = True And contactAreaBurstPsiGood = True And contactAreaSizeOk = True Then
                        surfFound = True
                        checkVerticalContact()

                        If verticalContact = False And posL > 0 Then
                            findVertSurf()
                            checkContainerInt()
                            checkLoadPath()
                            surfaceContact = False
                            checkSurfaceContact()
                            If hitFlagCnt = False And surfaceContact = True And contactAreaBurstPsiGood = True And contactAreaSizeOk = True Then
                                If posH = 0 Then
                                    moveToTrailerWall()
                                    If hitFlagCnt = False Then
                                        findVertSurf()
                                    End If
                                End If
                                If posW > 0 And posH = 0 Then
                                    checkVerticalContactRight()
                                    If verticalContactRight = False Then
                                        findVertSurfRight()
                                    End If
                                    checkVerticalContact()
                                    If verticalContact = False Then
                                        findVertSurf()
                                    End If
                                End If
                                resetHitFlags()
                                setContainerPosVal()
                                checkTrailerInt()
                                checkLoadPath()
                                checkContainerInt()

                                If hitFlagTrailer = False And hitFlagCnt = False Then
                                    calcAxleWeight()
                                    nextCntID = cntLoading
                                    addSurfaceData(varShipmentID, varShipmentID)

                                    prevCntID = nextCntID
                                    removeSurface(nextCntID, varShipmentID, varShipmentID)
                                    noSurfLoaded = noSurfLoaded + 1
                                    GoTo EndOfLoop
                                End If
                            End If
                        Else
                            If hitFlagCnt = False Then
                                If posH = 0 Then
                                    moveToTrailerWall()
                                    If hitFlagCnt = False Then
                                        findVertSurf()
                                    End If
                                End If
                                If posW > 0 And posH = 0 Then
                                    checkVerticalContactRight()
                                    If verticalContactRight = False Then
                                        findVertSurfRight()
                                    End If
                                    checkVerticalContact()
                                    If verticalContact = False Then
                                        findVertSurf()
                                    End If
                                End If
                                resetHitFlags()
                                setContainerPosVal()
                                checkTrailerInt()

                                checkLoadPath()
                                checkContainerInt()

                                If hitFlagTrailer = False And hitFlagCnt = False Then
                                    calcAxleWeight()
                                    nextCntID = cntLoading
                                    addSurfaceData(varShipmentID, varShipmentID)

                                    prevCntID = nextCntID
                                    removeSurface(nextCntID, varShipmentID, varShipmentID)
                                    noSurfLoaded = noSurfLoaded + 1
                                    GoTo EndOfLoop
                                End If
                            End If
                        End If
                    End If

                    resetHitFlags()
                    resetSurfFlags()
                    xTsub = xTsub + 1

                End While
                xT = xT + 1

                If xT <> noSurfLoaded And surfFound = True And hitFlagCnt = False And surfaceContact = True Then
                    GoTo EndOfLoop
                End If
            End While

            '**************************************************************************************************************************************************
            If surfFound = True And hitFlagCnt = False And surfaceContact = True Then
                surfFound = False
                GoTo EndOfLoop
            End If
            rotateCnt()
            resetHitFlags()
            '**************************************************************************************************************************************************

            xT = 0


            surfFound = False
            xT = xT + noSurfRemoved
            While xT < noSurfLoaded And surfFound = False
                setNextTestPos(xT)
                Dim xTsub = 0
                xTsub = xTsub + noSurfRemoved
                While xTsub < noSurfLoaded
                    setNextTestPosShiftDown(xTsub)
                    checkContainerInt()
                    checkTrailerInt()
                    checkLoadPath()
                    checkSurfaceContact()
                    If hitFlagCnt = False And hitFlagTrailer = False And surfaceContact = True And contactAreaBurstPsiGood = True And contactAreaSizeOk = True Then
                        surfFound = True
                        checkVerticalContact()

                        If verticalContact = False And posL > 0 Then
                            findVertSurf()
                            checkContainerInt()
                            checkLoadPath()
                            surfaceContact = False
                            checkSurfaceContact()
                            If hitFlagCnt = False And surfaceContact = True And contactAreaBurstPsiGood = True And contactAreaSizeOk = True Then
                                If posH = 0 Then
                                    moveToTrailerWall()
                                    If hitFlagCnt = False Then
                                        findVertSurf()
                                    End If
                                End If
                                If posW > 0 And posH = 0 Then
                                    checkVerticalContactRight()
                                    If verticalContactRight = False Then
                                        findVertSurfRight()
                                    End If
                                    checkVerticalContact()
                                    If verticalContact = False Then
                                        findVertSurf()
                                    End If
                                End If
                                resetHitFlags()
                                setContainerPosVal()
                                checkTrailerInt()
                                checkLoadPath()
                                checkContainerInt()

                                If hitFlagTrailer = False And hitFlagCnt = False Then
                                    calcAxleWeight()
                                    nextCntID = cntLoading
                                    addSurfaceData(varShipmentID, varShipmentID)

                                    prevCntID = nextCntID
                                    removeSurface(nextCntID, varShipmentID, varShipmentID)
                                    noSurfLoaded = noSurfLoaded + 1
                                    GoTo EndOfLoop
                                End If
                            End If
                        Else
                            If hitFlagCnt = False Then
                                If posH = 0 Then
                                    moveToTrailerWall()
                                    If hitFlagCnt = False Then
                                        findVertSurf()
                                    End If
                                End If
                                If posW > 0 And posH = 0 Then
                                    checkVerticalContactRight()
                                    If verticalContactRight = False Then
                                        findVertSurfRight()
                                    End If
                                    checkVerticalContact()
                                    If verticalContact = False Then
                                        findVertSurf()
                                    End If
                                End If
                                resetHitFlags()
                                setContainerPosVal()
                                checkTrailerInt()
                                checkLoadPath()
                                checkContainerInt()

                                If hitFlagTrailer = False And hitFlagCnt = False Then
                                    calcAxleWeight()
                                    nextCntID = cntLoading
                                    addSurfaceData(varShipmentID, varShipmentID)

                                    prevCntID = nextCntID
                                    removeSurface(nextCntID, varShipmentID, varShipmentID)
                                    noSurfLoaded = noSurfLoaded + 1
                                    GoTo EndOfLoop
                                End If
                            End If
                        End If
                    End If

                    resetHitFlags()
                    resetSurfFlags()
                    xTsub = xTsub + 1

                End While
                xT = xT + 1

                If xT <> noSurfLoaded And surfFound = True And hitFlagCnt = False And surfaceContact = True Then
                    GoTo EndOfLoop
                End If
            End While

            '**************************************************************************************************************************************************
            If surfFound = True And hitFlagCnt = False And surfaceContact = True Then
                surfFound = False
                GoTo EndOfLoop
            End If
            rotateCnt()
            resetHitFlags()
            '**************************************************************************************************************************************************
            xT = 0
            xT = xT + noSurfRemoved
            While xT < noSurfLoaded
                setNextTestPos(xT)
                checkContainerInt()
                checkTrailerInt()
                checkLoadPath()
                checkSurfaceContact()
                If hitFlagCnt = False And hitFlagTrailer = False And surfaceContact = True And contactAreaBurstPsiGood = True And contactAreaSizeOk = True Then
                    checkVerticalContact()

                    If verticalContact = False And posL > 0 Then
                        findVertSurf()
                        checkContainerInt()
                        checkLoadPath()
                        surfaceContact = False
                        checkSurfaceContact()
                        If hitFlagCnt = False And surfaceContact = True And contactAreaBurstPsiGood = True And contactAreaSizeOk = True Then
                            If posH = 0 Then
                                moveToTrailerWall()
                                If hitFlagCnt = False Then
                                    findVertSurf()
                                End If
                            End If
                            If posW > 0 And posH = 0 Then
                                checkVerticalContactRight()
                                If verticalContactRight = False Then
                                    findVertSurfRight()
                                End If
                                checkVerticalContact()
                                If verticalContact = False Then
                                    findVertSurf()
                                End If
                            End If
                            resetHitFlags()
                            setContainerPosVal()
                            checkTrailerInt()
                            checkLoadPath()
                            checkContainerInt()

                            If hitFlagTrailer = False And hitFlagCnt = False Then
                                calcAxleWeight()
                                nextCntID = cntLoading
                                addSurfaceData(varShipmentID, varShipmentID)

                                prevCntID = nextCntID
                                removeSurface(nextCntID, varShipmentID, varShipmentID)
                                noSurfLoaded = noSurfLoaded + 1
                                GoTo EndOfLoop
                            End If
                        End If
                    Else
                        If hitFlagCnt = False Then
                            If posH = 0 Then
                                moveToTrailerWall()
                                If hitFlagCnt = False Then
                                    findVertSurf()
                                End If
                            End If
                            If posW > 0 And posH = 0 Then
                                checkVerticalContactRight()
                                If verticalContactRight = False Then
                                    findVertSurfRight()
                                End If
                                checkVerticalContact()
                                If verticalContact = False Then
                                    findVertSurf()
                                End If
                            End If
                            resetHitFlags()
                            setContainerPosVal()
                            checkTrailerInt()
                            checkLoadPath()
                            checkContainerInt()

                            If hitFlagTrailer = False And hitFlagCnt = False Then
                                calcAxleWeight()
                                nextCntID = cntLoading
                                addSurfaceData(varShipmentID, varShipmentID)

                                prevCntID = nextCntID
                                removeSurface(nextCntID, varShipmentID, varShipmentID)
                                noSurfLoaded = noSurfLoaded + 1
                                GoTo EndOfLoop
                            End If
                        End If
                    End If
                End If

                resetHitFlags()
                resetSurfFlags()

                xT = xT + 1
            End While

            If xT <> noSurfLoaded And hitFlagCnt = False Then
                GoTo EndOfLoop
            End If

            '**************************************************************************************************************************************************
            rotateCnt()
            resetHitFlags()
            '**************************************************************************************************************************************************
            xT = 0
            xT = xT + noSurfRemoved

            While xT < noSurfLoaded
                setNextTestPos(xT)
                checkContainerInt()
                checkTrailerInt()
                checkLoadPath()
                checkSurfaceContact()
                If hitFlagCnt = False And hitFlagTrailer = False And surfaceContact = True And contactAreaBurstPsiGood = True And contactAreaSizeOk = True Then
                    checkVerticalContact()

                    If verticalContact = False And posL > 0 Then
                        findVertSurf()
                        checkContainerInt()
                        checkLoadPath()
                        surfaceContact = False
                        checkSurfaceContact()
                        If hitFlagCnt = False And surfaceContact = True And contactAreaBurstPsiGood = True And contactAreaSizeOk = True Then
                            If posH = 0 Then
                                moveToTrailerWall()
                                If hitFlagCnt = False Then
                                    findVertSurf()
                                End If
                            End If
                            If posW > 0 And posH = 0 Then
                                checkVerticalContactRight()
                                If verticalContactRight = False Then
                                    findVertSurfRight()
                                End If
                                checkVerticalContact()
                                If verticalContact = False Then
                                    findVertSurf()
                                End If
                            End If
                            resetHitFlags()
                            setContainerPosVal()
                            checkTrailerInt()
                            checkLoadPath()
                            checkContainerInt()

                            If hitFlagTrailer = False And hitFlagCnt = False Then
                                calcAxleWeight()
                                nextCntID = cntLoading
                                addSurfaceData(varShipmentID, varShipmentID)

                                prevCntID = nextCntID
                                removeSurface(nextCntID, varShipmentID, varShipmentID)
                                noSurfLoaded = noSurfLoaded + 1
                                GoTo EndOfLoop
                            End If
                        End If
                    Else
                        If hitFlagCnt = False Then
                            If posH = 0 Then
                                moveToTrailerWall()
                                If hitFlagCnt = False Then
                                    findVertSurf()
                                End If
                            End If
                            If posW > 0 And posH = 0 Then
                                checkVerticalContactRight()
                                If verticalContactRight = False Then
                                    findVertSurfRight()
                                End If
                                checkVerticalContact()
                                If verticalContact = False Then
                                    findVertSurf()
                                End If
                            End If
                            resetHitFlags()
                            setContainerPosVal()
                            checkTrailerInt()
                            checkLoadPath()
                            checkContainerInt()

                            If hitFlagTrailer = False And hitFlagCnt = False Then
                                calcAxleWeight()
                                nextCntID = cntLoading
                                addSurfaceData(varShipmentID, varShipmentID)

                                prevCntID = nextCntID
                                removeSurface(nextCntID, varShipmentID, varShipmentID)
                                noSurfLoaded = noSurfLoaded + 1
                                GoTo EndOfLoop
                            End If
                        End If
                    End If
                End If

                resetHitFlags()
                resetSurfFlags()

                xT = xT + 1
            End While

            If xT <> noSurfLoaded And hitFlagCnt = False Then
                GoTo EndOfLoop
            End If
            '**************************************************************************************************************************************************	
            rotateCnt()
            resetHitFlags()
            '**************************************************************************************************************************************************
            xT = 0
            p2HitFlag = False
            p1HitFlag = False
            tmpP8xVal = 0
            xT = xT + noSurfRemoved
            While xT < noSurfLoaded
                SetNextTestPosTop(xT)
                p2HitFlag = False
                p1HitFlag = False
                checkContainerInt()
                checkLoadPath()
                If p2HitFlag = True And posH > 0 And posL > 0 Then

                    Dim p2HitFlagChecker As Integer = 0
                    For p2HitFlagChecker = 0 To p2HitFlagCounter
                        If p2HitFlagArr(p2HitFlagChecker, 0) >= minTrailerLength - 96 Then
                            p2HitFlag = False
                            posL = CDec(p2HitFlagArr(p2HitFlagChecker, 0))
                            p2x = CDec(p2HitFlagArr(p2HitFlagChecker, 0))
                            p5x = CDec(p2HitFlagArr(p2HitFlagChecker, 0))
                            p6x = CDec(p2HitFlagArr(p2HitFlagChecker, 0))
                            posW = CDec(p2HitFlagArr(p2HitFlagChecker, 1))
                            posH = CDec(p2HitFlagArr(p2HitFlagChecker, 2))
                            resetHitFlags()
                            checkContainerInt()
                            checkLoadPath()
                            If hitFlagCnt = False Then
                                Exit For
                            End If
                        End If
                    Next p2HitFlagChecker
                End If

                If p1HitFlag = True And posH > 0 And posL > 0 Then

                    Dim p1HitFlagChecker As Integer = 0
                    For p1HitFlagChecker = 0 To p1HitFlagCounter
                        If p2HitFlagArr(p1HitFlagChecker, 0) >= minTrailerLength - 96 Then
                            p1HitFlag = False
                            posL = CDec(p1HitFlagArr(p1HitFlagChecker, 0))
                            p2x = CDec(p1HitFlagArr(p1HitFlagChecker, 0))
                            p5x = CDec(p1HitFlagArr(p1HitFlagChecker, 0))
                            p6x = CDec(p1HitFlagArr(p1HitFlagChecker, 0))
                            posW = CDec(p1HitFlagArr(p1HitFlagChecker, 1))
                            posH = CDec(p1HitFlagArr(p1HitFlagChecker, 2))
                            resetHitFlags()
                            checkContainerInt()
                            checkLoadPath()
                            If hitFlagCnt = False Then
                                Exit For
                            End If
                        End If
                    Next p1HitFlagChecker
                End If

                checkTrailerInt()
                checkSurfaceContact()
                If hitFlagCnt = False And hitFlagTrailer = False And surfaceContact = True And contactAreaBurstPsiGood = True And contactAreaSizeOk = True Then
                    If posH = 0 Then
                        moveToTrailerWall()
                        If hitFlagCnt = False Then
                            findVertSurf()
                        End If
                    End If
                    If posW > 0 And posH = 0 Then
                        checkVerticalContactRight()
                        If verticalContactRight = False Then
                            findVertSurfRight()
                        End If
                        checkVerticalContact()
                        If verticalContact = False Then
                            findVertSurf()
                        End If
                    End If
                    resetHitFlags()
                    setContainerPosVal()
                    checkTrailerInt()
                    checkLoadPath()

                    checkContainerInt()

                    If hitFlagTrailer = False And hitFlagCnt = False Then
                        calcAxleWeight()
                        nextCntID = cntLoading
                        addSurfaceData(varShipmentID, varShipmentID)

                        prevCntID = nextCntID
                        removeSurface(nextCntID, varShipmentID, varShipmentID)
                        noSurfLoaded = noSurfLoaded + 1
                        GoTo EndOfLoop
                    End If
                End If

                resetHitFlags()
                resetSurfFlags()
                xT = xT + 1
            End While


            If xT <> noSurfLoaded Then
                GoTo EndOfLoop
            End If
            '**************************************************************************************************************************************************	
            rotateCnt()
            resetHitFlags()
            '**************************************************************************************************************************************************
            xT = 0
            p2HitFlag = False
            p1HitFlag = False
            tmpP8xVal = 0
            xT = xT + noSurfRemoved
            While xT < noSurfLoaded
                SetNextTestPosTop(xT)
                p2HitFlag = False
                p1HitFlag = False
                checkContainerInt()
                checkLoadPath()
                If p2HitFlag = True And posH > 0 And posL > 0 Then

                    Dim p2HitFlagChecker As Integer = 0
                    For p2HitFlagChecker = 0 To p2HitFlagCounter
                        If p2HitFlagArr(p2HitFlagChecker, 0) >= minTrailerLength - 96 Then
                            p2HitFlag = False
                            posL = CDec(p2HitFlagArr(p2HitFlagChecker, 0))
                            p2x = CDec(p2HitFlagArr(p2HitFlagChecker, 0))
                            p5x = CDec(p2HitFlagArr(p2HitFlagChecker, 0))
                            p6x = CDec(p2HitFlagArr(p2HitFlagChecker, 0))
                            posW = CDec(p2HitFlagArr(p2HitFlagChecker, 1))
                            posH = CDec(p2HitFlagArr(p2HitFlagChecker, 2))
                            resetHitFlags()
                            checkContainerInt()
                            checkLoadPath()
                            If hitFlagCnt = False Then
                                Exit For
                            End If
                        End If
                    Next p2HitFlagChecker
                End If

                If p1HitFlag = True And posH > 0 And posL > 0 Then

                    Dim p1HitFlagChecker As Integer = 0
                    For p1HitFlagChecker = 0 To p1HitFlagCounter
                        If p2HitFlagArr(p1HitFlagChecker, 0) >= minTrailerLength - 96 Then
                            p1HitFlag = False
                            posL = CDec(p1HitFlagArr(p1HitFlagChecker, 0))
                            p2x = CDec(p1HitFlagArr(p1HitFlagChecker, 0))
                            p5x = CDec(p1HitFlagArr(p1HitFlagChecker, 0))
                            p6x = CDec(p1HitFlagArr(p1HitFlagChecker, 0))
                            posW = CDec(p1HitFlagArr(p1HitFlagChecker, 1))
                            posH = CDec(p1HitFlagArr(p1HitFlagChecker, 2))
                            resetHitFlags()
                            checkContainerInt()
                            checkLoadPath()
                            If hitFlagCnt = False Then
                                Exit For
                            End If
                        End If
                    Next p1HitFlagChecker
                End If

                checkTrailerInt()
                checkSurfaceContact()
                If hitFlagCnt = False And hitFlagTrailer = False And surfaceContact = True And contactAreaBurstPsiGood = True And contactAreaSizeOk = True Then
                    If posH = 0 Then '*****
                        moveToTrailerWall() '*****
                        If hitFlagCnt = False Then '*****
                            findVertSurf() '*****
                        End If '*****
                    End If '*****
                    If posW > 0 And posH = 0 Then  '*****
                        checkVerticalContactRight() '*****
                        If verticalContactRight = False Then '*****
                            findVertSurfRight() '*****
                        End If '*****
                        checkVerticalContact() '*****
                        If verticalContact = False Then '*****
                            findVertSurf() '*****
                        End If '*****
                    End If '*****
                    resetHitFlags()
                    setContainerPosVal()
                    checkTrailerInt()
                    checkLoadPath()
                    checkContainerInt()

                    If hitFlagTrailer = False And hitFlagCnt = False Then
                        calcAxleWeight()
                        nextCntID = cntLoading
                        addSurfaceData(varShipmentID, varShipmentID)

                        prevCntID = nextCntID
                        removeSurface(nextCntID, varShipmentID, varShipmentID)
                        noSurfLoaded = noSurfLoaded + 1
                        GoTo EndOfLoop
                    End If
                End If

                resetHitFlags()
                resetSurfFlags()
                xT = xT + 1
            End While


            If xT <> noSurfLoaded Then
                GoTo EndOfLoop
            End If
            '**************************************************************************************************************************************************	
            rotateCnt()
            resetHitFlags()
            '**************************************************************************************************************************************************	

            xT = 0
            surfFound = False
            xT = xT + noSurfRemoved
            While xT < noSurfLoaded And surfFound = False
                setNextTestPos(xT)
                Dim xTsub = 0
                xTsub = xTsub + noSurfRemoved
                While xTsub < noSurfLoaded
                    setNextTestPosShiftRearward(xTsub)
                    checkContainerInt()

                    checkTrailerInt()
                    checkLoadPath()
                    checkSurfaceContact()
                    If hitFlagCnt = False And hitFlagTrailer = False And surfaceContact = True And contactAreaBurstPsiGood = True And contactAreaSizeOk = True Then
                        surfFound = True
                        If posH = 0 Then
                            moveToTrailerWall()
                            If hitFlagCnt = False Then
                                findVertSurf()
                            End If
                        End If
                        If posW > 0 And posH = 0 Then
                            checkVerticalContactRight()
                            If verticalContactRight = False Then
                                findVertSurfRight()
                            End If
                            checkVerticalContact()
                            If verticalContact = False Then
                                findVertSurf()
                            End If
                        End If
                        resetHitFlags()
                        setContainerPosVal()
                        checkTrailerInt()
                        checkLoadPath()
                        checkContainerInt()

                        If hitFlagTrailer = False And hitFlagCnt = False Then
                            calcAxleWeight()
                            nextCntID = cntLoading
                            addSurfaceData(varShipmentID, varShipmentID)

                            prevCntID = nextCntID
                            removeSurface(nextCntID, varShipmentID, varShipmentID)
                            noSurfLoaded = noSurfLoaded + 1
                            GoTo EndOfLoop
                        End If
                    End If

                    resetHitFlags()
                    resetSurfFlags()
                    xTsub = xTsub + 1

                End While
                xT = xT + 1

                If xT <> noSurfLoaded And surfFound = True Then
                    GoTo EndOfLoop
                End If
            End While

            '**************************************************************************************************************************************************
            If surfFound = True Then
                surfFound = False
                GoTo EndOfLoop
            End If
            rotateCnt()
            resetHitFlags()
            '**************************************************************************************************************************************************

            xT = 0
            surfFound = False
            xT = xT + noSurfRemoved
            While xT < noSurfLoaded And surfFound = False
                setNextTestPos(xT)
                Dim xTsub = 0
                xTsub = xTsub + noSurfRemoved
                While xTsub < noSurfLoaded
                    setNextTestPosShiftRearward(xTsub)
                    checkContainerInt()

                    checkTrailerInt()
                    checkLoadPath()
                    checkSurfaceContact()
                    If hitFlagCnt = False And hitFlagTrailer = False And surfaceContact = True And contactAreaBurstPsiGood = True And contactAreaSizeOk = True Then
                        surfFound = True
                        If posH = 0 Then
                            moveToTrailerWall()
                            If hitFlagCnt = False Then
                                findVertSurf()
                            End If
                        End If
                        If posW > 0 And posH = 0 Then
                            checkVerticalContactRight()
                            If verticalContactRight = False Then
                                findVertSurfRight()
                            End If
                            checkVerticalContact()
                            If verticalContact = False Then
                                findVertSurf()
                            End If
                        End If
                        resetHitFlags()
                        setContainerPosVal()
                        checkTrailerInt()
                        checkLoadPath()
                        checkContainerInt()

                        If hitFlagTrailer = False And hitFlagCnt = False Then
                            calcAxleWeight()
                            nextCntID = cntLoading
                            addSurfaceData(varShipmentID, varShipmentID)

                            prevCntID = nextCntID
                            removeSurface(nextCntID, varShipmentID, varShipmentID)
                            noSurfLoaded = noSurfLoaded + 1
                            GoTo EndOfLoop
                        End If
                    End If

                    resetHitFlags()
                    resetSurfFlags()
                    xTsub = xTsub + 1

                End While
                xT = xT + 1

                If xT <> noSurfLoaded And surfFound = True Then
                    GoTo EndOfLoop
                End If
            End While

            '**************************************************************************************************************************************************
            rotateCnt()
            resetHitFlags()
            '**************************************************************************************************************************************************	

            xT = 0
            xT = xT + noSurfRemoved
            While xT < noSurfLoaded
                setNextTestPosFront(xT)
                Dim xTsub = 0
                xTsub = xTsub + noSurfRemoved
                While xTsub < noSurfLoaded
                    setNextTestPosShiftRearward(xTsub)
                    resetHitFlags()
                    checkContainerInt()
                    checkTrailerInt()
                    checkLoadPath()
                    checkSurfaceContact()
                    If hitFlagCnt = False And hitFlagTrailer = False And surfaceContact = True And contactAreaBurstPsiGood = True And contactAreaSizeOk = True Then
                        If posH = 0 Then
                            moveToTrailerWall()
                            If hitFlagCnt = False Then
                                findVertSurf()
                            End If
                        End If
                        If posW > 0 And posH = 0 Then
                            checkVerticalContactRight()
                            If verticalContactRight = False Then
                                findVertSurfRight()
                            End If
                            checkVerticalContact()
                            If verticalContact = False Then
                                findVertSurf()
                            End If
                        End If
                        resetHitFlags()
                        setContainerPosVal()
                        checkTrailerInt()
                        checkLoadPath()
                        checkContainerInt()

                        If hitFlagTrailer = False And hitFlagCnt = False Then
                            calcAxleWeight()
                            nextCntID = cntLoading
                            addSurfaceData(varShipmentID, varShipmentID)

                            prevCntID = nextCntID
                            removeSurface(nextCntID, varShipmentID, varShipmentID)
                            noSurfLoaded = noSurfLoaded + 1
                            GoTo EndOfLoop
                        End If
                    End If

                    resetHitFlags()
                    resetSurfFlags()
                    xTsub = xTsub + 1

                End While
                xT = xT + 1

                If xT <> noSurfLoaded And surfFound = True Then
                    GoTo EndOfLoop
                End If
            End While

            '**************************************************************************************************************************************************
            rotateCnt()
            resetHitFlags()
            '**************************************************************************************************************************************************	

            xT = 0
            xT = xT + noSurfRemoved
            While xT < noSurfLoaded
                setNextTestPosFront(xT)
                Dim xTsub = 0
                xTsub = xTsub + noSurfRemoved
                While xTsub < noSurfLoaded
                    setNextTestPosShiftRearward(xT)
                    checkContainerInt()
                    checkTrailerInt()
                    checkLoadPath()
                    checkSurfaceContact()
                    If hitFlagCnt = False And hitFlagTrailer = False And surfaceContact = True And contactAreaBurstPsiGood = True And contactAreaSizeOk = True Then
                        If posH = 0 Then
                            moveToTrailerWall()
                            If hitFlagCnt = False Then
                                findVertSurf()
                            End If
                        End If
                        If posW > 0 And posH = 0 Then
                            checkVerticalContactRight()
                            If verticalContactRight = False Then
                                findVertSurfRight()
                            End If
                            checkVerticalContact()
                            If verticalContact = False Then
                                findVertSurf()
                            End If
                        End If
                        resetHitFlags()
                        setContainerPosVal()
                        checkTrailerInt()
                        checkLoadPath()
                        checkContainerInt()

                        If hitFlagTrailer = False And hitFlagCnt = False Then
                            calcAxleWeight()
                            nextCntID = cntLoading
                            addSurfaceData(varShipmentID, varShipmentID)

                            prevCntID = nextCntID
                            removeSurface(nextCntID, varShipmentID, varShipmentID)
                            noSurfLoaded = noSurfLoaded + 1
                            GoTo EndOfLoop
                        End If
                    End If

                    resetHitFlags()
                    resetSurfFlags()
                    xTsub = xTsub + 1

                End While
                xT = xT + 1

                If xT <> noSurfLoaded And surfFound = True Then
                    GoTo EndOfLoop
                End If
            End While

            '**************************************************************************************************************************************************
            rotateCnt()
            resetHitFlags()
            '**************************************************************************************************************************************************
            xT = 0
            xT = xT + noSurfRemoved
            While xT < noSurfLoaded
                setNextTestPosFront(xT)
                checkContainerInt()
                checkTrailerInt()
                checkLoadPath()
                checkSurfaceContact()
                If hitFlagCnt = False And hitFlagTrailer = False And surfaceContact = True And contactAreaBurstPsiGood = True And contactAreaSizeOk = True Then
                    If posH = 0 Then
                        moveToTrailerWall()
                        If hitFlagCnt = False Then
                            findVertSurf()
                        End If
                    End If
                    If posW > 0 And posH = 0 Then
                        checkVerticalContactRight()
                        If verticalContactRight = False Then
                            findVertSurfRight()
                        End If
                        checkVerticalContact()
                        If verticalContact = False Then
                            findVertSurf()
                        End If
                    End If
                    resetHitFlags()
                    setContainerPosVal()
                    checkTrailerInt()
                    checkLoadPath()
                    checkContainerInt()

                    If hitFlagTrailer = False And hitFlagCnt = False Then
                        calcAxleWeight()
                        nextCntID = cntLoading
                        addSurfaceData(varShipmentID, varShipmentID)

                        prevCntID = nextCntID
                        removeSurface(nextCntID, varShipmentID, varShipmentID)
                        noSurfLoaded = noSurfLoaded + 1
                        GoTo EndOfLoop
                    End If
                End If

                resetHitFlags()
                resetSurfFlags()
                xT = xT + 1
            End While


            If xT <> noSurfLoaded And surfFound = True Then '
                GoTo EndOfLoop
            End If
            '**************************************************************************************************************************************************	
            rotateCnt()
            resetHitFlags()
            '**************************************************************************************************************************************************	
            xT = 0
            xT = xT + noSurfRemoved
            While xT < noSurfLoaded
                setNextTestPosFront(xT)
                checkContainerInt()
                checkTrailerInt()
                checkLoadPath()
                checkSurfaceContact()
                If hitFlagCnt = False And hitFlagTrailer = False And surfaceContact = True And contactAreaBurstPsiGood = True And contactAreaSizeOk = True Then
                    If posH = 0 Then
                        moveToTrailerWall()
                        If hitFlagCnt = False Then
                            findVertSurf()
                        End If
                    End If
                    If posW > 0 And posH = 0 Then
                        checkVerticalContactRight()
                        If verticalContactRight = False Then
                            findVertSurfRight()
                        End If
                        checkVerticalContact()
                        If verticalContact = False Then
                            findVertSurf()
                        End If
                    End If
                    resetHitFlags()
                    setContainerPosVal()
                    checkTrailerInt()
                    checkLoadPath()
                    checkContainerInt()

                    If hitFlagTrailer = False And hitFlagCnt = False Then
                        calcAxleWeight()
                        nextCntID = cntLoading
                        addSurfaceData(varShipmentID, varShipmentID)

                        prevCntID = nextCntID
                        removeSurface(nextCntID, varShipmentID, varShipmentID)
                        noSurfLoaded = noSurfLoaded + 1
                        GoTo EndOfLoop
                    End If
                End If

                resetHitFlags()
                resetSurfFlags()
                xT = xT + 1
            End While


            If xT <> noSurfLoaded And surfFound = True Then
                GoTo EndOfLoop
            End If
            '**************************************************************************************************************************************************	
            rotateCnt()
            resetHitFlags()
            '**************************************************************************************************************************************************

            If minTrailerLength + nextCntLength < maxTrailerL Then
                moveToTrailerWall()
                checkTrailerInt()
                checkContainerInt()

                If hitFlagTrailer = False And hitFlagCnt = False Then
                    calcAxleWeight()
                    nextCntID = cntLoading
                    addSurfaceData(varShipmentID, varShipmentID)
                    prevCntID = nextCntID
                    removeSurface(nextCntID, varShipmentID, varShipmentID)
                    noSurfLoaded = noSurfLoaded + 1
                    GoTo EndOfLoop
                End If
            End If


EndOfLoop:
        Next x

        calcaxleweight_2()

        updateLoadData(varShipmentID, varShipmentID)

        updateUsedContainers(varShipmentID, varShipmentID)

        updateUnUsedContainers(varShipmentID, varShipmentID)

    End Function

    Public Shared Function setContainerPosVal()

        If nextCntLength = 78 Then
            Dim debugStop As String = "stop"
        End If
        p8x = posL + nextCntLength
        p8y = posW + nextCntWidth
        p8z = posH + nextCntHeight
        p2x = posL
        p2y = posW
        p2z = posH + nextCntHeight
        p3x = posL + nextCntLength
        p3y = posW
        p3z = posH
        p4x = posL + nextCntLength
        p4y = posW
        p4z = posH + nextCntHeight
        p5x = posL
        p5y = posW + nextCntWidth
        p5z = posH
        p6x = posL
        p6y = posW + nextCntWidth
        p6z = posH + nextCntHeight
        p7x = posL + nextCntLength
        p7y = posW + nextCntWidth
        p7z = posH




    End Function

    Public Shared Function addSurfaceData(ByVal varSessionID As String, ByVal varShipmentID As String)

        Dim sDx As Integer


        For sDx = noSurfLoaded To noCntLoaded

            Dim cntSurfID = surfaceArr(sDx, 4)

            If cntSurfID = cntLoading Then

                If nextCntLength > nextCntWidth Then
                    Dim debugVar As String = "stop  here"
                End If



                Dim debugNoSurfLoaded = noSurfLoaded

                surfaceArr(sDx, 6) = nextCntWidth
                surfaceArr(sDx, 5) = nextCntLength

                surfaceArr(sDx, 1) = posW
                surfaceArr(sDx, 2) = posL
                surfaceArr(sDx, 3) = posH
                surfaceArr(sDx, 10) = heightPln
                If nextCntLength = 78 Then
                    Dim debugStop As String = "stop"
                End If
                p8x = posL + nextCntLength
                surfaceArr(sDx, 13) = p8x
                p8y = posW + nextCntWidth
                surfaceArr(sDx, 14) = p8y
                p8z = posH + nextCntHeight
                surfaceArr(sDx, 15) = p8z
                p2x = posL
                surfaceArr(sDx, 16) = p2x
                p2y = posW
                surfaceArr(sDx, 17) = p2y
                p2z = posH + nextCntHeight
                surfaceArr(sDx, 18) = p2z
                p3x = posL + nextCntLength
                surfaceArr(sDx, 19) = p3x
                p3y = posW
                surfaceArr(sDx, 20) = p3y
                p3z = posH
                surfaceArr(sDx, 21) = p3z
                p4x = posL + nextCntLength
                surfaceArr(sDx, 22) = p4x
                p4y = posW
                surfaceArr(sDx, 23) = p4y
                p4z = posH + nextCntHeight
                surfaceArr(sDx, 24) = p4z
                p5x = posL
                surfaceArr(sDx, 25) = p5x
                p5y = posW + nextCntWidth
                surfaceArr(sDx, 26) = p5y
                p5z = posH
                surfaceArr(sDx, 27) = p5z
                p6x = posL
                surfaceArr(sDx, 28) = p6x
                p6y = posW + nextCntWidth
                surfaceArr(sDx, 29) = p6y
                p6z = posH + nextCntHeight
                surfaceArr(sDx, 30) = p6z
                p7x = posL + nextCntLength
                surfaceArr(sDx, 31) = p7x
                p7y = posW + nextCntWidth
                surfaceArr(sDx, 32) = p7y
                p7z = posH
                surfaceArr(sDx, 33) = p7z



                Exit Function

            End If
        Next sDx


    End Function
    Public Shared Function calcAxleWeight()

        If p3x > minTrailerLength Then
            minTrailerLength = p3x
            minTrailerLengthFeet = Math.Floor((minTrailerLength / 12))
            System.Web.HttpContext.Current.Session("minTrailerLengthFeet") = minTrailerLengthFeet
            minTrailerlengthInches = Math.Floor(minTrailerLength - (minTrailerLengthFeet * 12))
            System.Web.HttpContext.Current.Session("minTrailerlengthInches") = minTrailerlengthInches
        End If




    End Function

    Public Shared Function removeSurface(ByVal surfIDArrNo, ByVal varSessionID, ByVal varShipmentID)

        If surfIDArrNo = 26 Then
            Dim test As String = "Test"
        End If

        Dim Rx As Integer


        For Rx = noSurfRemoved To noCntLoaded
            Dim testID = surfaceArr(Rx, 4)



            If testID = surfIDArrNo Then

                surfaceArr(Rx, 12) = "used"
                surfaceArr(Rx, 0) = trailerRow



                Exit Function
            End If


            If CDec(surfaceArr(Rx, 19)) < minTrailerLength - 96 Then
                noSurfRemoved = noSurfRemoved + 1

            End If




        Next Rx

    End Function

    Public Shared Function resetHitFlags()
        hitFlagTop = False
        hitFlagSide = False
        hitFlagEnd = False
        hitFlagCnt = False
        hitFlagTrailer = False
    End Function

    Public Shared Function resetHitFlagTop()
        hitFlagTop = False
    End Function

    Public Shared Function resetHitFlagSide()
        hitFlagSide = False
    End Function

    Public Shared Function resetHitFlagEnd()
        hitFlagEnd = False
    End Function

    Public Shared Function resetHitFlagCnt()
        hitFlagCnt = False
    End Function

    Public Shared Function resetSurfFlags()
        surfaceContact = False
        contactAreaBurstPsiGood = False
        contactAreaSizeOk = False
        contactArea = 0
        minBurstStrength = 0
        tmpMinBurstStrength = 0

    End Function

    Public Shared Function setNextTestPos(ByVal xT)

        noSurfChecked = 0
        If surfaceArr(xT, 12) = "used" And CDec(surfaceArr(xT, 2)) >= minTrailerLength - 96 And surfaceArr(xT, 4) <> cntLoading Then
            foundMatch = True
            posL = CDec(surfaceArr(xT, 25))
            posW = CDec(surfaceArr(xT, 26))
            posWE = CDec(surfaceArr(xT, 26))

            posH = CDec(surfaceArr(xT, 3))
            nextCntID = surfaceArr(xT, 4)

            burstStrength = CDec(surfaceArr(xT, 9))
            setContainerPosVal()
            Exit Function

        Else
            Exit Function


        End If
        noSurfChecked = noSurfChecked + 1
        setContainerPosVal()


    End Function

    Public Shared Function SetNextTestPosTop(ByVal xT)

        noSurfChecked = 0
        If surfaceArr(xT, 12) = "used" And CDec(surfaceArr(xT, 2)) >= minTrailerLength - 96 And surfaceArr(xT, 4) <> cntLoading Then
            posL = CDec(surfaceArr(xT, 16))
            posW = CDec(surfaceArr(xT, 17))
            posWE = CDec(surfaceArr(xT, 17))
            posH = CDec(surfaceArr(xT, 18))
            nextCntID = surfaceArr(xT, 4)
            If nextCntID = 13 Then
                Dim debugStop As String = "Stop"
            End If

            burstStrength = CDec(surfaceArr(xT, 9))
            setContainerPosVal()
            Exit Function
        End If
        noSurfChecked = noSurfChecked + 1
        setContainerPosVal()



    End Function

    Public Shared Function setNextTestPosFront(ByVal xT)

        noSurfChecked = 0
        If surfaceArr(xT, 12) = "used" And CDec(surfaceArr(xT, 2)) >= minTrailerLength - 96 And surfaceArr(xT, 4) <> cntLoading Then
            posL = CDec(surfaceArr(xT, 19))
            posW = CDec(surfaceArr(xT, 20))
            posWE = CDec(surfaceArr(xT, 20))
            posH = CDec(surfaceArr(xT, 21))
            nextCntID = surfaceArr(xT, 4)

            burstStrength = CDec(surfaceArr(xT, 9))


            setContainerPosVal()
            Exit Function
        End If
        noSurfChecked = noSurfChecked + 1
        setContainerPosVal()


    End Function

    Public Shared Function setNextTestPosNextRowFrontFloor(ByVal xT)
        noSurfChecked = 0

        If surfaceArr(xT, 12) = "used" And CDec(surfaceArr(xT, 1)) <= p5x And
        CDec(surfaceArr(xT, 1)) >= posW And CDec(surfaceArr(xT, 3)) >= posH And CDec(surfaceArr(xT, 3)) <= p2z Then
            posL = CDec(surfaceArr(xT, 19))
            posW = CDec(surfaceArr(xT, 20))
            posWE = CDec(surfaceArr(xT, 20))
            posH = CDec(surfaceArr(xT, 21))
            nextCntID = surfaceArr(xT, 4)

            burstStrength = CDec(surfaceArr(xT, 9))


            setContainerPosVal()
            Exit Function
        End If
        noSurfChecked = noSurfChecked + 1
        setContainerPosVal()


    End Function

    Public Shared Function findVertSurfRight()
        Dim sDx As Integer = 0

        Dim vSurfRightFound = False
        noSurfChecked = 0
        Dim tmpTestPosW = posW

        For sDx = noSurfRemoved To noSurfLoaded


            resetHitFlags()
            vSurfRightFound = False


            If surfaceArr(sDx, 12) = "used" And CDec(surfaceArr(sDx, 26)) < tmpTestPosW And
            CDec(surfaceArr(sDx, 2)) < posL And CDec(surfaceArr(sDx, 19)) > p3x And CDec(surfaceArr(sDx, 3)) <= p2z And
            CDec(surfaceArr(sDx, 18)) > posH And CDec(surfaceArr(sDx, 19)) >= minTrailerLength - 96 Then

                vSurfRightFound = True
            End If

            If surfaceArr(sDx, 12) = "used" And CDec(surfaceArr(sDx, 26)) < tmpTestPosW And CDec(surfaceArr(sDx, 2)) >= posL And
            CDec(surfaceArr(sDx, 2)) < p3x And CDec(surfaceArr(sDx, 3)) <= p2z And CDec(surfaceArr(sDx, 18)) > posH And
            CDec(surfaceArr(sDx, 19)) >= minTrailerLength - 96 Then

                vSurfRightFound = True
            End If

            If surfaceArr(sDx, 12) = "used" And CDec(surfaceArr(sDx, 26)) < tmpTestPosW And CDec(surfaceArr(sDx, 19)) >= posL And
            CDec(surfaceArr(sDx, 19)) < p3x And CDec(surfaceArr(sDx, 3)) <= p2z And CDec(surfaceArr(sDx, 18)) > posH And
            CDec(surfaceArr(sDx, 19)) >= minTrailerLength - 96 Then

                vSurfRightFound = True
            End If

            If vSurfRightFound = True Then

                posW = CDec(surfaceArr(sDx, 26))
                p2y = CDec(surfaceArr(sDx, 26))
                p3y = CDec(surfaceArr(sDx, 26))
                p4y = CDec(surfaceArr(sDx, 26))

                p5y = CDec(surfaceArr(sDx, 26)) + nextCntWidth
                p6y = CDec(surfaceArr(sDx, 26)) + nextCntWidth
                p7y = CDec(surfaceArr(sDx, 26)) + nextCntWidth
                p8y = CDec(surfaceArr(sDx, 26)) + nextCntWidth

                Dim prevPosW = posW

                checkContainerInt()
                checkTrailerInt()
                checkLoadPath()
                If hitFlagCnt = False And hitFlagTrailer = False Then
                    Exit Function
                ElseIf prevPosW > posW Then
                    posW = CDec(prevPosW)

                End If
            End If
            noSurfChecked = noSurfChecked + 1

        Next sDx
        setContainerPosVal()
    End Function

    Public Shared Function setNextTestPosShiftRearward(ByVal xTsub)
        noSurfChecked = 0

        If surfaceArr(xTsub, 12) = "used" And CDec(surfaceArr(xTsub, 19)) > posL And
        CDec(surfaceArr(xTsub, 1)) >= posW And CDec(surfaceArr(xTsub, 1)) < p5y And CDec(surfaceArr(xTsub, 3)) >= posH And CDec(surfaceArr(xTsub, 3)) < p2z And
        CDec(surfaceArr(xTsub, 19)) < minTrailerLength And CDec(surfaceArr(xTsub, 2)) >= minTrailerLength - 96 And surfaceArr(xTsub, 4) <> cntLoading _
        Or surfaceArr(xTsub, 12) = "used" And CDec(surfaceArr(xTsub, 19)) > posL And
        CDec(surfaceArr(xTsub, 26)) > posW And CDec(surfaceArr(xTsub, 26)) <= p5y And CDec(surfaceArr(xTsub, 3)) >= posH And CDec(surfaceArr(xTsub, 3)) < p2z And
        CDec(surfaceArr(xTsub, 19)) < minTrailerLength And CDec(surfaceArr(xTsub, 2)) >= minTrailerLength - 96 And surfaceArr(xTsub, 4) <> cntLoading Then

            If surfaceArr(xTsub, 4) = "21" Then
                Dim debugStop As String = "stop here"
            End If
            Dim tmpPosL As Decimal = posL

            posL = CDec(surfaceArr(xTsub, 19))

            If tmpPosL = surfaceArr(xTsub, 19) Or posL > tmpPosL + nextCntLength Then
                posL = tmpPosL
                Exit Function
            End If

            p2x = CDec(surfaceArr(xTsub, 19))
            p5x = CDec(surfaceArr(xTsub, 19))
            p6x = CDec(surfaceArr(xTsub, 19))

            p3x = posL + nextCntLength
            p4x = posL + nextCntLength
            p7x = posL + nextCntLength
            p8x = posL + nextCntLength




            Exit Function
        End If
        noSurfChecked = noSurfChecked + 1

    End Function

    Public Shared Function setNextTestPosShiftDown(ByVal xTsub)
        If posH > 0 Then
            noSurfChecked = 0


            If surfaceArr(xTsub, 12) = "used" And CDec(surfaceArr(xTsub, 2)) >= posL And
            CDec(surfaceArr(xTsub, 25)) <= p3x And CDec(surfaceArr(xTsub, 1)) <= posW And CDec(surfaceArr(xTsub, 20)) <= p5y And surfaceArr(xTsub, 4) <> cntLoading Then

                Dim cntSurfID As String = surfaceArr(xTsub, 4)
                posH = CDec(surfaceArr(xTsub, 18))
                p3z = CDec(surfaceArr(xTsub, 18))
                p5z = CDec(surfaceArr(xTsub, 18))
                p7z = CDec(surfaceArr(xTsub, 18))

                p2z = posH + nextCntHeight
                p4z = posH + nextCntHeight
                p6z = posH + nextCntHeight
                p8z = posH + nextCntHeight




                Exit Function
            End If
            noSurfChecked = noSurfChecked + 1

        End If
    End Function

    Public Shared Function rotateCnt()
        Dim tmpWidth = nextCntWidth
        Dim tmpLength = nextCntLength
        nextCntWidth = tmpLength
        nextCntLength = tmpWidth
        If nextCntLength = 78 Then
            Dim debugStop As String = "stop"
        End If
    End Function

    Public Shared Function checkTrailerInt()
        If posL < 0 Then
            hitFlagTrailer = True
        End If

        If posL > maxTrailerL Then
            hitFlagTrailer = True
        End If
        If posW > maxTrailerW Then
            hitFlagTrailer = True
        End If
        If posH > maxTrailerH Then
            hitFlagTrailer = True
        End If
        If p8x > maxTrailerL Then
            hitFlagTrailer = True
        End If
        If p8y > maxTrailerW Then
            hitFlagTrailer = True
        End If
        If p8z > maxTrailerH Then
            hitFlagTrailer = True
        End If
        If p2x > maxTrailerL Then
            hitFlagTrailer = True
        End If
        If p2y > maxTrailerW Then
            hitFlagTrailer = True
        End If
        If p2z > maxTrailerH Then
            hitFlagTrailer = True
        End If
        If p3x > maxTrailerL Then
            hitFlagTrailer = True
        End If
        If p3y > maxTrailerW Then
            hitFlagTrailer = True
        End If
        If p3z > maxTrailerH Then
            hitFlagTrailer = True
        End If
        If p4x > maxTrailerL Then
            hitFlagTrailer = True
        End If
        If p4y > maxTrailerW Then
            hitFlagTrailer = True
        End If
        If p4z > maxTrailerH Then
            hitFlagTrailer = True
        End If
        If p5x > maxTrailerL Then
            hitFlagTrailer = True
        End If
        If p5y > maxTrailerW Then
            hitFlagTrailer = True
        End If
        If p5z > maxTrailerH Then
            hitFlagTrailer = True
        End If
        If p6x > maxTrailerL Then
            hitFlagTrailer = True
        End If
        If p6y > maxTrailerW Then
            hitFlagTrailer = True
        End If
        If p6z > maxTrailerH Then
            hitFlagTrailer = True
        End If
        If p7x > maxTrailerL Then
            hitFlagTrailer = True
        End If
        If p7y > maxTrailerW Then
            hitFlagTrailer = True
        End If
        If p7z > maxTrailerH Then
            hitFlagTrailer = True
        End If
    End Function

    Public Shared Function resetPHit()
        p1xHit = False
        p1yHit = False
        p1zHit = False
        p2xHit = False
        p2yHit = False
        p2zHit = False
        p3xHit = False
        p3yHit = False
        p3zHit = False
        p4xHit = False
        p4yHit = False
        p4zHit = False
        p5xHit = False
        p5yHit = False
        p5zHit = False
        p6xHit = False
        p6yHit = False
        p6zHit = False
        p7xHit = False
        p7yHit = False
        p7zHit = False
        p8xHit = False
        p8yHit = False
        p8zHit = False

        tmpp1xHit = False
        tmpp1yHit = False
        tmpp1zHit = False
        tmpp2xHit = False
        tmpp2yHit = False
        tmpp2zHit = False
        tmpp3xHit = False
        tmpp3yHit = False
        tmpp3zHit = False
        tmpp4xHit = False
        tmpp4yHit = False
        tmpp4zHit = False
        tmpp5xHit = False
        tmpp5yHit = False
        tmpp5zHit = False
        tmpp6xHit = False
        tmpp6yHit = False
        tmpp6zHit = False
        tmpp7xHit = False
        tmpp7yHit = False
        tmpp7zHit = False
        tmpp8xHit = False
        tmpp8yHit = False
        tmpp8zHit = False

    End Function

    Public Shared Function checkSurfaceContact()
        contactArea = 0
        If posH = 0 Then
            surfaceContact = True
            contactAreaBurstPsiGood = True
            contactAreaSizeOk = True
        Else

            Dim sGx As Integer = 0

            For sGx = noSurfRemoved To noSurfLoaded - 1
                Dim checkUsed = surfaceArr(sGx, 12)

                Dim surfOnThisLoop = 0

                Dim tmpID = surfaceArr(sGx, 4)
                Dim surfPosL = CDec(surfaceArr(sGx, 2))
                Dim surfP3x = CDec(surfaceArr(sGx, 19))

                If posL >= surfPosL And posL < surfP3x Then

                    Dim surfPosW = CDec(surfaceArr(sGx, 1))
                    Dim surfP5y = CDec(surfaceArr(sGx, 26))
                    Dim surfP2z = CDec(surfaceArr(sGx, 18))
                    If posL >= surfPosL And posL < surfP3x And
                    posW >= surfPosW And posW < surfP5y And
                    posH = surfP2z Then

                        surfOnThisLoop = surfOnThisLoop + 1
                        surfaceContact = True
                        contactArea = contactArea + Math.Abs((Math.Max(posL, surfPosL) - Math.Min(p3x, surfP3x)) * (Math.Min(p5y, surfP5y) - Math.Max(posW, surfPosW)))
                        If contactArea = 0 Then

                            surfaceContact = False
                            GoTo nextCheck

                        End If
                        Dim topCntPsi = nextCntWgt / contactArea
                        tmpMinBurstStrength = CDec(surfaceArr(sGx, 9))
                        If minBurstStrength = 0 And sGx > 0 Then
                            minBurstStrength = tmpMinBurstStrength
                        ElseIf tmpMinBurstStrength < minBurstStrength Then
                            minBurstStrength = tmpMinBurstStrength
                        End If

                        If topCntPsi <= minBurstStrength Then
                            contactAreaBurstPsiGood = True
                        Else
                            contactAreaBurstPsiGood = False
                        End If
                        If contactArea * 1.45 >= cntArea Then
                            contactAreaSizeOk = True
                        Else
                            contactAreaSizeOk = False
                        End If

                    End If


                    tmpID = surfaceArr(sGx, 4)
                    surfPosL = CDec(surfaceArr(sGx, 2))
                    surfP3x = CDec(surfaceArr(sGx, 19))
                    surfPosW = CDec(surfaceArr(sGx, 1))
                    surfP5y = CDec(surfaceArr(sGx, 26))
                    surfP2z = CDec(surfaceArr(sGx, 18))


                    If p3x > surfPosL And p3x <= surfP3x And
                        p3y >= surfPosW And p3y < surfP5y And
                        posH = surfP2z Then

                        If surfOnThisLoop = 0 Then
                            surfOnThisLoop = surfOnThisLoop + 1
                            surfaceContact = True
                            contactArea = contactArea + Math.Abs((Math.Max(posL, surfPosL) - Math.Min(p3x, surfP3x)) * (Math.Min(p5y, surfP5y) - Math.Max(posW, surfPosW)))
                            If contactArea = 0 Then

                                surfaceContact = False
                                GoTo nextCheck
                            End If
                            Dim topCntPsi = nextCntWgt / contactArea
                            tmpMinBurstStrength = CDec(surfaceArr(sGx, 9))
                            If minBurstStrength = 0 And sGx > 0 Then
                                minBurstStrength = tmpMinBurstStrength
                            ElseIf tmpMinBurstStrength < minBurstStrength Then
                                minBurstStrength = tmpMinBurstStrength
                            End If
                            If topCntPsi <= minBurstStrength Then
                                contactAreaBurstPsiGood = True
                            Else
                                contactAreaBurstPsiGood = False
                            End If
                            If contactArea * 1.45 >= cntArea Then
                                contactAreaSizeOk = True
                            Else
                                contactAreaSizeOk = False
                            End If
                        End If

                    End If


                    tmpID = surfaceArr(sGx, 4)
                    surfPosL = CDec(surfaceArr(sGx, 2))
                    surfP3x = CDec(surfaceArr(sGx, 19))
                    Dim surfP5x = CDec(surfaceArr(sGx, 25))
                    surfPosW = CDec(surfaceArr(sGx, 1))
                    surfP5y = CDec(surfaceArr(sGx, 26))
                    surfP2z = CDec(surfaceArr(sGx, 18))

                    If p5x >= surfPosL And p5x < surfP3x And
                    p5y >= surfPosW And p5y < surfP5y And
                    posH = surfP2z Then
                        If surfOnThisLoop = 0 Then
                            surfOnThisLoop = surfOnThisLoop + 1
                            surfaceContact = True
                            contactArea = contactArea + Math.Abs((Math.Max(posL, surfPosL) - Math.Min(p3x, surfP3x)) * (Math.Min(p5y, surfP5y) - Math.Max(posW, surfPosW)))
                            If contactArea = 0 Then

                                surfaceContact = False
                                GoTo nextCheck
                            End If
                            Dim topCntPsi = nextCntWgt / contactArea
                            tmpMinBurstStrength = CDec(surfaceArr(sGx, 9))
                            If minBurstStrength = 0 And sGx > 0 Then
                                minBurstStrength = tmpMinBurstStrength
                            ElseIf tmpMinBurstStrength < minBurstStrength Then
                                minBurstStrength = tmpMinBurstStrength
                            End If

                            If topCntPsi <= minBurstStrength Then
                                contactAreaBurstPsiGood = True
                            Else
                                contactAreaBurstPsiGood = False
                            End If
                            If contactArea * 1.25 >= cntArea Then
                                contactAreaSizeOk = True
                            Else
                                contactAreaSizeOk = False
                            End If
                        End If

                    End If


                    tmpID = surfaceArr(sGx, 4)
                    surfPosL = CDec(surfaceArr(sGx, 2))
                    surfP3x = CDec(surfaceArr(sGx, 19))
                    surfP5x = CDec(surfaceArr(sGx, 25))
                    surfPosW = CDec(surfaceArr(sGx, 1))
                    surfP5y = CDec(surfaceArr(sGx, 26))
                    surfP2z = CDec(surfaceArr(sGx, 18))
                    If p7x >= surfPosL And p7x < surfP3x And p7y >= surfPosW And
                    p7y < surfP5y And posH = surfP2z Then
                        If surfOnThisLoop = 0 Then
                            surfOnThisLoop = surfOnThisLoop + 1
                            surfaceContact = True
                            contactArea = contactArea + Math.Abs((Math.Max(posL, surfPosL) - Math.Min(p3x, surfP3x)) * (Math.Min(p5y, surfP5y) - Math.Max(posW, surfPosW)))
                            If contactArea = 0 Then

                                surfaceContact = False
                                GoTo nextCheck
                            End If
                            Dim topCntPsi = nextCntWgt / contactArea
                            tmpMinBurstStrength = CDec(surfaceArr(sGx, 9))
                            If minBurstStrength = 0 And sGx > 0 Then
                                minBurstStrength = tmpMinBurstStrength
                            ElseIf tmpMinBurstStrength < minBurstStrength Then
                                minBurstStrength = tmpMinBurstStrength
                            End If

                            If topCntPsi <= minBurstStrength Then
                                contactAreaBurstPsiGood = True
                            Else
                                contactAreaBurstPsiGood = False
                            End If
                            If contactArea * 1.45 >= cntArea Then
                                contactAreaSizeOk = True
                            Else
                                contactAreaSizeOk = False
                            End If
                        End If

                    End If










nextCheck:
                End If

            Next sGx

        End If
    End Function

    '*****************************************************************************************************************************************

    Public Shared Function checkVerticalContact()
        verticalContact = False
        If posH > 0 Then
            Exit Function
        Else

            Dim sGx As Integer = 0
            For sGx = noSurfRemoved To noSurfLoaded - 1
                Dim checkUsed = surfaceArr(sGx, 12)

                If CDec(surfaceArr(sGx, 19)) = posL Then

                    If posL = CDec(surfaceArr(sGx, 19)) And posW >= CDec(surfaceArr(sGx, 1)) And posW < CDec(surfaceArr(sGx, 26)) And
                    posH >= CDec(surfaceArr(sGx, 3)) And posH <= CDec(surfaceArr(sGx, 18)) Then

                        verticalContact = True
                    End If



                    If posL = CDec(surfaceArr(sGx, 19)) And p5y >= CDec(surfaceArr(sGx, 1)) And p5y <= CDec(surfaceArr(sGx, 26)) And
                    p5z >= CDec(surfaceArr(sGx, 3)) And p5z <= CDec(surfaceArr(sGx, 18)) Then

                        verticalContact = True
                    End If


                    If posL = CDec(surfaceArr(sGx, 19)) And p6y >= CDec(surfaceArr(sGx, 1)) And p6y <= CDec(surfaceArr(sGx, 26)) And
                    p6z >= CDec(surfaceArr(sGx, 3)) And p6z <= CDec(surfaceArr(sGx, 18)) Then

                        verticalContact = True
                    End If


                    If posL = CDec(surfaceArr(sGx, 19)) And p2y >= CDec(surfaceArr(sGx, 1)) And p2y < CDec(surfaceArr(sGx, 26)) And
                    p2z > CDec(surfaceArr(sGx, 3)) And p2z <= CDec(surfaceArr(sGx, 18)) Then

                        verticalContact = True
                    End If


                End If

            Next sGx

        End If
    End Function

    '*****************************************************************************************************************************************

    Public Shared Function checkVerticalContactRight()
        verticalContactRight = False
        If posH > 0 Then
            Exit Function
        Else

            Dim sGx As Integer = 0
            For sGx = noSurfRemoved To noSurfLoaded - 1
                Dim checkUsed = surfaceArr(sGx, 12)

                If CDec(surfaceArr(sGx, 26)) = posW Then

                    If posW = CDec(surfaceArr(sGx, 26)) And posL >= CDec(surfaceArr(sGx, 2)) And posL < CDec(surfaceArr(sGx, 19)) And
                    posH >= CDec(surfaceArr(sGx, 3)) And posH < CDec(surfaceArr(sGx, 18)) Then

                        verticalContactRight = True
                    End If



                    If posW = CDec(surfaceArr(sGx, 26)) And p3x >= CDec(surfaceArr(sGx, 2)) And p3x <= CDec(surfaceArr(sGx, 19)) And
                    p5z >= CDec(surfaceArr(sGx, 3)) And p5z < CDec(surfaceArr(sGx, 18)) Then

                        verticalContactRight = True
                    End If



                    If posW = CDec(surfaceArr(sGx, 26)) And p4x >= CDec(surfaceArr(sGx, 2)) And p4x <= CDec(surfaceArr(sGx, 19)) And
                    p6z >= CDec(surfaceArr(sGx, 3)) And p6z <= CDec(surfaceArr(sGx, 18)) Then

                        verticalContactRight = True
                    End If


                    If posW = CDec(surfaceArr(sGx, 26)) And p2x >= CDec(surfaceArr(sGx, 2)) And p2x < CDec(surfaceArr(sGx, 19)) And
                    p2z > CDec(surfaceArr(sGx, 3)) And p2z <= CDec(surfaceArr(sGx, 18)) Then

                        verticalContactRight = True
                    End If

                    If posW = CDec(surfaceArr(sGx, 26)) And posL < CDec(surfaceArr(sGx, 2)) And p3x > CDec(surfaceArr(sGx, 19)) And
                    p2z > CDec(surfaceArr(sGx, 3)) And posH <= CDec(surfaceArr(sGx, 18)) Then
                        verticalContactRight = True
                    End If


                End If

            Next sGx

        End If
    End Function
    Public Shared Function checkLoadPath()
        Dim sDx = 0


        For sDx = noSurfRemoved To noSurfLoaded - 1

            Dim tmpPosW As Decimal = CDec((surfaceArr(sDx, 1)))
            Dim tmpPosL As Decimal = CDec((surfaceArr(sDx, 2)))
            Dim tmpPosH As Decimal = CDec(surfaceArr(sDx, 3))
            tmpP8x = CDec(surfaceArr(sDx, 13))

            Dim tmpP8y As Decimal = CDec(surfaceArr(sDx, 14))
            Dim tmpP8z As Decimal = CDec(surfaceArr(sDx, 15))
            Dim tmpP2x As Decimal = CDec(surfaceArr(sDx, 16))
            Dim tmpP2y As Decimal = CDec(surfaceArr(sDx, 17))
            Dim tmpP2z As Decimal = CDec(surfaceArr(sDx, 18))
            Dim tmpP3x As Decimal = CDec(surfaceArr(sDx, 19))
            Dim tmpP3y As Decimal = CDec(surfaceArr(sDx, 20))
            Dim tmpP3z As Decimal = CDec(surfaceArr(sDx, 21))
            Dim tmpP4x As Decimal = CDec(surfaceArr(sDx, 22))
            Dim tmpP4y As Decimal = CDec(surfaceArr(sDx, 23))
            Dim tmpP4z As Decimal = CDec(surfaceArr(sDx, 24))
            Dim tmpP5x As Decimal = CDec(surfaceArr(sDx, 25))
            Dim tmpP5y As Decimal = CDec(surfaceArr(sDx, 26))
            Dim tmpP5z As Decimal = CDec(surfaceArr(sDx, 27))
            Dim tmpP6x As Decimal = CDec(surfaceArr(sDx, 28))
            Dim tmpP6y As Decimal = CDec(surfaceArr(sDx, 29))
            Dim tmpP6z As Decimal = CDec(surfaceArr(sDx, 30))
            Dim tmpP7x As Decimal = CDec(surfaceArr(sDx, 31))
            Dim tmpP7y As Decimal = CDec(surfaceArr(sDx, 32))
            Dim tmpP7z As Decimal = CDec(surfaceArr(sDx, 33))




            If (tmpP2z > posH And tmpPosW <= p8y And tmpP8y > posW And tmpPosL >= p3x) Then
                hitFlagCnt = True
            End If

            If tmpP2z > posH And tmpPosW < posW And tmpP5y > p5y And tmpPosL >= p3x Then
                hitFlagCnt = True
            End If


        Next sDx
    End Function

    Public Shared Function moveToTrailerWall()
        Dim origPosW As Decimal = posW
        posW = 0
        p3y = 0
        p2y = 0
        p4y = 0

        p5y = nextCntWidth
        p6y = nextCntWidth
        p7y = nextCntWidth
        p8y = nextCntWidth

        checkContainerInt()
        If hitFlagCnt = True Then
            posW = origPosW
            p3y = posW
            p2y = posW
            p4y = posW

            p5y = posW + nextCntWidth
            p6y = posW + nextCntWidth
            p7y = posW + nextCntWidth
            p8y = posW + nextCntWidth

        End If


    End Function
    Public Shared Function calcaxleweight_2()
        driveAxleWgt = driveAxleNetLoad
        rearAxleWgt = rearAxleNetLoad
        Dim textWeightDrive
        Dim textWeightRear
        Dim loadedPosL As Decimal

        If txtInit = 0 Then
            txtInit = txtInit + 1
        End If

        Dim x As Integer

        For x = 0 To noCntLoaded - 1
            If surfaceArr(x, 12) = "used" Then

                loadedPosL = CDec(surfaceArr(x, 2))


                Dim loadedCntWgt As Decimal = CDec(loadArrC(x, 8))

                If loadedPosL <= kingPinOverHang Then
                    driveAxleWgt = driveAxleWgt + (loadedCntWgt)
                    System.Web.HttpContext.Current.Session("driveAxleWgt") = driveAxleWgt
                Else
                    driveAxleWgt = Math.Round(driveAxleWgt + ((1 - (loadedPosL / minTrailerLength)) * (loadedCntWgt)))
                    System.Web.HttpContext.Current.Session("driveAxleWgt") = driveAxleWgt
                    rearAxleWgt = Math.Round(rearAxleWgt + ((loadedPosL / minTrailerLength) * (loadedCntWgt)))
                    System.Web.HttpContext.Current.Session("rearAxleWgt") = rearAxleWgt
                End If

                If driveAxleWgt + rearAxleWgt < maxTrailerWgt Then

                    If driveAxleWgt <= 20000 Then
                        singleDriveAxle = True
                    Else
                        singleDriveAxle = False
                    End If

                    If rearAxleWgt <= 20000 Then
                        singleRearAxle = True
                    Else
                        singleRearAxle = False
                    End If

                    Dim driveAxleWeightTxt As String = "Drive Axle Weight: " + CStr(driveAxleWgt) + " LBS."
                    Dim rearAxleWeightTxt As String = "Rear Axle Weight: " + CStr(rearAxleWgt) + " LBS."

                    If singleDriveAxle = True Then
                        driveAxleNoTxt = "Single Drive Axle Required Min."
                        System.Web.HttpContext.Current.Session("driveAxleNoTxt") = driveAxleNoTxt
                    Else
                        driveAxleNoTxt = "Tandem Drive Axle Required"
                        System.Web.HttpContext.Current.Session("driveAxleNoTxt") = driveAxleNoTxt
                    End If

                    If singleRearAxle = True Then
                        rearAxleNoTxt = "Single Trailer Axle Required Min."
                        System.Web.HttpContext.Current.Session("rearAxleNoTxt") = rearAxleNoTxt
                    Else
                        rearAxleNoTxt = "Tandem Trailer Axle Required"
                        System.Web.HttpContext.Current.Session("rearAxleNoTxt") = rearAxleNoTxt
                    End If


                Else
                    hitFlagCnt = True
                    hitFlagTrailer = True
                End If

            End If
        Next x
    End Function

    Public Shared Function updateUnUsedContainers(ByVal varSessionID As String, ByVal varShipmentID As String)
        Dim cnStr As String = ConfigurationManager.ConnectionStrings("MyGlobalString").ConnectionString
        Dim connection As SqlConnection = New SqlConnection()
        connection.ConnectionString = cnStr

        Dim connection2 As SqlConnection = New SqlConnection()
        connection2.ConnectionString = cnStr
        Dim command As SqlCommand = New SqlCommand("getTmpLoadDataUnUsed", connection)
        Dim command2 As SqlCommand = New SqlCommand("updateTblPalletDataUnUsed", connection2)

        command.CommandType = CommandType.StoredProcedure
        command.Parameters.Add("@sessionID", varShipmentID)
        command.Parameters.Add("@shipmentID", varShipmentID)
        command.Parameters.Add("@flag", vbNull)

        command2.CommandType = CommandType.StoredProcedure

        connection.Open()
        connection2.Open()
        Dim cntReader As SqlDataReader = command.ExecuteReader

        While cntReader.Read
            Dim recordID As String = cntReader("recordID")
            command2.Parameters.Clear()
            command2.Parameters.Add("@recordID", recordID)
            command2.ExecuteNonQuery()
        End While
        connection.Close()
        connection2.Close()

    End Function

    Public Shared Function updateUsedContainers(ByVal varSessionID As String, ByVal varShipmentID As Integer)
        Dim cnstr As String = ConfigurationManager.ConnectionStrings("MyGlobalString").ConnectionString
        Dim connection As SqlConnection = New SqlConnection()
        connection.ConnectionString = cnstr

        'Dim connection2 As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("MyConnectionString"))
        Dim connection2 As SqlConnection = New SqlConnection()
        connection2.ConnectionString = cnstr

        Dim command As SqlCommand = New SqlCommand("getTmpLoadDataUsed", connection)
        Dim command2 As SqlCommand = New SqlCommand("updateTblPalletDataUsed", connection2)

        command.CommandType = CommandType.StoredProcedure
        command.Parameters.Add("@sessionID", varSessionID)
        command.Parameters.Add("@shipmentID", varShipmentID)
        command.Parameters.Add("@flag", vbNull)

        command2.CommandType = CommandType.StoredProcedure


        connection.Open()
        connection2.Open()
        Dim cntReader As SqlDataReader = command.ExecuteReader

        While cntReader.Read
            Dim recordID As String = cntReader("recordID")
            Dim palletLength As Decimal = cntReader("palletLength")
            Dim palletWidth As Decimal = cntReader("palletWidth")
            Dim cPosL As Decimal = cntReader("cPosL")
            Dim cPosW As Decimal = cntReader("cPosW")
            Dim cPosH As Decimal = cntReader("cposH")
            Dim area As Decimal = cntReader("area")

            command2.Parameters.Clear()
            command2.Parameters.Add("@recordID", recordID)
            command2.Parameters.Add("@palletLength", palletLength)
            command2.Parameters.Add("@palletwidth", palletWidth)
            command2.Parameters.Add("@cPosL", cPosL)
            command2.Parameters.Add("@cPosW", cPosW)
            command2.Parameters.Add("@cPosH", cPosH)
            command2.Parameters.Add("@shipmentID", varShipmentID)
            command2.Parameters.Add("@sessionID", varSessionID)
            command2.Parameters.Add("@area", area)


            command2.ExecuteNonQuery()
        End While

        connection.Close()
        connection2.Close()

        'command.CommandType = CommandType.StoredProcedure
        'command.Parameters.Add("@sessionID", varShipmentID)
        'command.Parameters.Add("@shipmentID", varShipmentID)
        'command.Parameters.Add("@flag", vbNull)

        'command2.CommandType = CommandType.StoredProcedure


        'connection.Open()
        'connection2.Open()
        'Dim cntReader As SqlDataReader = command.ExecuteReader

        'While cntReader.Read
        '    Dim recordID As String = cntReader("recordID")
        '    Dim palletLength As Decimal = cntReader("palletLength")
        '    Dim palletWidth As Decimal = cntReader("palletWidth")
        '    Dim cPosL As Decimal = cntReader("cPosL")
        '    Dim cPosW As Decimal = cntReader("cPosW")
        '    Dim cPosH As Decimal = cntReader("cposH")
        '    Dim area As Decimal = cntReader("area")

        '    command2.Parameters.Clear()
        '    command2.Parameters.Add("@recordID", recordID)
        '    command2.Parameters.Add("@palletLength", palletLength)
        '    command2.Parameters.Add("@palletwidth", palletWidth)
        '    command2.Parameters.Add("@cPosL", cPosL)
        '    command2.Parameters.Add("@cPosW", cPosW)
        '    command2.Parameters.Add("@cPosH", cPosH)
        '    command2.Parameters.Add("@shipmentID", varShipmentID)
        '    command2.Parameters.Add("@sessionID", varShipmentID)
        '    command2.Parameters.Add("@area", area)


        '    command2.ExecuteNonQuery()
        'End While

        'connection.Close()
        'connection2.Close()

    End Function

    Public Shared Function clearTmpLoadData(ByVal varsessionID As String, ByVal varShipmentID As String)

        Dim cmd As New SqlCommand
        Dim db As New CDatabase
        Dim dsShipmentReport As New DataSet

        cmd.CommandTimeout = 50000
        cmd.Parameters.Add(New SqlParameter("@sessionID", varShipmentID))
        cmd.Parameters.Add(New SqlParameter("@shipmentID", varShipmentID))

        dsShipmentReport = db.FillDataSql("clearTmpLoadData", cmd)


        'Dim connection As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.AppSettings("connectionstring"))
        'Dim command As SqlCommand = New SqlCommand("clearTmpLoadData", connection)
        'command.CommandType = CommandType.StoredProcedure
        'command.Parameters.AddWithValue("@sessionID", varShipmentID)
        'command.Parameters.AddWithValue("@shipmentID", varShipmentID)
        'connection.Open()
        'command.ExecuteNonQuery()
        'connection.Close()
    End Function

    Public Shared Function findVertSurf()
        Dim sDx As Integer = 0

        Dim vSurfFound = False
        noSurfChecked = 0
        Dim tmpTestPosL = posL

        For sDx = noSurfRemoved To noSurfLoaded


            resetHitFlags()
            vSurfFound = False


            If surfaceArr(sDx, 12) = "used" And CDec(surfaceArr(sDx, 19)) < tmpTestPosL And
            CDec(surfaceArr(sDx, 1)) < posW And CDec(surfaceArr(sDx, 26)) > p5y And CDec(surfaceArr(sDx, 3)) <= p2z And
            CDec(surfaceArr(sDx, 18)) > posH And CDec(surfaceArr(sDx, 19)) >= minTrailerLength - 96 Then

                vSurfFound = True
            End If

            If surfaceArr(sDx, 12) = "used" And CDec(surfaceArr(sDx, 19)) < tmpTestPosL And CDec(surfaceArr(sDx, 1)) >= posW And
            CDec(surfaceArr(sDx, 1)) < p5y And CDec(surfaceArr(sDx, 3)) <= p2z And CDec(surfaceArr(sDx, 18)) > posH And
            CDec(surfaceArr(sDx, 19)) >= minTrailerLength - 96 Then

                vSurfFound = True
            End If

            If surfaceArr(sDx, 12) = "used" And CDec(surfaceArr(sDx, 19)) < tmpTestPosL And CDec(surfaceArr(sDx, 26)) >= posW And
            CDec(surfaceArr(sDx, 26)) < p5y And CDec(surfaceArr(sDx, 3)) <= p2z And CDec(surfaceArr(sDx, 18)) > posH And
            CDec(surfaceArr(sDx, 19)) >= minTrailerLength - 96 Then

                vSurfFound = True
            End If


            If surfaceArr(sDx, 12) = "used" And CDec(surfaceArr(sDx, 19)) < tmpTestPosL And CDec(surfaceArr(sDx, 26)) >= posW And
            CDec(surfaceArr(sDx, 26)) < p5y And CDec(surfaceArr(sDx, 3)) <= p2z And CDec(surfaceArr(sDx, 18)) <= posH And
            CDec(surfaceArr(sDx, 19)) >= minTrailerLength - 96 Then

                vSurfFound = True
            End If

            If surfaceArr(sDx, 12) = "used" And CDec(surfaceArr(sDx, 19)) < tmpTestPosL And CDec(surfaceArr(sDx, 1)) < posW And
            CDec(surfaceArr(sDx, 26)) > posW And CDec(surfaceArr(sDx, 3)) <= p2z And CDec(surfaceArr(sDx, 18)) > posH And
CDec(surfaceArr(sDx, 19)) >= minTrailerLength - 96 Then
                vSurfFound = True
            End If


            If vSurfFound = True Then

                Dim origPosL As Decimal = posL
                Dim origp5x As Decimal = p5x
                Dim origp2x As Decimal = p2x
                Dim origp6x As Decimal = p6x
                Dim origp3x As Decimal = p3x
                Dim origp4x As Decimal = p4x
                Dim origp7x As Decimal = p7x
                Dim origp8x As Decimal = p8x

                posL = CDec(surfaceArr(sDx, 19))
                p5x = CDec(surfaceArr(sDx, 19))
                p2x = CDec(surfaceArr(sDx, 19))
                p6x = CDec(surfaceArr(sDx, 19))

                p3x = CDec(surfaceArr(sDx, 19)) + nextCntLength
                p4x = CDec(surfaceArr(sDx, 19)) + nextCntLength
                p7x = CDec(surfaceArr(sDx, 19)) + nextCntLength
                p8x = CDec(surfaceArr(sDx, 19)) + nextCntLength

                Dim prevPosL = posL

                checkContainerInt()
                checkTrailerInt()
                checkLoadPath()
                If hitFlagCnt = False And hitFlagTrailer = False Then
                    Exit Function
                ElseIf prevPosL > posL Then
                    posL = CDec(prevPosL)

                End If

                If hitFlagCnt = True Or hitFlagTrailer = True Then
                    posL = origPosL
                    p5x = origp5x
                    p2x = origp2x
                    p6x = origp6x
                    p3x = origp3x
                    p4x = origp4x
                    p7x = origp7x
                    p8x = origp8x
                End If
            End If
            noSurfChecked = noSurfChecked + 1

        Next sDx
    End Function

    Public Shared Function loadSurface()

        If nextCntLength > nextCntWidth Then
            Dim debugVar As String = "stop  here"
        End If

        surfaceArr(noCntLoaded - 1, 0) = trailerRow

        surfaceArr(noCntLoaded - 1, 1) = posW

        surfaceArr(noCntLoaded - 1, 2) = posL

        surfaceArr(noCntLoaded - 1, 3) = posH

        surfaceArr(noCntLoaded - 1, 4) = nextCntID

        surfaceArr(noCntLoaded - 1, 5) = nextCntLength

        surfaceArr(noCntLoaded - 1, 6) = nextCntWidth

        surfaceArr(noCntLoaded - 1, 7) = nextCntHeight

        surfaceArr(noCntLoaded - 1, 8) = nextCntWgt


        surfaceArr(noCntLoaded - 1, 9) = nextCntBurstWgt / (nextCntWidth * nextCntLength)

        surfaceArr(noCntLoaded - 1, 10) = heightPln

        surfaceArr(noCntLoaded - 1, 11) = cntArea

        surfaceArr(noCntLoaded - 1, 12) = "not used"

    End Function
    Protected Overrides Sub Finalize()
        MyBase.Finalize()
    End Sub

End Class
