<!--#include file="funcion3/funcion.inc"-->
<%'if isempty(session("cr")) then
'response.Redirect("default.asp?logout=true")
'end if%>
<%
response.expires=-1
On Error Resume Next
cr=request("txt_cr")
id_zona=request("select_zona")
id_territorio=request("select_territorial")
lobby=request("txt_nombrelobby")
'cr="4567"
'pendiente="dedede"
'id_modulo="1"
'id_contratista="1"

fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
	
sql="insert into tseguimiento_lobby (cr,id_zona,id_territorio,nombre_lobby,fecha_registro) values ('" & cr & "','" & id_zona & "','" & id_territorio& "','" & lobby & "','" & fecha & "')"

'ejecutamos la consulta

conn.execute sql
'sql="insert into tseguimientocontratista (cr,tipoTransformacion,contratistaAsignado,estatusObra,avanceProyectado,avanceReal,supervisorAsignado) values ('" & cr & "','" & id_tipoTransformacion & "','" & id_contratista& "',0,'0','0','" & id_supervisor & "')"

'ejecutamos la consulta

'conn.execute sql
'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn.close 
	set conn=nothing
	response.write(sql)
 	response.Redirect("asignarLobby.asp?err=InsertError")
else
	sql="select * from tseguimiento_lobby where cr='" & cr &"' and id_zona='" & id_zona &  "' and id_territorio='" & id_territorio & "' and nombre_lobby='" & lobby & "' and fecha_registro='" & fecha &"'"
	rs.open sql,conn
	id_lobby=""
		while not(rs.eof)
				id_lobby= rs("id_lobby") 
		rs.movenext
		wend 
	rs.close
	conn.close 
	set conn=nothing
	response.Redirect("editar_detalleAlcancesLobby.asp?id_lobby=" & id_lobby & "&cr=" & cr & "&id_zona=" & id_zona & "&id_territorio=" & id_territorio & "&lobby=" & lobby)
end if
	
%>

