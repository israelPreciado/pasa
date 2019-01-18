<!--#include file="funcion3/funcion.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css3/login.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/animate.css">

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="lightwindow/css/default.css" />
<link rel="stylesheet" type="text/css" href="lightwindow/css/lightwindow.css" />  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- JavaScript -->
<script type="text/javascript" src="lightwindow/javascript/prototype.js"></script>
<script type="text/javascript" src="lightwindow/javascript/effects.js"></script>
<script type="text/javascript" src="lightwindow/javascript/lightwindow.js"></script>

<title>Documento sin título</title>
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

<script language="javascript"> 

function cambiarClase(){
	$(document.getElementById('detalleAvance')).addClass('animated zoomIn').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend',
			function(){
				$(this).removeClass('animated zoomIn');
        });
}

function showDetalleAvance(cr){
	document.getElementById('loader').style.display="block"
	detComp(cr)
	document.getElementById('detalleAvance').style.display="block";
	cambiarClase()
	
}
function regresar(){
	document.getElementById('frm_revisarAvance').action="revisar_avance.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}
function detComp(cr){

	$.ajax({
	type: "GET",
	url: "searchCR.asp?cr=" + cr, 
	dataType: "html", 
	success: function(response){ 
	$("#Popup_Detalle").html(response);
	document.getElementById('loader').style.display="none"
	}
  });

}
 
     
</script>
</head>
<%
estatus1=request("hddn_estatus1")
estatus2=request("hddn_estatus2")
territorial=request("hddn_territorial")
%>
<body>
<div class="animated zoomIn" id="principal">
<form name="frm_revisarAvance" id="frm_revisarAvance" method="post">
<table>
 <tr height="20px">
  <td><p>Obras por Iniciar en <%=territorial%>: <strong><%=calculaObrasEstatusTerritorial(estatus1,estatus2,territorial)%></strong></p></td>
 </tr>
</table>

<table width="80%" align="center">
 <tr><td>
<div class="datagrid">
<table>
<thead><tr><th>&nbsp;</th><th>CR</th><th>Sucursal</th><th>Contratista</th><th>Fecha Inicio</th><th>Estatus</th></tr></thead>
<tbody>
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "SELECT a.cr, b.NOMBRE_SUCURSAL, c.contratista, b.INICIOPROYECTO, d.EstatusObra FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_contratistas c ON a.ContratistaAsignado = c.id_contratista LEFT JOIN cat_estatusobras d ON a.EstatusObra = d.id_estatusObra WHERE( a.EstatusObra = '"& estatus1 & "' OR a.EstatusObra = '"& estatus2 & "') AND b.territorial = '"& territorial &"';"

rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn1.close
else
cont=1
while not (rs1.eof)
if cont=1 then
cont=cont+1
%>
<tr><td align="center" style="cursor:pointer" onclick="showDetalleAvance('<%=rs1("cr")%>')"><font size="+2"><span class="icon-search" <%if estatus1 =0 and estatus2 =0 then%>style="display:none"<%end if%>></span></font></td><td><font color="#000000"><%=rs1("cr")%></font></td><td><font color="#000000"><%=rs1("NOMBRE_SUCURSAL")%></font></td><td><font color="#000000"><%=rs1("contratista")%></font></td><td><font color="#000000"><%=rs1("INICIOPROYECTO")%></font></td><td><font color="#000000"><%=rs1("EstatusObra")%></font></td></tr>
<%
else
cont=1
%>
<tr class="alt"><td align="center" style="cursor:pointer" onclick="showDetalleAvance('<%=rs1("cr")%>')"><font size="+2"><span class="icon-search" <%if estatus1 =0 and estatus2 =0 then%>style="display:none"<%end if%>></span></font></td><td><font color="#000000"><%=rs1("cr")%></font></td><td><font color="#000000"><%=rs1("NOMBRE_SUCURSAL")%></font></td><td><font color="#000000"><%=rs1("contratista")%></font></td><td><font color="#000000"><%=rs1("INICIOPROYECTO")%></font></td><td><font color="#000000"><%=rs1("EstatusObra")%></font></td></tr>
<%
end if
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
<%'end if%>
<table align="center">
 <tr height="20px">
  <td>&nbsp;</td>
 </tr>
</table>
<table align="center">
 <tr>
  <td><div class="loader" style="display:none" id="loader" align="center"></div></td>
 </tr>
</table>
 
<div id="detalleAvance" class="animated bounce" style="display:none">
</div>
</td></tr></table>
</div>

 <table width="20%" height="107" align="center">
   	 <tr height="50px">
      <td height="22">&nbsp;</td>
     </tr>
     <tr>
      <td><button class="button" type="button" onclick="regresar()" style="display:block" id="accion">Regresar &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="icon-arrow-left"></span></button></td>
     </tr>
    </table> 
</div>
</form>
</div>
 <!-- POP TICKETS-->
<div data-role="popup" id="Popup_Detalle"> <!-- inicio PopUp-->
 <div data-role="header"> <!-- inicio header-->
  <h1>Cargando</h1>
 </div> <!-- fin header-->
<table width="450px"><tr><td>&nbsp;</td></tr></table>
</div> <!-- fin PopUp-->
<!-- FIN POP TICKETS-->

<div class="container">
  <h2>Modal Login Example</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-default btn-lg" id="myBtn">Login</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
              <input type="text" class="form-control" id="usrname" placeholder="Enter email">
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="text" class="form-control" id="psw" placeholder="Enter password">
            </div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>Not a member? <a href="#">Sign Up</a></p>
          <p>Forgot <a href="#">Password?</a></p>
        </div>
      </div>
      
    </div>
  </div> 
</div>
 
<script>
$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#myModal").modal();
    });
});
</script>

</body>
</html>
