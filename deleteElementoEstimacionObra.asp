<!--#include file="funcion3/funcion.inc"-->

<%
response.expires=-1
cr=request("cr")
sap=request("sap")
'cantidad=request("cantidad")
'pendiente="dedede"
'id_modulo="1"
'id_contratista="1"

Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr
	
sql="delete from  nuevoCosto_estimadoObra  where id='" & sap & "' and cr='" & cr & "'"

'ejecutamos la consulta
conn.execute sql

'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn.close 
	set conn=nothing
 	response.Redirect("err1")
else
sql2="insert into nuevoCosto_estimadoObra_log (cr,componente,clave_sap_concurso) values ('" & cr & "','DELETE','" & sap & "')"
'ejecutamos la consulta

conn.execute sql2
	conn.close 
	set conn=nothing
	response.redirect("elementosCargadosEstimacionObra.asp?cr=" & cr)
end if
	
%>

