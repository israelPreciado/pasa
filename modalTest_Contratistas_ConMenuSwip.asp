<!--#include file="funcion3/funcion.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css3/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
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
	document.getElementById('frm_revisarAvance').action="modalTest_territorial.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}
function supervisores(){
	document.getElementById('frm_revisarAvance').action="modalTest_supervisores.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}
function contratistas(){
	document.getElementById('frm_revisarAvance').action="modalTest_contratistas.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}

  </script>
<!-- inicio 112 script necesario para que se ejecute el datatable-->
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
var subtotal8=0
$(document).ready(function() {
    $('#example1').DataTable( {
		
		"paging": false,
        "ordering": true,
        "info":     false,
		"searching": false,
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
 
 
            // Total over this page
            pageTotal = api
                .column( 2, { page: 'current'} )
                .data()
                .reduce( function (a, b) {

                    return intVal(a) + intVal(b);
                }, 0 );
 
            // Update footer
            //$( api.column( 2 ).footer() ).html(
//pageTotal
  //          );
        }
    } );
} );

function showDetalleAvance(territorial,query,estatusObra){

	//document.getElementById('loader').style.display="block"
	document.getElementById('query').value=query
	document.getElementById('estatusObra').value=estatusObra
	document.getElementById('territorial').value=territorial
	document.getElementById('frm_revisarAvance').action="modalTest_terr_contratistas_ConMenuSwip.asp"
	document.getElementById('frm_revisarAvance').submit()
	
}
function regresar(){
	document.getElementById('frm_revisarAvance').action="controlAcciones_proyGral_ConMenuSwip.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}
</script>
<!-- fin 112-->

<title>Documento sin título</title>

</head>
<%
estatus1=request("hddn_estatus1")
cpsp=request("hddn_estatus2")
territorial=request("hddn_territorial")
estatusObra=request("estatusObra")
%>
<%
if isempty(session("xmd")) then
response.Redirect("default.asp?logout=true")
end if
%>
<body> 
<form name="frm_revisarAvance" id="frm_revisarAvance" method="post">
<input type="hidden" id="cr" name="cr"/>
<input type="hidden" name="estatus1" id="estatus1" value="<%=estatus1%>"/>
<input type="hidden" name="estatus2" id="estatus2" value="<%=estatus2%>"/>
<input type="hidden" name="estatusObra" id="estatusObra" value="<%=estatusObra%>"/>
<input type="hidden" name="territorial" id="territorial"/>
<input type="hidden" id="query" name="query"/>
<div class="container">
    <div id="sidebar">
        <ul>
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
			
<!-- empieza el contenido-->	

<!-- DIRECTOR NACIONAL-->
<% if session.contents("zonaDirector")="" then%>			
<table width="70%" align="center">
 <tr><td>
<div class="datagrid">
<table cellpadding="0" cellspacing="0" class="display" id="example1">
<thead>
	<tr>
		<th width="10%">&nbsp;</th><th width="30%">Territorio</th><th width="10%"># Contratistas</th><th width="10%"># Sucursales</th><th width="10%">Terminadas</th><th width="10%">En Proceso</th><th width="10%">Por Iniciar</th>
	</tr>
</thead>
<tfoot>
   <tr>
    <th  style="text-align:center" colspan="2">TOTAL</th>
    <th  style="text-align:center;cursor:pointer" onclick="showDetalleAvance('',2,'autorizadas')"><%=numeroConTerritorial%></th>
	<th  style="text-align:center;cursor:pointer" onclick="showDetalleAvance('',2,'autorizadas')"><%=numeroSucTerritorial%></th>
	<th  style="text-align:center;cursor:pointer" onclick="showDetalleAvance('',2,'terminadas')"><%=numeroSucTerrRegional_Estatus(territorial, 3,3,query)%></th>
	<th  style="text-align:center;cursor:pointer" onclick="showDetalleAvance('',2,'enProceso')"><%=numeroSucTerrRegional_Estatus(territorial, 1,2,query)%></th>
	<th  style="text-align:center;cursor:pointer" onclick="showDetalleAvance('',2,'porIniciar')"><%=numeroSucTerrRegional_Estatus(territorial, 0,0,query)%></th>
   </tr>
</tfoot>
<tbody>
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr


sql1="SELECT contratistas.*, sucursales.Sucursales, sucursales.terminadas, sucursales.enProceso, sucursales.porIniciar FROM( SELECT TERRITORIAL.Territorial, NoContratistas.contratistas FROM( SELECT b.Territorial FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr GROUP BY b.Territorial) TERRITORIAL LEFT JOIN(( SELECT a.Territorial, COUNT(*) AS contratistas FROM( SELECT a.ContratistaAsignado, b.Territorial, d.contratista FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_contratistas d ON a.ContratistaAsignado = d.id_contratista GROUP BY a.ContratistaAsignado, b.territorial) a GROUP BY a.Territorial)) AS NoContratistas ON territorial.Territorial = NoContratistas.Territorial) contratistas LEFT JOIN( SELECT territorios.Territorial, CASE WHEN TotalSuc.sucursales IS NULL THEN 0 ELSE TotalSuc.sucursales END AS Sucursales, CASE WHEN terminadas.sucursales IS NULL THEN 0 ELSE terminadas.sucursales END AS terminadas, CASE WHEN enProceso.sucursales IS NULL THEN 0 ELSE enProceso.sucursales END AS enProceso, CASE WHEN porIniciar.sucursales IS NULL THEN 0 ELSE porIniciar.sucursales END AS porIniciar FROM( SELECT b.Territorial FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr GROUP BY b.Territorial) territorios LEFT JOIN( SELECT b.Territorial, COUNT(*) sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr GROUP BY b.Territorial) TotalSuc ON territorios.Territorial = TotalSuc.Territorial LEFT JOIN( SELECT b.Territorial, COUNT(*) sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE EstatusObra = 3 GROUP BY b.Territorial) terminadas ON territorios.Territorial = terminadas.Territorial LEFT JOIN( SELECT b.Territorial, COUNT(*) sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE( EstatusObra = 1 OR EstatusObra = 2) GROUP BY b.Territorial) enProceso ON territorios.Territorial = enProceso.Territorial LEFT JOIN( SELECT b.Territorial, COUNT(*) sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE EstatusObra = 0 GROUP BY b.Territorial) porIniciar ON territorios.Territorial = porIniciar.Territorial) sucursales ON contratistas.territorial = sucursales.territorial"
  
rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close
else
while not (rs1.eof)

%>
<tr>
 <td align="center" style="cursor:pointer"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'autorizadas')"><font size="+2"><span class="icon-search"></span></font></td>
 <td><font color="#000000"><%=rs1("territorial")%></font></td>
 <td  align="center" style="cursor:pointer"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'autorizadas')"><font color="#000000"><%=rs1("contratistas")%></font></td>
 <td  align="center" style="cursor:pointer"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'autorizadas')"><font color="#000000"><%=rs1("sucursales")%></font></td>
 <td align="center" style="cursor:pointer"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'terminadas')"><font color="#000000"><%=rs1("terminadas")%></font></td>
 <td align="center" style="cursor:pointer"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'enProceso')"><font color="#000000"><%=rs1("enProceso")%></font></td>
 <td  align="center" style="cursor:pointer"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'porIniciar')"><font color="#000000"><%=rs1("porIniciar")%></font></td>
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
<!-- Termina el contenido-->	

<!--DIRECTOR DIVISIONAL-->
<%else%>

<table width="70%" align="center">
 <tr><td>
<div class="datagrid">
<table cellpadding="0" cellspacing="0" class="display" id="example1">
<thead>
	<tr>
		<th width="10%">&nbsp;</th><th width="30%">Territorio</th><th width="10%"># Contratistas</th><th width="10%"># Sucursales</th><th width="10%">Terminadas</th><th width="10%">En Proceso</th><th width="10%">Por Iniciar</th>
	</tr>
</thead>
<tfoot>
   <tr>
    <th  style="text-align:center" colspan="2">TOTAL</th>
    <th  style="text-align:center;cursor:pointer" onclick="showDetalleAvance('',2,'autorizadas')"><%=numeroConTerritorialZona(session.contents("zonaDirector"))%></th>
	<th  style="text-align:center;cursor:pointer" onclick="showDetalleAvance('',2,'autorizadas')"><%=numeroSucTerritorialZona(session.contents("zonaDirector"))%></th>
	<th  style="text-align:center;cursor:pointer" onclick="showDetalleAvance('',2,'terminadas')"><%=numeroSucTerrRegional_EstatusZona(territorial, 3,3,query,session.contents("zonaDirector"))%></th>
	<th  style="text-align:center;cursor:pointer" onclick="showDetalleAvance('',2,'enProceso')"><%=numeroSucTerrRegional_EstatusZona(territorial, 1,2,query,session.contents("zonaDirector"))%></th>
	<th  style="text-align:center;cursor:pointer" onclick="showDetalleAvance('',2,'porIniciar')"><%=numeroSucTerrRegional_EstatusZona(territorial, 0,0,query,session.contents("zonaDirector"))%></th>
   </tr>
</tfoot>
<tbody>
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr


sql1="SELECT contratistas.*, sucursales.Sucursales, sucursales.terminadas, sucursales.enProceso, sucursales.porIniciar FROM( SELECT TERRITORIAL.Territorial, NoContratistas.contratistas FROM( SELECT b.Territorial FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & SESSION.contents("zonaDirector") & " GROUP BY b.Territorial) TERRITORIAL LEFT JOIN(( SELECT a.Territorial, COUNT(*) AS contratistas FROM( SELECT a.ContratistaAsignado, b.Territorial, d.contratista FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_contratistas d ON a.ContratistaAsignado = d.id_contratista WHERE b.zona_territorial = " & SESSION.contents("zonaDirector") & " GROUP BY a.ContratistaAsignado, b.territorial) a GROUP BY a.Territorial)) AS NoContratistas ON territorial.Territorial = NoContratistas.Territorial) contratistas LEFT JOIN( SELECT territorios.Territorial, CASE WHEN TotalSuc.sucursales IS NULL THEN 0 ELSE TotalSuc.sucursales END AS Sucursales, CASE WHEN terminadas.sucursales IS NULL THEN 0 ELSE terminadas.sucursales END AS terminadas, CASE WHEN enProceso.sucursales IS NULL THEN 0 ELSE enProceso.sucursales END AS enProceso, CASE WHEN porIniciar.sucursales IS NULL THEN 0 ELSE porIniciar.sucursales END AS porIniciar FROM( SELECT b.Territorial FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & SESSION.contents("zonaDirector") & " GROUP BY b.Territorial) territorios LEFT JOIN( SELECT b.Territorial, COUNT(*) sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & SESSION.contents("zonaDirector") & " GROUP BY b.Territorial) TotalSuc ON territorios.Territorial = TotalSuc.Territorial LEFT JOIN( SELECT b.Territorial, COUNT(*) sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE EstatusObra = 3 AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " GROUP BY b.Territorial) terminadas ON territorios.Territorial = terminadas.Territorial LEFT JOIN( SELECT b.Territorial, COUNT(*) sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE( EstatusObra = 1 OR EstatusObra = 2) AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " GROUP BY b.Territorial) enProceso ON territorios.Territorial = enProceso.Territorial LEFT JOIN( SELECT b.Territorial, COUNT(*) sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE EstatusObra = 0 AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " GROUP BY b.Territorial) porIniciar ON territorios.Territorial = porIniciar.Territorial) sucursales ON contratistas.territorial = sucursales.territorial"
  
rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close
else
while not (rs1.eof)

%>
<tr>
 <td align="center" style="cursor:pointer"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'autorizadas')"><font size="+2"><span class="icon-search"></span></font></td>
 <td><font color="#000000"><%=rs1("territorial")%></font></td>
 <td  align="center" style="cursor:pointer"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'autorizadas')"><font color="#000000"><%=rs1("contratistas")%></font></td>
 <td  align="center" style="cursor:pointer"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'autorizadas')"><font color="#000000"><%=rs1("sucursales")%></font></td>
 <td align="center" style="cursor:pointer"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'terminadas')"><font color="#000000"><%=rs1("terminadas")%></font></td>
 <td align="center" style="cursor:pointer"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'enProceso')"><font color="#000000"><%=rs1("enProceso")%></font></td>
 <td  align="center" style="cursor:pointer"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'porIniciar')"><font color="#000000"><%=rs1("porIniciar")%></font></td>
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
<!-- Termina el contenido-->	
<%end if%>
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





