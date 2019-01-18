<!--#include file="funcion3/funcion.inc"-->

<%
response.expires=-1
cr=request("cr")
cve_sap=request("clave_sap")
material=request("suministro")
cantidad=request("cantidad")
comentario=request("comentario")
tiempo=request("semanas")
fecha=request("fecha_llegada")
id_componente=request("id_componente")

Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr
	
sql="insert into cat_llegadamateriales (cve_sap,material,cantidad,comentario,tiempo,fecha,cr,id_componente,pos) values ('" & cve_sap & "','" & material & "'," & cantidad &",'" & comentario & "'," & tiempo &",'" & fecha & "','" & CR & "'," & id_componente & ",'')"

'ejecutamos la consulta
conn.execute sql
'response.write(sql)
'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn.close 
	set conn=nothing
 	response.redirect("edicion_llegadaMateriales.asp?success=err&cr=" & cr )
else
'ejecutamos la consulta
	conn.close 
	set conn=nothing
	response.redirect("edicion_llegadaMateriales.asp?success=ok&cr=" & cr )
end if
	
%>

