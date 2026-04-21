Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Partial Class LoadConsolidation_ModelHandler
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' Skip session check — the GLTFLoader XHR shares the same session cookie
        ' from the parent iframe. If no valid session, the DB query will still work
        ' since we use Integrated Security.

        Dim modelName As String = Request.QueryString("name")
        If String.IsNullOrEmpty(modelName) Then
            Response.StatusCode = 400
            Response.ContentType = "text/plain"
            Response.Write("Missing model name parameter")
            HttpContext.Current.ApplicationInstance.CompleteRequest()
            Return
        End If

        ' Sanitize — only allow alphanumeric model names
        For Each c As Char In modelName
            If Not Char.IsLetterOrDigit(c) Then
                Response.StatusCode = 400
                Response.ContentType = "text/plain"
                Response.Write("Invalid model name")
                HttpContext.Current.ApplicationInstance.CompleteRequest()
                Return
            End If
        Next

        Try
            Dim connStr As String = ConfigurationManager.ConnectionStrings("ConStr").ConnectionString
            Using connection As New SqlConnection(connStr)
                Using command As New SqlCommand()
                    command.Connection = connection
                    command.CommandText = "SELECT ContentType, FileSize, FileData FROM TrailerAnimation3DModels WHERE ModelName = @name"
                    command.Parameters.AddWithValue("@name", modelName)
                    command.CommandTimeout = 120

                    connection.Open()
                    Dim reader As SqlDataReader = command.ExecuteReader(CommandBehavior.SequentialAccess)

                    If reader.Read() Then
                        Dim contentType As String = reader.GetString(0)
                        Dim fileSize As Long = reader.GetInt64(1)

                        Response.Clear()
                        Response.Buffer = False
                        Response.ContentType = contentType
                        Response.AddHeader("Content-Length", fileSize.ToString())
                        Response.AddHeader("Cache-Control", "public, max-age=86400")
                        Response.AddHeader("Access-Control-Allow-Origin", "*")

                        ' Stream the binary data
                        Dim bufferSize As Integer = 65536
                        Dim buffer(bufferSize - 1) As Byte
                        Dim bytesRead As Long = 0
                        Dim dataIndex As Long = 0

                        Do
                            bytesRead = reader.GetBytes(2, dataIndex, buffer, 0, bufferSize)
                            If bytesRead > 0 Then
                                Response.OutputStream.Write(buffer, 0, CInt(bytesRead))
                                Response.OutputStream.Flush()
                                dataIndex += bytesRead
                            End If
                        Loop While bytesRead > 0

                        HttpContext.Current.ApplicationInstance.CompleteRequest()
                    Else
                        Response.StatusCode = 404
                        Response.ContentType = "text/plain"
                        Response.Write("Model not found: " & modelName)
                        HttpContext.Current.ApplicationInstance.CompleteRequest()
                    End If

                    reader.Close()
                End Using
            End Using
        Catch ex As Exception
            If Not Response.IsClientConnected Then Return
            Response.StatusCode = 500
            Response.ContentType = "text/plain"
            Response.Write("Error loading model")
            HttpContext.Current.ApplicationInstance.CompleteRequest()
        End Try
    End Sub
End Class
