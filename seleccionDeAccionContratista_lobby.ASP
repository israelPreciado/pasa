
<!--#include file="funcion/funcion.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Obras</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/login.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
<link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />
<Script language="javascript">
 function validar(plan){
	if (plan==1){
		document.getElementById('form_login').action='ModuloSupervisionLobby.asp'
		document.getElementById('form_login').submit();
		
		}
	else{
		document.getElementById('form_login').action='ModuloContratista_lobby.asp'
		document.getElementById('form_login').submit();
		//simulateClick(document.getElementById('alert4'))	
		}
 }
 
 function enter(e){
   tecla = (document.all) ? e.keyCode : e.which;
   if (tecla==13) validar();
 }  
 
 function sucDet(plan){
	$.ajax({
	type: "GET",
	url: "searchPlan.asp?plan=" + plan, 
	dataType: "html", 
	success: function(response){ 
	//$("#dedede").html(response);
	if (response=="NO"){
		simulateClick(document.getElementById('alert'))		
		} 
		else{
		if(response=="1"){
			if (<%=session.contents("privilegio")%>=="1"){
				document.getElementById('form_login').action='ModuloAsignacionObra.asp'
				document.getElementById('form_login').submit();
			}
			else{
				if (<%=session.contents("privilegio")%>=="6"){
				document.getElementById('form_login').action='ModuloAsignacionObraG.asp'
				document.getElementById('form_login').submit();
				}
				else{
				document.getElementById('form_login').action='ModuloSupervisionObra.asp'
				document.getElementById('form_login').submit();
				}
			}
			
		}
		else{
			document.getElementById('form_login').action='../bnrt_2018/default.asp?'
			document.getElementById('form_login').submit();
		}
		}
	}
   });
 }
 function simulateClick(control){
    if (document.all){
        control.click();
    }
    else{
        var evObj = document.createEvent('MouseEvents');
        evObj.initMouseEvent('click', true, true, window, 1, 12, 345, 7, 220, false, false, true, false, 0, null );
        control.dispatchEvent(evObj);
    }
 } 
</script>
<%

%>
</head>
<body>
<form name="form_login" id="form_login" method="post">
<div id="pagina">
  <div id="header">
    <div id="logo">
      <img src="images/logos/banorte.png"/>   
    </div>
    <div id="barrasuperior">
      <table><tr><td><a class="a" href="#" style="padding-left:55%;"><span></span></a></td></tr></table>
    </div>
  </div>
  <div align="center" id="menu_inicio">
    <p><strong>Direcci&oacute;n de Obras</strong></p>
    <p>Modulo de supervisi&oacute;n de Obra</p>
    <div id="login">
	  <input class="button" type="button" value="Estatus Lobbys" onclick="validar(1)" name="btnEnviar" />
	  <input class="button" type="button" value="Alta Catalogo Lobbys" onclick="validar(2)" name="btnEnviar" />
      <input type="hidden" value="true"  name="hddnEnviar"/></td>

      <a href="#" id="alert" style="display:none"></a>
      <a href="#" id="alert2" style="display:none">&nbsp;</a>
      <a href="#" id="alert3" style="display:none">&nbsp;</a>
      <a href="#" id="alert4" style="display:none">&nbsp;</a>
    </div>
  </div>
</div>
</form>    
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
	alertify.alert("<strong>Usuario o Contrase&ntilde;a </strong>  incorrectos!");
	return false;
 });
 $("#alert2").on( 'click', function () {
	reset();
	alertify.alert("El <strong>Usuario</strong> y la <strong>Contrase&ntilde;a</strong> son campos <strong>obligatorios</strong>");
	return false;
	});
 $("#alert3").on( 'click', function () {
	reset();
	alertify.alert("El <strong>CR</strong>  debe ser de <strong>4</strong> digitos");
	return false;
  });	
  $("#alert4").on( 'click', function () {
	reset();
	alertify.alert("Esta area esta en desarrollo");
	return false;
  });		
</script>
</body>
</html>
