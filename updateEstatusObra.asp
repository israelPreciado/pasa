<!--#include file="funcion/funcion.inc"-->
<%'if isempty(session("cr")) then
'response.Redirect("default.asp?logout=true")
'end if%>
<%
response.expires=-1
cr=request("temp2")
estatus=request("temp1")
comentario=request("temp3")
Set conn12 = Server.CreateObject("ADODB.Connection")
Conn12.Open connstr

'seleccionamos la consulta segun el parametro de entrada
	
regresar=""
sql12="update tseguimiento set estatusObra='" & estatus & "', comentarioEstatus='" & comentario & "' where cr='"& cr &"';"

'ejecutamos la consulta
conn12.execute sql12

sql13="update tseguimientoContratista set estatusObra='" & estatus & "', comentarioEstatus='" & comentario & "' where cr='"& cr &"';"
conn12.execute sql13

'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn12.close 
	set conn12=nothing
	response.redirect("edicion_estatusObras.asp?err=err")
else 
	conn12.close 	
	set conn12=nothing
	response.redirect("edicion_estatusObras.asp?err=ok")
end if

%>

