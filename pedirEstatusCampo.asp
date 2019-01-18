<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
On Error Resume Next
cr=request("cr")
campo=request("campo")

Set conn51 = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
conn51.Open connstr


'seleccionamos la consulta segun el parametro de entrada
	

sql51="select " & campo &" as campo from tseguimiento where cr='" & cr & "';"

'ejecutamos la consulta
rs.open sql51,conn51

'validamos si la insercion fue satisfactoria y damos respuesta
if rs.eof then
regresa="0"
	rs.close
	conn51.close 
	set conn51=nothing
	response.write(regresa)
	else
	regresa=rs("campo")
	rs.close
	conn51.close 
	set conn51=nothing
	response.write(regresa)
end if
	
%>

