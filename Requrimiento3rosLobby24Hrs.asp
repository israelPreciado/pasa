
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
	
 function home(){
	document.getElementById('frm_modulos').action="inicio.asp"
	document.getElementById('frm_modulos').submit()
}
 function exit(){
	 document.getElementById('frm_modulos').action="cerrar_sesion.asp"
	 document.getElementById('frm_modulos').submit()
 }
 function back(){
	document.getElementById('frm_modulos').action="modulos.asp"
	document.getElementById('frm_modulos').submit()
}
function validar2(elemento){
if(elemento==1){
document.getElementById('fileFotografia1').click()
}
if(elemento==2){
document.getElementById('fileFotografia2').click()
}
if(elemento==3){
document.getElementById('fileFotografia3').click()
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
 function enviar(){
	 if (validarCorreo()){
		if(document.getElementById('fileFotografia1').value=="" || document.getElementById('fileFotografia2').value=="" ){
			
			simulateClick(document.getElementById('alert'))
		}
	 	else{
			//alert(document.getElementById('selectZonas').selectedIndex)
			guardaFoto()		
			//buscaZona(cr,document.getElementById('selectZonas').selectedIndex)
		}
	}
	
 }
 function buscaZona(cr,id_zona){
	$.ajax({
	type: "GET",
	url: "searchZona.asp?cr=" + cr + "&id_zona=" + id_zona , 
	dataType: "html", 
	success: function(response){ 
	//$("#dedede").html(response);
	if (response=="NO"){
		guardaFoto()		
		} 
		else{
			simulateClick(document.getElementById('confirm'))
		}
	}
   });
 }
function guardaFoto(){
	
		if(document.getElementById('fileFotografia1').value=="" || document.getElementById('fileFotografia2').value==""){
			simulateClick(document.getElementById('alert3'))
		}

			else{
				//alert(document.getElementById('hddnZona').value)
				simulateClick(document.getElementById('alert5'))
				document.getElementById('frm_modulos').action="req3ros_guardaFotoLobby24Hrs.asp"
				document.getElementById('frm_modulos').submit()
			}
		
	//document.getElementById('frm_modulos').action="guardaFoto.asp"
	//document.getElementById('frm_modulos').submit()
}
function cargaAlbum(cr){
document.getElementById('tabla_principal').style.display="none"
document.getElementById('tabla_Album').style.display="block"

}
function showModalFotos(cr,dia,mes,anio){
document.getElementById('anio').value=anio
document.getElementById('mes').value=mes
document.getElementById('dia').value=dia
document.getElementById('frm_modulos').action="verImagenesCargadas.asp"
document.getElementById('frm_modulos').submit()
}
 function validarCorreo(){
 familia=document.getElementById('para').value
  if(familia.length == 0 || /^\s+$/.test(familia)){
				simulateClick(document.getElementById('alert3'))	
				document.getElementById('para').focus();
				return false
			}
else{
return true
}
 }
 function cambiaFoto(elemento){
if(elemento==1){
document.getElementById('foto1').value=document.getElementById ('fileFotografia1').value;
}
 if(elemento==2){
document.getElementById('foto2').value=document.getElementById ('fileFotografia2').value;
}
if(elemento==3){
document.getElementById('foto3').value=document.getElementById ('fileFotografia3').value;
}   

 }

</script>
<%'if isempty(session("cr")) then
'response.Redirect("default.asp?logout=true")
'end if%>
<%
modulo=request("hddnEnviar")
'nombreModulo=buscaModulo(modulo)
%>
</head>
<body>
<form name="frm_modulos" id="frm_modulos" method="post" enctype="multipart/form-data">
<div id="pagina">
	<div id="header">
		<div id="logo"> 
			<p><strong>Modulo de supervisi&oacute;n de Obra</strong><p>   
		</div>
		<div id="barrasuperior">
			<table><tr><td width="35%" onclick="back()"><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-arrow-left"></span></font></a></td><td width="35%" onclick="home()"><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-home3"></span></font></a></td><td onclick="exit()"><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-exit"></span></font></a></td></tr></table>
				&nbsp;
		</div>
	</div>
	<div align="center" id="menu_inicio">
		<div id="detalle">
			<table width="100%">
     			<tr>
     			 	<td width="40%"><p>CR: <strong><%=session.Contents("cr")%></strong></p></td>
      				<td><p><strong>Lobby 24 Hrs</strong></p></td>     
     			</tr>
   			 </table>
		</div>
		<br/>
               
		<br />
				  <div id="detalle">
<p style="font-size:150%"><font color="blue">Ingresa el correo a donde llegara la estimacion</font></p>
<p style="font-size:150%"><font color="blue">Para agregar mas destinatarios separalos por comas(,)</font></p>  
<p style="font-size:150%"><font color="blue">Asegurate de escribir los correos correctamente para que estos puedan llegar</font></p>  
<p style="font-size:150%"><font color="blue">Agrega una foto del Lobby </font></p>  	  	  
 </div>
 
 <table width="90%">
 <tr>
  <td style="font-size:100%" width="20%"><p><font color="red">PARA:</font></p></td><td style="font-size:50%"><input type="text" placeholder="correoSupervisor@correo.com, correo2@correo.com" id="para" name="para"></td>
 </tr>
 <tr>
  <td style="font-size:100%" width="20%"><p><font color="red">CC:</font></p></td><td style="font-size:50%"><input type="text" placeholder="correo1@correo.com, correo2@correo.com" id="cc" name="cc"></td>
 </tr>
</table>

<table width="90%">
 <tr>
  <td align="right" onclick="validar2(1)"><p><font color="red"><span class="icon-camera"></span></font></p></td><td style="font-size:50%"><input type="text" id="foto1" name="foto1" placeholder="Elije un archivo FOTO LOBBY" disabled=true></td>
 </tr>
 <tr>
  <td align="right" onclick="validar2(2)"><p><font color="red"><span class="icon-camera"></span></font></p></td><td style="font-size:50%"><input type="text" id="foto2" name="foto2" placeholder="Elije un archivo FOTO DOTACION" disabled=true></td>
 </tr>
 <tr>
  <td align="right" onclick="validar2(3)"><p><font color="red"><span class="icon-camera"></span></font></p></td><td style="font-size:50%"><input type="text" id="foto3" name="foto3" placeholder="Elije un archivo" disabled=true></td>
 </tr>
</table>


		<table width="30%" style="padding-top:10%" id="tabla_principal">
			<tr>
				<td align="center" colspan="1"><input class="botonGrande" type="button" value="ENVIAR" onclick="enviar()" name="btnEnviar"/><input type="hidden"  id="hddnEnviar" name="hddnEnviar" value="<%=modulo%>"/><input type="hidden"  id="hddnZona" name="hddnZona"/><input type="hidden"  id="hddnCR" name="hddnCR" value="<%=session.Contents("cr")%>"/></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input class="botonGrande"  type="file" id="fileFotografia1" name="fileFotografia1" ENCTYPE="multipart/form-data" style="display:none" onchange="cambiaFoto(1)"/></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input class="botonGrande"  type="file" id="fileFotografia2" name="fileFotografia2" ENCTYPE="multipart/form-data" style="display:none" onchange="cambiaFoto(2)"/></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input class="botonGrande"  type="file" id="fileFotografia3" name="fileFotografia3" ENCTYPE="multipart/form-data" style="display:none" onchange="cambiaFoto(3)"/></td>
			</tr>
		</table>
	
		
	</div>
</div>
<input type="hidden" id="dia" name="dia">
<input type="hidden" id="mes" name="mes">
<input type="hidden" id="anio" name="anio">

<a href="#" id="alert" style="display:none"></a>
<a href="#" id="alert2" style="display:none">&nbsp;</a>
<a href="#" id="alert3" style="display:none">&nbsp;</a>
<a href="#" id="alert4" style="display:none">&nbsp;</a>
<a href="#" id="alert5" style="display:none">&nbsp;</a>
<a href="#" id="alert10" style="display:none">&nbsp;</a>
<a href="#" id="confirm" style="display:none">&nbsp;</a>
<!--Fin Sistemas Config-->       
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
			alertify.alert("Debes Ingresar al menos 2 Fotografias (Lobby y Dotacion)");
			return false;
		});
		$("#alert10").on( 'click', function () {
			reset();
			alertify.alert("Debes añadir un comentario");
			return false;
		});
		$("#alert2").on( 'click', function () {
			reset();
			alertify.alert("El elemento no se pudo actualizar");
			return false;
		});
		$("#alert3").on( 'click', function () {
			reset();
			alertify.alert("Debes ingresar al menos 1 destinatario");
			return false;
		});
		$("#alert4").on( 'click', function () {
			reset();
			alertify.alert("Ya existe");
			return false;
		});
		$("#alert5").on( 'click', function () {
			reset();
			alertify.success("Espere un momento...");
			alertify.success("Enviando");
			return false;
		});
		  $("#confirm").on( 'click', function () {
			reset();
			alertify.confirm("Este CR ya contiene una foto para esta zona. ¿Quires reemplazarla?", function (e) {
				if (e) {
					guardaFoto()
					alertify.success("Espere un momento...");
					alertify.success("Guardando");
					return true;
				}
			});
			return false;
		});

		
	</script>
</body>
</html>
