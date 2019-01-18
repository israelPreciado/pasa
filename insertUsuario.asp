<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
login_usuario=request("txt_login_usuario")
login_pass=request("txt_login_pass")
login_privilegio=request("select_login_privilegio")
login_zonaDirector=request("select_zona")
login_nombre=request("txt_login_nombre")
Set conn = Server.CreateObject("ADODB.Connection")
 Conn.Open ConnStr

'seleccionamos la consulta segun el parametro de entrada
	
if cint(login_privilegio)<>3 then
	sql="insert into app_bnrt_login (login_usuario,login_pass,login_privilegio,login_nombre,login_zonaDirector) values ('" & login_usuario & "','" & login_pass & "','" & login_privilegio & "','" & ucase(login_nombre) & "','" & login_zonaDirector & "')"
'ejecutamos la consulta
	conn.execute sql

'validamos si la insercion fue satisfactoria y damos respuesta
	if err<>0 then
		conn.close 
		set conn=nothing
 		response.write("ErrorU")
	else
		conn.close 
		set conn=nothing
		response.write("OK")
	'CALL insertarLog(session.Contents("xmd"),"INSERT USUARIO",  login_usuario & "_" & login_nombre, Request.ServerVariables("REMOTE_ADDR") )
	end if
else
	sql="insert into cat_contratistas (contratista) values ('" & ucase(login_nombre) & "')"
'ejecutamos la consulta
	conn.execute sql
'validamos si la insercion fue satisfactoria y damos respuesta
	if err<>0 then
		conn.close 
		set conn=nothing
 		response.write("ErrorU")
	else
		set rs1=server.CreateObject("adodb.recordset")
		sql="select max(id_contratista) maximo from cat_contratistas"
		rs1.open sql, conn
		sql2="insert into app_bnrt_login (login_usuario,login_pass,login_privilegio,login_nombre,login_contratista) values ('" & login_usuario & "','" & login_pass & "','" & login_privilegio & "','" & ucase(login_nombre) & "','" & rs1("maximo") & "')"
		conn.execute sql2
		if err<>0 then
			rs1.close
			conn.close 
			set conn=nothing
 			response.write("ErrorC")
		else
			rs1.close
			conn.close 
			set conn=nothing
			response.write("OK")
	'CALL insertarLog(session.Contents("xmd"),"INSERT USUARIO",  login_usuario & "_" & login_nombre, Request.ServerVariables("REMOTE_ADDR") )
		end if
	end if
end if
%>

