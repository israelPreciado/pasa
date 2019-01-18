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
function showDetalleAvance(territorial,estatus1,estatus2,regional){

	document.getElementById('estatus1').value=estatus1
		document.getElementById('estatus2').value=estatus2
			document.getElementById('regional').value=regional
	document.getElementById('frm_revisarAvance').action="modalTest_terr_supervisor_paso3_ConMenuSwip.asp"
	document.getElementById('frm_revisarAvance').submit()
	
}
function showDetallePendientes(cr){
	document.getElementById('loader').style.display="block"
	detSearchPendientes(cr)
	document.getElementById('detallePendientes').style.display="block";
	cambiarClase("detallePendientes")
	
}
function regresar(){
	document.getElementById('frm_revisarAvance').action="modalTest_terr_contratista_paso2_ConMenuSwip.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}
</script>
<!-- fin 112-->

<title>Documento sin título</title>

</head>
<%

territorial=request("territorial")
estatus1=request("estatus1")
estatus2=request("estatus2")
regional=request("regional")
query=request("query")
contratista=request("contratista")
mes=request("mes")
anio=request("anio")
%>
<%
if isempty(session("xmd")) then
response.Redirect("default.asp?logout=true")
end if
%>
<%
cr=request("cr")
modulo=request("modulo")
nombreModulo=buscaModulo(modulo)
estatusObra=request("estatusObra")
%>
<body> 
<form name="frm_revisarAvance" id="frm_revisarAvance" method="get" enctype="multipart/form-data">
<form name="frm_revisarAvance" id="frm_revisarAvance" method="get" enctype="multipart/form-data">
<input type="hidden" id="cr" name="cr"/>
<input type="hidden" id="contratista" name="contratista" value="<%=contratista%>"/>
<input type="hidden" id="mes" name="mes" value="<%=mes%>"/>
<input type="hidden" id="anio" name="anio" value="<%=anio%>"/>
<input type="hidden" name="estatus1" id="estatus1" value="<%=estatus1%>"/>
<input type="hidden" name="estatus2" id="estatus2" value="<%=estatus2%>"/>
<input type="hidden" name="territorial" id="territorial" value="<%=territorial%>"/>
<input type="hidden" id="regional" name="regional" value="<%=regional%>"/>
<input type="hidden" id="query" name="query" value="<%=query%>"/>
<input type="hidden" name="estatusObra" id="estatus3" value="<%=estatusObra%>"/>

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
<!-- empieza el contenido-->			
<table width="90%" align="center">
<tr height="10%"><td>&nbsp;</td></tr>
 <tr><td>
  <div align="center" id="menu_inicio">
      <div id="detalle">

<%
Set conn12 = Server.CreateObject("ADODB.Connection")
set rs12= Server.CreateObject("adodb.recordset")
Conn12.Open connstr
sql12= "select * from tseguimiento where cr='" & cr & "'"
rs12.open sql12,conn12
if rs12.eof then
%> 
<p>No se encontro la informacion solicitada</p> 
<%else%>     
      
      <p>Sucursal:<strong><%=rs12("Sucursal")%></strong></p>
      <p>Tipo de transformaci&oacute;n: <strong><%=rs12("TipoTransformacion")%></strong></p>
      <p>Contratista: <strong><%=buscaContratista(rs12("ContratistaAsignado"))%></strong><p>
    </div>
<%
end if
rs12.close
conn12.close 
set rs12=nothing
set conn12=nothing
%> 
    <div id="detalle">
    <table width="100%">
     <tr>
      <td width="50%"><p>CR: <strong><%=cr%></strong></p></td>
	  <td colspan="2"><p><strong><%=nombreModulo%></strong></p></td>
      <td><p><strong>&nbsp;</strong></p></td>
	  <td><p><strong>&nbsp;</strong></p></td>      
     </tr>
	 <tr height="10%"><td>&nbsp;</td></tr>
     <tr>
	  <td width="50%"><p>&nbsp;</p></td>
      <td width="20%"><p><strong>Fecha Prog</strong></p></td>
      <td width="30%"><p><strong>% Avance</strong></p></td>     
     </tr>
    </table>
    </div>
    <br />
    <div id="detalle2">
    <table width="90%">
    
<%
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
sql= "select * from cat_componentes where id_modulo='" & modulo &"'"
rs.open sql,conn
if rs.eof then
%> 
	<tr>
      <td width="70%"><p>No se encontro el detalle buscado</p></td>    
     </tr>
<%
else
while not(rs.eof)
%>
	<tr>
      <td width="50%"><p><%=rs("componente")%></p></td>
	  <td width="20%"><p><%=cargaFechaLLegada(rs("id_componente"),cr)%></p></td>
      <td><p id="parrafo<%=rs("id_componente")%>"><%=cargaAvance(rs("nameBD"),cr)%></p></td>    

     </tr>

<%
rs.movenext
wend

end if
rs.close
conn.close 
set rs=nothing
set conn=nothing
%>   
    </table>
    </div>
    <br />
  </div>
  </div>
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





