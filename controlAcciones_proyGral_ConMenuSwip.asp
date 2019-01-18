<!--#include file="funcion3/funcion.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css3/bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css4/styleMenuSwipeable.css" type="text/css" media="screen" charset="utf-8">
<link rel="stylesheet" href="css3/animate.css">
  <link href="css3/login2.css" rel="stylesheet" type="text/css">
<style>
.datagrid table { border-collapse: collapse; text-align: left; width: 100%; } .datagrid {font: normal 12px/150% Arial, Helvetica, sans-serif; background: #fff; overflow: hidden; border: 1px solid #991821; -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; }.datagrid table td, .datagrid table th { padding: 3px 10px; }.datagrid table thead th {background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #991821), color-stop(1, #80141C) );background:-moz-linear-gradient( center top, #991821 5%, #80141C 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#991821', endColorstr='#80141C');background-color:#991821; color:#FFFFFF; font-size: 15px; font-weight: bold; border-left: 1px solid #B01C26; } .datagrid table thead th:first-child { border: none; }.datagrid table tbody td { color: #80141C; border-left: 1px solid #F7CDCD;font-size: 12px;font-weight: normal; }.datagrid table tbody .alt td { background: #F7CDCD; color: #80141C; }.datagrid table tbody td:first-child { border-left: none; }.datagrid table tbody tr:last-child td { border-bottom: none; }.datagrid table tfoot td div { border-top: 1px solid #991821;background: #F7CDCD;} .datagrid table tfoot td { padding: 0; font-size: 12px } .datagrid table tfoot td div{ padding: 2px; }.datagrid table tfoot td ul { margin: 0; padding:0; list-style: none; text-align: right; }.datagrid table tfoot  li { display: inline; }.datagrid table tfoot li a { text-decoration: none; display: inline-block;  padding: 2px 8px; margin: 1px;color: #FFFFFF;border: 1px solid #991821;-webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #991821), color-stop(1, #80141C) );background:-moz-linear-gradient( center top, #991821 5%, #80141C 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#991821', endColorstr='#80141C');background-color:#991821; }.datagrid table tfoot ul.active, .datagrid table tfoot ul a:hover { text-decoration: none;border-color: #80141C; color: #FFFFFF; background: none; background-color:#991821;}div.dhtmlx_window_active, div.dhx_modal_cover_dv { position: fixed !important; }
}
</style>  
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="js/jsplug.js"></script>
  <script language="javascript">
  
  function territorios(){
	document.getElementById('frm_revisarAvance').action="modalTest_territorial_ConMenuSwip.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}
function supervisores(){
	document.getElementById('frm_revisarAvance').action="modalTest_supervisores_ConMenuSwip.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}
function contratistas(){
	document.getElementById('frm_revisarAvance').action="modalTest_contratistas_ConMenuSwip.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}

    function buscarCR(){
	document.getElementById('frm_revisarAvance').action="modalTestBuscarCR_ConMenuSwip.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}
  function enviar(estatus1,estatus2,territorial){
	  document.getElementById('hddn_estatus1').value=estatus1
	  document.getElementById('hddn_estatus2').value=estatus2
	  document.getElementById('hddn_territorial').value=territorial
	  //document.getElementById('frm_revisarAvance').action="revisar_avanceDetalle.asp"	
	  document.getElementById('frm_revisarAvance').action="modalTest_ConMenuSwip.asp"	
	  document.getElementById('frm_revisarAvance').submit()  
  }
    function enviarETFT(estatus1,division,cpsp){
	  document.getElementById('hddn_estatus1').value=estatus1
	  document.getElementById('hddn_territorial').value=division
	  document.getElementById('hddn_estatus2').value=cpsp
	  //document.getElementById('frm_revisarAvance').action="revisar_avanceDetalle.asp"	
	  document.getElementById('frm_revisarAvance').action="modalTest_ETFT_ConMenuSwip.asp"	
	  document.getElementById('frm_revisarAvance').submit()  
  }
  function verPenVen(){
	document.getElementById('frm_revisarAvance').action="modalTest_PenFueraTiempo_ConMenuSwip.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}
  function verFotPen(){
	document.getElementById('frm_revisarAvance').action="modalTest_PenFotos_ConMenuSwip.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}
  function verSucSinAct(){
	document.getElementById('frm_revisarAvance').action="modalTest_UltimoReporte_ConMenuSwip.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}


  </script>
  

<title>Documento sin título</title>
<%
if isempty(session("xmd")) then
response.Redirect("default.asp?logout=true")
end if
%>
</head>

<body> 
<form name="frm_revisarAvance" id="frm_revisarAvance" method="post">
<div class="container">
    <div id="sidebar">
        <ul>
            <li><a href="revisar_avanceGraficas_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Home</a></li>
            <li><a href="busqueda_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Buscar un CR</a></li>
            <li><a href="revisar_avance_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Avance General</a></li>
			<li><a href="controlAcciones_proyGral_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Proyecto General</a></li>
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
			<table width="40%" align="center" class="animated zoomIn">
   		<tr height="30%">
    		<td width="15%" height="137">&nbsp;</td>
     	</tr>
     	<tr height="30%">
     		<td width="15%" height="53">&nbsp;</td>
      		<td width="55%"><input  type="button" value="Territorios" onclick="territorios()" name="btnEnviar" /></td>
      		<td width="30%">&nbsp;</td>
     	</tr>
        <tr height="30%">
     		<td width="15%" height="53">&nbsp;</td>
      		<td width="55%"><input  type="button" value="Supervisores" onclick="supervisores()" name="btnEnviar" /></td>
      		<td width="30%">&nbsp;</td>
     	</tr>
		<tr height="30%">
     		<td width="15%" height="53">&nbsp;</td>
      		<td width="55%"><input  type="button" value="Contratistas" onclick="contratistas()" name="btnEnviar" /></td>
      		<td width="30%">&nbsp;</td>
     	</tr>
    </table>
  <br/>
    </div>
    </div>
</div>
<input type="hidden" name="hddn_estatus1" id="hddn_estatus1" />
<input type="hidden" name="hddn_estatus2" id="hddn_estatus2" />
<input type="hidden" name="hddn_territorial" id="hddn_territorial" />
</form>
</body>
</html>





