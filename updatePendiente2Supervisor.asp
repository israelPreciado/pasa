<!--#include file="funcion/funcion.inc"-->
<%
response.expires=-1
id_pendiente=request("id_pendiente")
pendiente=request("pendiente")
modulo=request("modulo")
id_fotografia=request("id_fotografia")

Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr

'seleccionamos la consulta segun el parametro de entrada
	

sql="update pendientes_asupervisor set pendiente='" & pendiente & "' where id_pendiente='" & id_pendiente & "';"

'ejecutamos la consulta
conn.execute sql


'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn.close 
	set conn=nothing
 	response.write("err")
else 
sql="insert into pendientes_asupervisor_log(select * from pendientes_asupervisor where id_pendiente='" & id_pendiente & "')"
conn.execute sql
	conn.close 
	set conn=nothing
	response.redirect("modalTest.asp?res=ok&hddnEnviar=" & modulo)
	'response.Write(sql5)
end if
	
%>

