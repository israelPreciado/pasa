<!--#include file="funcion3/funcion.inc"-->

<%
response.expires=-1
cr=request("cr")
pendiente=request("pendiente")
'id_fotografia=request("id_fotografia")
'cr="4567"
'pendiente="dedede"
'id_modulo="1"
'id_contratista="1"

fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr
	
sql="insert into pendientes_asupervisor (cr,pendiente,id_estatus,fecha_reporte) values ('" & cr & "','" & pendiente & "',1,'" & fecha &"')"

'ejecutamos la consulta
conn.execute sql

'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn.close 
	set conn=nothing
 	response.Redirect("modalTest.asp?err=InsertError&hddnEnviar=" & id_modulo)
else
'sql="insert into pendientes_log (cr,pendiente,id_modulo,id_contratista,id_estatus,fecha_reporte,id_fotografia) values ('" & cr & "','" & pendiente & "'," & id_modulo & "," & id_contratista & ",1,'" & fecha &"','" & id_fotografia & "')"
'ejecutamos la consulta

'conn.execute sql
	conn.close 
	set conn=nothing
	response.Redirect("modalTest.asp?err=ok&hddnEnviar=" & id_modulo)
end if
	
%>

