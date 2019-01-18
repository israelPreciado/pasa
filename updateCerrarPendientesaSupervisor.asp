<!--#include file="funcion/funcion.inc"-->

<%if isempty(session("cr")) then
response.Redirect("default.asp?logout=true")
end if%>
<%
response.expires=-1
id_pendiente=request("id_pendiente")


Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr

'seleccionamos la consulta segun el parametro de entrada


fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time


sql="update pendientes_asupervisor set id_estatus='0', fecha_finalizacion='" & fecha  &"' where id_pendiente='" & id_pendiente & "';"

'ejecutamos la consulta
conn.execute sql

'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn.close 
	set conn=nothing
 	response.write("err")
else 
	conn.close 
	set conn=nothing
	response.write("ok")
end if
	
%>

