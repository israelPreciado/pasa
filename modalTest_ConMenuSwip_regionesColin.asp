<!--#include file="funcion3/funcion.inc"-->
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <link href="style.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="css3/animate.css">

  <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
  <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />
  <link rel="stylesheet" href="css4/styleMenuSwipeable.css" type="text/css" media="screen" charset="utf-8">
    	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="js/jsplug.js"></script>
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
    width: 60%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);

}
/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 18px;
    font-weight: bold;
}
  .modal-header, h4 {
      background-color: #90191c;
      color:white !important;
      text-align: center;
      font-size: 10px;
  }
  .modal-footer {
      background-color: #fcbdbd;
	  color:#90191c !important;
	  text-align: center;
      font-size:10px;
  }
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


input[type="button"]:hover{
 background:#f00404;
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
<style type="text/css" title="currentStyle">
			@import "DataTables/media/css/jquery.dataTables.min.css";
			@import "DataTables/media/css/dataTables.jqueryui.min.css";
			@import "DataTables/media/css/jquery-ui.css";
</style>
<script type="text/javascript" language="javascript" src="DataTables/media/js/jquery.dataTables.js"></script>
<script src="DataTables/media/js/jquery.dataTables.columnFilter.js" type="text/javascript"></script>
<script src="DataTables/media/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="DataTables/media/js/dataTables.jqueryui.min.js" type="text/javascript"></script>
<script>
//funcion para poner estilo a la tabla principal
$(document).ready(function() {
	
    $('#example1' ).DataTable( {
        "paging": true,
        "ordering": true,
        "info":     false,
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
</script>
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
	document.getElementById('frm_revisarAvance').action="revisar_avance_ConMenuSwip.asp"
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
function detAlbum(cr){

	$.ajax({
	type: "GET",
	url: "calcula_album.asp?cr=" + cr, 
	dataType: "html", 
	success: function(response){ 
	$("#album").html(response);
	//document.getElementById('loader').style.display="none"
	showModalAlbum()
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
 function detCargaFotos(cr,dia,mes,anio){

	$.ajax({
	type: "GET",
	//url: "carga_fotos.asp?cr=" + cr ,
	url: "carga_fotos.asp?cr=" + cr + "&dia=" + dia + "&mes=" + mes + "&anio=" + anio, 	
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
	//document.getElementById('loader').style.display="none"
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
	function sinPendientes(){
		simulateClick(document.getElementById('sinPendientes')) 
	}
	function formatNumber (num) {
    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
}
</script>
<script>
function confirmaSinFoto(idControl,cr){
document.getElementById('atmPendiente').value=cr
if(document.getElementById('fileFotografia').value==""){
			document.getElementById('idControl').value=idControl
			simulateClick(document.getElementById('pendiente_confirm'))
		}
		else{
		
			agregar(idControl)
		}
}
function agregar(idControl){
	var control=0
	var bandera=false
	familia=document.getElementById("input" + idControl).value;
	if (familia.length == 0 || /^\s+$/.test(familia)){
		simulateClick(document.getElementById('pendiente_alert'))	
		document.getElementById("input" + idControl).value=""
		document.getElementById("input" + idControl).focus();
		bandera=false
	}
	else{
			bandera=true
	}
	if (bandera==true){

   if(idControl<5000200){
   if(document.getElementById('fileFotografia').value==""){
   simulateClick(document.getElementById('pendiente_alert4'))
			insertPendiente(document.getElementById('atmPendiente').value,document.getElementById("input" + idControl).value)
		}
		else{
   simulateClick(document.getElementById('pendiente_alert4'))
   document.getElementById('accion').value=1
	  control=idControl+1
	  document.getElementById("input" + idControl).disabled=true
	  document.getElementById("agregar" + idControl).style.display="none"
	  document.getElementById("edit" + idControl).style.display="block"
	  document.getElementById("input" + control).style.display = "block";
	  document.getElementById("agregar" + control).style.display="block"
	  document.getElementById('frm_revisarAvance').action="guardaFotoPendienteASupervisor.asp"
	  document.getElementById('pendiente').value=document.getElementById("input" + idControl).value
	  document.getElementById('frm_revisarAvance').submit()
 	 } 
	  //insertPendiente(''session.Contents("cr")',document.getElementById("input" + idControl).value,document.getElementById("hddnEnviar").value,1)
   }
   else{

	   simulateClick(document.getElementById('pendiente_alert2'))		
	   document.getElementById("agregar" + idControl).style.display="none"
	   document.getElementById("input" + idControl).disabled=true
	   document.getElementById("edit" + idControl).style.display="block"
	   document.getElementById('frm_avanceObra').action="guardaFotoPendienteASupervisor.asp"
	   document.getElementById('pendiente').value=document.getElementById("input" + idControl).value
	   document.getElementById('accion').value=1
	   document.getElementById('frm_avanceObra').submit()
	   
	   //insertPendiente(''session.Contents("cr")',document.getElementById("input" + idControl).value,document.getElementById("hddnEnviar").value,1)

	   
   }
	}
 }
 function confirmaSinFotoUpdate(idControl){
if(document.getElementById('fileFotografia').value==""){
			document.getElementById('idControl').value=idControl

			simulateClick(document.getElementById('pendiente_confirmUpdate'))
		}
		else{
			update(idControl)
		}
}
 function update(idControl){
	var control=0
	var bandera=false
	familia=document.getElementById("input" + idControl).value;
	if (familia.length == 0 || /^\s+$/.test(familia)){
		simulateClick(document.getElementById('pendiente_alert'))	
		document.getElementById("input" + idControl).value=""
		document.getElementById("input" + idControl).focus();
		bandera=false
	}
	else{

			bandera=true
		
	}
	if (bandera==true){
if(document.getElementById('fileFotografia').value==""){
   simulateClick(document.getElementById('pendiente_alert4'))
			updateSuc(document.getElementById("input" + idControl).value,idControl,document.getElementById('hddnEnviar').value)
		}
		else{
	simulateClick(document.getElementById('pendiente_alert4'))
	  document.getElementById("input" + idControl).disabled="false"
   	  document.getElementById("edit" + idControl).style.display="block"
	  document.getElementById("update" + idControl).style.display="none"
	  document.getElementById("input" + idControl).disabled="true"
	  document.getElementById('frm_revisarAvance').action="guardaFotoPendienteASupervisor.asp"
	  document.getElementById('pendiente').value=document.getElementById("input" + idControl).value
	  document.getElementById('accion').value=2
	  document.getElementById('id_pendiente').value=idControl
	  document.getElementById('frm_revisarAvance').submit()
	}
	}
 }
 
 function edit(idControl){
	var control=0	
	  document.getElementById("input" + idControl).disabled=false;  
	  document.getElementById("agregar" + idControl).style.display="none"
	  document.getElementById("edit" + idControl).style.display="none"
	  document.getElementById("camara" + idControl).style.display="block"
	  document.getElementById("imagen" + idControl).style.display="none"
	  document.getElementById("update" + idControl).style.display="block"
	  document.getElementById('fileFotografia').value="" 
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
 function recorreElementos(){
	var elemento = document.getElementById('login').getElementsByTagName('img');
	var nombre
	var res
	for (var i=0; i<elemento.length; i++){
		str = document.getElementById(elemento[i].name).name
		res = str.substring(0, 6);
		if (res=="update" && document.getElementById(elemento[i].name).style.display=="block"){
			simulateClick(document.getElementById('pendiente_alert3'))
			break	
		}
		else{
			document.getElementById('frm_revisarAvance').submit()
		}
	}
}

function insertPendiente(cr,pendiente){
	document.getElementById('frm_revisarAvance').action="insertPendiente2Supervisor.asp?cr=" + cr + "&pendiente=" + pendiente 
document.getElementById('frm_revisarAvance').submit()
}
function updateSuc(pendiente,id_pendiente,modulo){
	
	document.getElementById('frm_revisarAvance').action="updatePendiente2Supervisor.asp?pendiente=" + pendiente + "&id_pendiente=" + id_pendiente + "&modulo=" + modulo
document.getElementById('frm_revisarAvance').submit()


}

function validar2(idControl){

	document.getElementById('fileFotografia').click()

}
function verImagenes(idControl,cr){
	document.getElementById('id_pendiente').value=idControl
	document.getElementById('cr').value=cr
	document.getElementById('frm_revisarAvance').action="verImagenesPendientesSupervisorAdmin.asp"
	document.getElementById('frm_revisarAvance').submit()
}
function verDetalle(cr){
document.getElementById('cr').value=cr
document.getElementById('frm_revisarAvance').action="detalleConceptosGralPorCR.asp"
document.getElementById('frm_revisarAvance').submit()
}
function cierraDiv(){
document.getElementById('detallePendientes').style.display='none'
}
function detSearchPendientesASupervisor(cr){

	//$.ajax({
	//type: "GET",
	//url: "cargaPendientesSupervisor.asp?cr=" + cr, 
	//dataType: "html", 
	//success: function(response){ 
	//$("#detallePendientes").html(response);
	//document.getElementById('detallePendientes').style.display='block'
	//}
  //});
  document.getElementById('frm_revisarAvance').action="cargaPendientesSupervisor.asp?cr=" + cr
  document.getElementById('frm_revisarAvance').submit()

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
<%
if isempty(session("xmd")) then
response.Redirect("default.asp?logout=true")
end if
%>
</head>
<body>
<form name="form_inmueble" id="form_inmueble" method="post">

</form>
<div class="container">
    <div id="sidebar">
        <ul>
        <ul>
            <li><a href="busqueda_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Buscar un CR</a></li>
            <li><a href="revisar_avance_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Avance General</a></li>
			<li><a href="controlAcciones_proyGral_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Proyecto General</a></li>
			<li><a href="modalTest_ConMenuSwip_regionesColin.asp" target = "contenido" style="text-decoration:none">Informe Ejecutivo</a></li>
			<li><a href="zanasColin.asp" target = "contenido" style="text-decoration:none">Informe General</a></li>
            <li><a href="controlAccionesTacticas_ConMenuSwip.asp">Acciones T&aacute;cticas</a></li>
        </ul>
    </div>
    <div class="main-content">
    <div class="swipe-area"></div>
        <a href="#" data-toggle=".container" id="sidebar-toggle">
            <span class="bar"></span>
            <span class="bar"></span>
            <span class="bar"></span>
        </a>
        <div class="content">
           <div class="animated zoomIn">
<!--inicio Conetenido-->
		   

<table width="90%" align="center">
 <tr><td>
<div class="datagrid">
<table cellpadding="0" cellspacing="0" class="display" id="example1">
  <thead>
    <tr>
     <th>TERRITORIAL</th>
     <th>TOTAL</th>
     <th>TERMINADAS</th>
     <th>EN TIEMPO</th>
     <th>POR INICIAR</th>
     <th>CON ATRASO</th>
     <th>SUSPENDIDAS</th>
     </tr>
  </thead>
<tbody>
<%
   

  'creamos un objeto de tipo "connection" para la 
  'conexión con el origen de datos ODBC 
  set conexion = Server.CreateObject("ADODB.Connection")

  'nos conectamos al origen de datos ODBC "bdoracle"
  conexion.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};server=localhost;database=app_bnrt_2018; uid=root;pwd=; option=3"

  'creamos un objeto de tipo "recordset" (tabla) 
  Set rsTabla = Server.CreateObject("ADODB.Recordset") 


    sql = " (select"
    sql = sql & " z.territorial,"
    sql = sql & " sum(ifnull(y.por_iniciar,0) + ifnull(x.en_tiempo,0) + ifnull(w.Con_Atraso,0) + ifnull(u.suspendida,0)) as total,"
    sql = sql & " ifnull(v.Terminada,0) as terminadas, "
    sql = sql & " ifnull(x.en_tiempo,0) as en_tiempo,"
    sql = sql & " ifnull(y.por_iniciar,0) as por_iniciar,"
    sql = sql & " ifnull(w.Con_Atraso,0) as con_atraso,"
    sql = sql & " ifnull(u.suspendida,0)as suspendidas"
    sql = sql & " from"
   sql = sql & " ("
   sql = sql & " select c.territorial from tseguimiento a "
   sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
    sql = sql & " GROUP BY c.Territorial) z"
   sql = sql & " LEFT JOIN ("
   sql = sql & " select c.territorial, count(a.cr) as por_iniciar from tseguimiento a "
   sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
    sql = sql & " where a.EstatusObra = 0"
    sql = sql & " GROUP BY c.Territorial) y on z.territorial = y.territorial"
   sql = sql & " LEFT JOIN("
   sql = sql & " select c.territorial, count(a.cr) as en_tiempo from tseguimiento a "
   sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
    sql = sql & " where a.EstatusObra = 1"
    sql = sql & " GROUP BY c.Territorial) x on z.territorial = x.territorial"
   sql = sql & " LEFT JOIN("
   sql = sql & " select c.territorial, count(a.cr) as Con_Atraso  from tseguimiento a "
   sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
   sql = sql & " where a.EstatusObra = 2"
    sql = sql & " GROUP BY c.Territorial) w on z.territorial = w.territorial"
   sql = sql & " LEFT JOIN("
   sql = sql & " select c.territorial, count(a.cr) as Terminada from tseguimiento a "
   sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
   sql = sql & " where a.EstatusObra = 3"
    sql = sql & " GROUP BY c.Territorial) v on z.territorial = v.territorial"
   sql = sql & " LEFT JOIN("
   sql = sql & " select c.territorial, count(a.cr) as suspendida from tseguimiento a "
   sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
   sql = sql & " where a.EstatusObra = 4"
    sql = sql & " GROUP BY c.Territorial) u on z.territorial = u.territorial"
   sql = sql & " GROUP BY z.territorial)"

  'asignamos al objeto "rsTabla" el resultado de la ejecución de la consulta SQL 
  rsTabla.Open sql, conexion, 0
  
  'Recorremos todos los registros del objeto recordset y mostramos su valor 
 
    if rsTabla.eof then

    %>

     <%
         else
		  while not(rstabla.eof)
         %>

        <tr >
          <td ><%=rstabla("TERRITORIAL")%></td>
          <td ><%=rstabla("TOTAL")%></td>
          <td ><%=rstabla("TERMINADAS")%></td>
          <td ><%=rstabla("EN_TIEMPO")%></td>
          <td ><%=rstabla("POR_INICIAR")%></td>
          <td ><%=rstabla("CON_ATRASO")%></td>
          <td ><%=rstabla("SUSPENDIDAS")%></td>
        </tr>
<%
	 rstabla.MoveNext 
		wend
      'cerramos el recordset y la conexión 
		 rsTabla.close 
         conexion.close 
		
         
  'liberamos los objetos 
          Set conexion = Nothing 
          Set rsTabla = Nothing 
	
         end if
		%>
</tbody>
</table>

</div>
</td>
</tr>
<table>
<!--fin Conetenido-->
</body>
</html>
