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
function regresar(){
	document.getElementById('frm_revisarAvance').action="revisar_avance.asp"
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
 function detCargaFotos(cr){

	$.ajax({
	type: "GET",
	url: "carga_fotos.asp?cr=" + cr, 
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
	document.getElementById('loader').style.display="none"
	}
  });

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
<div class="animated zoomIn">
<table>
 <tr height="20px">
  <td><p><%if estatus1="0" and estatus2="0" then%>Obras por Iniciar en <%else%><%if estatus1="1" and estatus2="2" then%>Obras en Proceso en <%else%>Obras con Pendientes en <%end if%><%end if%><%=territorial%>: <strong><%=calculaObrasEstatusTerritorial(estatus1,estatus2,territorial)%></strong></p></td>
 </tr>
</table>

<table width="80%" align="center">
 <tr><td>
<div class="datagrid">
<%if estatus1="3" then%>
<table>
<thead><tr><th>&nbsp;</th><th>CR</th><th>Sucursal</th><th>Contratista</th><th>Fecha Inicio</th><th><%if estatus1 =3 and estatus2 =3 then%>Pendientes<%else%>Estatus<%end if%></th></tr></thead>
<tbody>
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "select a.cr,b.NOMBRE_SUCURSAL, b.Territorial,d.contratista,b.FINPROYECTO, case when c.pendientes is null then 0 else c.pendientes end as pendientes from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.CR LEFT JOIN (select cr,count(*) as pendientes from pendientes where id_estatus=1 GROUP BY cr) c on a.CR=c.cr LEFT JOIN cat_contratistas d on a.ContratistaAsignado=d.id_contratista where EstatusObra=3 and b.territorial='" & territorial & "';"

rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close
else
cont=1
while not (rs1.eof)
if cont=1 then
cont=cont+1
%>
<tr><td align="center" style="cursor:pointer" <%if rs1("pendientes")="0" then %>onclick="sinPendientes()"<%else%>onclick="showDetallePendientes('<%=rs1("cr")%>')"<%end if%>><font size="+2"><span class="icon-search"></span></font></td><td><font color="#000000"><%=rs1("cr")%></font></td><td><font color="#000000"><%=rs1("NOMBRE_SUCURSAL")%></font></td><td><font color="#000000"><%=rs1("contratista")%></font></td><td><font color="#000000"><%=rs1("FINPROYECTO")%></font></td><td><font color="#000000"><%=rs1("pendientes")%></font></td></tr>
<%
else
cont=1
%>
<tr class="alt"><td align="center" style="cursor:pointer" <%if rs1("pendientes")="0" then %>onclick="sinPendientes()"<%else%>onclick="showDetallePendientes('<%=rs1("cr")%>')"<%end if%>><font size="+2"><span class="icon-search" ></span></font></td><td><font color="#000000"><%=rs1("cr")%></font></td><td><font color="#000000"><%=rs1("NOMBRE_SUCURSAL")%></font></td><td><font color="#000000"><%=rs1("contratista")%></font></td><td><font color="#000000"><%=rs1("FINPROYECTO")%></font></td><td><font color="#000000"><%=rs1("pendientes")%></font></td></tr>
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
<%else%>
<table>
<thead><tr><th>&nbsp;</th><th>CR</th><th>Sucursal</th><th>Contratista</th><th>Supervisor</th><th>Fecha Inicio</th><th>Estatus</th><%if estatus1 =0 and estatus2 =0 then%><th>Obs.</th><%end if%></tr></thead>
<tbody>
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "SELECT a.cr, b.NOMBRE_SUCURSAL, c.contratista,e.login_nombre, b.INICIOPROYECTO, d.EstatusObra FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_contratistas c ON a.ContratistaAsignado = c.id_contratista LEFT JOIN cat_estatusobras d ON a.EstatusObra = d.id_estatusObra LEFT JOIN app_bnrt_login e on a.supervisorAsignado=e.login_id WHERE( a.EstatusObra = '"& estatus1 & "' OR a.EstatusObra = '"& estatus2 & "') AND b.territorial = '"& territorial &"';"

rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close
else
cont=1
while not (rs1.eof)
if cont=1 then
cont=cont+1
%>
<tr><td align="center" <%if estatus1<>0 and estatus2 <>0 then%> style="cursor:pointer"  onclick="showDetalleAvance('<%=rs1("cr")%>')"<%end if%>><font size="+2"><span class="icon-search" <%if estatus1 =0 and estatus2 =0 then%>style="display:none"<%end if%>></span></font></td><td><font color="#000000"><%=rs1("cr")%></font></td><td><font color="#000000"><%=rs1("NOMBRE_SUCURSAL")%></font></td><td><font color="#000000"><%=rs1("contratista")%></font></td><td><font color="#000000"><%=rs1("login_nombre")%></font></td><td><font color="#000000"><%=rs1("INICIOPROYECTO")%></font></td><td><font color="#000000"><%=rs1("EstatusObra")%></font></td><%if estatus1 =0 and estatus2 =0 then%><td><font color="#000000"><%if cdate(rs1("INICIOPROYECTO"))<date() then%>DESFASADA<%end if%></font></td><%end if%></tr>
<%
else
cont=1
%>
<tr class="alt"><td align="center" <%if estatus1 <>0 and estatus2 <>0 then%> style="cursor:pointer"  onclick="showDetalleAvance('<%=rs1("cr")%>')"<%end if%>><font size="+2"><span class="icon-search" <%if estatus1 =0 and estatus2 =0 then%>style="display:none"<%end if%>></span></font></td><td><font color="#000000"><%=rs1("cr")%></font></td><td><font color="#000000"><%=rs1("NOMBRE_SUCURSAL")%></font></td><td><font color="#000000"><%=rs1("contratista")%></font></td><td><font color="#000000"><%=rs1("login_nombre")%></font></td><td><font color="#000000"><%=rs1("INICIOPROYECTO")%></font></td><td><font color="#000000"><%=rs1("EstatusObra")%></font></td><%if estatus1 =0 and estatus2 =0 then%><td><font color="#000000"><%if cdate(rs1("INICIOPROYECTO"))<date() then%>DESFASADA<%end if%></font></td><%end if%></tr>
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
<%end if%>
<table align="center">
 <tr height="20px">
  <td>&nbsp;</td>
 </tr>
</table>
</div>
<table align="center">
 <tr>
  <td><div class="loader" style="display:none" id="loader" align="center"></div></td>
 </tr>
</table>
<br/>


<div id="detalleAvance" class="animated bounce" style="display:block">

 <div class='modal-dialog'>
<div class='modal-content'>
<div class='modal-header' style='padding:10px 10px;'>
<button type='button' class='close' data-dismiss='modal'>&times;</button>
<h4>Selecciona un Album</h4>
</div>
<div class='modal-body' style='padding:40px 50px;'>
<div id='years' align='center' style='display:block'>
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "select * from (select *, YEAR(fecha) as anio,MONTH(fecha) as mes,day(fecha) as dia from ctrl_fotografias)z GROUP BY anio;"
rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close
%>
 <table>
  <tr><td><div style="display:block"><table width="50%"><tr><td align="center"><p>No se han cargado imagenes</p></td></tr></table></div></td></tr>
 </table>
<% 
else
while not (rs1.eof)
%>
 <table>
  <tr><td><div style="display:block"><table width="50%"><tr><td align="center"><p><img src="images/logos/album.png" onclick="document.getElementById('years').style.display='none';document.getElementById('months<%=rs1("anio")%>').style.display='block'"></p></td></tr><tr><td align="center"><p><%=rs1("anio")%></p></td></tr></table></div></td></tr>
 </table>
<%
rs1.movenext
wend 
rs1.close
conn3.close 
set rs1=nothing
set conn3=nothing
end if 
%>
</div>
<!--meses-->
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "select * from (select *, YEAR(fecha) as anio,MONTH(fecha) as mes,day(fecha) as dia from ctrl_fotografias)z GROUP BY anio;"
rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close
%>
 <table>
  <tr><td><div style="display:block"><table width="50%"><tr><td align="center"><p>No se han cargado imagenes (anios)</p></td></tr></table></div></td></tr>
 </table>
<% 
else
while not (rs1.eof)
	set rs2=server.CreateObject("adodb.recordset")
	sql2= "select *,case when mes=1 then 'ENERO' when mes=2 then 'FEBRERO' when mes=3 then 'MARZO' when mes=4 then 'ABRIL'when mes=5 then 'MAYO' when mes=6 then 'JUNIO' when mes=7 then 'JULIO' when mes=8 then 'AGOSTO' when mes=9 then 'SEPTIMBRE' when mes=10 then 'OCTUBRE' when mes=11 then 'NOVIEMBRE' when mes=12 then 'DICIEMBRE' end as mesName from (select *, YEAR(fecha) as anio,MONTH(fecha) as mes,day(fecha) as dia from ctrl_fotografias)z where anio='" & rs1("anio") & "' GROUP BY mes;"
	rs2.open sql2, conn3
	if rs2.eof then
		rs2.close
		conn3.close
%>
 <table>
  <tr><td><div style="display:block"><table width="50%"><tr><td align="center"><p>No se han cargado imagenes (meses)</p></td></tr></table></div></td></tr>
 </table>
 <%
	else
		while not (rs2.eof)
 %>
 <div id='months<%=rs1("anio")%>' style='display:none'>
 <table>
  <tr><td><div style="display:block"><table width="50%"><tr><td align="center"><p><img src="images/logos/album.png" onclick="document.getElementById('months<%=rs1("anio")%>').style.display='none';document.getElementById('days<%=rs1("anio")%><%=rs2("mes")%>').style.display='block'"></p></td></tr><tr><td align="center"><p><%=rs2("mesName")%></p></td></tr></table></div></td></tr>
 </table>
</div>

<%		rs2.movenext
		wend
		rs2.close
	end if
rs1.movenext
wend 
rs1.close
conn3.close 
set rs1=nothing
set conn3=nothing
end if 
%>

<!--dias-->
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
set rs2=server.CreateObject("adodb.recordset")
set rs3=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "select * from (select *, YEAR(fecha) as anio,MONTH(fecha) as mes,day(fecha) as dia from ctrl_fotografias)z GROUP BY anio;"
rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close
%>
 <table>
  <tr><td><div style="display:block"><table width="50%"><tr><td align="center"><p>No se han cargado imagenes (anios)</p></td></tr></table></div></td></tr>
 </table>
<% 
else
while not (rs1.eof)
	sql2= "select * from (select *, YEAR(fecha) as anio,MONTH(fecha) as mes,day(fecha) as dia from ctrl_fotografias)z where anio='" & rs1("anio") & "' GROUP BY mes;"
	rs2.open sql2, conn3
	if rs2.eof then
		rs2.close
		conn3.close
%>
 <table>
  <tr><td><div style="display:block"><table width="50%"><tr><td align="center"><p>No se han cargado imagenes (meses)</p></td></tr></table></div></td></tr>
 </table>
 <%
	else
		while not (rs2.eof)
			
			sql3= "select *, case when mes=1 then 'ENERO' when mes=2 then 'FEBRERO' when mes=3 then 'MARZO' when mes=4 then 'ABRIL'when mes=5 then 'MAYO' when mes=6 then 'JUNIO' when mes=7 then 'JULIO' when mes=8 then 'AGOSTO' when mes=9 then 'SEPTIMBRE' when mes=10 then 'OCTUBRE' when mes=11 then 'NOVIEMBRE' when mes=12 then 'DICIEMBRE' end as mesName from (select *, YEAR(fecha) as anio,MONTH(fecha) as mes,day(fecha) as dia from ctrl_fotografias)z where anio='" & rs1("anio") & "' and mes='" & rs2("mes") & "' GROUP BY dia;"
			rs3.open sql3, conn3
			if rs3.eof then
				rs3.close
				conn3.close
 %>
  <table>
  <tr><td><div style="display:block"><table width="50%"><tr><td align="center"><p>No se han cargado imagenes (dias)</p></td></tr></table></div></td></tr>
 </table>
 <%
			else
%>
<div id='days<%=rs1("anio")%><%=rs2("mes")%>' style='display:none'>
 <table>
 <%
			while not (rs3.eof)		
%>
  <tr height="20px"><td><div style="display:block"><table width="100%"><tr><td align="center"><p><%=rs3("dia") & " " & rs3("mesName")%></p></td></tr></table></div></td></tr>

<%
			rs3.movenext
			wend
			rs3.close
%>
 </table>
</div>
<%			
		end if
		rs2.movenext
		wend
		rs2.close
	end if
rs1.movenext
wend 
rs1.close
conn3.close 
set rs1=nothing
set conn3=nothing
end if 
%>
 </div>
<div class='modal-footer'>
&nbsp;
</div>
</div>
</div>
</div> 

</div>
<br/>


<div id="detallePendientes" class="animated bounce" style="display:none">

</div>
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
<a href="#" id="alert" style="display:none"></a>
<input type="hidden" name="zonaFoto" id="zonaFoto"/>
<input type="hidden" id="angulo" value="0"/>
<a href="#" id="sinPendientes" style="display:none">&nbsp;</a>
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
		
	</script>
</body>
</html>
