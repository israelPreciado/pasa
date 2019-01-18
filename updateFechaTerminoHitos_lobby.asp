<!--#include file="funcion/funcion.inc"-->
<%'if isempty(session("cr")) then
'response.Redirect("default.asp?logout=true")
'end if%>
<%
response.expires=-1
id=request("hddnID")
fecha=request("hddnFecha")
modulo=request("hddnEnviar")
campo=""
if session.Contents("privilegio")=3 then
campo="Contratista"
end if

Set conn12 = Server.CreateObject("ADODB.Connection")
Conn12.Open connstr

'seleccionamos la consulta segun el parametro de entrada
	fechaHoy=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
regresar=""
sql12="update tseguimiento_lobby set hito"& modulo &"_fechaRealTermino"& campo &"='" & fecha & "', hito" & modulo & "_fechaIngresoRealTermino"& campo &"='" & fechaHoy &"' where cr='"& session.contents("cr") &"';"

'ejecutamos la consulta
conn12.execute sql12 

'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn12.close 
	set conn12=nothing
	'response.write("err")
	response.redirect("avanceObraHitos_lobby.asp?err=err")
else 
	conn12.close 	
	set conn12=nothing
	response.redirect("avanceObraHitos_lobby.asp?err=ok")
	'response.write(sql12)
end if

%>

