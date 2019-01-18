<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
id=request("temp1")
perfil=request("temp2")
Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open ConnStr
set rs= Server.CreateObject("adodb.recordset")
'seleccionamos la consulta segun el parametro de entrada
	sql="delete from cat_gerentes_supervisores where id='" & id & "';"

	conn.execute sql
	if err<>0 then
				conn.close 
				set conn=nothing
				response.Redirect("edicion_gerentes.asp?err=DeleteUserErr")
 		else 
				conn.close 
				set conn=nothing
  				response.redirect("edicion_gerentes.asp?err=DeleteUserSatisfactorio")
		end if	
	
%>
