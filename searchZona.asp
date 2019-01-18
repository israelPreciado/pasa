
<!--#include file="funcion/funcion.inc"-->
<%
response.expires=-1

 cr=request("cr")
 id_zona=request("id_zona")


Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr

'seleccionamos la consulta segun el parametro de entrada
	sql="SELECT a.id_zona FROM ctrl_fotografias a LEFT JOIN cat_zonafotografica b ON a.id_zona = b.id_zona WHERE a.CR = '" & cr & "' and a.id_zona='" & id_zona & "' GROUP BY a.id_zona"

'ejecutamos la consulta
rs.open sql,conn
'si la consula trajo registros
if rs.eof then
'escribimos los encabezados de la tabla
response.write("NO")
'mientras el RecorSet no llegue al final se recorre
else
'dependiendo del parametro de entrada se le llama una funcion que te redirige a la pagina de detalle
	response.write(rs("id_zona"))
	
'seguimos al siguiente registro

'cerramos la tabla y damos un salto de linea	

end if
'cerramos el RecordSet y Cerramos la conexion
rs.close
conn.close 
set rs=nothing
set conn=nothing

%>


