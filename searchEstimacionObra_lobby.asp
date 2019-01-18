<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
cr=request("cr")
elemento=request("sap")
'cr="0008"
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr

'seleccionamos la consulta segun el parametro de entrada
	sql="SELECT  * from nuevoCosto_estimadoObra_lobby  where cr = '"& cr &"' and clave_sap_concurso = '"& elemento &"'"

'ejecutamos la consulta
rs.open sql,conn
'si la consula trajo registros
if rs.eof then
'escribimos los encabezados de la tabla
response.write("no")
'mientras el RecorSet no llegue al final se recorre
else
response.write("yes")
end if
'cerramos el RecordSet y Cerramos la conexion
rs.close
conn.close 
set rs=nothing
set conn=nothing
%>


