
<!--#include file="funcion/funcion.inc"-->

<%
capitulo=request("capitulo")
concepto=request("concepto")
cr=request("cr")
respustaStandard=request("respustaStandard")
%>



<%

Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
sql= "select * from cat_preguntas a LEFT JOIN preguntas_coordenadas b on a.id_pregunta =b.id_pregunta where id_capitulo=" & capitulo &" and id_concepto=" & concepto & " and b.id_tipoRespuesta=1"
rs.open sql,conn
i=0
while not(rs.eof)
i=1+1
sql="INSERT INTO ctrl_preguntasRespuestas (id_pregunta,cond,tipo,cr) VALUES ('" & rs("id_pregunta") & "','" & request("cond_" & rs("id_pregunta") ) & "','" & request("tipo_" & rs("id_pregunta") ) & "','" &  cr & "');"
conn.execute sql
if respustaStandard="3" and concepto="9" then
	sql="UPDATE ctrl_preguntasRespuestas SET tipoAA='" & request("EAA_123") & "', marca='" & request("EAA_124") & "',modelo='" & request("EAA_125") & "', no_serie='" & request("EAA_126") & "', no_inventario='" & request("EAA_127") & "',capacidad='" & request("EAA_128") & "' WHERE id_pregunta='" & rs("id_pregunta") & "' and cr ='" & cr & "';"
	conn.execute sql
end if
if rs("id_pregunta") ="133" or rs("id_pregunta") ="138" or rs("id_pregunta") ="148" then
	sql2="UPDATE ctrl_preguntasRespuestas SET lectura_V_A_B='" & request("lectura_V_A_B_" & rs("id_pregunta") ) & "', lectura_V_B_C='" & request("lectura_V_B_C_" & rs("id_pregunta") ) & "',lectura_V_C_A='" & request("lectura_V_C_A_" & rs("id_pregunta") ) & "' WHERE id_pregunta='" & rs("id_pregunta") & "' and cr ='" & cr & "';"
	conn.execute sql2
end if
if rs("id_pregunta") ="134" or rs("id_pregunta") ="139" or rs("id_pregunta") ="149" then 
	sql3="UPDATE ctrl_preguntasRespuestas SET amp_A='" & request("lectura_amp_A_" & rs("id_pregunta") ) & "', amp_B='" & request("lectura_amp_B_" & rs("id_pregunta") ) & "',amp_C='" & request("lectura_amp_C_" & rs("id_pregunta") ) & "' WHERE id_pregunta='" & rs("id_pregunta") & "' and cr ='" & cr & "';"
	conn.execute sql3
end if
if rs("id_pregunta") ="140" then 
			sql4="UPDATE ctrl_preguntasRespuestas SET ap='" & request("lectura_ap" & rs("id_pregunta") ) & "', bp='" & request("lectura_bp" & rs("id_pregunta") ) & "' WHERE id_pregunta='" & rs("id_pregunta") & "' and cr ='" & cr & "';"
			conn.execute sql4
end if
if rs("id_pregunta") ="140" then 
		sql4="UPDATE ctrl_preguntasRespuestas SET lectura_comentarios='" & request("comentarios_" & rs("id_pregunta") ) & "' WHERE id_pregunta='" & rs("id_pregunta") & "' and cr ='" & cr & "';"
		conn.execute sql4
end if
if rs("id_pregunta") ="129" or rs("id_pregunta") ="130" or rs("id_pregunta") ="131" or rs("id_pregunta") ="132" then 
		sql4="UPDATE ctrl_preguntasRespuestas SET lectura_comentarios='" & request("comentarios_" & rs("id_pregunta") ) & "' WHERE id_pregunta='" & rs("id_pregunta") & "' and cr ='" & cr & "';"
		conn.execute sql4
end if
if rs("id_pregunta") ="135" or rs("id_pregunta") ="136" or rs("id_pregunta") ="137"  then 
		sql4="UPDATE ctrl_preguntasRespuestas SET lectura_comentarios='" & request("comentarios_" & rs("id_pregunta") ) & "' WHERE id_pregunta='" & rs("id_pregunta") & "' and cr ='" & cr & "';"
		conn.execute sql4
end if
if rs("id_pregunta") ="143" or rs("id_pregunta") ="144" or rs("id_pregunta") ="145" or rs("id_pregunta") ="146" or rs("id_pregunta") ="147"  then 
		sql4="UPDATE ctrl_preguntasRespuestas SET lectura_comentarios='" & request("comentarios_" & rs("id_pregunta") ) & "' WHERE id_pregunta='" & rs("id_pregunta") & "' and cr ='" & cr & "';"
		conn.execute sql4
end if
if rs("id_pregunta") ="150" then 
		sql4="UPDATE ctrl_preguntasRespuestas SET lectura_comentarios='" & request("comentarios_" & rs("id_pregunta") ) & "' WHERE id_pregunta='" & rs("id_pregunta") & "' and cr ='" & cr & "';"
		conn.execute sql4
end if
rs.movenext
wend
sql3="INSERT INTO ctrl_capitulos_contestados (id_capitulo, id_concepto, cr) VALUES ('" & capitulo & "', '" & concepto & "','" & cr & "');"
conn.execute sql3
rs.close
conn.close 
set rs=nothing
set conn=nothing
response.redirect("llenadoPDF1.asp?cr=" & cr )

%>
