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
	sql="select pedimento from cat_pedimentos where cr='" & cr & "'"

'ejecutamos la consulta
rs.open sql,conn
'si la consula trajo registros
if rs.eof then
'escribimos los encabezados de la tabla
response.write("NoPrimVisitaReg")
'mientras el RecorSet no llegue al final se recorre
else
		response.write("PrimVisitaReg")
end if
'cerramos el RecordSet y Cerramos la conexion
rs.close
conn.close 
set rs=nothing
set conn=nothing

%>


