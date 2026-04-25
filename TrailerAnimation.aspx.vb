Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Text
Imports System.Web.Script.Serialization

Partial Class LoadConsolidation_TrailerAnimation
    Inherits System.Web.UI.Page

    ''' <summary>
    ''' When session is lost, redirect the top window (parent page), not only this iframe.
    ''' </summary>
    Private Sub RedirectToMainLoginEscapeIframe()
        Dim url As String = ResolveUrl("~/Common/Login.aspx")
        Dim jsLiteral As String = "'" & url.Replace("\", "\\").Replace("'", "\'") & "'"

        Response.Clear()
        Response.StatusCode = 200
        Response.ContentType = "text/html; charset=utf-8"
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.Write("<!DOCTYPE html><html><head><meta charset=""utf-8""/><title></title></head><body>" &
            "<script type=""text/javascript"">" &
            "try{window.top.location.replace(" & jsLiteral & ");}catch(e1){" &
            "try{window.parent.location.replace(" & jsLiteral & ");}catch(e2){window.location.replace(" & jsLiteral & ");}}" &
            "</script></body></html>")
        Context.ApplicationInstance.CompleteRequest()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session.IsNewSession Then
            RedirectToMainLoginEscapeIframe()
            Exit Sub
        End If

        Try
            Dim p001 As String = Request.QueryString("P001")
            Dim p002 As String = Request.QueryString("P002")

            If String.IsNullOrEmpty(p002) Then
                litContent.Text = "<div class='no-data'>Missing required parameter: ConsolidationID.</div>"
                Exit Sub
            End If

            If String.IsNullOrEmpty(p001) Then
                p001 = ""
            End If

            'spanInfo.InnerText = "Consolidation: " & p002

            Dim connStr As String = ConfigurationManager.ConnectionStrings("ConStr").ConnectionString
            Using connection As New SqlConnection(connStr)
                Using command As New SqlCommand()
                    command.Connection = connection
                    command.CommandText = "sp000001075733398"
                    command.CommandType = CommandType.StoredProcedure
                    command.CommandTimeout = 50000
                    command.Parameters.AddWithValue("@P001", p001)
                    command.Parameters.AddWithValue("@P002", Convert.ToInt64(p002))

                    connection.Open()

                    Dim da As New SqlDataAdapter(command)
                    Dim ds As New DataSet()
                    da.Fill(ds)

                    If ds.Tables.Count > 0 AndAlso ds.Tables(0).Rows.Count > 0 Then
                        Dim dt As DataTable = ds.Tables(0)

                        ' Check if this is box coordinate data (PosL, PosW, PosH, Length, Width, Height)
                        If dt.Columns.Contains("PosL") AndAlso dt.Columns.Contains("Length") Then
                            hdnBoxData.Value = ConvertToJson(dt)
                        Else
                            ' Fallback: render as table
                            litContent.Text = RenderDataTable(dt)
                        End If
                    Else
                        litContent.Text = "<div class='no-data'>No animation data available for this consolidation.</div>"
                    End If
                End Using
            End Using

        Catch ex As Exception
            litContent.Text = "<div class='error-msg'>An error occurred: " & Server.HtmlEncode(ex.Message) & "</div>"
        End Try
    End Sub

    Private Function ConvertToJson(ByVal dt As DataTable) As String
        Dim boxes As New List(Of Object)()
        For Each row As DataRow In dt.Rows
            Dim box As New Dictionary(Of String, Object)()
            box("PosL") = If(row("PosL") Is DBNull.Value, 0, Convert.ToDouble(row("PosL")))
            box("PosW") = If(row("PosW") Is DBNull.Value, 0, Convert.ToDouble(row("PosW")))
            box("PosH") = If(row("PosH") Is DBNull.Value, 0, Convert.ToDouble(row("PosH")))
            box("Length") = If(row("Length") Is DBNull.Value, 0, Convert.ToDouble(row("Length")))
            box("Width") = If(row("Width") Is DBNull.Value, 0, Convert.ToDouble(row("Width")))
            box("Height") = If(row("Height") Is DBNull.Value, 0, Convert.ToDouble(row("Height")))
            If dt.Columns.Contains("COL_1205559151") AndAlso row("COL_1205559151") IsNot DBNull.Value Then
                Dim pk As String = row("COL_1205559151").ToString().Trim().ToUpperInvariant()
                If pk.Length > 0 AndAlso pk.Chars(0) = "P"c Then
                    box("PackKind") = "P"
                Else
                    box("PackKind") = "C"
                End If
            Else
                box("PackKind") = "C"
            End If
            boxes.Add(box)
        Next

        Dim serializer As New JavaScriptSerializer()
        Return serializer.Serialize(boxes)
    End Function

    Private Function RenderDataTable(ByVal dt As DataTable) As String
        Dim sb As New StringBuilder()
        sb.Append("<table class='animation-table'>")
        sb.Append("<thead><tr>")
        For Each col As DataColumn In dt.Columns
            sb.Append("<th>")
            sb.Append(Server.HtmlEncode(col.ColumnName))
            sb.Append("</th>")
        Next
        sb.Append("</tr></thead><tbody>")
        For Each row As DataRow In dt.Rows
            sb.Append("<tr>")
            For Each col As DataColumn In dt.Columns
                sb.Append("<td>")
                If row(col) IsNot DBNull.Value Then
                    sb.Append(Server.HtmlEncode(row(col).ToString()))
                End If
                sb.Append("</td>")
            Next
            sb.Append("</tr>")
        Next
        sb.Append("</tbody></table>")
        Return sb.ToString()
    End Function
End Class
