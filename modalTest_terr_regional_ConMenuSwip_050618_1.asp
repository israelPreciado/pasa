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
					 }  
    } );
	 $('#example2').DataTable( {
		
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
		  "sEmptyTable":     "Ningúna Sucursal Encontrada",
		  "sZeroRecords":    "No se encontraron resultados",
		  "sLengthMenu": "Mostrar _MENU_ Registros",
      	  "oPaginate": {
       	    "sNext": "Pagina Siguiente",
			"sPrevious": "Pagina Anterior"
						}
					 }  
    } );
	
	

} );

	
   





function showDetalleAvance(territorial,estatus1,estatus2,estatus3,estatus4,regional,mes){

	
	document.getElementById('estatus1').value=estatus1
	document.getElementById('estatus2').value=estatus2
	document.getElementById('estatus3').value=estatus3
	document.getElementById('estatus4').value=estatus4
	document.getElementById('regional').value=regional
	document.getElementById('mes').value=mes
	document.getElementById('frm_revisarAvance').action="modalTest_terr_regional_paso2_ConMenuSwip.asp"
	document.getElementById('frm_revisarAvance').submit()
	
}

</script>
<!-- fin 112-->

<title>Documento sin título</title>

</head>
<%

territorial=request("territorial")
query=request("query")
anio="2017"
estatusObra=request("estatusObra")
estatus2=request("estatus2")
estatus1=request("estatus1")
estatus3=request("estatus3")
estatus4=request("estatus4")
mes=request("mes")
entregada=request("entregada")
%>
<%
if isempty(session("xmd")) then
response.Redirect("default.asp?logout=true")
end if
%>
<body> 
<form name="frm_revisarAvance" id="frm_revisarAvance" method="get">
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
<!-- DIRECTOR NACIONAL-->
<% if session.contents("zonaDirector")="" then%>	
<!-- empieza el contenido-->			
<input type="hidden" id="cr" name="cr"/>
<input type="hidden" name="estatus1" id="estatus1" value="<%=estatus1%>"/>
<input type="hidden" name="estatus2" id="estatus2" value="<%=estatus2%>"/>
<input type="hidden" name="estatus3" id="estatus3" value="<%=estatus3%>"/>
<input type="hidden" name="estatus4" id="estatus4" value="<%=estatus4%>"/>
<input type="hidden" name="estatusObra" id="estatusObra" value="<%=estatusObra%>"/>
<input type="hidden" id="query" name="query" value="<%=query%>"/>
<input type="hidden" name="territorial" id="territorial" value="<%=territorial%>"/>
<input type="hidden" name="mes" id="mes" value="<%=mes%>"/>
<input type="hidden" id="regional" name="regional"/>
<input type="hidden" id="entregada" name="entregada" value="<%=entregada%>"/>

<table width="60%" align="center">
	<tr>
		<td>
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
							<th  style="text-align:center;<%if cint(numeroSucTerrRegional(territorial,query,estatusObra))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional(territorial,query,estatusObra))>0 then%> onclick="showDetalleAvance('<%=territorial%>',3,2,1,0,'','')" <%end if%>><%=numeroSucTerrRegional(territorial,query,estatusObra)%></th>
							<th  style="text-align:center;<%if cint(numeroSucTerrRegional_Estatus(territorial, 3,3,query))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional_Estatus(territorial, 3,3,query))>0 then%> onclick="showDetalleAvance('<%=territorial%>',3,3,3,3,'','')" <%end if%>><%=numeroSucTerrRegional_Estatus(territorial, 3,3,query)%></th>
							<th  style="text-align:center;<%if cint(numeroSucTerrRegional_Estatus(territorial, 2,1,query))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional_Estatus(territorial, 2,1,query))>0 then%> onclick="showDetalleAvance('<%=territorial%>',2,1,1,1,'','')" <%end if%>><%=numeroSucTerrRegional_Estatus(territorial, 2,1,query)%></th>
							<th  style="text-align:center;<%if cint(numeroSucTerrRegional_Estatus(territorial, 0,0,query))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional_Estatus(territorial, 0,0,query))>0 then%> onclick="showDetalleAvance('<%=territorial%>',0,0,0,0,'','')" <%end if%>><%=numeroSucTerrRegional_Estatus(territorial,0,0,query)%></th>
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
							<td  style="text-align:center;<%if cint(rs1("NoSucursales"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("NoSucursales"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',3,2,1,0,'<%=rs1("regional")%>','')" <%end if%>><font color="#000000"><%=rs1("NoSucursales")%></font></td>
							<td  style="text-align:center;<%if cint(rs1("terminadas"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("terminadas"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',3,3,3,3,'<%=rs1("regional")%>','')" <%end if%>><font color="#000000"><%=rs1("terminadas")%></font></td>
							<td  style="text-align:center;<%if cint(rs1("enProceso"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("enProceso"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',2,1,1,1,'<%=rs1("regional")%>','')" <%end if%>><font color="#000000"><%=rs1("enProceso")%></font></td>
							<td  style="text-align:center;<%if cint(rs1("porIniciar"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("porIniciar"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',0,0,0,0,'<%=rs1("regional")%>','')" <%end if%>><font color="#000000"><%=rs1("porIniciar")%></font></td>
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
			</div>	
		</td>
	</tr>
<table>
			<%end if%>

			<%if estatusObra="terminadas" then%>
				<%if entregada="1" then%>
					<table cellpadding="0" cellspacing="0" class="display" id="example1">
						<thead>
							<tr>
								<th width="70%">Region</th><th width="30%">Terminadas</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th  style="text-align:center">TOTAL</th>
								<th  style="text-align:center;<%if cint(numeroSucTerrRegional_Estatus(territorial, 3,3,query))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional_Estatus(territorial, 3,3,query))>0 then%> onclick="showDetalleAvance('<%=territorial%>',3,3,3,3,'','')" <%end if%>><%=numeroSucTerrRegional_Estatus(territorial, 3,3,query)%></th>
							</tr>
						</tfoot>
						<tbody>
					<%
					set conn3=server.CreateObject("adodb.connection")
					set rs1=server.CreateObject("adodb.recordset")
					conn3.open connstr

					if query="1" then
						sql1="SELECT total.*, CASE WHEN terminadas.NoSucursales IS NULL THEN 0 ELSE terminadas.NoSucursales END AS terminadas, CASE WHEN enProceso.NoSucursales IS NULL THEN 0 ELSE enProceso.NoSucursales END AS enProceso, CASE WHEN porIniciar.NoSucursales IS NULL THEN 0 ELSE porIniciar.NoSucursales END AS porIniciar FROM( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.Territorial = '" & territorial & "' GROUP BY Regional) AS total LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND( c.id_estatusObra = 2 OR c.id_estatusObra = 1) GROUP BY Regional) AS enProceso ON total.Regional = enProceso.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' and a.entregada=1 GROUP BY Regional ) AS terminadas ON total.Regional = terminadas.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND(c.id_estatusObra = 0) GROUP BY Regional) AS porIniciar ON total.Regional = porIniciar.Regional"
					else
						if query="2" then
							sql1="SELECT total.*, CASE WHEN terminadas.NoSucursales IS NULL THEN 0 ELSE terminadas.NoSucursales END AS terminadas, CASE WHEN enProceso.NoSucursales IS NULL THEN 0 ELSE enProceso.NoSucursales END AS enProceso, CASE WHEN porIniciar.NoSucursales IS NULL THEN 0 ELSE porIniciar.NoSucursales END AS porIniciar FROM( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr  GROUP BY Regional) AS total LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE ( c.id_estatusObra = 2 OR c.id_estatusObra = 1) GROUP BY Regional) AS enProceso ON total.Regional = enProceso.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE(a.entregada=1) GROUP BY Regional) AS terminadas ON total.Regional = terminadas.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE (c.id_estatusObra = 0) GROUP BY Regional) AS porIniciar ON total.Regional = porIniciar.Regional"
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
								<td  style="text-align:center;<%if cint(rs1("terminadas"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("terminadas"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',3,3,3,3,'<%=rs1("regional")%>','')" <%end if%>><font color="#000000"><%=rs1("terminadas")%></font></td>
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
		<%else%>
<table cellpadding="0" cellspacing="0" class="display" id="example1">
<thead>
	<tr>
		<th width="70%">Region</th><th width="30%">Terminadas</th>
	</tr>
</thead>
<tfoot>
   <tr>
    <th  style="text-align:center">TOTAL</th>
	<th  style="text-align:center;<%if cint(numeroSucTerrRegional_Estatus(territorial, 3,3,query))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional_Estatus(territorial, 3,3,query))>0 then%> onclick="showDetalleAvance('<%=territorial%>',3,3,3,3,'','')" <%end if%>><%=numeroSucTerrRegional_Estatus(territorial, 3,3,query)%></th>
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
  <td  style="text-align:center;<%if cint(rs1("terminadas"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("terminadas"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',3,3,3,3,'<%=rs1("regional")%>','')" <%end if%>><font color="#000000"><%=rs1("terminadas")%></font></td>
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
	<th  style="text-align:center;<%if cint(numeroSucTerrRegional_Estatus(territorial, 2,1,query))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional_Estatus(territorial, 2,1,query))>0 then%> onclick="showDetalleAvance('<%=territorial%>',2,1,1,1,'','')" <%end if%>><%=numeroSucTerrRegional_Estatus(territorial, 2,1,query)%></th>
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
  <td  style="text-align:center;<%if cint(rs1("enProceso"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("enProceso"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',2,1,1,1,'<%=rs1("regional")%>','')" <%end if%>><font color="#000000"><%=rs1("enProceso")%></font></td>
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
	<th  style="text-align:center;<%if cint(numeroSucTerrRegional_Estatus(territorial, 0,0,query))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional_Estatus(territorial, 0,0,query))>0 then%> onclick="showDetalleAvance('<%=territorial%>',0,0,0,0,'','')" <%end if%>><%=numeroSucTerrRegional_Estatus(territorial,0,0,query)%></th>
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
  <td  style="text-align:center;<%if cint(rs1("porIniciar"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("porIniciar"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',0,0,0,0,'<%=rs1("regional")%>','')" <%end if%>><font color="#000000"><%=rs1("porIniciar")%></font></td>
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
	
	
<!-- Termina el contenido-->	
<!-- DIRECTOR DIVISIONAL-->
<%else%>
<!-- empieza el contenido-->
<input type="hidden" name="estatus1" id="estatus1" value="<%=estatus1%>"/>
<input type="hidden" name="estatus2" id="estatus2" value="<%=estatus2%>"/>
<input type="hidden" name="estatus3" id="estatus3" value="<%=estatus3%>"/>
<input type="hidden" name="estatus4" id="estatus4" value="<%=estatus4%>"/>
<input type="hidden" name="estatusObra" id="estatusObra" value="<%=estatusObra%>"/>
<input type="hidden" id="query" name="query" value="<%=query%>"/>
<input type="hidden" name="territorial" id="territorial" value="<%=territorial%>"/>
<input type="hidden" id="regional" name="regional"/>
<input type="hidden" name="mes" id="mes" value="<%=mes%>"/>
<input type="hidden" id="entregada" name="entregada" value="<%=entregada%>"/>

<table width="60%" align="center">
	<tr>
		<td>
			<div class="datagrid">
				<%if estatusObra="autorizadas" then%>
				<table style="border:none" width="100%">
					<tr>
						<td valign="top">
							<table cellpadding="0" cellspacing="0" class="display" id="example2">
								<thead>
									<tr>
										<th width="70%">Mes</th>
										<th width="30%">Total</th>
									</tr>
								</thead>
								<tbody>
				<%
					set conn3=server.CreateObject("adodb.connection")
					set rs1=server.CreateObject("adodb.recordset")
					conn3.open connstr

					if query="1" then
						sql1="SELECT CASE WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '01' THEN 'ENERO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '02' THEN 'FEBRERO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '03' THEN 'MARZO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '04' THEN 'ABRIL' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '05' THEN 'MAYO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '06' THEN 'JUNIO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '07' THEN 'JULIO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '08' THEN 'AGOSTO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '09' THEN 'SEPTIEMBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '10' THEN 'OCTUBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '11' THEN 'NOVIEMBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '12' THEN 'DICIEMBRE' END AS MES, COUNT(a.CR) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & SESSION.contents("zonaDirector") & " AND b.territorial = '" & territorial & "' AND( a.estatusObra = 1 OR a.estatusObra = 2 OR a.estatusObra = 3 OR a.estatusObra = 0) GROUP BY LEFT(FechaInicio, 7)"
					else
						if query="2" then
							sql1="SELECT CASE WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '01' THEN 'ENERO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '02' THEN 'FEBRERO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '03' THEN 'MARZO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '04' THEN 'ABRIL' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '05' THEN 'MAYO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '06' THEN 'JUNIO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '07' THEN 'JULIO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '08' THEN 'AGOSTO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '09' THEN 'SEPTIEMBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '10' THEN 'OCTUBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '11' THEN 'NOVIEMBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '12' THEN 'DICIEMBRE' END AS MES, COUNT(a.CR) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & SESSION.contents("zonaDirector") & " AND( a.estatusObra = 1 OR a.estatusObra = 2 OR a.estatusObra = 3 OR a.estatusObra = 0) GROUP BY LEFT(FechaInicio, 7)"
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
										<td align="center" ><font color="#000000"><%=rs1("mes")%></font></td>
										<td  style="text-align:center;<%if cint(rs1("total"))>0 then%>cursor:pointer" onclick="showDetalleAvance('<%=territorial%>',2,1,3,0,'','<%=rs1("mes")%>')<%end if%>"><font color="#000000"><%=rs1("total")%></font></td>
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
						<td style="border:none" valign="top">
							<table cellpadding="0" cellspacing="0" class="display" id="example1">
								<thead>
									<tr>
										<th width="40%">Region</th>
										<th width="15%"># Sucursal Autorizadas</th>
										<th width="15%">Terminadas</th>
										<th width="15%">En Proceso</th>
										<th width="15%">Por Iniciar</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th  style="text-align:center">TOTAL</th>
										<th  style="text-align:center;<%if cint(numeroSucTerrRegionalZona(territorial,query,estatusObra,session.contents("zonaDirector")))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegionalZona(territorial,query,estatusObra,session.contents("zonaDirector")))>0 then%> onclick="showDetalleAvance('<%=territorial%>',3,2,1,0,'','')" <%end if%>><%=numeroSucTerrRegionalZona(territorial,query,estatusObra,session.contents("zonaDirector"))%></th>
										<th  style="text-align:center;<%if cint(numeroSucTerrRegional_EstatusZona(territorial, 3,3,query,session.contents("zonaDirector")))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional_EstatusZona(territorial, 3,3,query,session.contents("zonaDirector")))>0 then%> onclick="showDetalleAvance('<%=territorial%>',3,3,3,3,'','')" <%end if%>><%=numeroSucTerrRegional_EstatusZona(territorial, 3,3,query,session.contents("zonaDirector"))%></th>
										<th  style="text-align:center;<%if cint(numeroSucTerrRegional_EstatusZona(territorial, 2,1,query,session.contents("zonaDirector")))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional_EstatusZona(territorial, 2,1,query,session.contents("zonaDirector")))>0 then%> onclick="showDetalleAvance('<%=territorial%>',2,1,1,1,'','')" <%end if%>><%=numeroSucTerrRegional_EstatusZona(territorial, 2,1,query,session.contents("zonaDirector"))%></th>
										<th  style="text-align:center;<%if cint(numeroSucTerrRegional_EstatusZona(territorial, 0,0,query,session.contents("zonaDirector")))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional_EstatusZona(territorial, 0,0,query,session.contents("zonaDirector")))>0 then%> onclick="showDetalleAvance('<%=territorial%>',0,0,0,0,'','')" <%end if%>><%=numeroSucTerrRegional_EstatusZona(territorial,0,0,query,session.contents("zonaDirector"))%></th>
									</tr>
								</tfoot>
								<tbody>
				<%
					set conn3=server.CreateObject("adodb.connection")
					set rs1=server.CreateObject("adodb.recordset")
					conn3.open connstr

					if query="1" then
						sql1="SELECT total.*, CASE WHEN terminadas.NoSucursales IS NULL THEN 0 ELSE terminadas.NoSucursales END AS terminadas, CASE WHEN enProceso.NoSucursales IS NULL THEN 0 ELSE enProceso.NoSucursales END AS enProceso, CASE WHEN porIniciar.NoSucursales IS NULL THEN 0 ELSE porIniciar.NoSucursales END AS porIniciar FROM( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.Territorial = '" & territorial & "' and b.zona_territorial ='" & session.contents("zonaDirector") & "' GROUP BY Regional) AS total LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND( c.id_estatusObra = 2 OR c.id_estatusObra = 1) GROUP BY Regional) AS enProceso ON total.Regional = enProceso.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND(c.id_estatusObra = 3) GROUP BY Regional) AS terminadas ON total.Regional = terminadas.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND(c.id_estatusObra = 0) GROUP BY Regional) AS porIniciar ON total.Regional = porIniciar.Regional"
					else
						if query="2" then
							sql1="SELECT total.*, CASE WHEN terminadas.NoSucursales IS NULL THEN 0 ELSE terminadas.NoSucursales END AS terminadas, CASE WHEN enProceso.NoSucursales IS NULL THEN 0 ELSE enProceso.NoSucursales END AS enProceso, CASE WHEN porIniciar.NoSucursales IS NULL THEN 0 ELSE porIniciar.NoSucursales END AS porIniciar FROM( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr where b.zona_territorial ='" & session.contents("zonaDirector") & "' GROUP BY Regional) AS total LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE ( c.id_estatusObra = 2 OR c.id_estatusObra = 1) GROUP BY Regional) AS enProceso ON total.Regional = enProceso.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE(c.id_estatusObra = 3) GROUP BY Regional) AS terminadas ON total.Regional = terminadas.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE (c.id_estatusObra = 0) GROUP BY Regional) AS porIniciar ON total.Regional = porIniciar.Regional"
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
										<td  style="text-align:center;<%if cint(rs1("NoSucursales"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("NoSucursales"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',3,2,1,0,'<%=rs1("regional")%>','')" <%end if%>><font color="#000000"><%=rs1("NoSucursales")%></font></td>
										<td  style="text-align:center;<%if cint(rs1("terminadas"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("terminadas"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',3,3,3,3,'<%=rs1("regional")%>','')" <%end if%>><font color="#000000"><%=rs1("terminadas")%></font></td>
										<td  style="text-align:center;<%if cint(rs1("enProceso"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("enProceso"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',2,1,1,1,'<%=rs1("regional")%>','')" <%end if%>><font color="#000000"><%=rs1("enProceso")%></font></td>
										<td  style="text-align:center;<%if cint(rs1("porIniciar"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("porIniciar"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',0,0,0,0,'<%=rs1("regional")%>','')" <%end if%>><font color="#000000"><%=rs1("porIniciar")%></font></td>
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
			</div>	
		</td>
	</tr>
<table>

<%if estatusObra="terminadas" then%>
	<%if entregada="1" then%>
		<table style="border:none" width="100%">
			<tr>
				<td valign="top">
					<table cellpadding="0" cellspacing="0" class="display" id="example2">
						<thead>
							<tr>
								<th width="70%">Mes</th><th width="30%">Total</th>
							</tr>
						</thead>
						<tbody>
	<%
	set conn3=server.CreateObject("adodb.connection")
	set rs1=server.CreateObject("adodb.recordset")
	conn3.open connstr

	if query="1" then
		sql1="SELECT CASE WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '01' THEN 'ENERO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '02' THEN 'FEBRERO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '03' THEN 'MARZO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '04' THEN 'ABRIL' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '05' THEN 'MAYO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '06' THEN 'JUNIO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '07' THEN 'JULIO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '08' THEN 'AGOSTO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '09' THEN 'SEPTIEMBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '10' THEN 'OCTUBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '11' THEN 'NOVIEMBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '12' THEN 'DICIEMBRE' END AS MES, COUNT(a.CR) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & SESSION.contents("zonaDirector") & " AND b.territorial = '" & territorial & "' and a.entregada=1 GROUP BY LEFT(FechaInicio, 7)"
	else
		if query="2" then
			sql1="SELECT CASE WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '01' THEN 'ENERO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '02' THEN 'FEBRERO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '03' THEN 'MARZO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '04' THEN 'ABRIL' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '05' THEN 'MAYO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '06' THEN 'JUNIO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '07' THEN 'JULIO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '08' THEN 'AGOSTO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '09' THEN 'SEPTIEMBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '10' THEN 'OCTUBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '11' THEN 'NOVIEMBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '12' THEN 'DICIEMBRE' END AS MES, COUNT(a.CR) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & SESSION.contents("zonaDirector") & "and a.entregada=1 GROUP BY LEFT(FechaInicio, 7)"
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
								<td align="center" ><font color="#000000"><%=rs1("mes")%></font></td>
								<td  style="text-align:center;<%if cint(rs1("total"))>0 then%>cursor:pointer" onclick="showDetalleAvance('<%=territorial%>',3,3,3,3,'','<%=rs1("mes")%>')<%end if%>"><font color="#000000"><%=rs1("total")%></font></td>
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
 <td style="border:none" valign="top">
<!--<table cellpadding="0" cellspacing="0" class="display" id="example1">
<thead>
	<tr>
		<th width="70%">Region</th><th width="30%">Terminadas</th>
	</tr>
</thead>
<tfoot>
   <tr>
    <th  style="text-align:center">TOTAL</th>
	<th  style="text-align:center;<%if cint(numeroSucTerrRegional_EstatusZonaEntregadas(territorial, 3,3,query,session.contents("zonaDirector")))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional_EstatusZonaEntregadas(territorial, 3,3,query,session.contents("zonaDirector")))>0 then%> onclick="showDetalleAvance('<%=territorial%>',3,3,3,3,'','')" <%end if%>><%=numeroSucTerrRegional_EstatusZonaEntregadas(territorial, 3,3,query,session.contents("zonaDirector"))%></th>
   </tr>
</tfoot>
<tbody>
-->
<%
'set conn3=server.CreateObject("adodb.connection")
'set rs1=server.CreateObject("adodb.recordset")
'conn3.open connstr

'if query="1" then
'sql1="SELECT total.*, CASE WHEN terminadas.NoSucursales IS NULL THEN 0 ELSE terminadas.NoSucursales END AS terminadas, CASE WHEN enProceso.NoSucursales IS NULL THEN 0 ELSE enProceso.NoSucursales END AS enProceso, CASE WHEN porIniciar.NoSucursales IS NULL THEN 0 ELSE porIniciar.NoSucursales END AS porIniciar FROM( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.Territorial = '" & territorial & "' and b.zona_territorial ='" & session.contents("zonaDirector") & "' GROUP BY Regional) AS total LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND( c.id_estatusObra = 2 OR c.id_estatusObra = 1) GROUP BY Regional) AS enProceso ON total.Regional = enProceso.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND(a.entregada=1) GROUP BY Regional) AS terminadas ON total.Regional = terminadas.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND(c.id_estatusObra = 0) GROUP BY Regional) AS porIniciar ON total.Regional = porIniciar.Regional"
'else
'if query="2" then
'sql1="SELECT total.*, CASE WHEN terminadas.NoSucursales IS NULL THEN 0 ELSE terminadas.NoSucursales END AS terminadas, CASE WHEN enProceso.NoSucursales IS NULL THEN 0 ELSE enProceso.NoSucursales END AS enProceso, CASE WHEN porIniciar.NoSucursales IS NULL THEN 0 ELSE porIniciar.NoSucursales END AS porIniciar FROM( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr where b.zona_territorial ='" & session.contents("zonaDirector") & "' GROUP BY Regional) AS total LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE ( c.id_estatusObra = 2 OR c.id_estatusObra = 1) GROUP BY Regional) AS enProceso ON total.Regional = enProceso.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE(a.entregada=1) GROUP BY Regional) AS terminadas ON total.Regional = terminadas.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE (c.id_estatusObra = 0) GROUP BY Regional) AS porIniciar ON total.Regional = porIniciar.Regional"
'end if
'end if
 
'rs1.open sql1, conn3
'if rs1.eof then
'	rs1.close
'	conn3.close
'else
'while not (rs1.eof)

%>
<!-- <tr>
  <td align="center" ><font color="#000000"><%=rs1("regional")%></font></td>
  <td  style="text-align:center;<%if cint(rs1("terminadas"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("terminadas"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',3,3,3,3,'<%=rs1("regional")%>','')" <%end if%>><font color="#000000"><%=rs1("terminadas")%></font></td>
 </tr>
 -->
<%

'rs1.movenext
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
</td>
</tr>
<table>
<%else%>
<table style="border:none" width="100%">
 <tr>
 <td valign="top">
	<table cellpadding="0" cellspacing="0" class="display" id="example2">
		<thead>
			<tr>
				<th width="70%">Mes</th><th width="30%">Total</th>
			</tr>
		</thead>
		<tbody>
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr

if query="1" then
sql1="SELECT CASE WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '01' THEN 'ENERO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '02' THEN 'FEBRERO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '03' THEN 'MARZO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '04' THEN 'ABRIL' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '05' THEN 'MAYO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '06' THEN 'JUNIO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '07' THEN 'JULIO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '08' THEN 'AGOSTO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '09' THEN 'SEPTIEMBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '10' THEN 'OCTUBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '11' THEN 'NOVIEMBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '12' THEN 'DICIEMBRE' END AS MES, COUNT(a.CR) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & SESSION.contents("zonaDirector") & " AND b.territorial = '" & territorial & "' AND( a.estatusObra = 3 ) GROUP BY LEFT(FechaInicio, 7)"
else
if query="2" then
sql1="SELECT CASE WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '01' THEN 'ENERO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '02' THEN 'FEBRERO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '03' THEN 'MARZO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '04' THEN 'ABRIL' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '05' THEN 'MAYO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '06' THEN 'JUNIO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '07' THEN 'JULIO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '08' THEN 'AGOSTO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '09' THEN 'SEPTIEMBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '10' THEN 'OCTUBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '11' THEN 'NOVIEMBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '12' THEN 'DICIEMBRE' END AS MES, COUNT(a.CR) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & SESSION.contents("zonaDirector") & " AND( a.estatusObra = 3) GROUP BY LEFT(FechaInicio, 7)"
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
  <td align="center" ><font color="#000000"><%=rs1("mes")%></font></td>
  <td  style="text-align:center;<%if cint(rs1("total"))>0 then%>cursor:pointer" onclick="showDetalleAvance('<%=territorial%>',3,3,3,3,'','<%=rs1("mes")%>')<%end if%>"><font color="#000000"><%=rs1("total")%></font></td>
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
 <td style="border:none" valign="top">
<table cellpadding="0" cellspacing="0" class="display" id="example1">
<thead>
	<tr>
		<th width="70%">Region</th><th width="30%">Terminadas</th>
	</tr>
</thead>
<tfoot>
   <tr>
    <th  style="text-align:center">TOTAL</th>
	<th  style="text-align:center;<%if cint(numeroSucTerrRegional_EstatusZona(territorial, 3,3,query,session.contents("zonaDirector")))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional_EstatusZona(territorial, 3,3,query,session.contents("zonaDirector")))>0 then%> onclick="showDetalleAvance('<%=territorial%>',3,3,3,3,'','')" <%end if%>><%=numeroSucTerrRegional_EstatusZona(territorial, 3,3,query,session.contents("zonaDirector"))%></th>
   </tr>
</tfoot>
<tbody>
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr

if query="1" then
sql1="SELECT total.*, CASE WHEN terminadas.NoSucursales IS NULL THEN 0 ELSE terminadas.NoSucursales END AS terminadas, CASE WHEN enProceso.NoSucursales IS NULL THEN 0 ELSE enProceso.NoSucursales END AS enProceso, CASE WHEN porIniciar.NoSucursales IS NULL THEN 0 ELSE porIniciar.NoSucursales END AS porIniciar FROM( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.Territorial = '" & territorial & "' and b.zona_territorial ='" & session.contents("zonaDirector") & "' GROUP BY Regional) AS total LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND( c.id_estatusObra = 2 OR c.id_estatusObra = 1) GROUP BY Regional) AS enProceso ON total.Regional = enProceso.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND(c.id_estatusObra = 3) GROUP BY Regional) AS terminadas ON total.Regional = terminadas.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND(c.id_estatusObra = 0) GROUP BY Regional) AS porIniciar ON total.Regional = porIniciar.Regional"
else
if query="2" then
sql1="SELECT total.*, CASE WHEN terminadas.NoSucursales IS NULL THEN 0 ELSE terminadas.NoSucursales END AS terminadas, CASE WHEN enProceso.NoSucursales IS NULL THEN 0 ELSE enProceso.NoSucursales END AS enProceso, CASE WHEN porIniciar.NoSucursales IS NULL THEN 0 ELSE porIniciar.NoSucursales END AS porIniciar FROM( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr where b.zona_territorial ='" & session.contents("zonaDirector") & "' GROUP BY Regional) AS total LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE ( c.id_estatusObra = 2 OR c.id_estatusObra = 1) GROUP BY Regional) AS enProceso ON total.Regional = enProceso.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE(c.id_estatusObra = 3) GROUP BY Regional) AS terminadas ON total.Regional = terminadas.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE (c.id_estatusObra = 0) GROUP BY Regional) AS porIniciar ON total.Regional = porIniciar.Regional"
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
  <td  style="text-align:center;<%if cint(rs1("terminadas"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("terminadas"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',3,3,3,3,'<%=rs1("regional")%>','')" <%end if%>><font color="#000000"><%=rs1("terminadas")%></font></td>
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
</td>
</tr>
<table>
<%end if%>
<%end if%>

<%if estatusObra="enProceso" then%>
<table style="border:none" width="100%">
 <tr>
 <td valign="top">
	<table cellpadding="0" cellspacing="0" class="display" id="example2">
		<thead>
			<tr>
				<th width="70%">Mes</th><th width="30%">Total</th>
			</tr>
		</thead>
		<tbody>
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr

if query="1" then
sql1="SELECT CASE WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '01' THEN 'ENERO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '02' THEN 'FEBRERO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '03' THEN 'MARZO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '04' THEN 'ABRIL' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '05' THEN 'MAYO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '06' THEN 'JUNIO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '07' THEN 'JULIO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '08' THEN 'AGOSTO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '09' THEN 'SEPTIEMBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '10' THEN 'OCTUBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '11' THEN 'NOVIEMBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '12' THEN 'DICIEMBRE' END AS MES, COUNT(a.CR) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & SESSION.contents("zonaDirector") & " AND b.territorial = '" & territorial & "' AND( a.estatusObra = 1 OR a.estatusObra = 2) GROUP BY LEFT(FechaInicio, 7)"
else
if query="2" then
sql1="SELECT CASE WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '01' THEN 'ENERO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '02' THEN 'FEBRERO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '03' THEN 'MARZO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '04' THEN 'ABRIL' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '05' THEN 'MAYO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '06' THEN 'JUNIO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '07' THEN 'JULIO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '08' THEN 'AGOSTO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '09' THEN 'SEPTIEMBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '10' THEN 'OCTUBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '11' THEN 'NOVIEMBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '12' THEN 'DICIEMBRE' END AS MES, COUNT(a.CR) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & SESSION.contents("zonaDirector") & " AND( a.estatusObra = 1 OR a.estatusObra = 2) GROUP BY LEFT(FechaInicio, 7)"
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
  <td align="center" ><font color="#000000"><%=rs1("mes")%></font></td>
  <td  style="text-align:center;<%if cint(rs1("total"))>0 then%>cursor:pointer" onclick="showDetalleAvance('<%=territorial%>',2,1,1,1,'','<%=rs1("mes")%>')<%end if%>"><font color="#000000"><%=rs1("total")%></font></td>
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
 <td style="border:none" valign="top">
<table cellpadding="0" cellspacing="0" class="display" id="example1">
<thead>
	<tr>
		<th width="70%">Region</th><th width="30%">En Proceso</th>
	</tr>
</thead>
<tfoot>
   <tr>
    <th  style="text-align:center">TOTAL</th>
	<th  style="text-align:center;<%if cint(numeroSucTerrRegional_EstatusZona(territorial, 2,1,query,session.contents("zonaDirector")))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional_EstatusZona(territorial, 2,1,query,session.contents("zonaDirector")))>0 then%> onclick="showDetalleAvance('<%=territorial%>',2,1,1,1,'','')" <%end if%>><%=numeroSucTerrRegional_EstatusZona(territorial, 2,1,query,session.contents("zonaDirector"))%></th>
   </tr>
</tfoot>
<tbody>
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr

if query="1" then
sql1="SELECT total.*, CASE WHEN terminadas.NoSucursales IS NULL THEN 0 ELSE terminadas.NoSucursales END AS terminadas, CASE WHEN enProceso.NoSucursales IS NULL THEN 0 ELSE enProceso.NoSucursales END AS enProceso, CASE WHEN porIniciar.NoSucursales IS NULL THEN 0 ELSE porIniciar.NoSucursales END AS porIniciar FROM( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.Territorial = '" & territorial & "' and b.zona_territorial ='" & session.contents("zonaDirector") & "' GROUP BY Regional) AS total LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND( c.id_estatusObra = 2 OR c.id_estatusObra = 1)  GROUP BY Regional) AS enProceso ON total.Regional = enProceso.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND(c.id_estatusObra = 3) GROUP BY Regional) AS terminadas ON total.Regional = terminadas.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND(c.id_estatusObra = 0) GROUP BY Regional) AS porIniciar ON total.Regional = porIniciar.Regional"
else
if query="2" then
sql1="SELECT total.*, CASE WHEN terminadas.NoSucursales IS NULL THEN 0 ELSE terminadas.NoSucursales END AS terminadas, CASE WHEN enProceso.NoSucursales IS NULL THEN 0 ELSE enProceso.NoSucursales END AS enProceso, CASE WHEN porIniciar.NoSucursales IS NULL THEN 0 ELSE porIniciar.NoSucursales END AS porIniciar FROM( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr where b.zona_territorial ='" & session.contents("zonaDirector") & "' GROUP BY Regional) AS total LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE ( c.id_estatusObra = 2 OR c.id_estatusObra = 1) GROUP BY Regional) AS enProceso ON total.Regional = enProceso.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE(c.id_estatusObra = 3) GROUP BY Regional) AS terminadas ON total.Regional = terminadas.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE (c.id_estatusObra = 0) GROUP BY Regional) AS porIniciar ON total.Regional = porIniciar.Regional"
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
  <td  style="text-align:center;<%if cint(rs1("enProceso"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("enProceso"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',2,1,1,1,'<%=rs1("regional")%>','')" <%end if%>><font color="#000000"><%=rs1("enProceso")%></font></td>
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
 </td></tr>
</table>
<%end if%>

<%if estatusObra="porIniciar" then%>
<table style="border:none" width="100%">
 <tr>
 <td valign="top">
	<table cellpadding="0" cellspacing="0" class="display" id="example2">
		<thead>
			<tr>
				<th width="70%">Mes</th><th width="30%">Total</th>
			</tr>
		</thead>
		<tbody>
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr

if query="1" then
sql1="SELECT CASE WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '01' THEN 'ENERO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '02' THEN 'FEBRERO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '03' THEN 'MARZO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '04' THEN 'ABRIL' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '05' THEN 'MAYO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '06' THEN 'JUNIO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '07' THEN 'JULIO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '08' THEN 'AGOSTO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '09' THEN 'SEPTIEMBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '10' THEN 'OCTUBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '11' THEN 'NOVIEMBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '12' THEN 'DICIEMBRE' END AS MES, COUNT(a.CR) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & SESSION.contents("zonaDirector") & " AND b.territorial = '" & territorial & "' AND( a.estatusObra = 0 ) GROUP BY LEFT(FechaInicio, 7)"
else
if query="2" then
sql1="SELECT CASE WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '01' THEN 'ENERO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '02' THEN 'FEBRERO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '03' THEN 'MARZO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '04' THEN 'ABRIL' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '05' THEN 'MAYO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '06' THEN 'JUNIO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '07' THEN 'JULIO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '08' THEN 'AGOSTO' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '09' THEN 'SEPTIEMBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '10' THEN 'OCTUBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '11' THEN 'NOVIEMBRE' WHEN RIGHT(LEFT(FechaInicio, 7), 2) = '12' THEN 'DICIEMBRE' END AS MES, COUNT(a.CR) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & SESSION.contents("zonaDirector") & " AND( a.estatusObra = 0) GROUP BY LEFT(FechaInicio, 7)"
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
  <td align="center" ><font color="#000000"><%=rs1("mes")%></font></td>
  <td  style="text-align:center;<%if cint(rs1("total"))>0 then%>cursor:pointer" onclick="showDetalleAvance('<%=territorial%>',0,0,0,0,'','<%=rs1("mes")%>')<%end if%>"><font color="#000000"><%=rs1("total")%></font></td>
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
 <td style="border:none" valign="top">
<table cellpadding="0" cellspacing="0" class="display" id="example1">
<thead>
	<tr>
		<th width="70%">Region</th><th width="30%">Por Iniciar</th>
	</tr>
</thead>
<tfoot>
   <tr>
    <th  style="text-align:center">TOTAL</th>
	<th  style="text-align:center;<%if cint(numeroSucTerrRegional_EstatusZona(territorial, 0,0,query,session.contents("zonaDirector")))>0 then%>cursor:pointer<%end if%>" <%if cint(numeroSucTerrRegional_EstatusZona(territorial, 0,0,query,session.contents("zonaDirector")))>0 then%> onclick="showDetalleAvance('<%=territorial%>',0,0,0,0,'','')" <%end if%>><%=numeroSucTerrRegional_EstatusZona(territorial,0,0,query,session.contents("zonaDirector"))%></th>
   </tr>
</tfoot>
<tbody>
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr

if query="1" then
sql1="SELECT total.*, CASE WHEN terminadas.NoSucursales IS NULL THEN 0 ELSE terminadas.NoSucursales END AS terminadas, CASE WHEN enProceso.NoSucursales IS NULL THEN 0 ELSE enProceso.NoSucursales END AS enProceso, CASE WHEN porIniciar.NoSucursales IS NULL THEN 0 ELSE porIniciar.NoSucursales END AS porIniciar FROM( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.Territorial = '" & territorial & "' and b.zona_territorial ='" & session.contents("zonaDirector") & "' GROUP BY Regional) AS total LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND( c.id_estatusObra = 0) GROUP BY Regional) AS enProceso ON total.Regional = enProceso.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND(c.id_estatusObra = 3) GROUP BY Regional) AS terminadas ON total.Regional = terminadas.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND(c.id_estatusObra = 0) GROUP BY Regional) AS porIniciar ON total.Regional = porIniciar.Regional"
else
if query="2" then
sql1="SELECT total.*, CASE WHEN terminadas.NoSucursales IS NULL THEN 0 ELSE terminadas.NoSucursales END AS terminadas, CASE WHEN enProceso.NoSucursales IS NULL THEN 0 ELSE enProceso.NoSucursales END AS enProceso, CASE WHEN porIniciar.NoSucursales IS NULL THEN 0 ELSE porIniciar.NoSucursales END AS porIniciar FROM( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr where b.zona_territorial ='" & session.contents("zonaDirector") & "' GROUP BY Regional) AS total LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE ( c.id_estatusObra = 0 ) GROUP BY Regional) AS enProceso ON total.Regional = enProceso.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE(c.id_estatusObra = 3) GROUP BY Regional) AS terminadas ON total.Regional = terminadas.Regional LEFT JOIN( SELECT b.Regional, b.Territorial, COUNT(a.cr) AS NoSucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE (c.id_estatusObra = 0) GROUP BY Regional) AS porIniciar ON total.Regional = porIniciar.Regional"
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
  <td  style="text-align:center;<%if cint(rs1("porIniciar"))>0 then%>cursor:pointer<%end if%>" <%if cint(rs1("porIniciar"))>0 then%> onclick="showDetalleAvance('<%=rs1("territorial")%>',0,0,0,0,'<%=rs1("regional")%>','')" <%end if%>><font color="#000000"><%=rs1("porIniciar")%></font></td>
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
 </td></tr>
</table>
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
<script>
function regresar(){
<%if session.contents("pagina")="1" then%>
document.getElementById('frm_revisarAvance').action="revisar_avanceGraficas_conMenuSwip.asp"
<%else%>
document.getElementById('frm_revisarAvance').action="modalTest_territorial_ConMenuSwip.asp"
<%end if%>
	
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}
</script>
</body>
</html>





