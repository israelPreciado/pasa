
<!--#include file="funcion/funcion.inc"-->

<%
capitulo=request("capitulo")
concepto=request("concepto")
cr=request("cr")
respustaStandard=request("respustaStandard")
%>



<%if respustaStandard="1" then

Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
sql= "select * from cat_preguntas a LEFT JOIN preguntas_coordenadas b on a.id_pregunta =b.id_pregunta where id_capitulo=" & capitulo &" and id_concepto=" & concepto & " and b.id_tipoRespuesta=1"
rs.open sql,conn

while not(rs.eof)

sql="INSERT INTO ctrl_preguntasRespuestas (id_pregunta,cond,cr) VALUES ('" & rs("id_pregunta") & "','" & request("cond_" & rs("id_pregunta") ) & "','" & cr & "');"
conn.execute sql
sql2="UPDATE ctrl_preguntasRespuestas SET observacion='" & request("comentarios_" & rs("id_pregunta") ) & "' WHERE id_pregunta='" & rs("id_pregunta") & "' and cr ='" & cr & "';"
conn.execute sql2
rs.movenext
wend
sql3="INSERT INTO ctrl_capitulos_contestados (id_capitulo, id_concepto, cr) VALUES ('" & capitulo & "', '" & concepto & "','" & cr & "');"
conn.execute sql3
rs.close
conn.close 
set rs=nothing
set conn=nothing
response.redirect("llenadoPDF1.asp?cr=" & cr )
end if%> 

