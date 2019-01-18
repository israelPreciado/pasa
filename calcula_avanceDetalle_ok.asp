<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
cr=request("cr")
modulo1=0
modulo2=0
modulo3=0
modulo4=0
modulo5=0
modulo6=0
modulo7=0
modulo8=0
promedio1=0
promedio2=0
promedio3=0
promedio4=0
promedio5=0
promedio6=0
promedio7=0
promedio8=0
elementos1=0
elementos2=0
elementos3=0
elementos4=0
elementos5=0
elementos6=0
elementos7=0
elementos8=0

Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
sql="select * from cat_modulos;"
rs.open sql,conn
if rs.eof then
 response.write("NO")
else
  while not (rs.eof)
 set rs2= Server.CreateObject("adodb.recordset")
 sql2="select * from cat_componentes a LEFT JOIN cat_modulos b on a.id_modulo=b.id_modulo where a.id_modulo='" & rs("id_modulo") & "';"
 rs2.open sql2,conn
 if rs2.eof then
  response.write("NO")
 else
  while not (rs2.eof)
  if cint(cuenta(rs2("nameBD"),cr))=1 then
  Select case cint(rs("id_modulo"))
   case 1
	modulo1= modulo1 + cdbl(contenidoCampo(rs2("nameBD"),cr))
    elementos1=elementos1 +1
   case 2
	 modulo2= modulo2 + cdbl(contenidoCampo(rs2("nameBD"),cr))
    elementos2=elementos2 +1
   case 3
	 modulo3= modulo3 + cdbl(contenidoCampo(rs2("nameBD"),cr))
    elementos3=elementos3 +1
	case 4
	modulo4= modulo4 + cdbl(contenidoCampo(rs2("nameBD"),cr))
    elementos4=elementos4 +1
   case 5
	 modulo5= modulo5 + cdbl(contenidoCampo(rs2("nameBD"),cr))
    elementos5=elementos5 +1
   case 6
	 modulo6= modulo6 + cdbl(contenidoCampo(rs2("nameBD"),cr))
    elementos6=elementos6 +1
	case 7
	 modulo7= modulo7 + cdbl(contenidoCampo(rs2("nameBD"),cr))
    elementos7=elementos7 +1
   case 8
	 modulo8= modulo8 + cdbl(contenidoCampo(rs2("nameBD"),cr))
    elementos8=elementos8 +1
End select
  end if
  rs2.movenext
  wend 
 end if
 rs2.close
 set rs2=nothing
 rs.movenext
  wend 
end if

rs.close
conn.close 
set rs=nothing
set conn=nothing
promedio1=round(calculaPromedio(modulo1,elementos1),2)
promedio2=round(calculaPromedio(modulo2,elementos2),2)
promedio3=round(calculaPromedio(modulo3,elementos3),2)
promedio4=round(calculaPromedio(modulo4,elementos4),2)
promedio5=round(calculaPromedio(modulo5,elementos5),2)
promedio6=round(calculaPromedio(modulo6,elementos6),2)
promedio7=round(calculaPromedio(modulo7,elementos7),2)
'promedio8=round(calculaPromedio(modulo8,elementos8),2)
promedioGeneral=round((round((calculaPromedio(modulo1,elementos1)*70)/100,2)+round((calculaPromedio(modulo2,elementos2)*5)/100,2)+round((calculaPromedio(modulo3,elementos3)*5)/100,2)+round((calculaPromedio(modulo4,elementos4)*5)/100,2)+round((calculaPromedio(modulo5,elementos5)*5)/100,2)+round((calculaPromedio(modulo6,elementos6)*5)/100,2)+round((calculaPromedio(modulo7,elementos7)*5)/100,2)),2)

regresar= "<table width='80%' align='center'>"
regresar=regresar & " <tr><td height='84'>"
regresar=regresar & "<div class='datagrid'>"
regresar=regresar & "   <table width='100%'>"
regresar=regresar & "   <tr>"
regresar=regresar & "      <td width='1%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='4%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='4%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='6%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='8%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='7%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='11%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='5%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='3%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='4%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='4%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='4%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='15%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='8%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='8%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td width='8%' style='border:hidden'>&nbsp;</td>"
regresar=regresar & "    </tr>  "
regresar=regresar & "    <tr>"
regresar=regresar & "      <td style='border:hidden' colspan='15'><font size='+3' color='#000000'><strong>"& cr &" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" & buscaSucursal(cr) & "</strong></font></td>"
regresar=regresar & "    </tr>  "
regresar=regresar & "    <tr>  "
regresar=regresar & "      <td style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td style='border:hidden' colspan='4'><p><font color='#000000'><strong>Avance General " & promedioGeneral & "%</strong></font></p></td>"
regresar=regresar & "      <td style='border:hidden' colspan='2'  valign='top'>" & buscaSemaforo(cr) & "</td>"
regresar=regresar & "      <td style='border:hidden' colspan='2'>&nbsp;</td>"
'regresar=regresar & "      <td style='border:hidden' colspan='4'><input  type='button' value='Ver Fotograf&iacute;as' onclick='showModalFotos("""& cr & """)' name='btnEnviar' /></td>"
regresar=regresar & "      <td style='border:hidden' colspan='4'><input  type='button' value='Ver Fotograf&iacute;as' onclick='showModalAlbum2("""& cr & """)' name='btnEnviar' /></td>"
if isEmpty(session.contents("gerente")) then
regresar=regresar & "      <td style='border:hidden' colspan='3'><input  type='button' value='Generar Pendiente' onclick='detSearchPendientesASupervisor("""& cr & """)' name='btnEnviar' /></td>"
end if
regresar=regresar & "     </tr>"
regresar=regresar & "     <tr>  "
regresar=regresar & "      <td style='border:hidden' colspan='12' height='20px'>&nbsp;</td>"
regresar=regresar & "     </tr>"
regresar=regresar & "     <tr>  "
regresar=regresar & "      <td style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td style='border:hidden' onClick='showModal(""" & cr & """,""1"")'><font size='+2'><span class='icon-search'></span></font></td>"
regresar=regresar & "      <td style='border:hidden' colspan='3'><p><font color='#000000'><strong>Obra Civil</strong></font></p></td>"
regresar=regresar & "      <td style='border:hidden'><p><font color='#000000'><strong>" & promedio1 & "%</strong></font></p></td>"
regresar=regresar & "      <td style='border:hidden' colspan='2'><img class='semaforo' src='images/indicadores/verde.png'/></td>"
regresar=regresar & "      <td style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td style='border:hidden' onClick='showModal(""" & cr & """,""5"")'><font size='+2'><span class='icon-search'></span></font></td>"
regresar=regresar & "      <td style='border:hidden' colspan='3'><p><font color='#000000'><strong>Suministros</strong></font></p></td>"
regresar=regresar & "      <td style='border:hidden'><p><font color='#000000'><strong>" & promedio5 & " %</strong></font></p></td>"
regresar=regresar & "      <td style='border:hidden' colspan='2'><img class='semaforo' src='images/indicadores/verde.png'/></td>"
regresar=regresar & "     </tr>"
regresar=regresar & "     <tr>  "
regresar=regresar & "      <td style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td style='border:hidden' onClick='showModal(""" & cr & """,""2"")'><font size='+2'><span class='icon-search'></span></font></td>"
regresar=regresar & "      <td style='border:hidden' colspan='3'><p><font color='#000000'><strong>Viniles</strong></font></p></td>"
regresar=regresar & "      <td style='border:hidden'><p><font color='#000000'><strong>" & promedio2 & " %</strong></font></p></td>"
regresar=regresar & "      <td style='border:hidden' colspan='2'><img class='semaforo' src='images/indicadores/verde.png'/></td>"
regresar=regresar & "      <td style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td style='border:hidden' onClick='showModal(""" & cr & """,""6"")'><font size='+2'><span class='icon-search'></span></font></td>"
regresar=regresar & "      <td style='border:hidden' colspan='3'><p><font color='#000000'><strong>Se&ntilde;alizaci&oacute;n Ext</strong></font></p></td>"
regresar=regresar & "      <td style='border:hidden'><p><font color='#000000'><strong>" & promedio6 & " %</strong></font></p></td>"
regresar=regresar & "      <td style='border:hidden' colspan='2'><img class='semaforo' src='images/indicadores/verde.png'/></td>"
regresar=regresar & "     </tr>"
regresar=regresar & "     <tr>  "
regresar=regresar & "      <td style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td style='border:hidden'  onClick='showModal(""" & cr & """,""3"")'><font size='+2'><span class='icon-search'></span></font></td>"
regresar=regresar & "      <td style='border:hidden' colspan='3'><p><font color='#000000'><strong>ATMs</strong></font></p></td>"
regresar=regresar & "      <td style='border:hidden'><p><font color='#000000'><strong>" & promedio3 & " %</strong></font></p></td>"
regresar=regresar & "      <td style='border:hidden' colspan='2'><img class='semaforo' src='images/indicadores/verde.png'/></td>"
regresar=regresar & "      <td style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td style='border:hidden' onClick='showModal(""" & cr & """,""7"")'><font size='+2'><span class='icon-search'></span></font></td>"
regresar=regresar & "      <td style='border:hidden' colspan='3'><p><font color='#000000'><strong>Sistemas Instalaci&oacute;n</strong></font></p></td>"
regresar=regresar & "      <td style='border:hidden'><p><font color='#000000'><strong>" & promedio7 & " %</strong></font></p></td>"
regresar=regresar & "      <td style='border:hidden' colspan='2'><img class='semaforo' src='images/indicadores/verde.png'/></td>"
regresar=regresar & "     </tr>"
regresar=regresar & "     <tr>  "
regresar=regresar & "      <td style='border:hidden'>&nbsp;</td>"
regresar=regresar & "      <td style='border:hidden' onClick='showModal(""" & cr & """,""4"")'><font size='+2'><span class='icon-search'></span></font></td>"
regresar=regresar & "      <td style='border:hidden' colspan='3'><p><font color='#000000'><strong>Seguridad</strong></font></p></td>"
regresar=regresar & "      <td style='border:hidden'><p><font color='#000000'><strong>" & promedio4 & " %</strong></font></p></td>"
regresar=regresar & "      <td style='border:hidden' colspan='2'><img class='semaforo' src='images/indicadores/verde.png'/></td>"
regresar=regresar & "      <td style='border:hidden'>&nbsp;</td>"

regresar=regresar & "    </table>"
regresar=regresar & "</div>"
regresar=regresar & "</td></tr></table>"


response.Write(regresar)
%>
