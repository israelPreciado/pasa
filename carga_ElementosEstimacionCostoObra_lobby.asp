<!--#include file="funcion3/funcion.inc"-->
<!--#include file="funcion3/funcion_edicion_usuarios.inc"-->
<%
response.expires=-1
cr=request("cr")
zona=buscaZonaTransformacion(cr)

regresa=""
regresa="<br/>"
regresa=regresa & "<br/>"
regresa=regresa &"<div class='tabla_usuarios' align='center' id='tabla_usuarios'>"
regresa=regresa & "<div class='container'>"


regresa=regresa & "<table cellpadding='0' cellspacing='0' class='display id='example2'>"
regresa=regresa & " <thead>"
regresa=regresa & "  <tr bgcolor='#991821'>"
regresa=regresa & "	<th width='3%'  height='42' align='center'><font color='#FFFFFF' size='-1'>CLAVE SAP</font></th>"
regresa=regresa & "    <th width='3%'  height='42' align='center'><font color='#FFFFFF' size='-1'>CLAVE SAP ZONA</font></th>"
regresa=regresa & "    <th width='17%'  height='42' align='center'><font color='#FFFFFF' size='-1'>DESCRIPCION CORTA</font></th>"
regresa=regresa & "    <th width='3%'  height='42' align='center'><font color='#FFFFFF' size='-1'>P.U.</font></th>"
regresa=regresa & "	<th width='3%'  height='42' align='center'><font color='#FFFFFF' size='-1'>CANTIDAD</font></th>"
regresa=regresa & "	<th width='3%'  height='42' align='center'><font color='#FFFFFF' size='-1'>UND</font></th>"
regresa=regresa & "	<th width='3%'  height='42' align='center'><font color='#FFFFFF' size='-1'>ESTIMACION</font></th>"
regresa=regresa & "	<th width='5%'  height='42' align='center'><font color='#FFFFFF' size='-1'>CONCEPTO</font></th>"
regresa=regresa & "	<th width='10%'  height='42' align='center'><font color='#FFFFFF' size='-1'>FECHA INGRESO</font></th>"
regresa=regresa & "  </tr>"
regresa=regresa & " </thead>" 
 
Set conn5 = Server.CreateObject("ADODB.Connection")
set rs25= Server.CreateObject("adodb.recordset")
Conn5.Open connstr
'sql= 'select * from app_bnrt_login where login_id='' & id & '''
sql= "select * from (select a.CLAVE_SAP_CONCURSO,a.clave_sap_zona, b.DESCRIPCION_CORTA,a.pu,a.cantidad,b.UND, a.componente, concat(left(a.fecha_ingreso,4),'-',right(left(a.fecha_ingreso,7),2),'-',right(left(a.fecha_ingreso,10),2),' ',right(a.fecha_ingreso,8))  as fecha_ingreso from nuevoCosto_estimadoObra_lobby a LEFT JOIN cat_sap_2017 b on a.CLAVE_SAP_CONCURSO=b.CLAVE_SAP_CONCURSO  where cr ='" & cr & "' AND  A.componente NOT like 'ATMS' AND A.componente NOT LIKE 'otros') as a union (select clave_sap_concurso,clave_sap_zona,descorta as descripcion_corta,pu,cantidad,und,componente,fecha_ingreso from nuevocosto_estimadoobra_lobby where cr ='" & cr & "' and   componente like 'Otros') UNION (select a.CLAVE_SAP_CONCURSO,a.clave_sap_zona, b.DESCRIPCION_CORTA,a.pu,a.cantidad,b.UND, a.componente, concat(left(a.fecha_ingreso,4),'-',right(left(a.fecha_ingreso,7),2),'-',right(left(a.fecha_ingreso,10),2),' ',right(a.fecha_ingreso,8))  as fecha_ingreso from nuevoCosto_estimadoObra_lobby a LEFT JOIN cat_sap_atms_2017 b on a.CLAVE_SAP_CONCURSO=b.CLAVE_SAP_CONCURSO  where cr ='" & cr & "' AND  A.componente like 'ATMS') order by fecha_ingreso desc limit 5;"
rs25.open sql,conn5
if rs25.eof then
regresa=regresa & "<tr><td colspan='5'>A&uacute;n no se han cargado elementos para esta obra</td></tr>"
else
while not(rs25.eof)
regresa=regresa & "<tr><td align='center'>" & rs25("clave_sap_concurso") & "</td><td align='center'>" & rs25("clave_sap_zona") & "</td><td align='center'><font size='-3'>" & rs25("DESCRIPCION_CORTA") & "</font></td><td align='center'>$" & rs25("pu") & "</td><td align='center'>" & rs25("cantidad")  & "</td><td align='center'>" & rs25("und")  & "</td><td align='right'>" & formatoPesos(rs25("pu") *  rs25("cantidad"))   & "</td><td align='center'><font size='-3'>" & rs25("componente")   & "</font></td><td align='center'>" & rs25("fecha_ingreso") & "</td></tr>"
rs25.movenext 
wend
end if
rs25.close
conn5.close 
set rs25=nothing
set conn5=nothing
regresa=regresa & "</table>"

regresa=regresa & "</div>"
regresa=regresa & "</div>"
regresa=regresa & "<br/>"
regresa=regresa & "<br/>"

response.Write(regresa)
%>

