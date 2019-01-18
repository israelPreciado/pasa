<!--#include file="funcion3/funcion.inc"-->
<!--#include file="funcion3/funcion_edicion_usuarios.inc"-->
<!DOCTYPE html>
<html  lang="en"
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <link href="style.css" rel="stylesheet" type="text/css">
  <link href="css3/style.css" rel="stylesheet" type="text/css">

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
input[type="button"]{
 width:106%;
 background:#a40505;
 border:0;
 padding:2%;
 text-wrap:none;
 font-family:'Open Sans',sans-serif;
 font-size:100%;
 color:#fff;
 cursor:pointer;
 transition:background .3s;
 -webkit-transition:background .3s;
  -webkit-appearance: none;
 -webkit-border-radius: 0;
}
input[type="text"]{
 width:100%;
 background:#fff;

 border:1px solid #ccc;

 font-family:'Open Sans',sans-serif;
 font-size:100%;
 color:#555;
}
</style>
<link href="css/calendario.css" type="text/css" rel="stylesheet">
<script src="js/calendar.js" type="text/javascript"></script>
<script src="js/calendar-es.js" type="text/javascript"></script>
<script src="js/calendar-setup.js" type="text/javascript"></script>

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

function detalleAlcances(modulo){
	document.getElementById('modulo').value=modulo
	document.getElementById('frm_revisarAvance').action="editar_detalleAlcances.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}
function regresar(){
	document.getElementById('frm_revisarAvance').action="controlAcciones_asignarObraStep2.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}
function actualizarContratista(){
	document.getElementById('frm_revisarAvance').action="updateContratistaSupervisor.asp"
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
function detHabilitarDeshabilitar(valor){
var campo=document.getElementById('temp1').value
var cr=document.getElementById('temp2').value
	$.ajax({
	type: "GET",
	url: "detHabilitarDeshabilitar.asp?cr=" + cr + "&campo=" + campo + "&valor=" + valor, 
	dataType: "html", 
	success: function(response){ 
	if (response=="err"){
		simulateClick(document.getElementById('error'))	
	}
	else{
		simulateClick(document.getElementById('ok'))
		$("#parrafo" + campo).html(response);
		var control = $('#txt_costo'+campo);
		if (control.is(':visible'))
		{
			document.getElementById('txt_costo'+campo).style.display="none";
			document.getElementById('txt_costo'+campo).value=""
			actualizaCantidad()
			
			document.getElementById('txt_cantidad'+campo).style.display="none";
			document.getElementById('txt_cantidad'+campo).value=""
		}
		else
 		{
			document.getElementById('txt_costo'+campo).style.display="block";
			document.getElementById('txt_cantidad'+campo).style.display="block";
		}
	}
	//document.getElementById('loader').style.display="none"
	//showModal2()
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
function habilitaDeshabilitar(campo,cr,estatus){
	document.getElementById('temp1').value=campo
	document.getElementById('temp2').value=cr
	document.getElementById('temp3').value=estatus
	if(estatus==1){
		simulateClick(document.getElementById('confirmHabilitar'))	
	}
	else{
		simulateClick(document.getElementById('confirmDeshabilitar'))	
	}
}
function soloNumeros(e){
	var key = window.Event ? e.which : e.keyCode
	return (key >= 48 && key <= 57 || key==46 || key ==08 )
}
function validaCantidad(id){
	if(isNaN(document.getElementById(id).value)){ 
		simulateClick(document.getElementById('errNumero'))
		document.getElementById(id).value=""
		document.getElementById(id).focus()
	}
	else{
		actualizaCantidad()
	}
}
function deleteLobby(){
	document.getElementById('frm_revisarAvance').action="deleteLobby.asp"
	simulateClick(document.getElementById('guardando'));
	setTimeout(enviar(),3000)
}
function actualizaCantidad(){
	var elemento = document.getElementById('detalleAlcance').getElementsByTagName('input');
	var costo=""
	var cantidad=""
	var largo=0
	var costoConcepto=0
	var pesos=''
	var tem=0
	var tem2=0
	for (var i=0; i<elemento.length; i++){
		if (elemento[i].type=="text"){  
			costo=elemento[i].name
			if (costo.substring(0, 9)=='txt_costo'){						
				familia=document.getElementById(costo).value;
				if (familia.length == 0 || /^\s+$/.test(familia)){	
					tem=0
					cantidad=elemento[i].name
					largo=cantidad.length
					familia='txt_subTotal' + cantidad.substring(9,largo)
					document.getElementById(familia).innerHTML=""
				} 
				else{ 
					tem=document.getElementById(costo).value
					if(isNaN(tem)){ 
						tem=0
					}		
					cantidad=elemento[i].name
					largo=cantidad.length
					familia='txt_cantidad' + cantidad.substring(9,largo)
					if (familia.length == 0 || /^\s+$/.test(familia)){	
						tem2=0
					} 
					else{
						tem2=document.getElementById(familia).value
						if(isNaN(tem2)){ 
							tem2=0
						}
					}
					tem=tem*tem2
					if(isNaN(tem)){ 
						tem=0
					}
					familia='txt_subTotal' + cantidad.substring(9,largo)
					document.getElementById(familia).innerHTML=parseFloat(tem).toFixed(2)
					costoConcepto=parseFloat(costoConcepto) + parseFloat(tem)
					costoConcepto=costoConcepto.toFixed(2)
					
				} 
			} 
		} 
	}	
	document.getElementById('lblCostoAproximado').innerHTML=pesos.concat('$',formatNumber(costoConcepto))	
}

function formatNumber (num) {
    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
}
function soloNumerosCalendario(e){
	var key = window.Event ? e.which : e.keyCode
	return ((key >= 48 && key <= 57) || key == 45 || key ==08 )
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
id_lobby=request("id_lobby")
cr=request("cr")
id_zona=request("id_zona")
id_territorio=request("id_territorio")
lobby=request("lobby")
num_atms=request("num_atms")
concurso_asignacion_proveedor=request("concurso_asignacion_proveedor")
if concurso_asignacion_proveedor="" then
concurso_asignacion_proveedor=0
else
concurso_asignacion_proveedor=cint(concurso_asignacion_proveedor)
end if
id_proveedor=request("id_proveedor")
if id_proveedor="" then
id_proveedor=0
else
id_proveedor=cint(id_proveedor)
end if
estatus_produccion=request("estatus_produccion")
if estatus_produccion="" then
estatus_produccion=0
else
estatus_produccion=cint(estatus_produccion)
end if
fecha_autorizacion_voboCanales=request("fecha_autorizacion_voboCanales")
estatus_arrendamiento=request("estatus_arrendamiento")
fecha_entrega_local_arrendamiento=request("fecha_entrega_local_arrendamiento")
fecha_entrega_anteproyecto=request("fecha_entrega_anteproyecto")
vobo_canales_anteproyecto=request("vobo_canales_anteproyecto")
estatus_ingenieria=request("estatus_ingenieria")
fecha_entrega_ingenieria=request("fecha_entrega_ingenieria")
estatus_permisos=request("estatus_permisos")
fecha_entrega_comercial=request("fecha_entrega_comercial")
fecha_inicio_obra=request("fecha_inicio_obra")
fecha_termino_obra=request("fecha_termino_obra")
inicio_reprogramado=request("inicio_reprogramado")
fin_reprogramado=request("fin_reprogramado")
actualizacion=request("err")
%>
</head>
<%if actualizacion="ok" then%>
<body onload="actualizaCantidad()">
<%else%>
<body>
<%end if%>
<form name="frm_revisarAvance" id="frm_revisarAvance" method="get">
<div class="animated zoomIn">
	<table width='50%' align='center' cellspacing='0'>
		<h1 align='center'><font color='#991821'><strong>EDICION DE LOBBY <%=lobby%></strong></font></h1>
	</table>




	<table>
    	<tr height="20px">
        	<td width="17%" align="left">
				<div id="detalleAlcanceLobby">
        			<table align="center">
        				<tr>
  							<td><font size="+1"><strong>&nbsp;</strong></font></td>
  						</tr>
  						<tr>
  							<td><font size="+1"><strong>CR</strong></font></td>
  						</tr>
  						<tr>
  							<td align="center"> <input type="text" id="cr" name="cr" value="<%=cr%>"></td>  
 						</tr>
  						<tr>
  							<td><font size="+1"><strong>&nbsp;</strong></font></td>
  						</tr>
  						<tr>
  							<td><font size="+1"><strong>ZONA</strong></font></td>
  						</tr>
  						<tr>
  							<td align="center"> <%=cargaZonas(id_zona)%></td>  
 						</tr>
 						<tr>
  							<td><font size="+1"><strong>&nbsp;</strong></font></td>
  						</tr>
  						<tr>
  							<td><font size="+1"><strong>TERRITORIO</strong></font></td>
  						</tr>
  						<tr>
  							<td align="center"> <%=cargaTerritorial(id_territorio)%></td>  
 						</tr>
 						<tr>
 							<td><font size="+1"><strong>&nbsp;</strong></font></td>
 						</tr>
 						<tr>
 							<td><font size="+1"><strong>NOMBRE LOBBY</strong></font></td>
 						</tr>
 						<tr>
 							<td align="center"> <input type="text" id="nombre" name="nombre" value="<%=lobby%>"></td>  
 						</tr>
 						<tr>
  							<td><font size="+1"><strong>&nbsp;</strong></font></td>
  						</tr>
  						<tr>
  							<td><font size="+1"><strong>NUMERO DE ATMS</strong></font></td>
  						</tr>
  						<tr>
  							<td align="center"> <%=cargaNumeroATMS(num_atms)%></td>  
						</tr>
 						<!--<tr>
  							<td><font size="+1"><strong>&nbsp;</strong></font></td>
  						</tr>
  						<tr>
  							<td><font size="+1"><strong>VO. BO. CANALES</strong></font></td>
  						</tr>
  						<tr>
  							<td align="center"><input type="hidden" name="vobo_canales" id="vobo_canales"/> <input type="text" name="corte" id="corte" placeholder="aaaa-mm-dd"  onkeypress="return soloNumerosCalendario(event)" value ="<%=fecha_autorizacion_voboCanales%>"/></td>  
 						</tr>
 	 					<tr>
 							<td><font size="+1"><strong>&nbsp;</strong></font></td>
 						</tr>
 						<tr>
 							<td><font size="+1"><strong>ARRENDAMIENTO</strong></font></td>
 						</tr>
 						<tr>
 							<td><font size="+1"><strong>ESTATUS</strong></font></td>
 							<td><font size="+1"><strong>&nbsp;</strong></font></td>
 							<td><font size="+1"><strong>FECHA ENTREGA DEL LOCAL</strong></font></td>
 						</tr>
 						<tr>
 							<td align="center"> <input type="text" id="arrendamiento" name="arrendamiento" value="<%=estatus_arrendamiento%>"></td> 
 							<td><font size="+1"><strong>&nbsp;</strong></font></td>
 							<td align="center"><input type="hidden" name="idc" id="idc" value="<%=idc%>"/> <input type="text" name="corte2" id="corte2" placeholder="aaaa-mm-dd"  onkeypress="return soloNumerosCalendario(event)" value="<%=fecha_entrega_local_arrendamiento%>"/></td> 
 						</tr>
  						<tr>
 							<td><font size="+1"><strong>&nbsp;</strong></font></td>
 						</tr>
 						<tr>
 							<td><font size="+1"><strong>ANTEPROYECTO</strong></font></td>
 						</tr>
 						<tr>
 							<td><font size="+1"><strong>FECHA ENTREGA</strong></font></td>
 							<td><font size="+1"><strong>&nbsp;</strong></font></td>
 							<td><font size="+1"><strong>VO. BO. CANALES</strong></font></td>
 						</tr>
 						<tr>
 							<td align="center"><input type="hidden" name="idc" id="idc"/> <input type="text" name="corte5" id="corte5" placeholder="aaaa-mm-dd"  onkeypress="return soloNumerosCalendario(event)" value="<%=fecha_entrega_anteproyecto%>"/></td>  
 							<td><font size="+1"><strong>&nbsp;</strong></font></td>
 							<td align="center"><input type="hidden" name="idc" id="idc"/> <input type="text" name="corte3" id="corte3" placeholder="aaaa-mm-dd"  onkeypress="return soloNumerosCalendario(event)" value="<%=vobo_canales_anteproyecto%>"/></td>  
 						</tr>
 						<tr>
 							<td><font size="+1"><strong>&nbsp;</strong></font></td>
 						</tr>
 						<tr>
 							<td><font size="+1"><strong>INGENIERIA</strong></font></td>
 						</tr>
 						<tr>
 							<td><font size="+1"><strong>ESTATUS</strong></font></td>
 							<td><font size="+1"><strong>&nbsp;</strong></font></td>
 							<td><font size="+1"><strong>FECHA DE ENTREGA</strong></font></td>
 						</tr>
 						<tr>
 							<td align="center"> <input type="text" id="ingenieria" name="ingenieria" value="<%=estatus_ingenieria%>"></td> 
 							<td><font size="+1"><strong>&nbsp;</strong></font></td>
 							<td align="center"><input type="hidden" name="idc" id="idc"/> <input type="text" name="corte4" id="corte4" placeholder="aaaa-mm-dd"  onkeypress="return soloNumerosCalendario(event)" value="<%=fecha_entrega_ingenieria%>"/></td>  
 						</tr>-->
 						<tr>
 							<td><font size="+1"><strong>&nbsp;</strong></font></td>
 						</tr>
 						<tr>
 							<td><font size="+1"><strong>ASIGNACION DE PROVEEDOR</strong></font></td>
 						</tr>
 						<tr>
 							<td><font size="+1"><strong>TIPO</strong></font></td>
 							<td><font size="+1"><strong>&nbsp;</strong></font></td>
 							<td><font size="+1"><strong>PROVEEDOR</strong></font></td>
 						</tr>
 						<tr>
 							<td align="center"> <%=cargaTipoProveedor(concurso_asignacion_proveedor)%></td> 
 							<td><font size="+1"><strong>&nbsp;</strong></font></td>
 							<td align="center"> <%=cargaContratistas(id_proveedor)%></td>  
 						</tr>
 						<tr>
 							<td><font size="+1"><strong>&nbsp;</strong></font></td>
 						</tr>
 						<tr>
 							<td><font size="+1"><strong>ASIGNACION DE SUPERVISOR</strong></font></td>
 						</tr>
 						<tr>
 							<td><font size="+1"><strong>SUPERVISOR</strong></font></td>
 						</tr>
 						<tr>
 							<td align="center"> <%=cargaSupervisoresId(buscaSupervisorId_lobby(cr))%></td>  
 						</tr>
 						<tr>
 							<td><font size="+1"><strong>&nbsp;</strong></font></td>
 						</tr>
 						<!--<tr>
 							<td><font size="+1"><strong>ESTATUS DE PERMISO</strong></font></td>
 						</tr>
 						<tr>
 							<td align="center"> <input type="text" id="estatus_permiso" name="estatus_permiso"  value="<%=estatus_permisos%>"></td>  
 						</tr>
 						<tr>
  							<td><font size="+1"><strong>&nbsp;</strong></font></td>
  						</tr>
  						<tr>
  							<td><font size="+1"><strong>ENTREGA COMERCIAL</strong></font></td>
  						</tr>
  						<tr>
  							<td align="center"><input type="hidden" name="idc" id="idc"/> <input type="text" name="corte8" id="corte8" placeholder="aaaa-mm-dd"  onkeypress="return soloNumerosCalendario(event)" value="<%=fecha_entrega_comercial%>"/></td>  
 						</tr>
 						<tr>
  							<td><font size="+1"><strong>&nbsp;</strong></font></td>
  						</tr>
  						<tr>
  							<td><font size="+1"><strong>ESTATUS PRODUCCION</strong></font></td>
  						</tr>
  						<tr>
  							<td align="center"> <%=cargaEstatusProduccion(estatus_produccion)%></td>  
						</tr>
 						<tr>
  							<td><font size="+1"><strong>&nbsp;</strong></font></td>
  						</tr>-->
  						<tr>
  							<td><font size="+1"><strong>Fecha Inicio</strong></font></td>
  						</tr>
  						<tr>
  							<td align="center"><input type="hidden" name="idc" id="idc" /> <input type="text" name="corte6" id="corte6" placeholder="aaaa-mm-dd"  onkeypress="return soloNumerosCalendario(event)" value="<%=fecha_inicio_obra%>"/></td>  
 						</tr>
 						<tr>
  							<td><font size="+1"><strong>&nbsp;</strong></font></td>
  						</tr>
  						<tr>
  							<td><font size="+1"><strong>Fecha Inicio REPROGRAMADA (solo si aplica)</strong></font></td>
  						</tr>
  						<tr>
  							<td align="center"><input type="hidden" name="idc" id="idc" /> <input type="text" name="corte7" id="corte7" placeholder="aaaa-mm-dd"  onkeypress="return soloNumerosCalendario(event)" value="<%=inicio_reprogramado%>"/></td>  
 						</tr>
 						<tr>
  							<td><font size="+1"><strong>&nbsp;</strong></font></td>
  						</tr>
  						<tr>
  							<td><font size="+1"><strong>Fecha Fin REPROGRAMADA (solo si aplica)</strong></font></td>
  						</tr>
  						<tr>
  							<td align="center"><input type="hidden" name="idc" id="idc" /> <input type="text" name="corte10" id="corte10" placeholder="aaaa-mm-dd"  onkeypress="return soloNumerosCalendario(event)" value="<%=fin_reprogramado%>"/></td>  
 						</tr>
 					</table> 
         		</div>
         	</td>	
        </tr>
	</table>
	 
  <!-- script que define y configura el calendario--> 
<script type="text/javascript"> 
 /*  Calendar.setup({ 
    inputField     :    "corte",     // id del campo de texto 
     ifFormat     :     "%Y-%m-%d",     // formato de la fecha que se escriba en el campo de texto 
     button     :    "corte"     // el id del botón que lanzará el calendario 
}); 
    Calendar.setup({ 
    inputField     :    "corte2",     // id del campo de texto 
     ifFormat     :     "%Y-%m-%d",     // formato de la fecha que se escriba en el campo de texto 
     button     :    "corte2"     // el id del botón que lanzará el calendario 
}); 
     Calendar.setup({ 
    inputField     :    "corte3",     // id del campo de texto 
     ifFormat     :     "%Y-%m-%d",     // formato de la fecha que se escriba en el campo de texto 
     button     :    "corte3"     // el id del botón que lanzará el calendario 
}); 
    Calendar.setup({ 
    inputField     :    "corte4",     // id del campo de texto 
     ifFormat     :     "%Y-%m-%d",     // formato de la fecha que se escriba en el campo de texto 
     button     :    "corte4"     // el id del botón que lanzará el calendario 
}); 
     Calendar.setup({ 
    inputField     :    "corte5",     // id del campo de texto 
     ifFormat     :     "%Y-%m-%d",     // formato de la fecha que se escriba en el campo de texto 
     button     :    "corte5"     // el id del botón que lanzará el calendario 
}); */
    Calendar.setup({ 
    inputField     :    "corte6",     // id del campo de texto 
     ifFormat     :     "%Y-%m-%d",     // formato de la fecha que se escriba en el campo de texto 
     button     :    "corte6"     // el id del botón que lanzará el calendario 
}); 
    Calendar.setup({ 
    inputField     :    "corte7",     // id del campo de texto 
     ifFormat     :     "%Y-%m-%d",     // formato de la fecha que se escriba en el campo de texto 
     button     :    "corte7"     // el id del botón que lanzará el calendario 
});

    Calendar.setup({ 
    inputField     :    "corte10",     // id del campo de texto 
     ifFormat     :     "%Y-%m-%d",     // formato de la fecha que se escriba en el campo de texto 
     button     :    "corte10"     // el id del botón que lanzará el calendario 
});

</script>

<br/>
	<table width="64%" align="center">
    	<tr>
      		<td width="20%"><input  type="button" value="Eliminar Lobby" onclick="eliminar()" name="btnEnviar"/></td>
      		<td width="20%">&nbsp;></td>
      		<td width="20%"><input  type="button" value="Guardar" onclick="validaFormulario('asignarObra')" name="btnEnviar"/></td>
     	</tr>
    </table>
<br/>
<br/>

</div>
	<a href="#" id="alert4" style="display:none"></a>
      <a href="#" id="alert2" style="display:none">&nbsp;</a>
      <a href="#" id="alert3" style="display:none">&nbsp;</a>
      <a href="#" id="guardando" style="display:none">&nbsp;</a>
      <a href="#" id="errorU" style="display:none">&nbsp;</a>
      <a href="#" id="errNumero" style="display:none">&nbsp;</a>
      <a href="#" id="errorEU" style="display:none">&nbsp;</a>
      <a href="#" id="ok" style="display:none">&nbsp;</a>
      <a href="#" id="alert" style="display:none">&nbsp;</a>
      <a href="#" id="confirmHabilitar" style="display:none">&nbsp;</a>
      <a href="#" id="confirmDeshabilitar" style="display:none">&nbsp;</a>
      <a href="#" id="confirmDelete" style="display:none">&nbsp;</a>

<input type="hidden" id="id_lobby" name="id_lobby" value="<%=id_lobby%>" />
<input type="hidden" id="temp1" name="temp1" />
<input type="hidden" id="temp2" name="temp2" />
<input type="hidden" id="temp3" name="temp3" />
</form>



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
function recorreElementos(div,tipoElemento){
	var elemento = document.getElementById(div).getElementsByTagName(tipoElemento);
	var bandera=false
	var cantidad
	var costo
	var familia

	for (var i=0; i<elemento.length; i++){
		if (elemento[i].type!="hidden"){
			if (elemento[i].type=="text"){
				cantidad=elemento[i].name;
				if (validar2(cantidad)){
					bandera=true;
				}
				else{
					bandera=false;
					break;
				}
			}
		}
	}
	if (bandera){
		if(recorreSelect(div)){
			bandera=true;
		}
		else{
			bandera=false;
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
	//if (recorreElementos('detalleAlcanceLobby','input')){
			//if (recorreSelect(tabla)){
			//document.getElementById('form_edicion_usuarios').action="insertUsuario.asp"
			//document.getElementById('form_edicion_usuarios').submit()
				//if(validar()){
	simulateClick(document.getElementById('guardando'));
		document.getElementById('frm_revisarAvance').action="updatesDetalleAlcancesLobby.asp"
		setTimeout(enviar(),3000)
		
	//}
//return bandera

//eturn bandera
	
}
function eliminar(){
	simulateClick(document.getElementById('confirmDelete'))	
}
function enviar(){
	document.getElementById('frm_revisarAvance').submit()
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
	alertify.alert("Todos los campos con costo son obligatorios");
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
			alertify.success("Actualizado con Exito");
			return false;
		});
		$("#errNumero").on( 'click', function () {
			reset();
			//$("#footer").html(document.getElementById('zonaFoto').value);
			alertify.error("No es un numero valido");
			return false;
		});
		$("#error").on( 'click', function () {
			reset();
			//$("#footer").html(document.getElementById('zonaFoto').value);
			alertify.error("Error al Actualizar Estatus");
			return false;
		});
		$("#guardando").on( 'click', function () {
			reset();
			//$("#footer").html(document.getElementById('zonaFoto').value);
			alertify.success("Guardando Cambios...");
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
		 $("#confirmHabilitar").on( 'click', function () {
			reset();
			alertify.confirm("ESTAS SEGURO DE CAMBIARLE EL ESTATUS A ESTE ELEMENTO?", function (e) {
				if (e) {
				detHabilitarDeshabilitar('0')
					return true;
				}
			});
			return false;
		});
		 $("#confirmDeshabilitar").on( 'click', function () {
			reset();
			alertify.confirm("ESTAS SEGURO DE CAMBIARLE EL ESTATUS A ESTE ELEMENTO?", function (e) {
				if (e) {
				detHabilitarDeshabilitar('NA')
					return true;
				}
			});
			return false;
		});
		$("#confirmDelete").on( 'click', function () {
			reset();
			alertify.confirm("¿ESTAS SEGURO DE ELIMINAR A ESTE LOBBY, ESTA ACCION NO SE PUEDE REVERTIR?", function (e) {
				if (e) {
				    deleteLobby()
	
					return true;
				}
			});
			return false;
		});

	</script>
<script>
$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});

function showModalFecha(){
	//detComp(cr)
	 $("#modalFecha").modal();
}
</script>
</body>
</html>
