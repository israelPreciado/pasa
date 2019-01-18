<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
cr=request("cr")
regresa=""
regresa=regresa & "<table width='80%' align='center'>"
regresa=regresa & " <tr><td height='84'>"
regresa=regresa & "<div class='datagrid'>"
regresa=regresa & "   <table width='100%'> "
regresa=regresa & "     <tr>"
regresa=regresa & "      <td width='8%' style='border:hidden' height='10px'>&nbsp;</font></td>"
regresa=regresa & "      <td width='25%' style='border:hidden' height='10px'>&nbsp;</font></td>"
regresa=regresa & "      <td width='5%' style='border:hidden' height='10px'>&nbsp;</font></td>"
regresa=regresa & "      <td width='5%' style='border:hidden' height='10px'>&nbsp;</font></td>"
regresa=regresa & "      <td style='border:hidden' height='10px'>&nbsp;</font></td>"
regresa=regresa & "    </tr> "
regresa=regresa & "    <tr>"
regresa=regresa & "      <td style='border:hidden' colspan='5' valign='middle'><font size='+3' color='#000000'><strong>"& cr &" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" & buscaSucursal(cr) & "</strong></font></td>"
regresa=regresa & "    </tr>  "
regresa=regresa & "    <tr height='30px'>  "
regresa=regresa & "      <td width='8%' style='border:hidden;'>&nbsp;</td>"
regresa=regresa & "      <td style='border:hidden' colspan='2'><font size='+2' color='#000000'><strong>Relaci&oacute;n de Pendientes</strong></font></td>"
regresa=regresa & "      <td width='16%'style='border:hidden'>&nbsp;</td>"
regresa=regresa & "      <td width='28%' style='border:hidden'><input  type='button' value='Ver Fotograf&iacute;as' onclick='showModalFotos()' name='btnEnviar' style='display:none'/></td>"
regresa=regresa & "      <td width='18%' style='border:hidden'>&nbsp;</td>"
regresa=regresa & "     </tr>"
regresa=regresa & "     <tr>"
regresa=regresa & "      <td style='border:hidden' colspan='5' height='10px'>&nbsp;</font></td>"
regresa=regresa & "    </tr>"
set conn10=server.CreateObject("adodb.connection")
set rs10=server.CreateObject("adodb.recordset")
set rs11=server.CreateObject("adodb.recordset")
conn10.open connstr
sql10= "select * from cat_modulos"
rs10.open sql10, conn10
if rs10.eof then
	rs10.close
	conn10.close 
	set rs10=nothing
	set conn10=nothing
else
while not(rs10.eof)
	sql11="SELECT a.*, CASE WHEN b.abiertos IS NULL THEN 0 ELSE b.abiertos END AS abiertos, CASE WHEN c.cerrados IS NULL THEN 0 ELSE c.cerrados END AS cerrados, d.estatus  FROM pendientes a LEFT JOIN( SELECT cr AS cr, count(*) AS abiertos FROM pendientes WHERE cr = '" & cr & "' AND id_modulo = '" & rs10("id_modulo") & "' AND id_estatus = 1) b ON a.cr = b.cr LEFT JOIN( SELECT cr, count(*) AS cerrados FROM pendientes WHERE cr = '" & cr & "' AND id_modulo = '" & rs10("id_modulo") & "' AND id_estatus = 0) c ON a.cr = c.cr LEFT JOIN cat_estatus d ON a.id_estatus = d.id_estatus WHERE a.cr = '" & cr & "' AND a.id_modulo = '" & rs10("id_modulo") & "'  ORDER BY fecha_reporte;"
rs11.open sql11, conn10
	if rs11.eof then
		rs11.close
        
regresa=regresa & "	<tr>"
regresa=regresa & "	 <td style='border:hidden'>&nbsp;</td><td style='border:hidden'><font color='#000000' size='+2'" & server.HTMLEncode(rs10("modulo")) & " </font></td><td align='left'><font size='+2' color='#000000'><span class='con-menu3' onClick='alert(""no hay pendientes"")' id='spanMuestra" & rs10("id_modulo") & "'> </span></font></td>"
regresa=regresa & "  </tr> "
	else
regresa=regresa & " <tr>"
regresa=regresa & "	 <td style='border:hidden'>&nbsp;</td><td style='border:hidden'><font color='#000000' size='+2'>" & server.HTMLEncode(rs10("modulo")) & "</font></td><td align='left'><font size='+2' color='#000000'><span class='icon-menu3' onClick='showPendientes(1,""" & rs10("id_modulo") & """)' id='spanMuestra" & rs10("id_modulo") & "'> </span><span class='icon-menu4' onClick='showPendientes(2,""" & rs10("id_modulo") & """)' id='spanOculta" & rs10("id_modulo") & "' style='display:none'> </span></font></td><td style='border:hidden'><font size='+1'> A (" & rs11("abiertos") & ") &nbsp;&nbsp;&nbsp;&nbsp; T(" & rs11("cerrados") & ") </font></td>"
regresa=regresa & "    </tr>"
regresa=regresa & "    <tr><td style='border:hidden'>&nbsp;</td><td colspan='4'>"
regresa=regresa & "    <div id='detallePendientes" & rs10("id_modulo") & "' style='display:none'><table align='center'>"
	cont=1
	while not(rs11.eof)
regresa=regresa & "   <tr height='20px'>"
regresa=regresa & "       <td colspan='2'><p><font style='font-family:Arial, Helvetica, sans-serif;' size='+1'><strong>" & cont & "." & server.HTMLEncode(rs11("pendiente")) & "</strong></font></p></td>"
regresa=regresa & "     </tr>"
regresa=regresa & "     <tr>"
regresa=regresa & "      <td width='12px'>&nbsp;</td><td style='border:hidden'><p><em><font style='font-family:Arial, Helvetica, sans-serif;' size='+1'>Registrado el: " & rs11("fecha_reporte") & " &nbsp;&nbsp;&nbsp;&nbsp; Estatus: " & rs11("estatus")
if rs11("id_estatus")="0" then
regresa=regresa & " &nbsp;&nbsp;(" & rs11("fecha_finalizacion") & ")"
end if
regresa=regresa & "</font></em></p></td>"
regresa=regresa & "     </tr>"	
cont=cont+1
	rs11.movenext
	wend 
regresa=regresa & "    </table>"
regresa=regresa & "    </div>"
regresa=regresa & "    </td></tr> "
	rs11.close
	end if
rs10.movenext
wend
rs10.close
	conn10.close 
	set rs10=nothing
	set conn10=nothing
end if
regresa=regresa & "    </table>"
regresa=regresa & "    <br/>"
regresa=regresa & "<br/>"
regresa=regresa & "</div>"
regresa=regresa & "</td></tr></table>"
regresa=regresa & "<br/>"
regresa=regresa & "<br/>"
response.write(regresa)
%>