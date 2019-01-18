<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
cr=request("cr")
dia=request("dia")
mes=request("mes")
anio=request("anio")
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr

'seleccionamos la consulta segun el parametro de entrada
	
    sql="select *, YEAR(fecha) as anio,MONTH(fecha) as mes,day(fecha) as dia, DATE_FORMAT(fecha,'%d/%m/%Y %H:%i:%s')as fechaf, case when a.perfil=2 then d.login_nombre when a.perfil=3 then e.contratista end as SubidoPor, f.PERFIL as subidoPorPerfil from ctrl_fotografias a LEFT JOIN cat_perfil f on a.perfil=f.ID_PERFIL LEFT JOIN app_bnrt_login d on a.usuario=d.login_id LEFT JOIN cat_contratistas e on a.usuario=e.id_contratista LEFT JOIN cat_zonafotografica b on a.id_zona=b.id_zona where cr='"& cr &"' and day(fecha)='"& dia &"' and MONTH(fecha)='"& mes &"' and YEAR(fecha)='"& anio &"'"
'ejecutamos la consulta
rs.open sql,conn
'si la consula trajo registros
if rs.eof then
'escribimos los encabezados de la tabla
regresar=regresar & "<table>"
regresar=regresar & " <div class='modal-dialog'>"
regresar=regresar & "<div class='modal-content'>"
regresar=regresar & "<div class='modal-header' style='padding:10px 10px;'>"
regresar=regresar & "<button type='button' class='close' data-dismiss='modal'>&times;</button>"
regresar=regresar & "<h4>Archivo Fotografico</h4>"
regresar=regresar & "</div>"
regresar=regresar & "<div class='modal-body' style='padding:40px 50px;'>"
regresar=regresar & " <form role='form'>"
regresar=regresar & "<table><tr><td><p>No se han cargado fotos a&uacute;n</p></td></tr></table>"
regresar=regresar & "</form>"
regresar=regresar & " </div>"
regresar=regresar & "<div class='modal-footer'>"
regresar=regresar & "&nbsp;"
regresar=regresar & "</div>"
regresar=regresar & "</div>"
regresar=regresar & "</div>"
regresar=regresar & "</div> "
'mientras el RecorSet no llegue al final se recorre
else
regresar= "<div class='modal-dialog'>"
regresar=regresar & "<div class='modal-content2'>"
regresar=regresar & "<div class='modal-header' style='padding:15px 50px;'>"
regresar=regresar & "<button type='button' class='close' data-dismiss='modal'>&times;</button>"
regresar=regresar & "<h4>Archivo Fotografico " & cr & "</h4>"
regresar=regresar & "</div>"
regresar=regresar & "<div class='modal-body' style='padding:35px 15px;'>"
regresar=regresar & "<div class='w3-content w3-section'>"
while not(rs.eof)
'dependiendo del parametro de entrada se le llama una funcion que te redirige a la pagina de detalle	
	regresar=regresar & "  <img class='mySlides w3-animate-zoom' src='"& rs("path") & rs("name")&"' style='width:100%' name='<P style=""background:transparent""> Zona: "& rs("zona") & "</P><P style=""background:transparent"">Comentarios: " & rs("comentario") & "</P><P style=""background:transparent"">Registrado Por: " & rs("subidoPor") & "</P><P style=""background:transparent""> Fecha de registro: " & rs("fechaf") & " </P><P style=""background:transparent""> Perfil: " & rs("subidoPorPerfil") & " </P>'  id='" & rs("id_foto") & "' onclick='rotarImagen(this.id,document.getElementById(""angulo"").value)'>"
rs.movenext
wend
regresar=regresar & "</div>"
regresar=regresar & "<div class='w3-center'>"
regresar=regresar & "  <div class='w3-section'>"
regresar=regresar & "  <button class='w3-button w3-display-left' onclick='plusDivs(-1)'><font color='#90191c'>&#10094</font></button>"
regresar=regresar & "  <button class='w3-button w3-display-right' onclick='plusDivs(+1)'><font color='#90191c'>&#10095;</font></button>"
regresar=regresar & " <br />"
regresar=regresar & " <br />"
regresar=regresar & "    <button class='w3-button w3-White' id='prev' onclick='plusDivs(-1)'><font color='#90191c'><span class='icon-arrow-left'></span> Prev</font></button>"
regresar=regresar & "    <button class='w3-button w3-White' id='next' onclick='plusDivs(1)'><font color='#90191c'>Next <span class='icon-arrow-right'></span></font></button>"
regresar=regresar & "  </div>"
regresar=regresar & "</div>"

regresar=regresar & "<div class='modal-footer' id='footer'>"
regresar=regresar & "&nbsp;"
regresar=regresar & "</div>"

regresar=regresar & "</div>"
regresar=regresar & "</div> "
regresar=regresar & "</div>"
regresar=regresar & "</table>"	
'seguimos al siguiente registro

'cerramos la tabla y damos un salto de linea	

end if
'cerramos el RecordSet y Cerramos la conexion
rs.close
conn.close 
set rs=nothing
set conn=nothing
response.write(regresar)
%>

