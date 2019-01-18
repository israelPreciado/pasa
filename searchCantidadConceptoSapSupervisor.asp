<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
id=request("id")
'cr="0008"
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr

'seleccionamos la consulta segun el parametro de entrada
	sql="select cantidad from nuevocosto_estimadoObra where id='" & id & "'"

'ejecutamos la consulta
rs.open sql,conn
'si la consula trajo registros
if rs.eof then
'escribimos los encabezados de la tabla
response.write("<p>0</p>")
'mientras el RecorSet no llegue al final se recorre
else
response.write("<p>" & rs("cantidad") & "</p>" )
end if
'cerramos el RecordSet y Cerramos la conexion
rs.close
conn.close 
set rs=nothing
set conn=nothing


%>


