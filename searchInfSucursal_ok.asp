<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
cr=request("cr")

Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr

'seleccionamos la consulta segun el parametro de entrada
	
    sql="select a.cr,a.Sucursal,b.Territorial,a.TipoTransformacion,a.FechaInicio,a.FechaTermino,c.login_nombre,d.contratista from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr LEFT JOIN app_bnrt_login c on a.supervisorasignado=c.login_id LEFT JOIN cat_contratistas d on a.ContratistaAsignado=d.id_contratista where a.cr='" & cr & "'"
'ejecutamos la consulta
rs.open sql,conn
'si la consula trajo registros
if rs.eof then
'escribimos los encabezados de la tabla
regresar="<div class='w3-modal-content w3-card-4'>"
regresar=regresar & "      <header class='w3-container w3-red'> "
regresar=regresar & "        <span onclick='document.getElementById(""myModal"").style.display=""none"""
regresar=regresar & "        class='w3-button w3-display-topright'>&times;</span>"
regresar=regresar & "        <h2>Informaci&oacute;n de la Sucursal</h2>"
regresar=regresar & "      </header>"
regresar=regresar & "      <div class='w3-container'>"
regresar=regresar & "        <p>Error al cargar la Informacion</p>"
regresar=regresar & "      </div>"
regresar=regresar & "    </div>"
regresar=regresar & "  </div>"
regresar=regresar & "</div>"
'mientras el RecorSet no llegue al final se recorre
else
regresar="<div class='w3-modal-content w3-card-4'>"
regresar=regresar & "      <header class='w3-container w3-red'> "
regresar=regresar & "        <span onclick=""document.getElementById('"
regresar=regresar & "myModal"
regresar=regresar & "').style.display='none'"""
regresar=regresar & "        class='w3-button w3-display-topright'>&times;</span>"
regresar=regresar & "        <h2>Informaci&oacute;n de la Sucursal</h2>"
regresar=regresar & "      </header>"
regresar=regresar & "      <div class='w3-container'>"
while not(rs.eof)
'dependiendo del parametro de entrada se le llama una funcion que te redirige a la pagina de detalle	
	regresar=regresar & " <p><strong>CR: </strong>" & rs("cr") &"</p>"
	regresar=regresar & " <p><strong>Sucursal: </strong>" & rs("sucursal") &"</p>"
	regresar=regresar & " <p><strong>Territorial: </strong>" & rs("territorial") &"</p>"
	regresar=regresar & " <p><strong>Tipo de Transformaci&oacuten: </strong>" & rs("tipotransformacion") &"</p>"
	regresar=regresar & " <p><strong>Fecha Inicio: </strong>" & rs("fechainicio") &"</p>"
	regresar=regresar & " <p><strong>Fecha Fin: </strong>" & rs("fechatermino") &"</p>"
	regresar=regresar & " <p><strong>Supervisor: </strong>" & rs("login_nombre") &"</p>"
	regresar=regresar & " <p><strong>Contratista: </strong>" & rs("contratista") &"</p>"
rs.movenext
wend
regresar=regresar & "      </div>"
regresar=regresar & "    </div>"
	
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

