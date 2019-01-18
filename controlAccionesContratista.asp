
<!--#include file="funcion3/funcion.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Obras</title>
<link href="css3/style.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<link href="css3/login.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css3/animate.css">
<link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
<link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />
<style>
a.one:link {color:#fff;}
a.one:visited {color:#Fff;}
a:link {
    text-decoration: none;
	a:link {
    color: white;
}

/* visited link */
a:visited {
    color: white;
}

/* mouse over link */
a:hover {
    color: white;
}

/* selected link */
a:active {
    color: white;
}
}
</style>
<script>
function enviar(id){
	if (id==2){
		simulateClick(document.getElementById('AsignarObra'))
	}
}
  
function cerrar(){
alert('ok')
simulateClick(document.getElementById('cerrar'))
}
   function simulateClick(control){
    if (document.all)
    {
        control.click();
    }
    else
    {
        var evObj = document.createEvent('MouseEvents');
        evObj.initMouseEvent('click', true, true, window, 1, 12, 345, 7, 220, false, false, true, false, 0, null );
        control.dispatchEvent(evObj);
    }
} 
</script>
</head>
<body>
<form name="form_login" id="form_login" method="post">
<div id="pagina">
  <div id="header">
    
    <table cellspacing="0">
     <tr>
      <td width="25%" rowspan="2"><img src="images/logos/banorte.png" /></td>
      <td width="40%"><p><strong>Direcci&oacute;n de Obras</strong></p></td>
      <td bgcolor="#90191c" style="padding-left:3%" colspan="2"><p style="background-color: transparent"><font color="#FFFFFF"><strong><%=server.HTMLEncode(session.Contents("nombre_usuario"))%></strong></font></p></a></td>
     </tr>
      <tr>
      <td width="30%"><p style="background-color: transparent"><strong>Modulo de Asignaci&oacute;n de Obra</strong></p></td>
      <td width="30%" bgcolor="#90191c"  style="padding-left:3%"><p style="background-color: transparent"><font color="#FFFFFF"><strong>Perfil: <%=buscaPerfil(session.Contents("xmd"))%></strong></font></p></td>
	  <td width="30%" bgcolor="#90191c" align="center"><font color="#FFFFFF" style="font-size:150%"><strong><a href="cerrar_sesion.asp" class="one" id="cerrar" target = "general" style="text-decoration:none"><span class="icon-exit" ></span></a></strong></font></td>
     </tr>
    </table>
    <div id="barrasuperior">
      <table><tr><td><a class="a" href="#" style="padding-left:55%;"><span></span></a></td></tr></table>
    </div>
   <table width="40%">
     <tr>
     <td width="10%">&nbsp;</td>
       <td width="20%"><a href="modalTest_sucursalesAsignadasContratista.asp" target = "contenido" style="text-decoration:none"><input  type="button" value="Mis Sucursales"  name="btnEnviar" /></a></td>
      <td width="10%">&nbsp;</td>
     </tr>
    </table> 
  </div>   
      
	 
      <input type="hidden" value="true"  name="hddnEnviar"/></td>
 </div>
<a href="cerrar_sesion.asp" id="cerrar" target = "general" style="display:none"></a>
</form> 

</body>
<script>
 function simulateClick(control){
    if (document.all)
    {
        control.click();
    }
    else
    {
        var evObj = document.createEvent('MouseEvents');
        evObj.initMouseEvent('click', true, true, window, 1, 12, 345, 7, 220, false, false, true, false, 0, null );
        control.dispatchEvent(evObj);
    }
} 
</script>
</html>
