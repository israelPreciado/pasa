<!--#include file="funcion3/funcion.inc"-->
<%'if isempty(session("cr")) then
'response.Redirect("default.asp?logout=true")
'end if%>
<%
response.expires=-1
On Error Resume Next
id_gerente=request("select_gerentes")
id_supervisor=request("select_supervisores")
'cr="4567"
'pendiente="dedede"
'id_modulo="1"
'id_contratista="1"

fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
	
sql2="select * from cat_gerentes_supervisores where id_gerente='" & id_gerente &"' and id_supervisor='" & id_supervisor &"'"
rs.open sql2, conn

if rs.eof then 
sql="insert into cat_gerentes_supervisores (id_gerente,id_supervisor) values ('" & id_gerente & "','" & id_supervisor & "')"

'ejecutamos la consulta

conn.execute sql

if err<>0 then
	conn.close 
	set conn=nothing
 	response.Redirect("asignarGerente.asp?err=InsertError")
else
	conn.close 
	set conn=nothing
	response.Redirect("asignarGerente.asp?err=ok")
end if
else
rs.close
conn.close 
set rs=nothing
set conn=nothing
response.Redirect("asignarGerente.asp?err=InsertErrorExistente")
end if
%>

