<!--#include file="funcion/funcion.inc"-->
<%'if isempty(session("cr")) then
'response.Redirect("default.asp?logout=true")
'end if%>
<%
response.expires=-1
cr=request("cr")
Set conn12 = Server.CreateObject("ADODB.Connection")
Conn12.Open connstr

'seleccionamos la consulta segun el parametro de entrada
fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
regresar=""
sql12="update tseguimiento set entregada='1', fechaEntrega='" & fecha & "' where cr='"& cr &"';"

'ejecutamos la consulta
conn12.execute sql12

'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn12.close 
	set conn12=nothing
	response.write("err")
else 
	conn12.close 	
	set conn12=nothing
	response.write("ok")
end if

%>

