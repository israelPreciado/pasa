<!--#include file="funcion3/funcion.inc"-->

<%
response.expires=-1
cr=request("cr")
sap=request("sap")
zona=request("zona")
pu=request("pu")
cantidad=request("cantidad")
componente=request("componente")
tipo=request("tipo")
desCorta=request("desCorta")
desLarga=request("desLarga")
und=request("und")
clavesap=request("clavesap")

'cr="4567"
'pendiente="dedede"
'id_modulo="1"
'id_contratista="1"

Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr
if tipo="1" then	
sql="insert into nuevoCosto_estimadoObra (cr,componente,clave_sap_concurso,clave_sap_zona,cantidad,pu,estatus) values ('" & cr & "','" & componente & "','" & sap & "','" & zona & "','" & cantidad &"','" & pu & "',1)"
else
sql="insert into nuevoCosto_estimadoObra (cr,componente,clave_sap_concurso,cantidad,pu,descorta,deslarga,und,estatus) values ('" & cr & "','" & componente & "','" & sap & "','" & cantidad &"','" & pu & "','" & descorta & "','" & deslarga & "','" & und & "',1)"
end if
'ejecutamos la consulta
conn.execute sql

'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn.close 
	set conn=nothing
 	response.Redirect("err1")
else
if tipo="1" then	
sql2="insert into nuevoCosto_estimadoObra_log (cr,componente,clave_sap_concurso,clave_sap_zona,cantidad,pu) values ('" & cr & "','" & componente & "','" & sap & "','" & zona & "','" & cantidad &"','" & pu & "')"
else
sql2="insert into nuevoCosto_estimadoObra_log (cr,componente,cantidad,pu,descorta,deslarga,und) values ('" & cr & "','" & componente & "','" & cantidad &"','" & pu & "','" & descorta & "','" & deslarga & "','" & und & "')"
end if
'ejecutamos la consulta

conn.execute sql2
	conn.close 
	set conn=nothing
	response.write("ok")
end if
	
%>

