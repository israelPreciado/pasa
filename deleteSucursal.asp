<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
cr=request("temp1")
Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open ConnStr
set rs= Server.CreateObject("adodb.recordset")
'seleccionamos la consulta segun el parametro de entrada
	sql="delete from tseguimiento where cr='" & cr & "';"
	sql2="delete from tseguimientoContratista where cr='" & cr & "';"

	conn.execute sql
	conn.execute sql2
	if err<>0 then
				conn.close 
				set conn=nothing
				response.Redirect("edicion_estatusObras.asp?err=DeleteUserErr")
 		else 
				conn.close 
				set conn=nothing
  				response.redirect("edicion_estatusObras.asp?err=DeleteUserSatisfactorio")
		end if	
	
%>
