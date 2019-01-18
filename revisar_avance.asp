<!--#include file="funcion3/funcion.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <link href="style.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="css3/animate.css">


  <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
  <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />
    	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="js/jsplug.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  
  <style>

<style>
.datagrid table { border-collapse: collapse; text-align: left; width: 100%; } .datagrid {font: normal 12px/150% Arial, Helvetica, sans-serif; background: #fff; overflow: hidden; border: 1px solid #991821; -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; }.datagrid table td, .datagrid table th { padding: 3px 10px; }.datagrid table thead th {background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #991821), color-stop(1, #80141C) );background:-moz-linear-gradient( center top, #991821 5%, #80141C 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#991821', endColorstr='#80141C');background-color:#991821; color:#FFFFFF; font-size: 15px; font-weight: bold; border-left: 1px solid #B01C26; } .datagrid table thead th:first-child { border: none; }.datagrid table tbody td { color: #80141C; border-left: 1px solid #F7CDCD;font-size: 12px;font-weight: normal; }.datagrid table tbody .alt td { background: #F7CDCD; color: #80141C; }.datagrid table tbody td:first-child { border-left: none; }.datagrid table tbody tr:last-child td { border-bottom: none; }.datagrid table tfoot td div { border-top: 1px solid #991821;background: #F7CDCD;} .datagrid table tfoot td { padding: 0; font-size: 12px } .datagrid table tfoot td div{ padding: 2px; }.datagrid table tfoot td ul { margin: 0; padding:0; list-style: none; text-align: right; }.datagrid table tfoot  li { display: inline; }.datagrid table tfoot li a { text-decoration: none; display: inline-block;  padding: 2px 8px; margin: 1px;color: #FFFFFF;border: 1px solid #991821;-webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #991821), color-stop(1, #80141C) );background:-moz-linear-gradient( center top, #991821 5%, #80141C 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#991821', endColorstr='#80141C');background-color:#991821; }.datagrid table tfoot ul.active, .datagrid table tfoot ul a:hover { text-decoration: none;border-color: #80141C; color: #FFFFFF; background: none; background-color:#991821;}div.dhtmlx_window_active, div.dhx_modal_cover_dv { position: fixed !important; }
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

  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script language="javascript">
  function buscarCR(){
	document.getElementById('frm_revisarAvance').action="modalTestBuscarCR.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}
  function enviar(estatus1,estatus2,territorial){
	  document.getElementById('hddn_estatus1').value=estatus1
	  document.getElementById('hddn_estatus2').value=estatus2
	  document.getElementById('hddn_territorial').value=territorial
	  //document.getElementById('frm_revisarAvance').action="revisar_avanceDetalle.asp"	
	  document.getElementById('frm_revisarAvance').action="modalTest.asp"	
	  document.getElementById('frm_revisarAvance').submit()  
  }
    function enviarETFT(estatus1,division,cpsp){
	  document.getElementById('hddn_estatus1').value=estatus1
	  document.getElementById('hddn_territorial').value=division
	  document.getElementById('hddn_estatus2').value=cpsp
	  //document.getElementById('frm_revisarAvance').action="revisar_avanceDetalle.asp"	
	  document.getElementById('frm_revisarAvance').action="modalTest_ETFT.asp"	
	  document.getElementById('frm_revisarAvance').submit()  
  }
  </script>
  

<title>Documento sin título</title>

</head>

<body> 

<form name="frm_revisarAvance" id="frm_revisarAvance" method="post">

<div class="animated zoomIn">

<table width="100%">
 <tr height="20px">
  <td>&nbsp;</td>
 </tr>
 <tr>
  <td style="padding-left:20px"><p style="background-color: transparent">Total de Obras Asignadas: <strong><%=calculaTotalObras%></strong></p></td>
 </tr>
</table>
<table width="40%" align="left">
 <tr>
  <td width="10%">&nbsp;</td>
  <td width="20%"><input  type="button" value="Buscar CR" onclick="buscarCR()" name="btnEnviar" /></td>
  <td width="10%">&nbsp;</td>
 </tr>
 <tr height="20px">
  <td>&nbsp;</td>
 </tr>
</table>
	<br>
<table width="100%" align="center" >
 <tr><td>
<div class="datagrid">

<table width="100%">
 <tr>
  <td width="15%" style="vertical-align:top; padding-left:20px" >
  <div class="datagrid"><table width="100%"><thead>
 <tr>
  <th width="83%" height="20px" style="vertical-align:top;border:hidden" >Obras por iniciar</th>
  <th width="17%" style="vertical-align:top"><%=calculaObras1Estatus(0,0)%></strong></th>
 </tr></thead>
 
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "select b.Territorial, COUNT(*) as Sucursales from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr where a.EstatusObra=0 and b.territorial is not null  GROUP BY b.Territorial"

rs1.open sql1, conn3
if rs1.eof then
%>
<tr style="border-style:solid; color:#d51818">
  <th width="83%" style="padding-left:20px; border:hidden"><p style="background-color: transparent"><font color="#000000">Sin Sucursales</font></p></th>
  <th width="17%" style="padding-left:20px; border:hidden; cursor:pointer" onclick="enviar(0,0,'0')"<p style="background-color: transparent; color:#d51818; text-decoration:underline">0</p></th>
</tr>
<%
	rs1.close
	conn3.close
else
while not (rs1.eof)
%>
<tr style="border-style:solid; color:#d51818">
  <th width="83%" style="padding-left:20px; border:hidden"><p style="background-color: transparent"><font color="#000000"><%=rs1("Territorial")%></font></p></th>
  <th width="17%" style="padding-left:20px; border:hidden; cursor:pointer" onclick="enviar(0,0,'<%=rs1("Territorial")%>')"><p style="background-color: transparent; color:#d51818; text-decoration:underline"><%=rs1("Sucursales")%></p></th>
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
</table></div></td>
<td width="5%" style="border:hidden"></td><!--Espacio entre las tablas-->
 <td width="25%" style="vertical-align:top">
 
  <div class="datagrid"><table width="100%"><thead>
 <tr>
  <th width="60%" height="20px" style="vertical-align:top;border:hidden">En Proceso</th>
  <th width="10%" style="vertical-align:top;border:hidden" ><%=calculaObras1Estatus(1,2)%></strong></th>
  <th width="10%" style="vertical-align:top;border:hidden;padding-left;">E/Tiempo</strong></th>
  <th width="10%" style="vertical-align:top;border:hidden;padding-left;">F/Tiempo</strong></th>
  <th width="10%" style="vertical-align:top;border:hidden">Con Pend.</strong></th>
 </tr></thead>
 
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "SELECT a.Territorial, a.Sucursales, CASE WHEN b.Sucursales IS NULL THEN 0 ELSE b.Sucursales END AS Tiempo, CASE WHEN c.Sucursales IS NULL THEN 0 ELSE c.Sucursales END AS Fuera, CASE WHEN d.pendientes IS NULL THEN 0 ELSE d.pendientes END AS pendientes FROM( SELECT b.Territorial, COUNT(*) AS Sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE a.EstatusObra = 1 OR a.EstatusObra = 2 AND b.territorial IS NOT NULL GROUP BY b.Territorial) a LEFT JOIN( SELECT b.Territorial, COUNT(*) AS Sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE a.EstatusObra = 1 AND b.territorial IS NOT NULL GROUP BY b.Territorial) b ON a.Territorial = b.Territorial LEFT JOIN( SELECT b.Territorial, COUNT(*) AS Sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE a.EstatusObra = 2 AND b.territorial IS NOT NULL GROUP BY b.Territorial) c ON a.Territorial = c.Territorial LEFT JOIN( SELECT A.TERRITORIAL, COUNT(A.Territorial) AS pendientes FROM( SELECT b.Territorial FROM pendientes a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN tseguimiento c on a.cr=c.cr where (c.EstatusObra=1 or c.EstatusObra=2) and a.id_estatus=1 GROUP BY a.cr) a GROUP BY A.Territorial) d ON a.Territorial = d.TERRITORIAL"

rs1.open sql1, conn3
if rs1.eof then
%>
<tr>
  <th width="83%" style="padding-left:20px;"><p style="background-color: transparent"><font color="#000000">Sin Sucursales</font></p></th>
  <th width="17%" style="padding-left:20px; cursor:pointer" onclick="enviar(1,2,'0')"><p style="background-color: transparent; color:#d51818; text-decoration:underline">0</p></th>
</tr>
<%
	rs1.close
	conn3.close
else
while not (rs1.eof)
%>
<tr>
  <th  style="padding-left:20px;"><p style="background-color: transparent"><font color="#000000"><%=rs1("Territorial")%></font></p></th>
  <th  style="padding-left:20px; cursor:pointer" onclick="enviar(1,2,'<%=rs1("Territorial")%>')"><p style="background-color: transparent; color:#d51818; text-decoration:underline"><%=rs1("Sucursales")%></p></th>
  <th  style="padding-left:20px; cursor:pointer" onclick="enviarETFT(1,'<%=rs1("Territorial")%>',0)"><table><tr><td style="cursor:pointer; border:hidden; padding-bottom:20px;" ><!--<img src='images/indicadores/verde.png'/>--></td><td><p style="background-color: transparent; color:#d51818; text-decoration:underline"><%=rs1("tiempo")%></p></td></tr></table></th>
  <th  style="cursor:pointer" onclick="enviarETFT(2,'<%=rs1("Territorial")%>',0)"><table><tr><td style="cursor:pointer; border:hidden;padding-bottom:20px;"><!--<img src='images/indicadores/rojo.png'/>--></td><td><p style="background-color: transparent; color:#d51818; text-decoration:underline"><%=rs1("fuera")%></p></td></tr></table></th>
  <th  style="padding-left:30px; cursor:pointer" onclick="enviarETFT(1,'<%=rs1("Territorial")%>',1)"><p style="background-color: transparent; color:#d51818; text-decoration:underline"><%=rs1("pendientes")%></p></th>
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
 <tr height="20px">
  <td>&nbsp;</td>
 </tr>
  <tr>
  <td colspan="5" style="padding-left:20px; padding-right:20px">
 <%if cint(calculaObras1Estatus(1,2)) > 0 then%> 
  <div class="progress">
  <div class="progress-bar progress-bar-success" role="progressbar" style="width:<%=(cint(calculaObras1Estatus(1,1)) / cint(calculaObras1Estatus(1,2)))*100%>%">
    <%=Round((cint(calculaObras1Estatus(1,1)) / cint(calculaObras1Estatus(1,2)))*100)%>%
  </div>
  <div class="progress-bar progress-bar-danger" role="progressbar" style="width:<%=(cint(calculaObras1Estatus(2,2)) / cint(calculaObras1Estatus(1,2)))*100%>%">
    <%=Round((cint(calculaObras1Estatus(2,2)) / cint(calculaObras1Estatus(1,2)))*100)%>%
  </div>
</div>
<%end if%>
  </td>
 </tr>
 <tr>
  <td height="54" colspan="2">
  <ul type = square>
   <li style="color:#5cb85c;cursor:pointer" onclick="enviarETFT(1,'',0)">En Tiempo <%=calculaObras1Estatus(1,1)%></li>
   <li style="color:#d9534f;cursor:pointer" onclick="enviarETFT(2,'',0)">Con Atraso <%=calculaObras1Estatus(2,2)%></li>
  </ul>
  </td>
 </tr>
</table>
</div>

</td>
<td width="5%" style="border:hidden"></td><!--Espacio entre las tablas-->
  <td width="20%" style="vertical-align:top; padding-right:20px">
  <div class="datagrid"><table width="100%"><thead>
 <tr>
  <th width="66%" height="20px" style="vertical-align:top;border:hidden">Terminadas</th>
  <th width="17%" style="vertical-align:top;border:hidden"><%=calculaObras1Estatus(3,3)%></strong></th>
  <th width="17%" style="vertical-align:top">Con Pen.</strong></th>
 </tr></thead>
 <%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "SELECT a.Territorial, a.Sucursales, CASE WHEN d.pendientes IS NULL THEN 0 ELSE d.pendientes END AS pendientes FROM( SELECT b.Territorial, COUNT(*) AS Sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE a.EstatusObra = 3 and b.territorial IS NOT NULL GROUP BY b.Territorial) a  LEFT JOIN( SELECT A.TERRITORIAL, COUNT(A.Territorial) AS pendientes FROM( SELECT b.Territorial FROM pendientes a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN tseguimiento c on a.cr=c.cr where (c.EstatusObra=3) and a.id_estatus=1 GROUP BY a.cr) a GROUP BY A.Territorial) d ON a.Territorial = d.TERRITORIAL"
rs1.open sql1, conn3
if rs1.eof then
%>
<tr>
  <th width="83%" style="padding-left:20px;"><p style="background-color: transparent"><font color="#000000">Sin Sucursales</font></p></th>
  <th width="17%" style="padding-left:20px; cursor:pointer" onclick="enviar(3,3,'')"><p style="background-color: transparent; color:#d51818; text-decoration:underline">0</p></th>
</tr>
<%
	rs1.close
	conn3.close
else
while not (rs1.eof)
%>
<tr>
  <th width="66%" style="padding-left:20px;"><p style="background-color: transparent"><font color="#000000"><%=rs1("Territorial")%></font></p></th>
  <th width="17%" style="padding-left:20px; cursor:pointer" onclick="enviar(3,3,'<%=rs1("Territorial")%>')"><p style="background-color: transparent; color:#d51818; text-decoration:underline"><%=rs1("Sucursales")%></p></th>
  <th  style="padding-left:30px; cursor:pointer" onclick="enviarETFT(3,'<%=rs1("Territorial")%>',1)"><p style="background-color: transparent; color:#d51818; text-decoration:underline"><%=rs1("pendientes")%></p></th>
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
 <tr height="20px">
  <td>&nbsp;</td>
 </tr>
 <tr>
  <td colspan="3" style="padding-left:20px; padding-right:20px">
  <%if cint(calculaObras1Estatus(3,3)) > 0 then%>
  <div class="progress">
  <div class="progress-bar progress-bar-success" role="progressbar" style="width:<%=round((cint(calculaObras1Estatus(3,3))-cint(calculaObrasConPendientes()))/cint(calculaObras1Estatus(3,3))*100)%>%">
    <%=round((cint(calculaObras1Estatus(3,3))-cint(calculaObrasConPendientes()))/cint(calculaObras1Estatus(3,3))*100)%>%
  </div>
  <div class="progress-bar progress-bar-danger" role="progressbar" style="width:<%=Round((cint(calculaObrasConPendientes())/cint(calculaObras1Estatus(3,3)))*100)%>%">
    <%=Round((cint(calculaObrasConPendientes())/cint(calculaObras1Estatus(3,3)))*100)%>%
  </div>
</div>
<%end if%>
  </td>
 </tr>
 <tr>
  <td height="65">
  <ul type = square>
   <li style="color:#5cb85c">S/Pendientes <%=cint(calculaObras1Estatus(3,3))-cint(calculaObrasConPendientes())%></li>
   <li style="color:#d9534f">C/Pendientess  <%=calculaObrasConPendientes()%></li>   
  </ul>
  </td>
 </tr>
</table></div>

</td>
<!-- SUSPENDIDAS-->

<td width="5%" style="border:hidden"></td><!--Espacio entre las tablas-->
  <td width="15%" style="vertical-align:top; padding-right:20px">
  <div class="datagrid"><table width="100%"><thead>
 <tr>
  <th width="83%" height="20px" style="vertical-align:top;border:hidden">Suspendidas</th>
  <th width="17%" style="vertical-align:top"><%=calculaObras1Estatus(4,4)%></strong></th>
 </tr></thead>
 <%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "select b.Territorial, COUNT(*) as Sucursales from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr where a.EstatusObra=4 and b.territorial is not null  GROUP BY b.Territorial"
rs1.open sql1, conn3
if rs1.eof then
%>
<tr>
  <th width="83%" style="padding-left:20px;"><p style="background-color: transparent"><font color="#000000">Sin Sucursales</font></p></th>
  <th width="17%" style="padding-left:20px; cursor:pointer" onclick="enviar(3,3,'')"><p style="background-color: transparent; color:#d51818; text-decoration:underline">0</p></th>
</tr>
<%
	rs1.close
	conn3.close
else
while not (rs1.eof)
%>
<tr>
  <th width="83%" style="padding-left:20px;"><p style="background-color: transparent"><font color="#000000"><%=rs1("Territorial")%></font></p></th>
  <th width="17%" style="padding-left:20px; cursor:pointer" onclick="enviar(4,4,'<%=rs1("Territorial")%>')"><p style="background-color: transparent; color:#d51818; text-decoration:underline"><%=rs1("Sucursales")%></p></th>
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
 <tr height="20px">
  <td>&nbsp;</td>
 </tr>
</table></div>

</td>
 </tr> 
</table>
</div>

<input type="hidden" name="hddn_estatus1" id="hddn_estatus1" />
<input type="hidden" name="hddn_estatus2" id="hddn_estatus2" />
<input type="hidden" name="hddn_territorial" id="hddn_territorial" />
</form>

<!--  <button onclick="document.getElementById('id01').style.display='block';return false;" class="w3-button w3-black">Open Animated Modal</button>
<div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4">
      <header class="w3-container w3-red"> 
        <span onclick="document.getElementById('id01').style.display='none'" 
        class="w3-button w3-display-topright">&times;</span>
        <h2>Modal Header</h2>
      </header>
      <div class="w3-container">
        <p>You have two options to close this modal:</p>
        <p>Click on the "x" or click anywhere outside of the modal!</p>
      </div>
      <footer class="w3-container w3-red">
        <p class="w3-red">Modal Footer</p>
      </footer>
    </div>
  </div>
</body> -->
<style type="text/css" title="currentStyle">
			@import "DataTables/media/css/jquery.dataTables.min.css";
			@import "DataTables/media/css/dataTables.jqueryui.min.css";
			@import "DataTables/media/css/jquery-ui.css";
</style>
<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script> 
<script type="text/javascript" language="javascript" src="DataTables/media/js/jquery.dataTables.js"></script>
<script src="DataTables/media/js/jquery.dataTables.columnFilter.js" type="text/javascript"></script>
<script src="DataTables/media/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="DataTables/media/js/dataTables.jqueryui.min.js" type="text/javascript"></script>
	<script>
//funcion para poner estilo a la tabla principal
$(document).ready(function() {
	
    $('#example1' ).DataTable( {
        "paging": true,
        "ordering": false,
        "info":     false,
		"searching": true,
		"lengthMenu": [[1], [1]],
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
</html>
