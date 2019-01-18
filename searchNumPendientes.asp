<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
cr=request("cr")
'componente=request("id")
'cr="0008"
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr

'seleccionamos la consulta segun el parametro de entrada
	sql="select count(*) as pendientes from pendientes where cr ='" & cr &"' and id_estatus=1"

'ejecutamos la consulta
rs.open sql,conn
'si la consula trajo registros
if rs.eof then
'escribimos los encabezados de la tabla
response.write(0)
'mientras el RecorSet no llegue al final se recorre
else

		response.write(rs("pendientes"))

end if
'cerramos el RecordSet y Cerramos la conexion
rs.close
conn.close 
set rs=nothing
set conn=nothing

%>