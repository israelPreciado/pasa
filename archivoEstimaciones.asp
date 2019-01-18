<!--#include file="funcion3/funcion.inc"-->
<!--#include file="funcion3/funcion_edicion_usuarios.inc"-->
<!--#include file="funcion/funcion.inc"-->
<%
response.ContentType="application/vnd.ms-xls"
Response.AddHeader "Content-Disposition", "attachment; filename=Estimaciones_realizadas.xls"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Archiv Estimaciones</title>

    
</head>
<body>
<form id="frm_estatusATM" name="frm_estatusATM">
<div class="container" align="center"> 
<p><font size="+2" color="#003399"><strong>Estimaciones Realizadas</strong></font></p>
<div style="color:#0066CC" align="center">

<table cellpadding="0" cellspacing="0" class="display" id="example1" width="100%">
 <thead>
  <tr bgcolor="#639be6">
 <th align="center"><font color="#FFFFFF" size="-6">CR</font></th>
 <th align="center"><font color="#FFFFFF" size="-6">NOMBRE_SUCURSAL</font></th>
 <th align="center"><font color="#FFFFFF" size="-6">TERRITORIAL</font></th>
 <th align="center"><font color="#FFFFFF" size="-6">REGIONAL</font></th>
 <th align="center"><font color="#FFFFFF" size="-6">SUPERVISOR</font></th>
 <th align="center"><font color="#FFFFFF" size="-6">CONTRATISTA</font></th>
 <th align="center"><font color="#FFFFFF" size="-6">ESTIMACION1</font></th>
 <th align="center"><font color="#FFFFFF" size="-6">ESTIMACION2</font></th>
 <th align="center"><font color="#FFFFFF" size="-6">ESTIMACION3</font></th>
 <th align="center"><font color="#FFFFFF" size="-6">ESTIMACION4</font></th>
 <th align="center"><font color="#FFFFFF" size="-6">FECHAINICIO</font></th>
 <th align="center"><font color="#FFFFFF" size="-6">FECHATERMINO</font></th>
 <th align="center"><font color="#FFFFFF" size="-6">AVANCEREAL</font></th>
 <th align="center"><font color="#FFFFFF" size="-6">AVANCEPROYECTADO</font></th>
</tr>
 </thead> 
   <%=cargaEstimacionesRealizadas()%>
</table>
</div>
</form>
</body>

</html>
