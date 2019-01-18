<!--#include file="funcion/funcion.inc"-->
<%if isempty(session("cr")) then
response.Redirect("default.asp?logout=true")
end if%>
<%
response.expires=-1
cr=request("cr")
partida=request("partida")
estatus=request("estatus")


Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr

'seleccionamos la consulta segun el parametro de entrada
	

sql="update nuevocosto_estimadoobra set estatus='" & estatus & "' where cr='" & cr & "' and componente='" & partida & "';"

'ejecutamos la consulta
conn.execute sql


'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn.close 
	set conn=nothing
 	response.write("err")
else
 if estatus="1" then
  sql="insert into nuevocosto_estimadoobra_log(cr,componente) values('" & cr & "','Abierto / " & partida & "')"
 else
  sql="insert into nuevocosto_estimadoobra_log(cr,componente) values('" & cr & "','Cerrado / " & partida & "')" 
 end if
    conn.execute sql
	conn.close 
	set conn=nothing
	response.Write("ok")
end if
	
%>

