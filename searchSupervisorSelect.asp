<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
territorial=request("division")
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr

'seleccionamos la consulta segun el parametro de entrada
	sql="select b.login_id, b.login_nombre,c.Territorial from tseguimiento a LEFT JOIN cat_sucursales c on a.cr=c.cr LEFT JOIN app_bnrt_login b on a.supervisorAsignado=b.login_id where c.Territorial='" & territorial & "' GROUP BY b.login_nombre"

'ejecutamos la consulta
regresar="<p>Filtrar por Supervisor</p><br>"
rs.open sql, conn
if rs.eof then
	regresar="<select><option value='0'>--</option></select>"
else
	regresar=regresar & "<select id='select_supervisor' name='select_supervisor' ><option></option>"
	while not(rs.eof)
		regresar=regresar & "<option value='" & rs("login_id") & "'>" & rs("login_nombre") &"</option>"
	rs.movenext
	wend  
	regresar=regresar & "</select>"
end if
'cerramos el RecordSet y Cerramos la conexion
rs.close
conn.close 
set rs=nothing
set conn=nothing

response.write(regresar)
%>


