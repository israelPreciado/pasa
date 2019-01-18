<!--#include file="funcion3/funcion.inc"-->
<%'if isempty(session("cr")) then
'response.Redirect("default.asp?logout=true")
'end if%>
<%
response.expires=-1
cr=request("temp2")
'pendiente=request("pendiente")
fechaReasignacion=request("corte3")
comentario=request("temp3")
'id_contratista=request("id_contratista")
'cr="4567"
'pendiente="dedede"
'id_modulo="1"
'id_contratista="1"


'fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr

sql10="update tseguimiento set fechaReasignacion='" & fechaReasignacion & "',reasignacion='1',estatusObra='1',comentarioEstatus='Reprogramacion' where cr='" & cr & "'"


		 conn.execute sql10



conn.close 
set conn=nothing	
'sql="insert into pendientes (cr,pendiente,id_modulo,id_contratista,id_estatus,fecha_reporte) values ('" & cr & "','" & pendiente & "'," & id_modulo & "," & id_contratista & ",1,'" & fecha &"')"

'ejecutamos la consulta
'conn.execute sql

'validamos si la insercion fue satisfactoria y damos respuesta
'if err<>0 then
'	conn.close 
'	set conn=nothing
 	'response.Redirect("pendientesObra2.asp?err=InsertError")
'else
'	conn.close 
'	set conn=nothing
	response.Redirect("edicion_estatusObras.asp?cr="& cr & "&err=ok")
'end if
	
%>

