<!--#include file="funcion/funcion.inc"-->
<%'if isempty(session("cr")) then
'response.Redirect("default.asp?logout=true")
'end if%>
<%
response.expires=-1
id=request("hddnID")
fecha=request("hddnFecha")

Set conn12 = Server.CreateObject("ADODB.Connection")
Conn12.Open connstr

'seleccionamos la consulta segun el parametro de entrada
	
regresar=""
sql12="update cat_llegadamateriales set fecha='" & fecha & "' where id_pedido='"& id &"';"

'ejecutamos la consulta
conn12.execute sql12

'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn12.close 
	set conn12=nothing
	response.redirect("detalleCr.asp?err=err")
else 
	conn12.close 	
	set conn12=nothing
	response.redirect("detalleCR.asp?err=ok")
end if

%>

