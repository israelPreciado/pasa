<!--#include file="funcion3/funcion.inc"-->
<!--#include file="funcion3/funcion_edicion_usuarios.inc"-->
<%
response.expires=-1
id=request("id")
perfil=request("perfil")

regresa=""
regresa="<table width='500' align='center' cellspacing='0'>"
regresa=regresa & "<h1 align='center'><font color='#991821'><strong>EDITAR USUARIO</strong></font></h1>"
regresa=regresa & "</table>"
regresa=regresa & "<fieldset style='border:ridge; border-color:#666666; font-size:16px; color:#666' >"
regresa=regresa & "<legend>Informaci&oacute;n Usuario</legend>"
regresa=regresa & "<table width='100%' align='center' cellspacing='0' > "
regresa=regresa & "  <tr bgcolor='#991821'>"
regresa=regresa & "	<td width='15%'  height='42' align='center'><font color='#FFFFFF' size='-1'>USUARIO</font></td>"
regresa=regresa & "    <td width='15%'  height='42' align='center'><font color='#FFFFFF' size='-1'>PASS</font></td>"
regresa=regresa & "    <td width='15%'  height='42' align='center'><font color='#FFFFFF' size='-1'>PERFIL</font></td>"
regresa=regresa & "    <td width='16%'  height='42' align='center'><font color='#FFFFFF' size='-1'>ZONA</font></td>"
regresa=regresa & "    <td width='39%' height='42' align='center'><font color='#FFFFFF' size='-1'>NOMBRE</font></td>"
regresa=regresa & "  </tr>" 

Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
'sql= 'select * from app_bnrt_login where login_id='' & id & '''
sql= "select a.*,b.PERFIL from app_bnrt_login a LEFT JOIN cat_perfil b on a.login_privilegio = b.ID_PERFIL where a.login_id='"& id & "'"
rs.open sql,conn
if rs.eof then

regresa=regresa & "<table width='100%' align='center' cellspacing='0' > "
regresa=regresa & "  <tr bgcolor='#991821'>"
regresa=regresa & "    <td height='42' align='center'><font color='#FFFFFF' size='-1'>NO SE ENCONTRO EL USUARIO SOLICITADO</font></td>"
regresa=regresa & "  </tr>"
regresa=regresa & "</table>"
regresa=regresa & " <br />"
regresa=regresa & "</fieldset>"
regresa=regresa & "</div>"
else
regresa=regresa & "<tr>"
regresa=regresa & "	<td  height='42' align='center'><input type='text' id='txt_login_usuarioEdit' name='txt_login_usuarioEdit' placeholder='M13556D' value='" & rs("login_usuario") & "'/></td>"
regresa=regresa & "	    <td  height='42' align='center'><input type='text' id='txt_login_passEdit' name='txt_login_passEdit' placeholder='M13556D' value='" & rs("login_pass") & "'/></td>"
regresa=regresa & "	    <td  height='42' align='center'><p>" & rs("perfil") & "</p></td>"

if rs("login_privilegio")="7" then
regresa=regresa & "	    <td  height='42' align='center'><p><select id='select_zona' name='select_zona'>"
else
regresa=regresa & "	    <td  height='42' align='center'><p><select id='select_zona' name='select_zona' style='display:none'>"
end if
regresa=regresa & " <option value ='0'>--SELECCION--</option>"
if rs("login_zonaDirector")="1" then
regresa=regresa & " <option value='1' selected='selected'>Zona 1</option>"
else
regresa=regresa & " <option value='1'>Zona 1</option>"
end if
if rs("login_zonaDirector")="2" then
regresa=regresa & " <option value='2' selected='selected'>Zona 2</option>"
else
regresa=regresa & " <option value='2'>Zona 1</option>"
end if
regresa=regresa & "</select></p></td>"
regresa=regresa & "	    <td height='42' align='center'><input type='text' id='txt_login_nombreEdit' name='txt_login_nombreEdit' placeholder='JUAN PEREZ' value='" & server.HTMLEncode(rs("login_nombre").value) & "'/></td>"
regresa=regresa & "    <input type='hidden' id='hdd_id' name='hdd_id' value='" & id & "' /><input type='hidden' id='hdd_perfil' name='hdd_perfil' value='" & perfil & "' />"
regresa=regresa & "  </tr> "	
regresa=regresa & "</table>" 
regresa=regresa & "  <br />"  
regresa=regresa & "    <table width='80%' align='center' class='animated zoomIn'>"
regresa=regresa & "       <tr height='30%'>"
regresa=regresa & "       <td width='10%' height='53'>&nbsp;</td>"
regresa=regresa & "        <td width='30%'><input  type='button' value='Regresar' onclick='confirmar_regreso2()' name='btnEnviar' /></td>"
regresa=regresa & "        <td width='15%'>&nbsp;</td>"
regresa=regresa & "         <td width='30%'><input  type='button' value='Guardar' onclick=""validaFormulario('tabla_editarUsuario','2','109')"" name='btnEnviar' />"
regresa=regresa & "  </td>"
regresa=regresa & "       </tr>"
regresa=regresa & "      </table>"
regresa=regresa & "   <br />"
regresa=regresa & "  </fieldset>"
end if
rs.close
conn.close 
set rs=nothing
set conn=nothing
response.Write(regresa)
%>

