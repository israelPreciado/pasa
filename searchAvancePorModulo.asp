<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
cr=request("cr")
id_modulo=request("id_modulo")
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
set rs2= Server.CreateObject("adodb.recordset")
Conn.Open connstr

'seleccionamos la consulta segun el parametro de entrada
	
    sql="select nameBD,componente from cat_componentes where id_modulo='"& id_modulo &"'"
'ejecutamos la consulta
rs.open sql,conn
'si la consula trajo registros
if rs.eof then
'escribimos los encabezados de la tabla
regresar=regresar & " <div class='modal-dialog'>"
regresar=regresar & "<div class='modal-content'>"
regresar=regresar & "<div class='modal-header' style='padding:10px 10px;'>"
regresar=regresar & "<button type='button' class='close' data-dismiss='modal'>&times;</button>"
regresar=regresar & "<h4>ERROR</h4>"
regresar=regresar & "</div>"
regresar=regresar & "<div class='modal-body' style='padding:10px 10px;'>"
regresar=regresar & " <form role='form'>"
regresar=regresar & "<table><tr><td><p>No se encontro la informaci&oacute;n solicitada</p></td></tr></table>"
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
regresar=regresar & " <div class='modal-dialog'>"
regresar=regresar & "<div class='modal-content'>"
regresar=regresar & "<div class='modal-header' style='padding:10px 10px;'>"
regresar=regresar & "<button type='button' class='close' data-dismiss='modal'>&times;</button>"
regresar=regresar & "<h4>"& buscaModulo(id_modulo) & "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" & cr & "</h4>"
regresar=regresar & "</div>"
regresar=regresar & "<div class='modal-body' style='padding:10px 0px;'>"
regresar=regresar & " <form role='form'>"
regresar=regresar & " <div id='detalle2'>"
regresar=regresar & "<table align='center' width='100%'>"
while not(rs.eof)
'dependiendo del parametro de entrada se le llama una funcion que te redirige a la pagina de detalle
sql2="select "& rs("nameBD")  &" as campo from tseguimiento where cr='" & cr & "'"
	rs2.open sql2,conn
		while not(rs2.eof)		
			regresar=regresar & "<tr>"
			regresar=regresar & "<td>" & rs("componente") & "</td>"
			if id_modulo=1 then 
			 if  rs("componente")="Albañileria" then 
			 'regresar=regresar & "<td>1111 %</td>"
			regresar=regresar & "<td>" &  porcentajeAvancePartida(cr,"Alba?ileria")& " %</td>"
			 else 
			 regresar=regresar & "<td>" &  porcentajeAvancePartida(cr,rs("componente"))& " %</td>"
			 'regresar=regresar & "<td>22222 %</td>"
			 end if 
			 'regresar=regresar & "<td>" &  porcentajeAvancePartida(cr,rs("componente"))& " %</td>"
			 regresar=regresar &"</td>"
			else
			if cuenta(rs("nameBD"),cr)="1" then
				if cdbl(rs2("campo"))>=0 then
					regresar=regresar & "<td>" & cdbl(rs2("campo")) * 100  & " %</td>"
				else
					regresar=regresar & "<td align='center'>-</td>"
				end if
			else
				if len(trim(rs2("campo")))=0 or isnull(rs2("campo")) then
					regresar=regresar & "<td align='center'>-</td>"
				else
					regresar=regresar & "<td>" & rs2("campo") & "</td>"
				end if
			end if	
			end if
			regresar=regresar & "</tr>"
		rs2.movenext
		wend
	rs2.close
    
	'response.write(rs("cr"))
rs.movenext
wend
regresar=regresar & "<tr height='10px'><td>&nbsp;</td></tr>"
regresar=regresar & "</div>"
regresar=regresar & "</table>"
regresar=regresar & "</form>"
regresar=regresar & " </div>"
regresar=regresar & "<div class='modal-footer'>"
regresar=regresar & "Detalle de Avance" 
regresar=regresar & "</div>"
regresar=regresar & "</div>"
regresar=regresar & "</div>"
regresar=regresar & "</div> "
	
'seguimos al siguiente registro

'cerramos la tabla y damos un salto de linea	

end if
'cerramos el RecordSet y Cerramos la conexion
rs.close
conn.close 
set rs=nothing
set conn=nothing
set rs2=nothing
response.write(regresar)
%>

