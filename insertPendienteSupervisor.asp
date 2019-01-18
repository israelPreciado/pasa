<!--#include file="funcion3/funcion.inc"-->

<%
response.expires=-1
cr=request("cr")
pendiente=request("pendiente")
id_fotografia=request("id_fotografia")
'cr="4567"
'pendiente="dedede"
'id_modulo="1"
'id_contratista="1"

fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr
	
sql="insert into pendientes_asupervisor (cr,pendiente,id_modulo,id_estatus,fecha_reporte,id_fotografia) values ('" & cr & "','" & pendiente & "',1,1,'" & fecha &"','" & id_fotografia & "')"

'ejecutamos la consulta
conn.execute sql

'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn.close 
	set conn=nothing
 	response.Redirect("cargaPendientesSupervisor.asp?cr=" & cr)
else
sql="insert into pendientes_asupervisor_log (cr,pendiente,id_estatus,fecha_reporte,id_fotografia) values ('" & cr & "','" & pendiente & "',1,'" & fecha &"','" & id_fotografia & "')"
'ejecutamos la consulta

conn.execute sql
	if id_fotografia<>"" then
		set rs3=server.CreateObject("adodb.recordset")
		sql4= "select * from pendientes_asupervisor where id_fotografia='" & id_fotografia & "'"
		rs3.open sql4, conn
		sql5="update ctrl_fotografiaspendientes_asupervisor set id_pendiente='" & rs3("id_pendiente") & "' where name='" & id_fotografia & "'"
		conn.execute sql5
		rs3.close
	end if
	conn.close 
	set conn=nothing
	response.Redirect("cargaPendientesSupervisor.asp?cr=" & cr)
end if
	
%>

