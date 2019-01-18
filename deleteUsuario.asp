<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
id=request("temp1")
perfil=request("temp2")
Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open ConnStr
set rs= Server.CreateObject("adodb.recordset")
'seleccionamos la consulta segun el parametro de entrada
	sql="delete from app_bnrt_login where login_id='" & id & "';"
	sql2="select count(*) as cuenta from app_bnrt_login a LEFT JOIN cat_perfil b on a.login_privilegio =b.id_perfil where login_id<>1 and login_privilegio=1"
if perfil="1" then
	rs.open sql2,conn
	
	if rs.eof then
				rs=nothing
				conn.close 
				set conn=nothing
				response.Redirect("edicion_Usuarios.asp?err=DeleteUserErr33")
	else
		if cint(rs("cuenta"))>1 then
			conn.execute sql
			if err<>0 then
				rs=nothing
				conn.close 
				set conn=nothing
				response.Redirect("edicion_Usuarios.asp?err=DeleteUserErr")
 			else 
				set rs=nothing
				conn.close 
				set conn=nothing
  				response.redirect("edicion_Usuarios.asp?err=DeleteUserSatisfactorio")
			end if	
		else
				set rs=nothing
				conn.close 
				set conn=nothing
				response.Redirect("edicion_Usuarios.asp?err=DeleteUserErr32")
		end if
	end if
else
	conn.execute sql
	if err<>0 then
				conn.close 
				set conn=nothing
				response.Redirect("edicion_Usuarios.asp?err=DeleteUserErr")
 		else 
				conn.close 
				set conn=nothing
  				response.redirect("edicion_Usuarios.asp?err=DeleteUserSatisfactorio")
		end if	
end if		
%>
