<!--#include file="funcion3/funcion.inc"-->

<%
	if isempty(session("cr")) then
		session.Abandon()
		response.Redirect("/bnrt/")
	end if
response.expires=-1

sap=request("id")
cantidad=request("cantidad")
cr=request("cr")
'id_modulo="1"
'id_contratista="1"

Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr
'********** hacemos un BEGIN para poder realizar posteriormente un commit o un rollback
	'sql="begin"
	'conn.execute sql
	
sql="update nuevoCosto_estimadoObra_lobby set avanceContratista='" & cantidad & "' where id='" & sap & "' and cr='" & session("cr") & "'"
'ejecutamos la consulta
conn.execute sql

'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn.close 
	set conn=nothing
 	response.write("err1")
else
sql2="insert into nuevoCosto_estimadoObra_lobby_log (cr,componente,clave_sap_concurso,cantidad) values ('" & session("cr") & "','UPDATE_AVANCE_Contratista','" & sap & "','" & cantidad &"')"
'ejecutamos la consulta
conn.execute sql2


	set conn=nothing
	response.write("ok")

	
end if
	
%>



















