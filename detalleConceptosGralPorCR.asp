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
width:80%;
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
	
   $('#example1').DataTable( {
		
		"paging": false,
        "ordering": true,
        "info":     false,
		"searching": true,
		"lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
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
					   },
        "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;
 
            // Remove the formatting to get integer data for summation
            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };
 //total gral
            // Total over all pages
            total = api
                .column( 1 )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Total over this page
            pageTotal = api
                .column( 1, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);			
                }, 0 );
 
            // Update footer
            $( api.column( 1 ).footer() ).html(
              '$' + formatNumber(pageTotal.toFixed(2) )
            );			
        }
    } );
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

function detCargaEdicion(id,perfil){
	$.ajax({
	type: "GET",
	url: "carga_edicionUsuarios.asp?perfil=" + perfil + "&id=" + id, 
	dataType: "html", 
	success: function(response){ 
	$("#tabla_editarUsuario").html(response);
	}
  });

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
function formatNumber (num) {
    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
}
function verDetalle(capitulo){

document.getElementById('capitulo').value=capitulo
document.getElementById('form_conceptosGral').action='detalleConceptosPorCr.asp'
document.getElementById('form_conceptosGral').submit()
}
</script>
<script type="text/javascript" language="javascript" src="DataTables/media/js/jquery.dataTables.js"></script>
<script src="DataTables/media/js/jquery.dataTables.columnFilter.js" type="text/javascript"></script>
<script src="DataTables/media/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="DataTables/media/js/dataTables.jqueryui.min.js" type="text/javascript"></script>
<%cr=request("cr")%>
</head>


<body >

<form id="form_conceptosGral" name="form_conceptosGral" >
<table align='center'><tr><td><h1><strong>Detalle de Estimaci&oacute;n</strong></h1></td></tr></table>
<div id="tabla_principal" class="animated zoomIn">
<!--Se crea la tabla principal-->
<div class="tabla_usuarios" align="center" id="tabla_usuarios">
<div class="container"> 

<table cellpadding="0" cellspacing="0" class="display" id="example1">
 <thead>
  <tr bgcolor="#991821">
	<th width="20%"  height="42" align="center"><font color="#FFFFFF" size="-1">CAPITULO</font></th>
    <th width="20%"  height="42" align="center"><font color="#FFFFFF" size="-1">ESTIMADO CAPITULO</font></th>
  </tr>
  <tfoot>
   <tr>
    <th  style="text-align:center">TOTAL:</th>
    <th  style="text-align:center"></th>
   </tr>
  </tfoot>
 </thead> 
 
<%=cargaConceptosGral(cr)%>

</table>

</div>
</div>
</div>


<div id="test">
</div>


<div id="tabla_editarUsuario" style="padding:50px; font-size:12px; display:none" class="animated zoomIn">

</div>

<input type="hidden" name="temp1" id="temp1" />
<input type="hidden" name="cr" id="cr" value="<%=cr%>"/>
<input type="hidden" name="capitulo" id="capitulo" />
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
