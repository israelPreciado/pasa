<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
On Error Resume Next
cr=request("cr")
campo=request("campo")

valor=""
regresa=""
Set conn51 = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
conn51.Open connstr	

sql51="select " & campo &" as campo from tseguimiento where cr='" & cr & "';"

'ejecutamos la consulta
rs.open sql51,conn51

'validamos si la insercion fue satisfactoria y damos respuesta
if rs.eof then
	regresa="0"
	rs.close
	conn51.close 
	set conn51=nothing
else
	regresa=rs("campo")
	rs.close
	conn51.close 
	set conn51=nothing
end if


Set conn52 = Server.CreateObject("ADODB.Connection")
Conn52.Open connstr

if regresa<>"NA" then
'seleccionamos la consulta segun el parametro de entrada
sql52="update tseguimiento set " & campo &"='NA' where cr='" & cr & "';"
else
sql52="update tseguimiento set " & campo &"='0' where cr='" & cr & "';"
end if
'ejecutamos la consulta
conn52.execute sql52
'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn52.close 
	set conn52=nothing
 	response.write("err")
else 
	conn52.close 
	set conn51=nothing
	if regresa<>"NA" then
	response.write("NA")
	else
	response.write("0")
	end if
end if
	
%>
