
<!--#include file="funcion/funcion_lobby.inc"-->
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
 function home(){
	document.getElementById('frm_informe_cr').action="inicioSupervisor.asp"
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
  if (document.getElementById('txt_buscar').value.length<2){
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
	document.getElementById('frm_informe_cr').action="detalleCR_lobby.asp"
	sucDet(cr)
 }

function sucDet(cr){

	$.ajax({
	type: "GET",
	url: "searchCR_lobby.asp?cr=" + cr , 
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
<%if isempty(session("nombre_usuario")) then
response.Redirect("default.asp?logout=true")
end if
	estatus1=request("hdd_Enviar")
	estatus2=request("hdd_Enviar2")
	pendientes=request("hdd_Enviar3")
%>
<body>
<form name="frm_informe_cr" id="frm_informe_cr" method="post">
<div id="pagina">
<div id="header">
<div id="logo">  
<p><strong>Modulo de supervisi&oacute;n de Obra</strong></p> 
</div>
    <div id="barrasuperior">
    <table><tr><td width="85%" <%if session.Contents("privilegio")=2 then%>onclick="home()"<%else%>onclick="home2()"<%end if%>><a href="#" style="padding-left:75%"><font style="font-size:200%"><span class="icon-home3"></span></font></a></td><td onclick="exit()"><a href="#" style="padding-left:50%"><font style="font-size:200%"><span class="icon-exit"></span></font></a></td></tr></table>
      &nbsp;
    </div>
</div>
<div align="center" id="menu_inicio">

<p>Bienvenido</p>
<p><font size="+5"><strong><%=server.HTMLEncode(session.Contents("nombre_usuario"))%></strong></font></p>
<p>Perfil: <%=buscaPerfil(session.Contents("xmd"))%></p>


<div id="login">

   <!--<input type="usuario" id="txt_buscar" name="txt_buscar" onkeypress="return soloNumeros(event)" maxlength="4" placeholder="CR a Consultar"/>-->
   <table><tr><td>
   <%=cargaCRAsignadoContratista(session.Contents("contratista"))%>
   </td></tr>
   <tr height="20px"><td>
   &nbsp;
   </td></tr>
   <tr><td>
   <input class="button" type="button" value="Buscar" onclick="validar()" name="btnEnviar"/>
   </td></tr>
   </table>
   <input type="hidden" id="hdd_cr" name="hdd_cr"/>
 
</div>
</div>
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
