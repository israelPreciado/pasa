<!--#include file="funcion3/funcion.inc"-->
<%if isempty(session("cr")) then
response.Redirect("default.asp?logout=true")
end if%>
<%
response.expires=-1
cr=request("cr")
pendiente=request("pendiente")
id_modulo=request("id_modulo")
id_contratista=request("id_contratista")
id_fotografia=request("id_fotografia")
'cr="4567"
'pendiente="dedede"
'id_modulo="1"
'id_contratista="1"

fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr
	
sql="insert into pendientes (cr,pendiente,id_modulo,id_contratista,id_estatus,fecha_reporte,id_fotografia,registradoPor,perfilRegistradoPor) values ('" & cr & "','" & pendiente & "'," & id_modulo & "," & id_contratista & ",1,'" & fecha &"','" & id_fotografia & "','" & session.contents("id") & "','" & session.contents("privilegio") & "')"

'ejecutamos la consulta
conn.execute sql

'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn.close 
	set conn=nothing
 	response.Redirect("pendientesObra2.asp?err=InsertError&hddnEnviar=" & id_modulo)
else
sql="insert into pendientes_log (cr,pendiente,id_modulo,id_contratista,id_estatus,fecha_reporte,id_fotografia) values ('" & cr & "','" & pendiente & "'," & id_modulo & "," & id_contratista & ",1,'" & fecha &"','" & id_fotografia & "')"
'ejecutamos la consulta

conn.execute sql
	if id_fotografia<>"" then
		set rs3=server.CreateObject("adodb.recordset")
		sql4= "select * from pendientes where id_fotografia='" & id_fotografia & "'"
		rs3.open sql4, conn
		sql5="update ctrl_fotografiaspendientes set id_pendiente='" & rs3("id_pendiente") & "' where name='" & id_fotografia & "'"
		conn.execute sql5
		rs3.close
	end if
	conn.close 
	set conn=nothing
	response.Redirect("pendientesObra2.asp?err=ok&hddnEnviar=" & id_modulo)
end if
	
%>

