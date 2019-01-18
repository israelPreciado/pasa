<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%> 
<!--#include file="funcion3/funcion.inc"-->
<%'if isempty(session("cr")) then
'response.Redirect("default.asp?logout=true")
'end if%>
<%
response.expires=-1


ruta= Server.MapPath("adjuntos/Almacen/plantilla_almacen.csv")
ruta=Replace(ruta,"\","/")

Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr
sql="LOAD DATA LOCAL INFILE '" & ruta & "' INTO TABLE pruebaLoad LINES TERMINATED BY '\n'"

'ejecutamos la consulta
conn.execute sql

	conn.close 
	set conn=nothing
'validamos si la insercion fue satisfactoria y damos respuesta
'if err<>0 then
'	conn.close 
'	set conn=nothing
 	'response.Redirect("pendientesObra2.asp?err=InsertError")
'else
'	conn.close 
'	set conn=nothing
	'response.Redirect("pendientesObra2.asp?err=InsertSatisfactorio")
'end if
'	response.write(sql)
%>

