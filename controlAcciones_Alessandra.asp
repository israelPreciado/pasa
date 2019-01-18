
<!--#include file="funcion3/funcion.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Obras</title>
<link href="css4/style.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<link href="css4/login.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css4/animate.css">
<link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
<link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />
<style>
a.one:link {color:#fff;}
a.one:visited {color:#fff;}
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
function cerrar(){
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

    
    <table cellspacing="0">
     <tr>
      <td rowspan="2" width="40%"><img src="images/logos/banorte.png" width="80%"/></td>
      <td rowspan="2" align="left"><p style="background-color: transparent"><strong><img src="images/logos/xgos.png"/></strong></p></td>
      <td width="30%" bgcolor="#90191c" style="padding-left:3%" colspan="2"><p style="background-color: transparent"><font color="#FFFFFF"><strong><%=server.HTMLEncode(session.Contents("nombre_usuario"))%></strong></font></p></a></td>
     </tr>
      <tr>
      <td  bgcolor="#90191c"  style="padding-left:3%"><p style="background-color: transparent"><font color="#FFFFFF"; size="-1"><strong>Perfil:<%=buscaPerfil(session.Contents("xmd"))%></strong></font></p></td>
	  <td  bgcolor="#90191c" align="right"><p style="background-color: transparent"><font color="#FFFFFF" style="font-size:150%"><strong><a href="cerrar_sesion.asp" class="one" id="cerrar" target = "general" style="text-decoration:none"><span class="icon-exit" onclick="cerrar()"></span></a></strong></font></p></td>
     </tr>
    </table>
    <div id="barrasuperior">
      <table><tr><td><a class="a" href="#" style="padding-left:55%;"><span></span></a></td></tr></table>
    </div>
<a href="cerrar_sesion.asp" id="cerrar" target = "general" style="display:none"></a>


</form> 

</body>
</html>
