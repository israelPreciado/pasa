<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
login_usuario=request("txt_login_usuarioEdit")
login_pass=request("txt_login_passEdit")
login_privilegio=request("hdd_perfil")
login_nombre=request("txt_login_nombreEdit")
id=request("hdd_id")
Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open ConnStr

'seleccionamos la consulta segun el parametro de entrada
	
if cint(login_privilegio)<>3 then
	sql="update app_bnrt_login set login_usuario='" & login_usuario & "', login_pass='" & login_pass & "', login_nombre='" & ucase(login_nombre) & "' where login_id='" & id & "'"
	'sql="update app_bnrt_login set login_usuario='" & login_usuario & "'"
'ejecutamos la consulta
	conn.execute sql

'validamos si la insercion fue satisfactoria y damos respuesta
	if err<>0 then
		conn.close 
		set conn=nothing
 		response.Redirect("edicion_usuarios.asp?estatus=ErrorU")
	else
		conn.close 
		set conn=nothing
		response.Redirect("edicion_usuarios.asp?estatus=ok")
	'CALL insertarLog(session.Contents("xmd"),"INSERT USUARIO",  login_usuario & "_" & login_nombre, Request.ServerVariables("REMOTE_ADDR") )
	end if
else
	sql="update cat_contratistas a  LEFT JOIN app_bnrt_login b on a.id_contratista=b.login_contratista set a.contratista='" & ucase(login_nombre) & "' where login_id='" & id & "'"
'ejecutamos la consulta
	conn.execute sql
'validamos si la insercion fue satisfactoria y damos respuesta
	if err<>0 then
		conn.close 
		set conn=nothing
 		response.Redirect("edicion_usuarios.asp?estatus=ErrorC")
	else
			sql2="update app_bnrt_login set login_usuario='" & login_usuario & "', login_pass='" & login_pass & "', login_nombre='" & ucase(login_nombre) & "' where login_id='" & id & "'"
		conn.execute sql2
		if err<>0 then
			'rs1.close
			conn.close 
			set conn=nothing
			response.Redirect("edicion_usuarios.asp?estatus=ErrorC")
		else
			'rs1.close
			conn.close 
			set conn=nothing
			response.Redirect("edicion_usuarios.asp?estatus=ok")
	'CALL insertarLog(session.Contents("xmd"),"INSERT USUARIO",  login_usuario & "_" & login_nombre, Request.ServerVariables("REMOTE_ADDR") )
		end if
	end if
end if
%>

