<%

Dim cont
Dim CheckQueryString
CheckQueryString = Request.QueryString("shipmentID")
QStringSID = Request.QueryString("shipmentID")
cont = 0
Set conn = Server.CreateObject("ADODB.Connection")
conn.open "PROVIDER=SQLOLEDB;Persist Security Info=True;UID=AshVenture91;Password=RichardTatiMia95;Initial Catalog=db_Clients_Alpha;Data Source=192.168.1.104"

Set rs = Server.CreateObject("ADODB.Recordset")
SQL="exec spPalletgetDataSet " & CheckQueryString

rs.open SQL, conn



While Not rs.EOF

response.write("shipmentID"&cont&"="&rs("shipmentID") & "&" & "shipmentStopNumber"&cont&"="&rs("shipmentStopNumber")& "&" & "palletLength"&cont&"="&rs("palletLength")& "&" & "palletWidth"&cont&"="&rs("palletWidth")& "&" & "palletHeight"&cont&"="&rs("palletHeight")& "&" & "palletWeight"&cont&"="&rs("palletWeight") & "&" & "typeOfContainer"&cont&"="&rs("typeOfContainer")& "&" &"burstWeight"&cont&"="&rs("burstWeight") & "&" & "sessionID"&cont&"="&rs("sessionID")& "&" &"containerID"&cont&"="&rs("containerID")& "&" &"posL"&cont&"="&rs("cPosL")& "&" &"posW"&cont&"="&rs("cPosW")& "&" &"posH"&cont&"="&rs("cPosH")&"&")
cont=cont+1
rs.MoveNext
Wend

Response.Write "cant="&cont


rs.close
conn.close
Set rs = Nothing
Set conn = Nothing
%>
