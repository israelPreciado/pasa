<!--#include file="funcion3/funcion.inc"-->

<%
	if isempty(session("cr")) then
		session.Abandon()
		response.Redirect("/bnrt/")
	end if
response.expires=-1

sap=request("id")
cantidad=request("cantidad")
'pendiente="dedede"
'id_modulo="1"
'id_contratista="1"

Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr
	
sql="update nuevoCosto_estimadoObra set cantidad='" & cantidad & "' where id='" & sap & "' and cr='" & session("cr") & "'"

'ejecutamos la consulta
conn.execute sql

'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn.close 
	set conn=nothing
 	response.write("err1")
else
sql2="insert into nuevoCosto_estimadoObra_log (cr,componente,clave_sap_concurso,cantidad) values ('" & session("cr") & "','UPDATE','" & sap & "','" & cantidad &"')"
'ejecutamos la consulta

conn.execute sql2
	conn.close 
	set conn=nothing
	response.write("ok")
end if
	
%>

