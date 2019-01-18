<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
cr=request("cr")
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr

'seleccionamos la consulta segun el parametro de entrada
	sql="select * from tseguimiento_lobby where cr='" & cr & "'"

'ejecutamos la consulta
rs.open sql,conn
'si la consula trajo registros
if rs.eof then
'escribimos los encabezados de la tabla
response.write("NO")
'mientras el RecorSet no llegue al final se recorre
else
'dependiendo del parametro de entrada se le llama una funcion que te redirige a la pagina de detalle
	session("cr")=rs("cr")
	response.write(rs("cr"))
'seguimos al siguiente registro

'cerramos la tabla y damos un salto de linea	

end if
'cerramos el RecordSet y Cerramos la conexion
rs.close
conn.close 
set rs=nothing
set conn=nothing
%>


