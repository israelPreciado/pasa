<!--#include file="funcion/funcion.inc"-->
<%if isempty(session("cr")) then
response.Redirect("default.asp?logout=true")
end if%>
<%
response.expires=-1
id_pendiente=request("id_pendiente")
pendiente=request("pendiente")
modulo=request("modulo")
id_fotografia=request("id_fotografia")

Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr

'seleccionamos la consulta segun el parametro de entrada
	

sql="update pendientes set pendiente='" & pendiente & "' where id_pendiente='" & id_pendiente & "';"

'ejecutamos la consulta
conn.execute sql


'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn.close 
	set conn=nothing
 	response.write("err")
else 
sql="insert into pendientes_log(select * from pendientes where id_pendiente='" & id_pendiente & "')"
conn.execute sql
if id_fotografia<>"" then
	sql5="update ctrl_fotografiaspendientes set id_pendiente='" & id_pendiente & "' where name=" & id_fotografia 
	conn.execute sql5
end if	
	conn.close 
	set conn=nothing
	response.redirect("pendientesObra2.asp?res=ok&hddnEnviar=" & modulo)
	'response.Write(sql5)
end if
	
%>

