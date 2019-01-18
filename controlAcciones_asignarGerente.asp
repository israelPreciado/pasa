<!--#include file="funcion3/funcion.inc"-->
<!--#include file="funcion3/funcion_edicion_usuarios.inc"-->
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <link href="style.css" rel="stylesheet" type="text/css">
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
function editarUsuarios(){
	document.getElementById('frm_revisarAvance').action="edicion_gerentes.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}
function asignarObra(){
	document.getElementById('frm_revisarAvance').action="asignarObra.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}
function asignarGerente(){
	document.getElementById('frm_revisarAvance').action="asignarGerente.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}

function asignarObraEdit(){
	document.getElementById('frm_revisarAvance').action="asignarObraEdicion.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
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
function subirArchivo(){
document.getElementById('frm_revisarAvance').action="subirArchivo.asp"
document.getElementById('frm_revisarAvance').submit()
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
function editarAsignar(){
 if (document.getElementById('cr').value==""){
	simulateClick(document.getElementById('alert'))
 }
 else{
	document.getElementById('frm_revisarAvance').action="editar_detalleAlcances.asp"
	document.getElementById('frm_revisarAvance').submit()
 }
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
<body>
<form name="frm_revisarAvance" id="frm_revisarAvance" method="post">

	<table width="40%" align="center" class="animated zoomIn">
   		<tr height="30%">
    		<td width="15%" height="137">&nbsp;</td>
     	</tr>
     	<tr height="30%">
     		<td width="15%" height="53">&nbsp;</td>
      		<td width="55%"><input  type="button" value="Asignar Gerente" onclick="asignarGerente()" name="btnEnviar" /></td>
      		<td width="30%">&nbsp;</td>
     	</tr>
        <tr height="30%">
     		<td width="15%" height="53">&nbsp;</td>
      		<td width="55%"><input  type="button" value="Eliminar Supervisores Asignados" onclick="editarUsuarios()" name="btnEnviar" /></td>
      		<td width="30%">&nbsp;</td>
     	</tr>
    </table>
  <br/>
<br/>
<a href="#" id="alert" style="display:none"></a>
</form>
</div>



<div class="container">
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
</div>

<div class="modal fade" id="modalFotos" role="dialog">
	
</div>

</div><!--container-->
<script>
$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});

function showModal(cr,id_modulo){
	detComp(cr,id_modulo)
	// $("#myModal").modal();
}
function showModal2(){
	//detComp(cr)
	 $("#myModal").modal();
}
function showModalFotos(cr){
	detCargaFotos(cr)
	 //$("#modalFotos").modal();
}
function showModalFotos2(){
	//detComp(cr)
	 $("#modalFotos").modal();
}
</script>
<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";
  document.getElementById('zonaFoto').value=x[slideIndex-1].name
 simulateClick(document.getElementById('alert')) 
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
			alertify.alert("Debes elegir un cr" );
			return false;
		});
		
	</script>
</body>
</html>
