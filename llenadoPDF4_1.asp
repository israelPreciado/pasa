
<!--#include file="funcion/funcion.inc"-->

<%
capitulo=request("capitulo")
concepto=request("concepto")
cr=request("cr")
respustaStandard=request("respustaStandard")
%>



<%if respustaStandard="2" then

Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
sql= "select * from cat_preguntas a LEFT JOIN preguntas_coordenadas b on a.id_pregunta =b.id_pregunta where id_capitulo=" & capitulo &" and id_concepto=" & concepto & " and b.id_tipoRespuesta=1"
rs.open sql,conn
i=0
while not(rs.eof)
i=1+1
sql="INSERT INTO ctrl_preguntasRespuestas (id_pregunta,cond,cr) VALUES ('" & rs("id_pregunta") & "','" & request("cond_" & rs("id_pregunta") ) & "','" & cr & "');"
conn.execute sql
if i=1 then 
sql2="UPDATE ctrl_preguntasRespuestas SET lectura_comentarios='" & request("comentarios_" & rs("id_pregunta") ) & "' WHERE id_pregunta='" & rs("id_pregunta") & "' and cr ='" & cr & "';"
conn.execute sql2
sql3="UPDATE ctrl_preguntasRespuestas SET tipo='" & request("tipo" & rs("id_pregunta") ) & "' WHERE id_pregunta='" & rs("id_pregunta") & "' and cr ='" & cr & "';"
conn.execute sql3
else
sql3="UPDATE ctrl_preguntasRespuestas SET tipo='" & request("tipo" & rs("id_pregunta") ) & "',lectura_A_A_B='"& request("AB_" & rs("id_pregunta") ) &"',lectura_A_B_C='"& request("BC_" & rs("id_pregunta") ) &"',lectura_A_C_A='"& request("CA_" & rs("id_pregunta") ) &"' WHERE id_pregunta='" & rs("id_pregunta") & "' and cr ='" & cr & "';"
conn.execute sql3
rs.movenext
end if

wend
sql3="INSERT INTO ctrl_capitulos_contestados (id_capitulo, id_concepto, cr) VALUES ('" & capitulo & "', '" & concepto & "','" & cr & "');"
conn.execute sql3
rs.close
conn.close 
set rs=nothing
set conn=nothing
response.redirect("llenadoPDF1.asp?cr=" & cr )
end if%> 

