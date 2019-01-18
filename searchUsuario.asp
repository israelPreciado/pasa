<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
usuario=request("Usuario")
pass=request("Pass")
'cr="0008"
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr

'seleccionamos la consulta segun el parametro de entrada
	sql="SELECT  * from app_bnrt_login where login_usuario = '"& usuario &"' and login_pass = '"& pass &"'"

'ejecutamos la consulta
rs.open sql,conn
'si la consula trajo registros
if rs.eof then
'escribimos los encabezados de la tabla
response.write("NO")
'mientras el RecorSet no llegue al final se recorre
else
session("id")=rs("login_id")
session("xmd")=usuario
session("nombre_usuario")=rs("login_nombre")
session("privilegio")=rs("login_privilegio")
if rs("login_privilegio")=3 then
session("contratista")=rs("login_contratista")
end if
if rs("login_privilegio")=4 then
session("director")=rs("login_privilegio")
session("zonaDirector")=rs("login_zonaDirector")
end if
if rs("login_privilegio")=5 then
session("gerente")=rs("login_nombre")
end if
if rs("login_privilegio")=6 then
session("gerente")=rs("login_nombre")
end if
if rs("login_privilegio")=7 then
session("gerente")=rs("login_nombre")
session("zonaDirector")=rs("login_zonaDirector")
end if
'call insertarLog(usuario,"LOGIN","", Request.ServerVariables("REMOTE_ADDR"))
'dependiendo del parametro de entrada se le llama una funcion que te redirige a la pagina de detalle
response.write(rs("login_privilegio"))	
'seguimos al siguiente registro

'cerramos la tabla y damos un salto de linea	

end if
'cerramos el RecordSet y Cerramos la conexion
rs.close
set rs=nothing
	set rs12= Server.CreateObject("adodb.recordset")
	sql12= "select * from tseguimiento where estatusObra>0"
	rs12.open sql12,conn
	if rs12.eof then
	else
	while not(rs12.eof)
		
			sql13="update tseguimiento set avanceProyectado=" & cDbl(calculaAvanceProyectado7030(rs12("cr"),rs12("fechaInicio"))) & " where cr='" & rs12("cr") & "'"
			conn.execute sql13
		
	rs12.movenext
	wend  
		
	end if
	rs12.close
	sql13="UPDATE tseguimiento set EstatusObra=1 where AvanceProyectado<=AvanceReal and AvanceReal<100 and estatusObra>0 ;"
				conn.execute sql13
	'sql14="UPDATE tseguimiento set EstatusObra=2 where AvanceProyectado>AvanceReal and estatusObra>0;"
	'			conn.execute sql14
	
conn.close 
set conn=nothing


%>


