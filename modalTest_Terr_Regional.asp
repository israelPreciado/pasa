<!--#include file="funcion3/funcion.inc"-->
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="css3/login.css" rel="stylesheet" type="text/css">
  <link href="style.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="css3/animate.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
  <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />
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
    width: 70%;
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

<script language="javascript"> 

function cambiarClase(id){
	$(document.getElementById(id)).addClass('animated zoomIn').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
			function(){
				$(this).removeClass('animated zoomIn');
        });
}

function showDetalleAvance(territorial,estatus1,estatus2,estatus3,estatus4,regional){

	document.getElementById('estatus1').value=estatus1
	document.getElementById('estatus2').value=estatus2
	document.getElementById('estatus3').value=estatus3
	document.getElementById('estatus4').value=estatus4
	document.getElementById('regional').value=regional
	document.getElementById('frm_revisarAvance').action="modalTest_terr_regional_paso2.asp"
	document.getElementById('frm_revisarAvance').submit()
	
}
function showDetallePendientes(cr){
	document.getElementById('loader').style.display="block"
	detSearchPendientes(cr)
	document.getElementById('detallePendientes').style.display="block";
	cambiarClase("detallePendientes")
	
}
function regresar(){
	document.getElementById('frm_revisarAvance').action="modalTest_territorial.asp"
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
function verPendientes(cr){
document.getElementById('cr').value=cr
document.getElementById('frm_revisarAvance').action="verPendientesPerfilAdmin.asp"
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

territorial=request("territorial")
query=request("query")
anio="2018"
estatusObra=request("estatusObra")
estatus2=request("estatus2")
estatus1=request("estatus1")
estatus3=request("estatus3")
estatus4=request("estatus4")
%>
</head>
<body>
<form name="frm_revisarAvance" id="frm_revisarAvance" method="get" enctype="multipart/form-data">

<input type="hidden" id="cr" name="cr"/>
<input type="hidden" name="estatus1" id="estatus1" value="<%=estatus1%>"/>
<input type="hidden" name="estatus2" id="estatus2" value="<%=estatus2%>"/>
<input type="hidden" name="estatus3" id="estatus3" value="<%=estatus3%>"/>
<input type="hidden" name="estatus4" id="estatus4" value="<%=estatus4%>"/>
<input type="hidden" name="estatusObra" id="estatusObra" value="<%=estatusObra%>"/>
<input type="hidden" id="query" name="query" value="<%=query%>"/>
<input type="hidden" name="territorial" id="territorial" value="<%=territorial%>"/>
<input type="hidden" id="regional" name="regional"/>
</form>
<div class="animated zoomIn">


<table width="60%" align="center">
 <tr><td>
<div class="datagrid">
<%if estatusObra="autorizadas" then%>
<table cellpadding="0" cellspacing="0" class="display" id="example1">
<thead>
	<tr>
		<th width="40%">Region</th><th width="15%"># Sucursal Autorizadas</th><th width="15%">Terminadas</th><th width="15%">En Proceso</th><th width="15%">Por Iniciar</th>
	</tr>
</thead>
<tfoot>
   <tr>
    <th  style="text-align:center">TOTAL</th>
    <th  style="text-align:center;<%if cint(numeroSucTerrRegional(territorial,query,estatusObra))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional(territorial,query,estatusObra))>0 then%> onclick="showDetalleAvance('<%=territorial%>',3,2,1,0,'')" <%end if%>><%=numeroSucTerrRegional(territorial,query,estatusObra)%></th>
	<th  style="text-align:center;<%if cint(numeroSucTerrRegional_Estatus(territorial, 3,3,query))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional_Estatus(territorial, 3,3,query))>0 then%> onclick="showDetalleAvance('<%=territorial%>',3,3,3,3,'')" <%end if%>><%=numeroSucTerrRegional_Estatus(territorial, 3,3,query)%></th>
	<th  style="text-align:center;<%if cint(numeroSucTerrRegional_Estatus(territorial, 2,1,query))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional_Estatus(territorial, 2,1,query))>0 then%> onclick="showDetalleAvance('<%=territorial%>',2,1,1,1,'')" <%end if%>><%=numeroSucTerrRegional_Estatus(territorial, 2,1,query)%></th>
	<th  style="text-align:center;<%if cint(numeroSucTerrRegional_Estatus(territorial, 0,0,query))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional_Estatus(territorial, 0,0,query))>0 then%> onclick="showDetalleAvance('<%=territorial%>',0,0,0,0,'')" <%end if%>><%=numeroSucTerrRegional_Estatus(territorial,0,0,query)%></th>
   </tr>
</tfoot>
<tbody>
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr

if query="1" then
sql1="SELECT total.*, CASE WHEN terminadas.NoSucursales IS NULL THEN 0 ELSE terminadas.NoSucursales END AS terminadas, CASE WHEN enProceso.NoSucursales IS NULL THEN 0 ELSE enProceso.NoSucursales END AS enProceso, CASE WHEN porIniciar.NoSucursales IS NULL THEN 0 ELSE porIniciar.NoSucursales END AS porIniciar FROM( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.Territorial = '" & territorial & "' GROUP BY Regional) AS total LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND( c.id_estatusObra = 2 OR c.id_estatusObra = 1) GROUP BY Regional) AS enProceso ON total.Regional = enProceso.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND(c.id_estatusObra = 3) GROUP BY Regional) AS terminadas ON total.Regional = terminadas.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND(c.id_estatusObra = 0) GROUP BY Regional) AS porIniciar ON total.Regional = porIniciar.Regional"
else
if query="2" then
sql1="SELECT total.*, CASE WHEN terminadas.NoSucursales IS NULL THEN 0 ELSE terminadas.NoSucursales END AS terminadas, CASE WHEN enProceso.NoSucursales IS NULL THEN 0 ELSE enProceso.NoSucursales END AS enProceso, CASE WHEN porIniciar.NoSucursales IS NULL THEN 0 ELSE porIniciar.NoSucursales END AS porIniciar FROM( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr  GROUP BY Regional) AS total LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE ( c.id_estatusObra = 2 OR c.id_estatusObra = 1) GROUP BY Regional) AS enProceso ON total.Regional = enProceso.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE(c.id_estatusObra = 3) GROUP BY Regional) AS terminadas ON total.Regional = terminadas.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE (c.id_estatusObra = 0) GROUP BY Regional) AS porIniciar ON total.Regional = porIniciar.Regional"
end if
end if
 
rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close
else
while not (rs1.eof)

%>
 <tr>
  <td align="center" ><font color="#000000"><%=rs1("regional")%></font></td>
  <td  style="text-align:center;<%if cint(rs1("NoSucursales"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("NoSucursales"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',3,2,1,0,'<%=rs1("regional")%>')" <%end if%>><font color="#000000"><%=rs1("NoSucursales")%></font></td>
  <td  style="text-align:center;<%if cint(rs1("terminadas"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("terminadas"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',3,3,3,3,'<%=rs1("regional")%>')" <%end if%>><font color="#000000"><%=rs1("terminadas")%></font></td>
  <td  style="text-align:center;<%if cint(rs1("enProceso"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("enProceso"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',2,1,1,1,'<%=rs1("regional")%>')" <%end if%>><font color="#000000"><%=rs1("enProceso")%></font></td>
  <td  style="text-align:center;<%if cint(rs1("porIniciar"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("porIniciar"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',0,0,0,0,'<%=rs1("regional")%>')" <%end if%>><font color="#000000"><%=rs1("porIniciar")%></font></td>
 </tr>
<%

rs1.movenext
	wend 
rs1.close
conn3.close 
set rs1=nothing
set conn3=nothing
end if 
%> 
</tbody>
</table>
</td>
</tr>
<table>

<%end if%>

<%if estatusObra="terminadas" then%>
<table cellpadding="0" cellspacing="0" class="display" id="example1">
<thead>
	<tr>
		<th width="70%">Region</th><th width="30%">Terminadas</th>
	</tr>
</thead>
<tfoot>
   <tr>
    <th  style="text-align:center">TOTAL</th>
	<th  style="text-align:center;<%if cint(numeroSucTerrRegional_Estatus(territorial, 3,3,query))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional_Estatus(territorial, 3,3,query))>0 then%> onclick="showDetalleAvance('<%=territorial%>',3,3,3,3,'')" <%end if%>><%=numeroSucTerrRegional_Estatus(territorial, 3,3,query)%></th>
   </tr>
</tfoot>
<tbody>
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr

if query="1" then
sql1="SELECT total.*, CASE WHEN terminadas.NoSucursales IS NULL THEN 0 ELSE terminadas.NoSucursales END AS terminadas, CASE WHEN enProceso.NoSucursales IS NULL THEN 0 ELSE enProceso.NoSucursales END AS enProceso, CASE WHEN porIniciar.NoSucursales IS NULL THEN 0 ELSE porIniciar.NoSucursales END AS porIniciar FROM( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.Territorial = '" & territorial & "' GROUP BY Regional) AS total LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND( c.id_estatusObra = 2 OR c.id_estatusObra = 1) GROUP BY Regional) AS enProceso ON total.Regional = enProceso.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND(c.id_estatusObra = 3) GROUP BY Regional) AS terminadas ON total.Regional = terminadas.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND(c.id_estatusObra = 0) GROUP BY Regional) AS porIniciar ON total.Regional = porIniciar.Regional"
else
if query="2" then
sql1="SELECT total.*, CASE WHEN terminadas.NoSucursales IS NULL THEN 0 ELSE terminadas.NoSucursales END AS terminadas, CASE WHEN enProceso.NoSucursales IS NULL THEN 0 ELSE enProceso.NoSucursales END AS enProceso, CASE WHEN porIniciar.NoSucursales IS NULL THEN 0 ELSE porIniciar.NoSucursales END AS porIniciar FROM( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr  GROUP BY Regional) AS total LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE ( c.id_estatusObra = 2 OR c.id_estatusObra = 1) GROUP BY Regional) AS enProceso ON total.Regional = enProceso.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE(c.id_estatusObra = 3) GROUP BY Regional) AS terminadas ON total.Regional = terminadas.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE (c.id_estatusObra = 0) GROUP BY Regional) AS porIniciar ON total.Regional = porIniciar.Regional"
end if
end if
 
rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close
else
while not (rs1.eof)

%>
 <tr>
  <td align="center" ><font color="#000000"><%=rs1("regional")%></font></td>
  <td  style="text-align:center;<%if cint(rs1("terminadas"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("terminadas"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',3,3,3,3,'<%=rs1("regional")%>')" <%end if%>><font color="#000000"><%=rs1("terminadas")%></font></td>
 </tr>
<%

rs1.movenext
	wend 
rs1.close
conn3.close 
set rs1=nothing
set conn3=nothing
end if 
%> 
</tbody>
</table>
</td>
</tr>
<table>

<%end if%>

<%if estatusObra="enProceso" then%>
<table cellpadding="0" cellspacing="0" class="display" id="example1">
<thead>
	<tr>
		<th width="70%">Region</th><th width="30%">En Proceso</th>
	</tr>
</thead>
<tfoot>
   <tr>
    <th  style="text-align:center">TOTAL</th>
	<th  style="text-align:center;<%if cint(numeroSucTerrRegional_Estatus(territorial, 2,1,query))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional_Estatus(territorial, 2,1,query))>0 then%> onclick="showDetalleAvance('<%=territorial%>',2,1,1,1,'')" <%end if%>><%=numeroSucTerrRegional_Estatus(territorial, 2,1,query)%></th>
   </tr>
</tfoot>
<tbody>
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr

if query="1" then
sql1="SELECT total.*, CASE WHEN terminadas.NoSucursales IS NULL THEN 0 ELSE terminadas.NoSucursales END AS terminadas, CASE WHEN enProceso.NoSucursales IS NULL THEN 0 ELSE enProceso.NoSucursales END AS enProceso, CASE WHEN porIniciar.NoSucursales IS NULL THEN 0 ELSE porIniciar.NoSucursales END AS porIniciar FROM( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.Territorial = '" & territorial & "' GROUP BY Regional) AS total LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND( c.id_estatusObra = 2 OR c.id_estatusObra = 1) GROUP BY Regional) AS enProceso ON total.Regional = enProceso.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND(c.id_estatusObra = 3) GROUP BY Regional) AS terminadas ON total.Regional = terminadas.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND(c.id_estatusObra = 0) GROUP BY Regional) AS porIniciar ON total.Regional = porIniciar.Regional"
else
if query="2" then
sql1="SELECT total.*, CASE WHEN terminadas.NoSucursales IS NULL THEN 0 ELSE terminadas.NoSucursales END AS terminadas, CASE WHEN enProceso.NoSucursales IS NULL THEN 0 ELSE enProceso.NoSucursales END AS enProceso, CASE WHEN porIniciar.NoSucursales IS NULL THEN 0 ELSE porIniciar.NoSucursales END AS porIniciar FROM( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr  GROUP BY Regional) AS total LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE ( c.id_estatusObra = 2 OR c.id_estatusObra = 1) GROUP BY Regional) AS enProceso ON total.Regional = enProceso.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE(c.id_estatusObra = 3) GROUP BY Regional) AS terminadas ON total.Regional = terminadas.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE (c.id_estatusObra = 0) GROUP BY Regional) AS porIniciar ON total.Regional = porIniciar.Regional"
end if
end if
 
rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close
else
while not (rs1.eof)

%>
 <tr>
  <td align="center" ><font color="#000000"><%=rs1("regional")%></font></td>
  <td  style="text-align:center;<%if cint(rs1("enProceso"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("enProceso"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',2,1,1,1,'<%=rs1("regional")%>')" <%end if%>><font color="#000000"><%=rs1("enProceso")%></font></td>
 </tr>
<%

rs1.movenext
	wend 
rs1.close
conn3.close 
set rs1=nothing
set conn3=nothing
end if 
%> 
</tbody>
</table>
</td>
</tr>
<table>

<%end if%>

<%if estatusObra="porIniciar" then%>
<table cellpadding="0" cellspacing="0" class="display" id="example1">
<thead>
	<tr>
		<th width="70%">Region</th><th width="30%">Por Iniciar</th>
	</tr>
</thead>
<tfoot>
   <tr>
    <th  style="text-align:center">TOTAL</th>
	<th  style="text-align:center;<%if cint(numeroSucTerrRegional_Estatus(territorial, 0,0,query))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional_Estatus(territorial, 0,0,query))>0 then%> onclick="showDetalleAvance('<%=territorial%>',0,0,0,0,'')" <%end if%>><%=numeroSucTerrRegional_Estatus(territorial,0,0,query)%></th>
   </tr>
</tfoot>
<tbody>
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr

if query="1" then
sql1="SELECT total.*, CASE WHEN terminadas.NoSucursales IS NULL THEN 0 ELSE terminadas.NoSucursales END AS terminadas, CASE WHEN enProceso.NoSucursales IS NULL THEN 0 ELSE enProceso.NoSucursales END AS enProceso, CASE WHEN porIniciar.NoSucursales IS NULL THEN 0 ELSE porIniciar.NoSucursales END AS porIniciar FROM( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.Territorial = '" & territorial & "' GROUP BY Regional) AS total LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND( c.id_estatusObra = 2 OR c.id_estatusObra = 1) GROUP BY Regional) AS enProceso ON total.Regional = enProceso.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND(c.id_estatusObra = 3) GROUP BY Regional) AS terminadas ON total.Regional = terminadas.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND(c.id_estatusObra = 0) GROUP BY Regional) AS porIniciar ON total.Regional = porIniciar.Regional"
else
if query="2" then
sql1="SELECT total.*, CASE WHEN terminadas.NoSucursales IS NULL THEN 0 ELSE terminadas.NoSucursales END AS terminadas, CASE WHEN enProceso.NoSucursales IS NULL THEN 0 ELSE enProceso.NoSucursales END AS enProceso, CASE WHEN porIniciar.NoSucursales IS NULL THEN 0 ELSE porIniciar.NoSucursales END AS porIniciar FROM( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr  GROUP BY Regional) AS total LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE ( c.id_estatusObra = 2 OR c.id_estatusObra = 1) GROUP BY Regional) AS enProceso ON total.Regional = enProceso.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE(c.id_estatusObra = 3) GROUP BY Regional) AS terminadas ON total.Regional = terminadas.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE (c.id_estatusObra = 0) GROUP BY Regional) AS porIniciar ON total.Regional = porIniciar.Regional"
end if
end if
 
rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close
else
while not (rs1.eof)

%>
 <tr>
  <td align="center" ><font color="#000000"><%=rs1("regional")%></font></td>
  <td  style="text-align:center;<%if cint(rs1("porIniciar"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("porIniciar"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',0,0,0,0,'<%=rs1("regional")%>')" <%end if%>><font color="#000000"><%=rs1("porIniciar")%></font></td>
 </tr>
<%

rs1.movenext
	wend 
rs1.close
conn3.close 
set rs1=nothing
set conn3=nothing
end if 
%> 
</tbody>
</table>
</td>
</tr>
<table>

<%end if%>

<br/>
   <table width="40%" align="center">
     <tr>
     <td width="10%">&nbsp;</td>
      <td width="20%"><input  type="button" value="Regresar" onclick="regresar()" name="btnEnviar" /></td>
      <td width="10%">&nbsp;</td>
     </tr>
    </table>
  <br/>
<br/>



</div>



<div class="container">
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
</div>

<div class="modal fade" id="modalFotos" role="dialog">
	
</div>

<div id="album" class="modal fade" role="dialog">
<!-- *****-->
	
<!--*********-->
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
function showModalFotos(cr,dia,mes,anio){
	//detCargaFotos(cr,dia,mes,anio)
	$("#album").modal('hide')
	setTimeout(function(){ detCargaFotos(cr,dia,mes,anio); }, 500);
	
	 //$("#modalFotos").modal();
}
function showModalFotos2(){
	//detComp(cr)
	 $("#modalFotos").modal();
}
function showModalAlbum(){

	//document.getElementById('cr').value=cr
	//detComp(cr)
	 $("#album").modal();
}
function showModalAlbum2(cr){
	document.getElementById('cr').value=cr
	detAlbum(cr)
	//document.getElementById('cr').value=cr
	//detComp(cr)
	 //$("#album").modal();
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
			$("#footer").html(document.getElementById('zonaFoto').value);
			//alertify.success(document.getElementById('zonaFoto').value );
			return false;
		});
		$("#sinPendientes").on( 'click', function () {
			reset();
			//$("#footer").html(document.getElementById('zonaFoto').value);
			alertify.error("No hay pendientes que mostrar");
			return false;
		});
		
		// Standard Dialogs Pendientes a Supervisor
		 $("#pendiente_alert").on( 'click', function () {
	reset();
	alertify.alert("El campo de pendiente debe estar lleno");
	return false;
 });
 $("#pendiente_alertFoto").on( 'click', function () {
	reset();
	alertify.alert("Debes cargar una foto");
	return false;
 });
 $("#pendiente_alert2").on( 'click', function () {
	reset();
	alertify.alert("Ya no puedes agregar mas Cajas de Texto");
	return false;
	});
 $("#pendiente_alert3").on( 'click', function () {
	reset();
	alertify.alert("Hay campos que aun no Actualizas");
	return false;
  });
  $("#pendiente_alert41").on( 'click', function () {
	reset();
	alertify.alert("Elemento Actualizado Exitosamente");
	return false;
  });
$("#pendiente_alert4").on( 'click', function () {
	reset();
	alertify.alert("Subiendo pendiente");
	alertify.success("Subiendo pendiente");
	alertify.success("esto puede tardar un poco");
	return false;
  });  
  $("#pendiente_confirm").on( 'click', function () {
			reset();
			alertify.confirm("¿Quieres continuar sin cargar una foto?", function (e) {
				if (e) {
					document.getElementById('sinFoto').value="sinFoto"
					agregar(document.getElementById('idControl').value)
				}
			});
			return false;
		});
		 $("#pendiente_confirmUpdate").on( 'click', function () {
			reset();
			alertify.confirm("¿Quieres continuar sin cargar una foto?", function (e) {
				if (e) {
					document.getElementById('sinFoto').value="sinFoto"
					update(document.getElementById('idControl').value)
				}
			});
			return false;
		});
	</script>
	<script>
//funcion para poner estilo a la tabla principal
var subtotal8=0
$(document).ready(function() {
    $('#example1').DataTable( {
		
		"paging": true,
        "ordering": true,
        "info":     true,
		"searching": true,
		"lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
		"oLanguage": {
		  "sSearch":         "Buscar:",
		  "sInfo": "Mostrando del _START_ al _END_ de _TOTAL_ registros",
		  "sInfoEmpty":      "Mostrando 0 registros",
		  "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
		  "sEmptyTable":     "Ningún servicio adicional",
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
 
 
 
            // Update footer
            //$( api.column( 2 ).footer() ).html(
//pageTotal
  //          );
        }
    } );
} );


</script>
</body>
</html>
