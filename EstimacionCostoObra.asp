<!--#include file="funcion3/funcion_edicion_usuarios.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css3/loginAgregarUsuarios.css" rel="stylesheet" type="text/css">
  <link href="style.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="css3/animate.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
  <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />
<title>Documento sin título</title>

<style>
a:link   
{   
 text-decoration:none;   
}  

.tabla_usuarios .container {
position: relative;
width:97%;
}

</style>
<style type="text/css" title="currentStyle">
			@import "DataTables/media/css/jquery.dataTables.min.css";
			@import "DataTables/media/css/dataTables.jqueryui.min.css";
			@import "DataTables/media/css/jquery-ui.css";
</style>
<script src="js/popup1.js"></script>
<script>
//funcion para poner estilo a la tabla principal
$(document).ready(function() {
	
    $('#example1' ).DataTable( {
        "paging": true,
        "ordering": true,
        "info":     true,
		"searching": true,
		"lengthMenu": [[5, 10, 25, 50, -1], [5	, 10, 25, 50, "All"]],
		"oLanguage": {
		  "sSearch":         "Buscar:",
		  "sInfo": "Mostrando del _START_ al _END_ de _TOTAL_ registros",
		  "sInfoEmpty":      "Mostrando 0 registros",
		  "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
		  "sEmptyTable":     "Ningún dato disponible en esta tabla",
		  "sZeroRecords":    "No se encontraron resultados",
		  "sLengthMenu": "Mostrar _MENU_ Registros",
      	  "oPaginate": {
       	    "sNext": "Pagina Siguiente",
			"sPrevious": "Pagina Anterior"
      }
    }
    } 
	);
} );

$(document).ready(function() {
	
    $('#example2' ).DataTable( {
        "paging": false,
        "ordering": false,
        "info":     false,
		"searching": false,
		"lengthMenu": [[5, 10, 25, 50, -1], [5	, 10, 25, 50, "All"]],
		"oLanguage": {
		  "sSearch":         "Buscar:",
		  "sInfo": "Mostrando del _START_ al _END_ de _TOTAL_ registros",
		  "sInfoEmpty":      "Mostrando 0 registros",
		  "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
		  "sEmptyTable":     "Ningún dato disponible en esta tabla",
		  "sZeroRecords":    "No se encontraron resultados",
		  "sLengthMenu": "Mostrar _MENU_ Registros",
      	  "oPaginate": {
       	    "sNext": "Pagina Siguiente",
			"sPrevious": "Pagina Anterior"
      }
    }
    } 
	);
} );

$(document).ready(function() {
	
    $('#example3' ).DataTable( {
        "paging": false,
        "ordering": false,
        "info":     false,
		"searching": false,
		"lengthMenu": [[5, 10, 25, 50, -1], [5	, 10, 25, 50, "All"]],
		"oLanguage": {
		  "sSearch":         "Buscar:",
		  "sInfo": "Mostrando del _START_ al _END_ de _TOTAL_ registros",
		  "sInfoEmpty":      "Mostrando 0 registros",
		  "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
		  "sEmptyTable":     "Ningún dato disponible en esta tabla",
		  "sZeroRecords":    "No se encontraron resultados",
		  "sLengthMenu": "Mostrar _MENU_ Registros",
      	  "oPaginate": {
       	    "sNext": "Pagina Siguiente",
			"sPrevious": "Pagina Anterior"
      }
    }
    } 
	);
} );

 function simulateClick(control)
{
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

function addUser(){
	show(2)
}

 function deleteUser(id,perfil){
	document.getElementById('form_edicion_usuarios').action='deleteUsuario.asp'
	document.getElementById('form_edicion_usuarios').submit()
}

function confirmar_deleteUser(id,perfil) {
	document.getElementById('temp1').value=id
	document.getElementById('temp2').value=perfil
	simulateClick(document.getElementById('confirmDelete'))
}
function confirmar_regreso() {
   simulateClick(document.getElementById('confirm'))
}
function confirmar_regreso2() {
   simulateClick(document.getElementById('confirm2'))
}
function show(id){
	if(id==2){
		document.getElementById('tabla_principal').style.display="none";
		document.getElementById('tabla_agregarUsuario').style.display="block";
	}
	else if (id==3){
		document.getElementById('tabla_principal').style.display="none";
		document.getElementById('tabla_informacioAyuda').style.display="block";
	}
	else if (id==4){
		document.getElementById('tabla_principal').style.display="none";
		document.getElementById('tabla_editarUsuario').style.display="block";
	}
	else{
		document.getElementById('tabla_principal').style.display="block";
		document.getElementById('tabla_editarUsuario').style.display="none"
		document.getElementById('tabla_agregarUsuario').style.display="none";

	}
	
}

function detUpdateUsuario2(){
	document.getElementById('form_edicion_usuarios').action='updateUsuario.asp'
	document.getElementById('form_edicion_usuarios').submit()
}
function detUpdateUsuario(id,accion){
	alert(document.getElementById('txt_login_usuarioEdit').value)
	alert(document.getElementById('txt_login_passEdit').value)
	alert(document.getElementById('txt_login_nombreEdit').value)
	alert(accion)
	alert(id)
	$.ajax({
	type: "GET",
	url: "updatetUsuario.asp?txt_login_usuarioEdit=" + document.getElementById('txt_login_usuarioEdit').value, 
	dataType: "html", 
	success: function(response){ 
	if (response=="OK"){ 
		simulateClick(document.getElementById('okE'))
	}
	else if(response=="ErrorU"){
		simulateClick(document.getElementById('errorEU'))
	}
	else if(response=="ErrorC"){
		simulateClick(document.getElementById('errorEC'))
	}	
	}
  });
//
}
function detSearchElemento(cajaTexto){
	$.ajax({
	type: "GET",
	url: "searchEstimacionObra.asp?cr=" + document.getElementById('cr').value + "&sap=" +document.getElementById('sap').value, 
	dataType: "html", 
	success: function(response){ 

	if (response=="no"){ 
		detInserElemento(cajaTexto)
	}
	else{
		alert('Este elemento ya se ha registrado con  anterioridad')
	}

	}
  });

}
 function searchEstatusElementoEstimacion(partida,cr){
	$.ajax({
	type: "GET",
	url: "updateEstatusEstimacionObra.asp?partida=" + partida + "&cr=" + cr + "&estatus=" + estatus, 
	dataType: "html", 
	success: function(response){ 
	var update=response
	//$("#dedede").html(response);
	if (update=="err"){
		simulateClick(document.getElementById('alertErrorCerrar'))	
		} 
	else{
		 
		 simulateClick(document.getElementById('alert4'))
		}
	}
  });
}

function detSearchCostoEstimado(){
	$.ajax({
	type: "GET",
	url: "searchCostoEstimado.asp?cr=" + document.getElementById('cr').value, 
	dataType: "html", 
	success: function(response){ 

	$("#costoEstimado").html(response)

	}
  });

}
function detCargaEdicion(cajaTexto){
	$.ajax({
	type: "GET",
	url: "carga_ElementosEstimacionCostoObra.asp?cr=" + document.getElementById('cr').value, 
	dataType: "html", 
	success: function(response){ 

	$("#tabla_principal2").html(response)
    document.getElementById(cajaTexto).value=""
	}
  });

}

function detCargaEdicion2(){
	$.ajax({
	type: "GET",
	url: "carga_ElementosEstimacionCostoObra.asp?cr=" + document.getElementById('cr').value, 
	dataType: "html", 
	success: function(response){ 

	$("#tabla_principal2").html(response)
   document.getElementById('txt_desCorta').value=""
 document.getElementById('txt_desLarga').value=""
  document.getElementById('txt_cantidad').value=""
   document.getElementById('txt_unidad').value=""
    document.getElementById('txt_pu').value=""
	}
  });

}
function validarCampo(cajaTexto){	
	familia=document.getElementById(cajaTexto).value;
	if (familia.length == 0 || /^\s+$/.test(familia)){
		alert("Debes ingresar un valor")
		document.getElementById(cajaTexto).value=""
		document.getElementById(cajaTexto).focus();
		return false
	}
	else
	{
		if (/^[0-9\.]+$/.test(familia)){
			if(isNaN(familia)){
				alert('La cantidad ingresada no es valida');
				document.getElementById(cajaTexto).focus();
				return false
			}
			else
			{
				document.getElementById('unidad').value=familia
				document.getElementById('sap').value=cajaTexto
				return true	
			}
		}
		else
		{
			alert('NO SE PUEDEN INCLUIR CARACTERES ESPECIALES');
			document.getElementById(cajaTexto).focus();
			return false
		}		
	}
}
function validarCampoTexto(cajaTexto){	
	familia=document.getElementById(cajaTexto).value;
	if (familia.length == 0 || /^\s+$/.test(familia)){
		alert("Debes ingresar un valor")
		document.getElementById(cajaTexto).value=""
		document.getElementById(cajaTexto).focus();
		return false
	}
	else
	{
		if (/^[0-9a-zA-Z\s()-.,:/]+$/.test(familia)){
				document.getElementById('unidad').value=familia
				document.getElementById('sap').value=cajaTexto
				return true	
		}
		else
		{
			alert('NO SE PUEDEN INCLUIR CARACTERES ESPECIALES');
			document.getElementById(cajaTexto).focus();
			return false
		}		
	}
}

function ingresarElementoFueraCat(){
if(validarCampoTexto('txt_clavesap')){
if(validarCampoTexto('txt_desCorta')){
 if(validarCampoTexto('txt_desLarga')){
  if(validarCampo('txt_cantidad')){
   if(validarCampoTexto('txt_unidad')){
    if(validarCampo('txt_pu')){
	document.getElementById('sap').value=document.getElementById('txt_clavesap').value
		document.getElementById('pu').value=document.getElementById('txt_pu').value
		document.getElementById('componente').value='Otros'
		document.getElementById('unidad').value=document.getElementById('txt_cantidad').value
		document.getElementById('und').value=document.getElementById('txt_unidad').value
		document.getElementById('desCorta').value=document.getElementById('txt_desCorta').value
		document.getElementById('desLarga').value=document.getElementById('txt_desLarga').value
		detInserElementoFueraCat()
    }
   } 
  }
 }
}
}
}
function ingresarElemento(cajaTexto,zona,pu,componente){
	if(validarCampo(cajaTexto)){
		document.getElementById('zona').value=zona
		document.getElementById('pu').value=pu
		document.getElementById('componente').value=componente
		detSearchElemento(cajaTexto)
	}
}

 function detInserElemento(cajaTexto){
	$.ajax({
	type: "GET",
	url: "insertElementoEstimacionObra.asp?cr="+ document.getElementById('cr').value + "&cantidad=" + document.getElementById('unidad').value +"&sap=" + document.getElementById('sap').value + "&zona=" + document.getElementById('zona').value + "&pu=" + document.getElementById('pu').value + "&tipo=1&componente=" + document.getElementById('componente').value, 
	dataType: "html", 
	success: function(response){ 
	if (response=="ok"){
		detCargaEdicion(cajaTexto);
		detSearchCostoEstimado();
	}
	}
  });

}
function detInserElementoFueraCat(){
	
	$.ajax({
	type: "GET",
	url: "insertElementoEstimacionObra.asp?cr="+ document.getElementById('cr').value + "&cantidad=" + document.getElementById('unidad').value +"&tipo=2&pu=" + document.getElementById('pu').value + "&componente=" + document.getElementById('componente').value + "&desCorta=" + document.getElementById('desCorta').value + "&desLarga=" + document.getElementById('desLarga').value +"&sap=" + document.getElementById('sap').value + "&und=" + document.getElementById('und').value , 
	dataType: "html", 
	success: function(response){ 
	if (response=="ok"){
		detCargaEdicion2();
		detSearchCostoEstimado();
	}
	}
  });

}
function regresar(){
	document.getElementById('form_edicion_usuarios').action="seleccionDeAccionContratista2.asp"
	document.getElementById('form_edicion_usuarios').submit()
	//cambiarClase2()	
}

function verElementos(){
document.getElementById('form_edicion_usuarios').action="elementosCargadosEstimacionObra.asp"
document.getElementById('form_edicion_usuarios').submit()
}
function editUser(id,perfil){
	//document.getElementById('loader').style.display="block"
	detCargaEdicion(id,perfil)
	show(4)
	cambiarClase("tabla_editarUsuario")
	
}
function cambiarClase(id){
	$(document.getElementById(id)).addClass('animated zoomIn').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
			function(){
				$(this).removeClass('animated zoomIn');
        });
}
function soloNumeros(e){
	var key = window.Event ? e.which : e.keyCode
	return (key >= 46 && key <= 57)
}

</script>
<script type="text/javascript" language="javascript" src="DataTables/media/js/jquery.dataTables.js"></script>
<script src="DataTables/media/js/jquery.dataTables.columnFilter.js" type="text/javascript"></script>
<script src="DataTables/media/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="DataTables/media/js/dataTables.jqueryui.min.js" type="text/javascript"></script>
<%CodErr=request("err")%>
</head>

<%
cr=request("cr")
zona=buscaZonaTransformacion(cr)
anio=request("anio")
%>
<body onload="detCargaEdicion();detSearchCostoEstimado()">

<form id="form_edicion_usuarios" name="form_edicion_usuarios" >
<input type="hidden" id="cr" name="cr" value="<%=cr%>"/>
<input type="hidden" name="unidad" id="unidad"/>
<input type="hidden" name="sap" id="sap"/>
<input type="hidden" name="zona" id="zona"/>
<input type="hidden" name="pu" id="pu"/>
<input type="hidden" name="und" id="und"/>
<input type="hidden" name="desCorta" id="desCorta"/>
<input type="hidden" name="desLarga" id="desLarga"/>
<input type="hidden" name="componente" id="componente"/>
<input type="hidden" name="clavesap" id="clavesap"/>
<input type="hidden" name="anio" id="anio" value="<%=anio%>"/>


<table>
<tr height="20">
  <td><font size="+2"><strong>&nbsp;</strong></font></td>
 </tr>
 <tr>
  <td><font size="+2"><strong>Bienvenido <%=server.HTMLEncode(session.Contents("nombre_usuario"))%></strong></font></td>
 </tr> 
 <tr height="20">
  <td><font size="+2"><strong>CR: <%=cr%> Sucursal <%=buscaSucursal(cr)%></strong></font></td>
 </tr>
 <tr height="20">
  <td><div id="costoEstimado"></div></td>
 </tr>
</table>

<div id="tabla_principal" class="animated zoomIn">
<!--Se crea la tabla principal-->
<div class="tabla_usuarios" align="center" id="tabla_usuarios">
<div class="container"> 


<table cellpadding="0" cellspacing="0" class="display" id="example1" width="100%">
 <thead>
  <tr bgcolor="#991821">
	<th width="5%"  height="42" align="center"><font color="#FFFFFF" size="-1">CLAVE SAP</font></th>
    <th width="17%"  height="42" align="center"><font color="#FFFFFF" size="-1">DESCRIPCION CORTA</font></th>
    <th width="59%"  height="42" align="center"><font color="#FFFFFF" size="-1">DESCRIPCION LARGA</font></th>
	<th width="3%"  height="42" align="center"><font color="#FFFFFF" size="-1">P.U.</font></th>
	<th width="3%"  height="42" align="center"><font color="#FFFFFF" size="-1">CANTIDAD</font></th>
	<th width="3%"  height="42" align="center"><font color="#FFFFFF" size="-1">UND</font></th>
	<th width="6%"  height="42" align="center"><font color="#FFFFFF" size="-1">Concepto</font></th>
	<th width="3%"  height="42" align="center"><font color="#FFFFFF" size="-1">&nbsp;</font></th>
  </tr>
 </thead> 
 
  <%=cargaClavesSap(cr,zona,anio)%>

</table>

</div>
</div>
</div>

<table width="99%">
<tr height="20">
  <td><font size="+2"><strong>&nbsp;</strong></font></td>
 </tr>
 <tr>
  <td><font size="+2" width="70%"><strong>Agregar Elemento Fuera del Catalogo Dictamindado</strong></font></td>
 </tr>
 
</table>
	


<table cellpadding='0' cellspacing='0' class='display' id='example3' width="100%">
 <thead>
  <tr bgcolor='#991821'>
    <th width="10%"  height="42" align="center"><font color="#FFFFFF" size="-1">CLAVE SAP</font></th>
    <th width="27%"  height="42" align="center"><font color="#FFFFFF" size="-1">DESCRIPCION CORTA</font></th>
    <th width="30%"  height="42" align="center"><font color="#FFFFFF" size="-1">DESCRIPCION LARGA</font></th>
    <th width='10%'  height='42' align='center'><font color='#FFFFFF' size='-1'>CANTIDAD</font></th>
    <th width='10%'  height='42' align='center'><font color='#FFFFFF' size='-1'>UND</font></th>
	<th width='10%'  height='42' align='center'><font color='#FFFFFF' size='-1'>P.U.</font></th>
	<th width='3%'  height='42' align='center'><font color='#FFFFFF' size='-1'>&nbsp;</font></th>
 </tr>
 </thead>
 <td><input type='text' name='txt_clavesap' id='txt_clavesap' placeholder='Clave SAP' maxlength='50'></td>
 <td><input type='text' name='txt_desCorta' id='txt_desCorta' placeholder='Descripcion Corta'maxlength='50'></td>

 <td><textarea rows='1' cols='100%' name='txt_desLarga' id='txt_desLarga' placeholder='Descripcion Larga'></textarea></td>
 <td><input type='text' name='txt_cantidad' id='txt_cantidad' placeholder='Cantidad' onkeypress='return soloNumeros(event)'></td>
 <td><input type='text' name='txt_unidad' id='txt_unidad' placeholder='Unidad' maxlength='6'></td>
 <td><input type='text' name='txt_pu' id='txt_pu' placeholder='Precio Unitario' onkeypress='return soloNumeros(event)'></td>
 <td align='right'><img src='images/logos/add_notes32.png' align='left' title='Agregar Elemento' style='cursor:pointer' onclick='ingresarElementoFueraCat()' /></td>
</table>

</div>
</div>
</div>

<table width="99%">
<tr height="20">
  <td><font size="+2"><strong>&nbsp;</strong></font></td>
 </tr>
 <tr>
  <td><font size="+2" width="70%"><strong>Ultimos elementos agregados a la Sucursal</strong></font></td>
  <td align="left" ><font size="+2"><img src='images/logos/checklist32.png' align='left' title='Ver todos los elementos cargados' style='cursor:pointer' onclick='verElementos()' /></font></td>
 </tr>
 <tr>
  <td align="right" colspan="3"><font size="-1" ><strong>Ver todos los elementos cargados</strong></font></td>
 </tr>  
</table>
	
<div id="tabla_principal2" class="animated zoomIn">
<!--Se crea la tabla principal-->
<div class="tabla_usuarios" align="center" id="tabla_usuarios">
<div class="container"> 


<table cellpadding='0' cellspacing='0' class='display' id='example2'>
 <thead>
  <tr bgcolor='#991821'>
	<th width='10%'  height='42' align='center'><font color='#FFFFFF' size='-1'>CLAVE SAP</font></th>
    <th width='10%'  height='42' align='center'><font color='#FFFFFF' size='-1'>CLAVE SAP ZONA</font></th>
    <th width='10%'  height='42' align='center'><font color='#FFFFFF' size='-1'>P.U.</font></th>
<th width='10%'  height='42' align='center'><font color='#FFFFFF' size='-1'>CANTIDAD</font></th>
<th width='10%'  height='42' align='center'><font color='#FFFFFF' size='-1'>UND</font></th>
	<th width='10%'  height='42' align='center'><font color='#FFFFFF' size='-1'>ESTIMACION</font></th>
	<th width='10%'  height='42' align='center'><font color='#FFFFFF' size='-1'>CONCEPTO</font></th>
<th width='10%'  height='42' align='center'><font color='#FFFFFF' size='-1'>FECHA INGRESO</font></th>
	<th width='10%'  height='42' align='center'><font color='#FFFFFF' size='-1'>&nbsp;</font></th>
 </tr>
 </thead>
 


</table>

</div>
</div>
</div>


<br/>
   <table width="40%" align="center">
     <tr>
     <td width="10%">&nbsp;</td>
      <td width="20%"><input  type="button" value="Regresar" onclick="regresar()" name="btnEnviar" /></td>
      <td width="10%">&nbsp;</td>
     </tr>
    </table>
  <br/>



</form>
      <a href="#" id="alert4" style="display:none"></a>
      <a href="#" id="alert2" style="display:none">&nbsp;</a>
      <a href="#" id="alert3" style="display:none">&nbsp;</a>
      <a href="#" id="errorC" style="display:none">&nbsp;</a>
      <a href="#" id="errorU" style="display:none">&nbsp;</a>
      <a href="#" id="errorEC" style="display:none">&nbsp;</a>
      <a href="#" id="errorEU" style="display:none">&nbsp;</a>
      <a href="#" id="ok" style="display:none">&nbsp;</a>
      <a href="#" id="okE" style="display:none">&nbsp;</a>
      <a href="#" id="confirm" style="display:none">&nbsp;</a>
      <a href="#" id="confirm2" style="display:none">&nbsp;</a>
      <a href="#" id="confirmDelete" style="display:none">&nbsp;</a>
      
</body>
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
			else if (elemento[i].type=="date"){
				if (document.getElementById('chb_sucUlises').checked){
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
	}
return bandera
}
function limpiarElementos(div,tipoElemento){
	var elemento = document.getElementById(div).getElementsByTagName(tipoElemento);
	var bandera=false
	for (var i=0; i<elemento.length; i++){
		if (elemento[i].type!="hidden"){
			if (elemento[i].type=="text"){
				elemento[i].value=""
	}
		}
	}
return bandera
}
function recorreElementos2(div,tipoElemento){
	var elemento = document.getElementById(div).getElementsByTagName(tipoElemento);
	var bandera=false
	for (var i=0; i<elemento.length; i++){
		if(elemento[i].name.substring(4,9)=="email"){
			if(isValidEmail(document.getElementById(elemento[i].name).value)){
				bandera=true
			}
			else{
				alert("EL EMAIL INGRESADO NO ES VALIDO")
				document.getElementById(elemento[i].name).focus()
				bandera=false
				break
			}
		}
		else{
			if(validar2(elemento[i].name)){
				bandera=true
			}
			else{
				bandera=false
				break
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
function validaFormulario(tabla,accion, id){
	if(accion=="1"){
		if (recorreElementos(tabla,'input')){
			if (recorreSelect(tabla)){
			//document.getElementById('form_edicion_usuarios').action="insertUsuario.asp"
			//document.getElementById('form_edicion_usuarios').submit()
				detInsertUsuario()
			}
		}
		}
	else{
		if (recorreElementos(tabla,'input')){
			detUpdateUsuario2()
			//detUpdateUsuario(id,accion)
		}
		//
			//if (recorreElementos(tabla,'input')){
				
			//}
	}
		
	
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
			document.getElementById(cajaTexto).focus();
			return false
		}		
	}
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
			alertify.success("Espere un momento...");
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
		$("#okE").on( 'click', function () {
			reset();
			//$("#footer").html(document.getElementById('zonaFoto').value);
			alertify.success("Usuario Actualizado con Exito");
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
</html>
