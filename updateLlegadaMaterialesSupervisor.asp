<!--#include file="funcion3/funcion.inc"-->

<%
response.expires=-1
cr=request("cr")
pos=request("pos")
cve_sap=request("clave_sap")
material=request("suministro")
cantidad=request("cantidad")
comentario=request("comentario")
tiempo=request("semanas")
fecha=request("fecha_llegada")
id_componente=request("id_componente")
id_pedido=request("id")

Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr

sql="update cat_llegadamateriales set cantidad=" & cantidad & ", cve_sap='" & cve_sap & "', tiempo=" & tiempo & ", fecha='" & fecha & "', comentario='" & comentario & "' where id_pedido='"& id_pedido &"';"
'sql="insert into cat_llegadamateriales (pos,cve_sap,material,cantidad,comentario,tiempo,fecha,cr,id_componente) values ('" & pos & "','" & cve_sap & "','" & material & "'," & cantidad &",'" & comentario & "'," & tiempo &",'" & fecha & "','" & CR & "'," & id_componente & ")"

'ejecutamos la consulta
conn.execute sql
'response.write(sql)
'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn.close 
	set conn=nothing
 	response.redirect("edicion_llegadaMateriales.asp?success=err&cr="&cr)
else
'ejecutamos la consulta
	conn.close 
	set conn=nothing
	response.redirect("edicion_llegadaMateriales.asp?success=ok&cr="&cr)
end if
	
%>

