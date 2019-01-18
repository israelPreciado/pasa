<!--#include file="funcion3/funcion.inc"-->
<%'if isempty(session("cr")) then
'response.Redirect("default.asp?logout=true")
'end if%>
<%
response.expires=-1
cr=request("cr")
'pendiente=request("pendiente")
id_supervisor=request("select_supervisores")
id_contratista=request("select_contratistas")
'cr="4567"
'pendiente="dedede"
'id_modulo="1"
'id_contratista="1"


'fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr
sql4="update tseguimiento set contratistaAsignado='" & id_contratista & "' where cr='" & cr & "'"
sql5="update tseguimiento set supervisorAsignado='" & id_supervisor & "' where cr='" & cr & "'"

		conn.execute sql4
		conn.execute sql5

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
	response.Redirect("editar_detalleAlcances.asp?cr="& cr & "&err=ok")
'end if
	
%>

