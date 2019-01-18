<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
cr=request("cr")
regresar=""

regresar= regresar & "<table width='80%' align='center' style='display:block'>"
regresar= regresar & "<tr><td><p><strong>Pendientes CR: " & cr & "</strong></p></td><td onclick='cierraDiv()' style='cursor:pointer' title='Cerrar'><strong>X</strong></td><tr>"
regresar= regresar & " <tr><td height='84'>"
regresar= regresar & "<div class='datagrid'>"
regresar= regresar & "   <table width='100%' align='center'>"

set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from pendientes_asupervisor where cr=" & cr
rs2.open sql3, conn3
if rs2.eof then
	rs2.close
	conn3.close 
	set rs2=nothing
	set conn3=nothing
else
	while not(rs2.eof)

regresar= regresar & "   			<tr> "   
regresar= regresar & "      			<td style='border:hidden' width='30%' valign='middle'><img src='images/logos/plus.png' style='display:none' onclick='agregar(" & rs2("id_pendiente")& ")' id='agregar" & rs2("id_pendiente") & "' name='agregar" & rs2("id_pendiente") & "'/>"
regresar= regresar & "					<img src='images/logos/edit.png' onclick='edit(" & rs2("id_pendiente") &")' id='edit" & rs2("id_pendiente") & "' name='edit" & rs2("id_pendiente") & "%' style='display:block'/>"
regresar= regresar & "					<img src='images/logos/update.png' onclick='confirmaSinFotoUpdate(" & rs2("id_pendiente") & ")' id='update" & rs2("id_pendiente") & "' name='update" & rs2("id_pendiente") & "' style='display:none'/></td>"
regresar= regresar & "				<td style='border:hidden' width='50%'><textarea class='area' id='input" & rs2("id_pendiente") & "' name='input" & rs2("id_pendiente") & "' type='text' style='display: block;' value='" & rs2("pendiente") & "' disabled='disabled'>" & rs2("pendiente") & "</textarea></td>"
regresar= regresar & "				<td style='border:hidden' align='left' width='10%' ><a href='#' style='padding-left:55%'><font style='font-size:200%'><span id='imagen" & rs2("id_pendiente") & "' class='icon-image' onclick=""verImagenes('" & rs2("id_pendiente") & "','" & cr & "')""></span></font></a></td>"
regresar= regresar & "				<td style='border:hidden' align='right' width='10%' ><a href='#' style='padding-left:55%'><font style='font-size:200%'><span id='camara" & rs2("id_pendiente") & "' class='icon-camera' onclick=""validar2('" & rs2("id_pendiente") & "')"" style='display:none'></span></font></a></td>"
regresar= regresar & "            </tr>"

	rs2.movenext
	wend 
rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
end if

regresar= regresar & "			<tr> "   
regresar= regresar & "                <td style='border:hidden' width='30%' valign='middle'><img src='images/logos/plus.png' style='display:block' onclick='confirmaSinFoto(5000100,""" & cr & """)' id='agregar5000100' name='agregar5000100'/><img src='images/logos/edit.png' onclick='edit(5000100)' id='edit5000100' name='edit5000100' style='display:none'/><img src='images/logos/update.png' onclick='update(5000100)' id='update5000100' name='update5000100' style='display:none'/></td><td style='border:hidden'><textarea class='area' id='input5000100' name='input5000100' style='overflow:auto;border:solid .3px #e9e9e9;'></textarea></td><td style='border:hidden' onclick=""verImagenes('5000100')""><a href='#' style='padding-left:55%'><font style='font-size:200%'><span id='imagen5000100' class='icon-image' style='display:none'></span></font></a></td><td style='border:hidden' onclick='validar2()'><a href='#' style='padding-left:55%'><font style='font-size:200%'><span id='camara5000100' class='icon-camera'></span></font></a></td>"    
regresar= regresar & "     		</tr>"

For i = 5000101 To 5000103
		
regresar= regresar & "			<tr>  "  
regresar= regresar & "      			<td style='border:hidden' width='30%' valign='middle'><img src='images/logos/plus.png' style='display:none' onclick='agregar(" & i & ")' id='agregar" & i & "' name='agregar" & i & "'/><img src='images/logos/edit.png' onclick='edit(" & i & ")' id='edit" & i & " name='edit" & i & "' style='display:none'/><img src='images/logos/update.png' onclick='update(" & i & ")' id='update" & i & "' style='display:none'/></td><td style='border:hidden'><textarea class='area' id='input" & i & "' name='input" & i & "' type='text' style='display: none;' ></textarea></td><td style='border:hidden' onclick=""verImagenes('" & i & "')""><a href='#' style='padding-left:55%'><font style='font-size:200%'><span id='imagen" & i & "' class='icon-image' style='display:none'></span></font></a></td><td style='border:hidden' onclick='validar2()'><a href='#' style='padding-left:55%'><font style='font-size:200%'><span id='camara" & i & "' class='icon-camera' style='display:none'></span></font></a></td>"
 regresar= regresar & "           </tr>"

next

regresar= regresar & "<tr>"
regresar= regresar & "<td align='center' colspan='2'><input class='botonGrande' type='file' id='fileFotografia' name='fileFotografia' ENCTYPE='multipart/form-data' style='display:none'/></td>"
regresar= regresar & "</tr>"

regresar= regresar & "    </table>"
regresar= regresar & "</div>"
regresar= regresar & "</td></tr></table>"

regresar= regresar & "<br/>"


response.write(regresar)
%>