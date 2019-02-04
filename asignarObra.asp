<!--#include file="funcion3/funcion.inc"-->
<!--#include file="funcion3/funcion_edicion_usuarios.inc"-->
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <link href="style.css" rel="stylesheet" type="text/css">
  <link href="css3/loginAgregarUsuarios.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="css3/animate.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
  <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <style>

.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 50%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);

}
.modal-content2 {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 100%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);

}
/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}
  .modal-header, h4 {
      background-color: #90191c;
      color:white !important;
      text-align: center;
      font-size: 20px;
  }
  .modal-footer {
      background-color: #fcbdbd;
	  color:#90191c !important;
	  text-align: center;
      font-size:15px;
  }
  </style>
  <style>
/* fin loader */
.loader {
  border: 6px solid #fcbdbd;
  border-radius: 50%;
  border-top: 6px solid #90191c;
  border-bottom: 6px solid #90191c;
  width: 30px;
  height: 30px;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
  /*fin  loader */ 
.datagrid table { border-collapse: collapse; text-align: left; width: 100%; } .datagrid {font: normal 12px/150% Arial, Helvetica, sans-serif; background: #fff; overflow: hidden; border: 1px solid #991821; -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; }.datagrid table td, .datagrid table th { padding: 3px 10px; }.datagrid table thead th {background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #991821), color-stop(1, #80141C) );background:-moz-linear-gradient( center top, #991821 5%, #80141C 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#991821', endColorstr='#80141C');background-color:#991821; color:#FFFFFF; font-size: 15px; font-weight: bold; border-left: 1px solid #B01C26; } .datagrid table thead th:first-child { border: none; }.datagrid table tbody td { color: #80141C; border-left: 1px solid #F7CDCD;font-size: 12px;font-weight: normal; }.datagrid table tbody .alt td { background: #F7CDCD; color: #80141C; }.datagrid table tbody td:first-child { border-left: none; }.datagrid table tbody tr:last-child td { border-bottom: none; }.datagrid table tfoot td div { border-top: 1px solid #991821;background: #F7CDCD;} .datagrid table tfoot td { padding: 0; font-size: 12px } .datagrid table tfoot td div{ padding: 2px; }.datagrid table tfoot td ul { margin: 0; padding:0; list-style: none; text-align: right; }.datagrid table tfoot  li { display: inline; }.datagrid table tfoot li a { text-decoration: none; display: inline-block;  padding: 2px 8px; margin: 1px;color: #FFFFFF;border: 1px solid #991821;-webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #991821), color-stop(1, #80141C) );background:-moz-linear-gradient( center top, #991821 5%, #80141C 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#991821', endColorstr='#80141C');background-color:#991821; }.datagrid table tfoot ul.active, .datagrid table tfoot ul a:hover { text-decoration: none;border-color: #80141C; color: #FFFFFF; background: none; background-color:#991821;}div.dhtmlx_window_active, div.dhx_modal_cover_dv { position: fixed !important; }
</style>
<script language="javascript"> 

function cambiarClase(id){
	$(document.getElementById(id)).addClass('animated zoomIn').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
			function(){
				$(this).removeClass('animated zoomIn');
        });
}

function showDetalleAvance(cr){
	document.getElementById('loader').style.display="block"
	detAvanceDetalle(cr)
	document.getElementById('detalleAvance').style.display="block";
	cambiarClase("detalleAvance")
	
}
function showDetallePendientes(cr){
	document.getElementById('loader').style.display="block"
	detSearchPendientes(cr)
	document.getElementById('detallePendientes').style.display="block";
	cambiarClase("detallePendientes")
	
}
function regresar(){
	document.getElementById('frm_revisarAvance').action="controlAcciones_asignarObraStep2.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}
function detComp(cr,modulo){

	$.ajax({
	type: "GET",
	url: "searchAvancePorModulo.asp?cr=" + cr + "&id_modulo=" + modulo, 
	dataType: "html", 
	success: function(response){ 
	$("#myModal").html(response);
	//document.getElementById('loader').style.display="none"
	showModal2()
	}
  });

}
 
  function detAvanceDetalle(cr){

	$.ajax({
	type: "GET",
	url: "calcula_avanceDetalle.asp?cr=" + cr, 
	dataType: "html", 
	success: function(response){ 
	$("#detalleAvance").html(response);
	document.getElementById('loader').style.display="none"
	}
  });

}
 function detCargaFotos(cr){

	$.ajax({
	type: "GET",
	url: "carga_fotos.asp?cr=" + cr, 
	dataType: "html", 
	success: function(response){ 
	$("#modalFotos").html(response);
	document.getElementById('loader').style.display="none"
	showModalFotos2()
	simulateClick(document.getElementById('next'))
	}
  });

}
function detSearchPendientes(cr){

	$.ajax({
	type: "GET",
	url: "searchPendientes.asp?cr=" + cr, 
	dataType: "html", 
	success: function(response){ 
	$("#detallePendientes").html(response);
	document.getElementById('loader').style.display="none"
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
function showPendientes(estado,id){
	if(estado==1){
		document.getElementById('detallePendientes'+id).style.display="block"
		document.getElementById('spanOculta'+id).style.display="block"
		document.getElementById('spanMuestra' + id).style.display="none" 
	}
	else{
		document.getElementById('detallePendientes'+id).style.display="none"
		document.getElementById('spanOculta'+id).style.display="none"
		document.getElementById('spanMuestra' + id).style.display="block" 
	}
	}
	function soloNumeros(e){
	var key = window.Event ? e.which : e.keyCode
	return (key >= 48 && key <= 57)
}
function validar(){
	if (document.getElementById('select_cr').value.length<4){
		simulateClick(document.getElementById('alert'))	
		document.getElementById('select_cr').focus();
		return false
	}
	else{
		return true
	}
}
function showErr(){
	simulateClick(document.getElementById('err'))
}
</script>
  <script src="js/jQueryRotate.js"></script>
  <script>
  function rotarImagen(imagen,angulo){
    $("#"+imagen).rotate({angle:parseInt(angulo)+90})
	document.getElementById('angulo').value=parseInt(angulo)+90	
}

  </script>
<%
estatus1=request("hddn_estatus1")
estatus2=request("hddn_estatus2")
territorial=request("hddn_territorial")
%>
</head>
<%if request("err")="InsertError" then%>
<body onLoad="showErr()">
<%else%>
<body>
<%end if%>
<form name="frm_revisarAvance" id="frm_revisarAvance" method="post">
<div class="animated zoomIn">
<table width='50%' align='center' cellspacing='0'>
	<h1 align='center'><font color='#991821'><strong>Asignacion de Obra</strong></font></h1>
</table>

	<div id="asignarObra">
		<table width="80%" align="center">
 			<tr><td>
				<div class="datagrid">
					<table>
						<thead><tr><th>CR</th><th>Tipo de Transformaci&oacute;n</th><th>Contratista Asignado</th><th>Supervisor Asignado</th></tr></thead>
						<tbody>
							<tr><td><font color="#000000"><%=cargaCRsAsignar()%></font></td><td><font color="#000000"><%=cargaTipoTransformacion()%></font></td><td><font color="#000000"><%=cargaContratistas(0)%></font></td><td><font color="#000000"><%=cargaSupervisores()%></font></td></tr>
						</tbody>
					</table>
                </div>    
			</td></tr>
		</table>
	</div> 
<br/>
   <table width="40%" align="center">
     <tr>
     <td width="10%">&nbsp;</td>
      <td width="20%"><input  type="button" value="Regresar" onclick="regresar()" name="btnEnviar" /></td>
      <td width="10%">&nbsp;</td>
      <td width="20%"><input  type="button" value="Guardar" onclick="validaFormulario('asignarObra')" name="btnEnviar" /></td>
     </tr>
    </table>
  <br/>
<br/>

	<a href="#" id="alert4" style="display:none"></a>
      <a href="#" id="alert2" style="display:none">&nbsp;</a>
      <a href="#" id="alert3" style="display:none">&nbsp;</a>
      <a href="#" id="errorC" style="display:none">&nbsp;</a>
      <a href="#" id="errorU" style="display:none">&nbsp;</a>
      <a href="#" id="errorEC" style="display:none">&nbsp;</a>
      <a href="#" id="errorEU" style="display:none">&nbsp;</a>
      <a href="#" id="ok" style="display:none">&nbsp;</a>
      <a href="#" id="alert" style="display:none">&nbsp;</a>
      <a href="#" id="err" style="display:none">&nbsp;</a>
      <a href="#" id="confirm2" style="display:none">&nbsp;</a>
      <a href="#" id="confirmDelete" style="display:none">&nbsp;</a>
      </div>
</form>



<script>		
function recorreElementos(div,tipoElemento){
	var elemento = document.getElementById(div).getElementsByTagName(tipoElemento);
	var bandera=false
	for (var i=0; i<elemento.length; i++){
		if (elemento[i].type!="hidden"){
			if (elemento[i].type=="text"){
				if (!validar2(elemento[i].name)){
					bandera=false
					break;
				}
				else{
					bandera=true
				}
			}
		}
	}
return bandera
}


function recorreSelect(div){
	var elemento = document.getElementById(div).getElementsByTagName('select');
	var bandera=false
	for (var i=0; i<elemento.length; i++){
		if (elemento[i].type!="hidden"){
			if (valor_select(elemento[i].name)==0){
				bandera=false
				//alert('tripas')
				simulateClick(document.getElementById('alert3'))	
				document.getElementById(elemento[i].name).focus();
				break;
			}
			else{
				bandera=true
			}
		}
	}
	return bandera
}
function validaFormulario(tabla){
	if (recorreElementos('asignarObra','input')){
			if (recorreSelect(tabla)){
			//document.getElementById('form_edicion_usuarios').action="insertUsuario.asp"
			//document.getElementById('form_edicion_usuarios').submit()
				if(validar()){
					document.getElementById('frm_revisarAvance').action="insertAsignarObra.asp"
					document.getElementById("frm_revisarAvance").method="get"
					document.getElementById("frm_revisarAvance").submit()
				}
			}
		
		
	}
//return bandera

//eturn bandera
	
}

function isValidEmail(mail)
{
    return /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(mail);
}

function valor_select(nombre_select){
	var opcion=0
	var elemento=0
	opcion = document.getElementById(nombre_select).options;	
	indexSeleccionado=document.getElementById(nombre_select).selectedIndex;
	return indexSeleccionado;	
	}
	
function validar2(cajaTexto){	
	familia=document.getElementById(cajaTexto).value;
	if (familia.length == 0 || /^\s+$/.test(familia)){
		simulateClick(document.getElementById('alert4'))
		//alert('aguanta')	
		document.getElementById(cajaTexto).value=""
		document.getElementById(cajaTexto).focus();
		return false
	}
	else
	{
		if (/^[0-9a-zA-Z\sñÑ.()-]+$/.test(familia)){
			return true
		}
		else
		{
			simulateClick(document.getElementById('alert2'))	
			//alert('simo')
			document.getElementById(cajaTexto).focus();
			return false
		}		
	}
}	
	</script>
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
			//$("#footer").html(document.getElementById('zonaFoto').value);
			alertify.alert("El CR debe ser de 4 Digitos");
			return false;
		});
		$("#alert2").on( 'click', function () {
	reset();
	alertify.alert("No se pueden incluir caracteres especiales");
	return false;
  });
  $("#alert4").on( 'click', function () {
	reset();
	alertify.alert("Todos los campos son obligatorios");
	return false;
  });	
  $("#alert3").on( 'click', function () {
	reset();
	alertify.alert("Tienes que elegir una opcion");
	return false;
  });	
  $("#ok").on( 'click', function () {
			reset();
			//$("#footer").html(document.getElementById('zonaFoto').value);
			alertify.success("Usuario Registrado con Exito");
			return false;
		});
		$("#err").on( 'click', function () {
			reset();
			//$("#footer").html(document.getElementById('zonaFoto').value);
			alertify.error("No se pudo asignar la obra, vuelva a intentarlo");
			return false;
		});
		$("#errorC").on( 'click', function () {
			reset();
			//$("#footer").html(document.getElementById('zonaFoto').value);
			alertify.success("Error al Guardar Contratista, intente de nuevo");
			return false;
		});
		$("#errorU").on( 'click', function () {
			reset();
			//$("#footer").html(document.getElementById('zonaFoto').value);
			alertify.success("Error al Guardar Usuario, intente de nuevo");
			return false;
		});
		$("#errorEC").on( 'click', function () {
			reset();
			//$("#footer").html(document.getElementById('zonaFoto').value);
			alertify.success("Error al Actualizar Contratista, intente de nuevo");
			return false;
		});
		$("#errorEU").on( 'click', function () {
			reset();
			//$("#footer").html(document.getElementById('zonaFoto').value);
			alertify.success("Error al Actualizar Usuario, intente de nuevo");
			return false;
		});
		 $("#confirm").on( 'click', function () {
			reset();
			alertify.confirm("¿ESTAS SEGURO DE REGRESAR, LOS CAMBIOS NO GUARDADOS SE PERDERAN?", function (e) {
				if (e) {
				limpiarElementos('tabla_agregarUsuario','input')

					show(1)
					return true;
				}
			});
			return false;
		});
		 $("#confirm2").on( 'click', function () {
			reset();
			alertify.confirm("¿ESTAS SEGURO DE REGRESAR, LOS CAMBIOS NO GUARDADOS SE PERDERAN?", function (e) {
				if (e) {
				limpiarElementos('tabla_editarUsuario','input')

					show(1)
					return true;
				}
			});
			return false;
		});
		$("#confirmDelete").on( 'click', function () {
			reset();
			alertify.confirm("¿ESTAS SEGURO DE ELIMINAR A ESTE USUARIO, ESTA ACCION NO SE PUEDE REVERTIR?", function (e) {
				if (e) {
				    deleteUser(document.getElementById('temp1').value,document.getElementById('temp2').value)
	
					return true;
				}
			});
			return false;
		});

	</script>
</body>
</html>
