
<!--#include file="funcion/funcion.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Obras</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<link href="css/login.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
<link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />
<Script language="javascript">
 function exit(){
	 document.getElementById('frm_informe_cr').action="cerrar_sesion.asp"
	 document.getElementById('frm_informe_cr').submit()
 }
  function enviarDetalleObra(estatus,estatus2,conPsinP){
	 document.getElementById('hdd_Enviar').value=estatus
	 document.getElementById('hdd_Enviar2').value=estatus2
	 document.getElementById('hdd_Enviar3').value=conPsinP
	 document.getElementById('frm_informe_cr').action="detalleObra.asp"
	 document.getElementById('frm_informe_cr').submit()
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
	document.getElementById('frm_informe_cr').action="detalleCR.asp"
	sucDet(cr)
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
		//alert('nega')		
		} 
		else{
			document.getElementById('frm_informe_cr').submit();
	//		alert('afirma')
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

 
</script>

</head>
<%'if isempty(session("nombre_usuario")) then
'response.Redirect("default.asp?logout=true")
'send if

%>
<body>
<form name="frm_informe_cr" id="frm_informe_cr" method="post">
<div id="pagina">
<div id="header">
<div id="logo">  
<p><strong>Modulo de supervisi&oacute;n de Obra</strong></p> 
</div>
    <div id="barrasuperior">
    <table><tr><td width="90%"><a href="#" style="padding-left:90%"><font style="font-size:200%"><span class="icon-exit" onclick="exit()"></span></font></a></td></tr></table>
      &nbsp;
    </div>
</div>
<div align="left" id="menu_inicioC">

<p>Bienvenido</p>
<p><font size="+5"><strong><%=server.HTMLEncode(session.Contents("nombre_usuario"))%></strong></font></p>

</div>

<table width="90%" align="center">
<tr height="80px"><td><p><font size="+3"><strong>Estatus de Obras</strong></font></p></td><td align="center"><p><font size="+5"><strong><%=cint(cuentaPendientesPorEstatus(0,  session.contents("contratista"))) + cint(cuentaPendientesPorEstatus(1,  session.contents("contratista"))) + cint(cuentaPendientesPorEstatus(2, session.contents("contratista"))) + cint(cuentaPendientesPorEstatus(3,session.contents("contratista"))) + cint(cuentaPendientesPorEstatus(4,session.contents("contratista")))%></strong></font></p></td></tr>
 <tr>
  <td width="60%"><input class="botonGrande" type="button" value="Por Iniciar" onclick="enviarDetalleObra('0','0','1')" name="btnEnviar"/></td><td align="center"><p><font size="+5"><strong><%=cuentaPendientesPorEstatus(0, session.contents("contratista"))%></strong></font></p></td>
 </tr>
 <tr height="20px"><td>&nbsp;</td></tr>
 <tr>
  <td width="60%"><input class="botonGrande" type="button" value="En Tiempo" onclick="enviarDetalleObra('1','1','1')" name="btnEnviar"/></td><td align="center"><p><font size="+5"><strong><%=cuentaPendientesPorEstatus(1, session.contents("contratista"))%></strong></font></p></td>
 </tr>
 <tr height="20px"><td>&nbsp;</td></tr>
 <tr>
  <td width="60%"><input class="botonGrande" type="button" value="Con Atraso" onclick="enviarDetalleObra('2','2','1')" name="btnEnviar"/></td><td align="center"><p><font size="+5"><strong><%=cuentaPendientesPorEstatus(2,session.contents("contratista"))%></strong></font></p></td>
 </tr>
 <tr height="20px"><td>&nbsp;</td></tr>
 <tr>
  <td width="60%"><input class="botonGrande" type="button" value="Terminadas" onclick="enviarDetalleObra('3','3','1')" name="btnEnviar"/></td><td align="center"><p><font size="+5"><strong><%=cuentaPendientesPorEstatus(3,session.contents("contratista"))%></strong></font></p></td>
 </tr>
 </tr>
 <tr height="20px"><td>&nbsp;</td></tr>
 <tr>
  <td width="60%"><input class="botonGrande" type="button" value="Suspendidas" onclick="enviarDetalleObra('4','4','1')" name="btnEnviar"/></td><td align="center"><p><font size="+5"><strong><%=cuentaPendientesPorEstatus(4,session.contents("contratista"))%></strong></font></p></td>
 </tr>
 <tr height="40px"><td>&nbsp;</td></tr>
</table>
<br />
 
  <table width="90%" align="center">
  <tr height="80px"><td><p><font size="+3"><strong>Obras con Pendientes </strong></font></p></td><td align="center"><p><font size="+5"><strong><%=cint(cuentaPendientesPorEstatusConPendientes(1,2,session.contents("contratista"))) + cint(cuentaPendientesPorEstatusConPendientes(3,3,session.contents("contratista")))%></strong></font></p></td></tr>
 <tr>
  <td width="60%"><input class="botonGrande" type="button" value="En Proceso" onclick="enviarDetalleObra('2','2','2')" name="btnEnviar"/></td><td align="center"><p><font size="+5"><strong><%=cuentaPendientesPorEstatusConPendientes(1,2,session.contents("contratista"))%></strong></font></p></td>
 </tr>
 <tr height="20px"><td>&nbsp;</td></tr>
 <tr>
  <td width="60%"><input class="botonGrande" type="button" value="Terminadas" onclick="enviarDetalleObra('3','3','2')"  name="btnEnviar"/></td><td align="center"><p><font size="+5"><strong><%=cuentaPendientesPorEstatusConPendientes(3,3,session.contents("contratista"))%></strong></font></p></td>
 </tr>
 <tr height="20px"><td>&nbsp;</td></tr>
</table>
   
   <input type="hidden" id="hdd_Enviar" name="hdd_Enviar"/>
   <input type="hidden" id="hdd_Enviar2" name="hdd_Enviar2"/>
   <input type="hidden" id="hdd_Enviar3" name="hdd_Enviar3"/>
 


</div>
 <a href="#" id="alert" style="display:none"></a>
      <a href="#" id="alert2" style="display:none">&nbsp;</a>
      <a href="#" id="alert3" style="display:none">&nbsp;</a>
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
</body>
</html>
