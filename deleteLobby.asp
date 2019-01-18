<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
id_lobby=request("id_lobby")
Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open ConnStr
set rs= Server.CreateObject("adodb.recordset")
'seleccionamos la consulta segun el parametro de entrada
	sql="delete from tseguimiento_lobby where id_lobby='" & id_lobby & "';"
	'sql2="delete from tseguimientoContratista where cr='" & cr & "';"

	conn.execute sql
	'conn.execute sql2
	if err<>0 then
				conn.close 
				set conn=nothing
				response.Redirect("controlAcciones_adminLobby.asp?err=DeleteUserErr")
 		else 
				conn.close 
				set conn=nothing
  				response.redirect("controlAcciones_adminLobby.asp?err=DeleteUserSatisfactorio")
		end if	
	
%>
