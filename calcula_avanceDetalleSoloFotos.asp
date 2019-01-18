<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
cr=request("cr")



regresar= "<table width='30%' align='center'>"
regresar=regresar & " <tr><td height='84'>"
regresar=regresar & "<div class='datagrid'>"
regresar=regresar & "   <table width='100%'>"
regresar=regresar & "   <tr>"
regresar=regresar & "      <td width='1%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='4%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='4%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='1%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='4%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='4%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='4%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "    </tr>  "
regresar=regresar & "    <tr>"
regresar=regresar & "      <td style='border:hidden' colspan='7'><font size='+1' color='#000000'><strong>"& cr &" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" & buscaSucursal(cr) & "</strong></font></td>"
regresar=regresar & "    </tr>  "
regresar=regresar & "    <tr>  "
regresar=regresar & "      <td style='border:hidden'>&nbsp;</td>"
'regresar=regresar & "      <td style='border:hidden' colspan='4'><input  type='button' value='Ver Fotograf&iacute;as' onclick='showModalFotos("""& cr & """)' name='btnEnviar' /></td>"
regresar=regresar & "      <td style='border:hidden' colspan='2' ><input  type='button' value='Ver Fotograf&iacute;as' onclick='showModalAlbum2("""& cr & """)' name='btnEnviar' /></td>"
regresar=regresar & "      <td style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td style='border:hidden' colspan='2' ><input  type='button' value='Ver Pendientes' onclick='verPendientes("""& cr & """)' name='btnEnviar' /></td>"
regresar=regresar & "     </tr>"
regresar=regresar & "    </table>"
regresar=regresar & "</div>"
regresar=regresar & "</td></tr></table>"


response.Write(regresar)
%>
