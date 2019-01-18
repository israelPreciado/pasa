<!--#include file="funcion3/funcion.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css3/bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css4/styleMenuSwipeable.css" type="text/css" media="screen" charset="utf-8">
<link rel="stylesheet" href="css3/animate.css">

<style>
.datagrid table { border-collapse: collapse; text-align: left; width: 100%; } .datagrid {font: normal 12px/150% Arial, Helvetica, sans-serif; background: #fff; overflow: hidden; border: 1px solid #991821; -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; }.datagrid table td, .datagrid table th { padding: 3px 10px; }.datagrid table thead th {background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #991821), color-stop(1, #80141C) );background:-moz-linear-gradient( center top, #991821 5%, #80141C 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#991821', endColorstr='#80141C');background-color:#991821; color:#FFFFFF; font-size: 15px; font-weight: bold; border-left: 1px solid #B01C26; } .datagrid table thead th:first-child { border: none; }.datagrid table tbody td { color: #80141C; border-left: 1px solid #F7CDCD;font-size: 12px;font-weight: normal; }.datagrid table tbody .alt td { background: #F7CDCD; color: #80141C; }.datagrid table tbody td:first-child { border-left: none; }.datagrid table tbody tr:last-child td { border-bottom: none; }.datagrid table tfoot td div { border-top: 1px solid #991821;background: #F7CDCD;} .datagrid table tfoot td { padding: 0; font-size: 12px } .datagrid table tfoot td div{ padding: 2px; }.datagrid table tfoot td ul { margin: 0; padding:0; list-style: none; text-align: right; }.datagrid table tfoot  li { display: inline; }.datagrid table tfoot li a { text-decoration: none; display: inline-block;  padding: 2px 8px; margin: 1px;color: #FFFFFF;border: 1px solid #991821;-webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #991821), color-stop(1, #80141C) );background:-moz-linear-gradient( center top, #991821 5%, #80141C 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#991821', endColorstr='#80141C');background-color:#991821; }.datagrid table tfoot ul.active, .datagrid table tfoot ul a:hover { text-decoration: none;border-color: #80141C; color: #FFFFFF; background: none; background-color:#991821;}div.dhtmlx_window_active, div.dhx_modal_cover_dv { position: fixed !important; }
}
</style>  
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="js/jsplug.js"></script>
  <script language="javascript">
  function enviar(estatus1,estatus2,territorial){
	  document.getElementById('hddn_estatus1').value=estatus1
	  document.getElementById('hddn_estatus2').value=estatus2
	  document.getElementById('hddn_territorial').value=territorial
	  //document.getElementById('frm_revisarAvance').action="revisar_avanceDetalle.asp"	
	  document.getElementById('frm_revisarAvance').action="modalTest_ConMenuSwip.asp"	
	  document.getElementById('frm_revisarAvance').submit()  
  }
  </script>
  

<title>Documento sin título</title>

</head>

<body> 
<form name="frm_revisarAvance" id="frm_revisarAvance" method="post">
<div class="container">
    <div id="sidebar">
        <ul>
            <li><a href="busqueda_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Buscar un CR</a></li>
            <li><a href="revisar_avance_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Avance General</a></li>
            <li><a href="#">Acciones T&aacute;cticas</a></li>
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

<table width="100%">
 <tr>
  <td width="25%" style="vertical-align:top; padding-left:20px">
  <div class="datagrid"><table width="67%"><thead>
 <tr>
  <th width="83%" height="20px" style="vertical-align:top">Obras por iniciar</th>
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
<td width="10%"></td><!--Espacio entre las tablas-->
 <td width="25%" style="vertical-align:top">
 
  <div class="datagrid"><table width="67%"><thead>
 <tr>
  <th width="83%" height="20px" style="vertical-align:top">En Proceso</th>
  <th width="17%" style="vertical-align:top"><%=calculaObras1Estatus(1,2)%></strong></th>
 </tr></thead>
 
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "select b.Territorial, COUNT(*) as Sucursales from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr where a.EstatusObra=1 or a.EstatusObra=2 and b.territorial is not null GROUP BY b.Territorial"

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
  <th width="83%" style="padding-left:20px;"><p style="background-color: transparent"><font color="#000000"><%=rs1("Territorial")%></font></p></th>
  <th width="17%" style="padding-left:20px; cursor:pointer" onclick="enviar(1,2,'<%=rs1("Territorial")%>')"><p style="background-color: transparent; color:#d51818; text-decoration:underline"><%=rs1("Sucursales")%></p></th>
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
  <td colspan="2" style="padding-left:20px; padding-right:20px">
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
   <li style="color:#5cb85c">En Tiempo <%=calculaObras1Estatus(1,1)%></li>
   <li style="color:#d9534f">Con Atraso <%=calculaObras1Estatus(2,2)%></li>
  </ul>
  </td>
 </tr>
</table>
</div>

</td>
<td width="10%"></td><!--Espacio entre las tablas-->
  <td width="25%" style="vertical-align:top; padding-right:20px">
  <div class="datagrid"><table width="67%"><thead>
 <tr>
  <th width="83%" height="20px" style="vertical-align:top">Terminadas</th>
  <th width="17%" style="vertical-align:top"><%=calculaObras1Estatus(3,3)%></strong></th>
 </tr></thead>
 <%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "select b.Territorial, COUNT(*) as Sucursales from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr where a.EstatusObra=3 and b.territorial is not null  GROUP BY b.Territorial"
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
  <th width="17%" style="padding-left:20px; cursor:pointer" onclick="enviar(3,3,'<%=rs1("Territorial")%>')"><p style="background-color: transparent; color:#d51818; text-decoration:underline"><%=rs1("Sucursales")%></p></th>
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
  <td colspan="2" style="padding-left:20px; padding-right:20px">
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
   <li style="color:#5cb85c">Sin Pendientes <%=cint(calculaObras1Estatus(3,3))-cint(calculaObrasConPendientes())%></li>
   <li style="color:#d9534f">Con Pendientes <%=calculaObrasConPendientes()%></li>
  </ul>
  </td>
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
</form>
</body>
</html>
