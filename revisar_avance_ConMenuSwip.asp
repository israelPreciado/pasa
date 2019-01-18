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
  </script>
  

<title>Documento sin título</title>

</head>
<%
if isempty(session("xmd")) then
response.Redirect("default.asp?logout=true")
end if
%>
<body> 

<form name="frm_revisarAvance" id="frm_revisarAvance" method="post">
<% if session.contents("zonaDirector")="" then%>
<!--Cuando es Director Nacional-->
<div class="container">
    <div id="sidebar">
        <ul>
            <li><a href="busqueda_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Buscar un CR</a></li>
            <li><a href="revisar_avance_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Avance General</a></li>
			<li><a href="controlAcciones_proyGral_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Proyecto General</a></li>
			<li><a href="modalTestPag1_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Informe Ejecutivo</a></li>
			<li><a href="modalTestPag5_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Informe General</a></li>
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
<table width="90%" align="center" >
 <tr><td>
<div class="datagrid">
<table width="100%" >
 <tr>
  <td width="25%" style="vertical-align:top; padding-left:20px" >
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
  <th  style="padding-left:20px; cursor:pointer" onclick="enviarETFT(1,'<%=rs1("Territorial")%>',0)"><table><tr><td style="cursor:pointer; border:hidden; padding-bottom:20px;" ><img src='images/indicadores/verde.png'/></td><td><p style="background-color: transparent; color:#d51818; text-decoration:underline"><%=rs1("tiempo")%></p></td></tr></table></th>
  <th  style="cursor:pointer" onclick="enviarETFT(2,'<%=rs1("Territorial")%>',0)"><table><tr><td style="cursor:pointer; border:hidden;padding-bottom:20px;"><img src='images/indicadores/rojo.png'/></td><td><p style="background-color: transparent; color:#d51818; text-decoration:underline"><%=rs1("fuera")%></p></td></tr></table></th>
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
  <td width="25%" style="vertical-align:top; padding-right:20px">
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
   <li style="color:#d9534f">C/Pendientes  <%=calculaObrasConPendientes()%></li>
  </ul>
  </td>
 </tr>
</table></div>

</td>
<!-- SUSPENDIDAS-->

<td width="5%" style="border:hidden"></td><!--Espacio entre las tablas-->
  <td width="25%" style="vertical-align:top; padding-right:20px">
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

        </div>
    </div>
    </div>
</div>
<input type="hidden" name="hddn_estatus1" id="hddn_estatus1" />
<input type="hidden" name="hddn_estatus2" id="hddn_estatus2" />
<input type="hidden" name="hddn_territorial" id="hddn_territorial" />
<%else%>

<!--cuando es director divisional-->
<div class="container">
    <div id="sidebar">
        <ul>
            <li><a href="revisar_avanceGraficas_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Home</a></li>
            <li><a href="busqueda_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Buscar un CR</a></li>
            <li><a href="revisar_avance_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Avance General</a></li>
			<li><a href="controlAcciones_proyGral_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Proyecto General</a></li>
			<li><a href="modalTestPag1_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Informe Ejecutivo</a></li>
			<li><a href="modalTestPag5_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Informe General</a></li>
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

<table width="100%">
 <tr height="20px">
  <td>&nbsp;</td>
 </tr>
 <tr>
  <td style="padding-left:20px"><p style="background-color: transparent">Total de Obras Asignadas: <strong><%=calculaTotalObrasZona(session.contents("zonaDirector"))%></strong></p></td>
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
<table width="90%" align="center" >
 <tr><td>
<div class="datagrid">
<table width="100%" >
 <tr>
  <td width="25%" style="vertical-align:top; padding-left:20px" >
  <div class="datagrid"><table width="100%"><thead>
 <tr>
  <th width="83%" height="20px" style="vertical-align:top;border:hidden" >Obras por iniciar</th>
  <th width="17%" style="vertical-align:top"><%=calculaObras1EstatusZona(0,0,session.contents("zonaDirector"))%></strong></th>
 </tr></thead>
 
 
 
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "select b.Territorial, COUNT(*) as Sucursales from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr where a.EstatusObra=0 and b.territorial is not null and  b.zona_territorial=" & session.contents("zonaDirector") & "  GROUP BY b.Territorial"

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
  <th width="10%" style="vertical-align:top;border:hidden" ><%=calculaObras1EstatusZona(1,2,session.contents("zonaDirector"))%></strong></th>
  <th width="10%" style="vertical-align:top;border:hidden;padding-left;">E/Tiempo</strong></th>
  <th width="10%" style="vertical-align:top;border:hidden;padding-left;">F/Tiempo</strong></th>
  <th width="10%" style="vertical-align:top;border:hidden">Con Pend.</strong></th>
 </tr></thead>
 
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
'sql1= "SELECT a.Territorial, a.Sucursales, CASE WHEN b.Sucursales IS NULL THEN 0 ELSE b.Sucursales END AS Tiempo, CASE WHEN c.Sucursales IS NULL THEN 0 ELSE c.Sucursales END AS Fuera, CASE WHEN d.pendientes IS NULL THEN 0 ELSE d.pendientes END AS pendientes FROM( SELECT b.Territorial, COUNT(*) AS Sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE a.EstatusObra = 1 OR a.EstatusObra = 2 AND b.territorial IS NOT NULL GROUP BY b.Territorial) a LEFT JOIN( SELECT b.Territorial, COUNT(*) AS Sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE a.EstatusObra = 1 AND b.territorial IS NOT NULL GROUP BY b.Territorial) b ON a.Territorial = b.Territorial LEFT JOIN( SELECT b.Territorial, COUNT(*) AS Sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE a.EstatusObra = 2 AND b.territorial IS NOT NULL GROUP BY b.Territorial) c ON a.Territorial = c.Territorial LEFT JOIN( SELECT A.TERRITORIAL, COUNT(A.Territorial) AS pendientes FROM( SELECT b.Territorial FROM pendientes a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN tseguimiento c on a.cr=c.cr where (c.EstatusObra=1 or c.EstatusObra=2) and a.id_estatus=1 GROUP BY a.cr) a GROUP BY A.Territorial) d ON a.Territorial = d.TERRITORIAL"
sql1="SELECT a.Territorial, a.Sucursales, CASE WHEN b.Sucursales IS NULL THEN 0 ELSE b.Sucursales END AS Tiempo, CASE WHEN c.Sucursales IS NULL THEN 0 ELSE c.Sucursales END AS Fuera, CASE WHEN d.pendientes IS NULL THEN 0 ELSE d.pendientes END AS pendientes FROM( SELECT b.Territorial, COUNT(*) AS Sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE (a.EstatusObra = 1 OR a.EstatusObra = 2) AND b.territorial IS NOT NULL AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " GROUP BY b.Territorial) a LEFT JOIN( SELECT b.Territorial, COUNT(*) AS Sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE a.EstatusObra = 1 AND b.territorial IS NOT NULL AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " GROUP BY b.Territorial) b ON a.Territorial = b.Territorial LEFT JOIN( SELECT b.Territorial, COUNT(*) AS Sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE a.EstatusObra = 2 AND b.territorial IS NOT NULL AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " GROUP BY b.Territorial) c ON a.Territorial = c.Territorial LEFT JOIN( SELECT A.TERRITORIAL, COUNT(A.Territorial) AS pendientes FROM( SELECT b.Territorial FROM pendientes a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN tseguimiento c ON a.cr = c.cr WHERE( c.EstatusObra = 1 OR c.EstatusObra = 2) AND a.id_estatus = 1 AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " GROUP BY a.cr) a GROUP BY A.Territorial) d ON a.Territorial = d.TERRITORIAL"
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
  <th  style="padding-left:20px; cursor:pointer" onclick="enviarETFT(1,'<%=rs1("Territorial")%>',0)"><table><tr><td style="cursor:pointer; border:hidden; padding-bottom:20px;" ><img src='images/indicadores/verde.png'/></td><td><p style="background-color: transparent; color:#d51818; text-decoration:underline"><%=rs1("tiempo")%></p></td></tr></table></th>
  <th  style="cursor:pointer" onclick="enviarETFT(2,'<%=rs1("Territorial")%>',0)"><table><tr><td style="cursor:pointer; border:hidden;padding-bottom:20px;"><img src='images/indicadores/rojo.png'/></td><td><p style="background-color: transparent; color:#d51818; text-decoration:underline"><%=rs1("fuera")%></p></td></tr></table></th>
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
 <%if cint(calculaObras1EstatusZona(1,2,session.contents("zonaDirector"))) > 0 then%> 
  <div class="progress">
  <div class="progress-bar progress-bar-success" role="progressbar" style="width:<%=(cint(calculaObras1EstatusZona(1,1,session.contents("zonaDirector"))) / cint(calculaObras1EstatusZona(1,2,session.contents("zonaDirector"))))*100%>%">
    <%=Round((cint(calculaObras1EstatusZona(1,1,session.contents("zonaDirector"))) / cint(calculaObras1EstatusZona(1,2,session.contents("zonaDirector"))))*100)%>%
  </div>
  <div class="progress-bar progress-bar-danger" role="progressbar" style="width:<%=(cint(calculaObras1EstatusZona(2,2,session.contents("zonaDirector"))) / cint(calculaObras1EstatusZona(1,2,session.contents("zonaDirector"))))*100%>%">
    <%=Round((cint(calculaObras1EstatusZona(2,2,session.contents("zonaDirector"))) / cint(calculaObras1EstatusZona(1,2,session.contents("zonaDirector"))))*100)%>%
  </div>
</div>
<%end if%>
  </td>
 </tr>
 <tr>
  <td height="54" colspan="2">
  <ul type = square>
   <li style="color:#5cb85c;cursor:pointer" onclick="enviarETFT(1,'',0)">En Tiempo <%=calculaObras1EstatusZona(1,1,session.contents("zonaDirector"))%></li>
   <li style="color:#d9534f;cursor:pointer" onclick="enviarETFT(2,'',0)">Con Atraso <%=calculaObras1EstatusZona(2,2,session.contents("zonaDirector"))%></li>
  </ul>
  </td>
 </tr>
</table>
</div>

</td>
<td width="5%" style="border:hidden"></td><!--Espacio entre las tablas-->
  <td width="25%" style="vertical-align:top; padding-right:20px">
  <div class="datagrid"><table width="100%"><thead>
 <tr>
  <th width="66%" height="20px" style="vertical-align:top;border:hidden">Terminadas</th>
  <th width="17%" style="vertical-align:top;border:hidden"><%=calculaObras1EstatusZona(3,3,session.contents("zonaDirector"))%></strong></th>
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
  <%if cint(calculaObras1EstatusZona(3,3,session.contents("zonaDirector"))) > 0 then%>
  <div class="progress">
  <div class="progress-bar progress-bar-success" role="progressbar" style="width:<%=round((cint(calculaObras1EstatusZona(3,3,session.contents("zonaDirector")))-cint(calculaObrasConPendientesZona(session.contents("zonaDirector"))))/cint(calculaObras1EstatusZona(3,3,session.contents("zonaDirector")))*100)%>%">
    <%=round((cint(calculaObras1EstatusZona(3,3,session.contents("zonaDirector")))-cint(calculaObrasConPendientesZona(session.contents("zonaDirector"))))/cint(calculaObras1EstatusZona(3,3,session.contents("zonaDirector")))*100)%>%
  </div>
  <div class="progress-bar progress-bar-danger" role="progressbar" style="width:<%=Round((cint(calculaObrasConPendientesZona(session.contents("zonaDirector")))/cint(calculaObras1EstatusZona(3,3,session.contents("zonaDirector"))))*100)%>%">
    <%=Round((cint(calculaObrasConPendientesZona(session.contents("zonaDirector")))/cint(calculaObras1EstatusZona(3,3,session.contents("zonaDirector"))))*100)%>%
  </div>
</div>
<%end if%>
  </td>
 </tr>
 <tr>
  <td height="65">
  <ul type = square>
   <li style="color:#5cb85c">S/Pendientes <%=cint(calculaObras1EstatusZona(3,3,session.contents("zonaDirector")))-cint(calculaObrasConPendientesZona(session.contents("zonaDirector")))%></li>
   <li style="color:#d9534f">C/Pendientes  <%=calculaObrasConPendientesZona(session.contents("zonaDirector"))%></li>
  </ul>
  </td>
 </tr>
</table></div>

</td>
<!-- SUSPENDIDAS-->

<td width="5%" style="border:hidden"></td><!--Espacio entre las tablas-->
  <td width="25%" style="vertical-align:top; padding-right:20px">
  <div class="datagrid"><table width="100%"><thead>
 <tr>
  <th width="83%" height="20px" style="vertical-align:top;border:hidden">Suspendidas</th>
  <th width="17%" style="vertical-align:top"><%=calculaObras1EstatusZona(4,4,session.contents("zonaDirector"))%></strong></th>
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

        </div>
    </div>
    </div>
</div>
<input type="hidden" name="hddn_estatus1" id="hddn_estatus1" />
<input type="hidden" name="hddn_estatus2" id="hddn_estatus2" />
<input type="hidden" name="hddn_territorial" id="hddn_territorial" />
<%end if%>
</form>
</body>
</html>
