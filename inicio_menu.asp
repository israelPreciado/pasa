<!--#include file="funcion/funcion.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html  lang="en" class="demo-2">
<head>
	<title>Menu</title>
	<link rel="stylesheet" type="text/css" href="estilos.css">
	<link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="css/style_headers.css" />
    <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
	<link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />
    <link href="css/login.css" rel="stylesheet" type="text/css">

	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    
<style>
<style>
		.alertify-log-custom {
			background: blue;
		}
body{
	font-family:Tahoma, Geneva, sans-serif;
}

table.ex1 {
    margin-right:3cm;
}
[class|=top] {
    background: yellow;
}
.tabla_usuarios .container {
	padding:2%;
position: relative;
width:100%;
}

.button{
 width:200px;
 background:#004082;
 display:block;
 margin:0 auto;
 margin-top:10%;
 padding:5px;
 text-align:center;
 text-decoration:none;
 color:#fff;
 
}
</style>

<script>
function cerrar_menu(){
	//$('nav').toggle();
		if (contador==1) {
			$('nav').animate({left:'0'});
			contador=0;
		}else {
			contador=1;
			$('nav').animate({left:'-100%'});

	}
}

function mostrarContenido(div){
	document.getElementById(div).style.display="block";
}
function ocultarContenido(){
	document.getElementById('buscar').style.display="none"
	document.getElementById('general').style.display="none"
	document.getElementById('equipamiento').style.display="none"
	document.getElementById('financiera').style.display="none"
	document.getElementById('mantenimiento').style.display="none"
	document.getElementById('energetica').style.display="none"
	document.getElementById('proyectos').style.display="none"
	document.getElementById('experiencia').style.display="none"
}
function soloNumeros(e){
	var key = window.Event ? e.which : e.keyCode
	if (key == 13){
		enter(e)
	}
	return (key >= 48 && key <= 57)
}
function enter(e) {
  tecla = (document.all) ? e.keyCode : e.which;
  if (tecla==13) validar();
} 

function validar(){
	if (document.getElementById('txt_buscar').value.length<4){
		simulateClick(document.getElementById('alert3'))	
		document.getElementById('txt_buscar').focus();
	}
	else{
		 if (isNaN(document.getElementById('txt_buscar').value * 1)){
			simulateClick(document.getElementById('alert2'))	
			document.getElementById('txt_buscar').value="";
			document.getElementById('txt_buscar').focus();
		}
		else{
			enviar(document.getElementById('txt_buscar').value)		
		}
	}
}
function enviar(cr){
	document.getElementById('hdd_cr').value=cr
	document.getElementById('frm_informe_cr').action="default.asp"
	sucDet(cr)
}
function showInfoAdicional(div){
	if(document.getElementById(div).style.display=="none"){
		document.getElementById(div).style.display="block"
		document.getElementById(div+'_down').style.display="none"
		document.getElementById(div+'_up').style.display="block"
		
	}
	else{
		document.getElementById(div).style.display="none"
		document.getElementById(div+'_down').style.display="block"
		document.getElementById(div+'_up').style.display="none"
	}
}

function sucDet(cr){

	$.ajax({
	type: "GET",
	url: "searchCR.asp?cr=" + cr , 
	dataType: "html", 
	success: function(response){ 
	//$("#dedede").html(response);
	if (response=="NO"){
		simulateClick(document.getElementById('alert'))		
		} 
		else{
			document.getElementById('frm_informe_cr').submit();
		}
	}
  });
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
//funcion para poner estilo a la tabla principal
</script>


<%
cr=request("hdd_cr")
%>
</head>

<%if cr="" then%>
<body onload="mostrarContenido('buscar')">
<%else%>
<body onload="ocultarContenido();mostrarContenido('general')">
<!--<body onload="mostrarContenido('general')">-->
<%end if%>
<form id="frm_informe_cr" name="frm_informe_cr" method="post">
	<header>
		<div class="menu_bar">
			<a href="#" class="bt-menu"><span class="icon-menu2"></span><%if cr="" then%> Men&uacute; <%else%> CR <%=cr%><%end if%></a>
		</div>
		<nav>
			<ul  class="list-menu">
				
                <li onclick="cerrar_menu();<%if cr="" then%>mostrarContenido('buscar')<%else%>ocultarContenido();mostrarContenido('buscar')<%end if%>"><a href="#"><span class="icon-binoculars"></span><font size="+1">Buscar</font></a></li>
                <li onclick="cerrar_menu();<%if cr="" then%>mostrarContenido('buscar')<%else%>ocultarContenido();mostrarContenido('general')<%end if%>"><a href="#" class="bt-menu"><span class="icon-newspaper"></span><font size="+1">Informaci&oacute;n General</font></a></li>
				<li onclick="cerrar_menu();<%if cr="" then%>mostrarContenido('buscar')<%else%>ocultarContenido();mostrarContenido('equipamiento')<%end if%>"><a href="#"><span class="icon-office"></span><font size="+1">Morfolog&iacute;a y Equipamiento</font></a></li>
				
				<li onclick="cerrar_menu();<%if cr="" then%>mostrarContenido('buscar')<%else%>ocultarContenido();mostrarContenido('mantenimiento')<%end if%>"><a href="#"><span class="icon-hammer"></span><font size="+1">Servicios de Mantenimiento</font></a></li>
				<li onclick="cerrar_menu();<%if cr="" then%>mostrarContenido('buscar')<%else%>ocultarContenido();mostrarContenido('energetica')<%end if%>"><a href="#"><span class=" icon-power-cord"></span><font size="+1">Gesti&oacute;n Energetica</font></a></li>
                <li onclick="cerrar_menu();<%if cr="" then%>mostrarContenido('buscar')<%else%>ocultarContenido();mostrarContenido('proyectos')<%end if%>"><a href="#"><span class="icon-calendar"></span><font size="+1">Proyectos 2016</font></a></li>
                <li onclick="cerrar_menu();<%if cr="" then%>mostrarContenido('buscar')<%else%>ocultarContenido();mostrarContenido('experiencia')<%end if%>"><a href="#"><span class="icon-user-tie"></span><font size="+1">Experiencia del Cliente</font></a></li>
                
			</ul>
		</nav>
	</header>
  
<div id="buscar" align="center">
	<section style="padding-top:50">
	 <table align="center">
 	  <tr>
       <td width="50%" colspan="2" valign="baseline" align="center"> 
    	<section class="main">
         <h2>Consultar CR</h2>
        </section>
       </td>
      </tr>
     </table> 
	 <br />
	 <table align="center">
     <div id="login">
      <tr>
       <td height="30px" align="center" width="25%"> <font color="#006699" size="-1"><input type="text" id="txt_buscar" name="txt_buscar" onkeypress="return soloNumeros(event)" width="80%" maxlength="4" placeholder="Introduce un CR"/></font></td>
      </tr>
      <tr>
       <td height="50px"><input type="button" value="Buscar" onclick="validar()" name="btnEnviar"/></td>
      </tr>
      <a href="#" id="alert" style="display:none">&nbsp;</a>
      <a href="#" id="alert2" style="display:none">&nbsp;</a>
      <a href="#" id="alert3" style="display:none">&nbsp;</a>
      </div>
     </table>
	</section>
</div>
<%if not(cr="") then%>
<div id="general" align="center" style="display:none">
	<section style="padding-top:50">
	 <table align="center">
 	  <tr>
       <td width="50%" colspan="2" valign="baseline" align="center"> 
    	<section class="main">
         <h2>Informaci&oacute;n General</h2>
        </section>
       </td>
      </tr>
     </table> 
	 <br />
	 <%=cargaInfGeneral(cr)%>
	</section>
</div>
<div id="equipamiento" align="center" style="display:none">
	<section style="padding-top:50">
	 <table align="center">
 	  <tr>
       <td width="500" colspan="2" valign="baseline" align="center"> 
    	<section class="main">
         <h2>Morfolog&iacute;a y Equipamiento</h2>
        </section>
       </td>
      </tr>
     </table> 
     <br />
     <%=cargaEquipamiento(cr)%>
	</section>
</div>
<div id="financiera" align="center" style="display:none">
	<section style="padding-top:50">
	 <table align="center">
 	  <tr>
       <td width="50%" colspan="2" valign="baseline" align="center"> 
    	<section class="main">
         <h2>Informaci&oacute;n Financiera</h2>
        </section>
       </td>
      </tr>
     </table> 
	 <br />
	 <%=cargaFinanciera(cr)%>
	</section>
</div>
<div id="mantenimiento" align="center" style="display:none">
	<section style="padding-top:50">
	 <table align="center">
 	  <tr>
       <td width="50%" colspan="2" valign="baseline" align="center"> 
    	<section class="main">
         <h2>Servicio de Mantenimiento</h2>
        </section>
       </td>
      </tr>
     </table> 
	 <br />
	 <%=cargaMantenimiento(cr)%>
	</section>
</div>
<div id="energetica" align="center" style="display:none">
	<section style="padding-top:50">
	 <table align="center">
 	  <tr>
       <td width="50%" colspan="2" valign="baseline" align="center"> 
    	<section class="main">
         <h2>Gesti&oacute;n Energetica</h2>
        </section>
       </td>
      </tr>
     </table> 
	 <br />
	 <%=cargaEnergetica(cr)%>
	</section>
</div>
<div id="proyectos" align="center" style="display:none">
	<section style="padding-top:50">
	 <table align="center">
 	  <tr>
       <td width="50%" colspan="2" valign="baseline" align="center"> 
    	<section class="main">
         <h2>Proyectos 2016</h2>
        </section>
       </td>
      </tr>
     </table> 
	 <br />
	 <%=cargaProyectos(cr)%>
	</section>
</div>
<div id="experiencia" align="center" style="display:none">
	<section style="padding-top:50">
	 <table align="center">
 	  <tr>
       <td width="50%" colspan="2" valign="baseline" align="center"> 
    	<section class="main">
         <h2>Experiencia del Cliente</h2>
        </section>
       </td>
      </tr>
     </table> 
	 <br />
	 <%=cargaExperiencia(cr)%>
	</section>
</div>
<%end if%>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="menu.js"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="alertify.js-0.3.11/lib/alertify.min.js"></script>
	<script>
		function reset () {
			$("#toggleCSS").attr("href", "alertify.js-0.3.11/themes/alertify.default.css");
			alertify.set({
				labels : {
					ok     : "OK",
					cancel : "Cancel"
				},
				delay : 5000,
				buttonReverse : false,
				buttonFocus   : "ok"
			});
		}

		// ==============================
		// Standard Dialogs
		$("#alert").on( 'click', function () {
			reset();
			alertify.alert("<strong>CR</strong>  no encontrado!");
			return false;
		});
		$("#alert2").on( 'click', function () {
			reset();
			alertify.alert("El <strong>CR</strong> solo debe contener <strong>numeros</strong>");
			return false;
		});
		$("#alert3").on( 'click', function () {
			reset();
			alertify.alert("El <strong>CR</strong>  debe ser de <strong>4</strong> digitos");
			return false;
		});

		
	</script>
    <input type="hidden" id="hdd_cr" name="hdd_cr"/>
</form>
</body>
</html>
