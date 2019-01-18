<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="UTF-8">
	<title>datatablevegueta</title>
	 <link rel="stylesheet" href="css/tabla.css">

<script>
      function mostrar() {
               document.getElementById('tabla1').style.display = 'none';
               document.getElementById('tabla2').style.display = 'block';
               }
</script>
</head>
     <%region =request("oso") %>

 <body>


             <%
       
    
    Dim conexion, rsTabla 

  set conexion = Server.CreateObject("ADODB.Connection")
  conexion.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};server=localhost;database=app_bnrt_2018; uid=root;pwd=; option=3"
  Set rsTabla = Server.CreateObject("ADODB.Recordset") 

  sql =  "select Territorial from cat_sucursales GROUP BY Territorial"

  rsTabla.Open sql, conexion, 0
  
  
     %>
    
<form  id="form_inmueble" method="post" action="regionesColin.asp"> 

<center>
<div class="center-on-page">
     <div class="select">
            <select name="oso" >
               
                 <%
                 while not(rstabla.eof)
                 %>
                 <option selected="selected" value="<%=rstabla("territorial")%>"><%=rstabla("territorial")%> </option>
      <%
        rstabla.MoveNext 
		wend
         rsTabla.close 
         conexion.close 
		
          Set conexion = Nothing 
          Set rsTabla = Nothing 
           %>
            </select>
         </div>
    <input type="button" value="Buscar" onclick="document.getElementById('form_inmueble').submit(); openPage('Dg', this, 'grey');"/>
</div>
</center>





     <div id="tabla1">
<%
   

  'creamos un objeto de tipo "connection" para la 
  'conexión con el origen de datos ODBC 
  set conexion = Server.CreateObject("ADODB.Connection")

  'nos conectamos al origen de datos ODBC "bdoracle"
  conexion.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};server=localhost;database=app_bnrt_2018; uid=root;pwd=; option=3"

  'creamos un objeto de tipo "recordset" (tabla) 
  Set rsTabla = Server.CreateObject("ADODB.Recordset") 


    sql = " (select"
    sql = sql & " z.territorial,"
    sql = sql & " sum(ifnull(y.por_iniciar,0) + ifnull(x.en_tiempo,0) + ifnull(w.Con_Atraso,0) + ifnull(u.suspendida,0)) as total,"
    sql = sql & " ifnull(v.Terminada,0) as terminadas, "
    sql = sql & " ifnull(x.en_tiempo,0) as en_tiempo,"
    sql = sql & " ifnull(y.por_iniciar,0) as por_iniciar,"
    sql = sql & " ifnull(w.Con_Atraso,0) as con_atraso,"
    sql = sql & " ifnull(u.suspendida,0)as suspendidas"
    sql = sql & " from"
   sql = sql & " ("
   sql = sql & " select c.territorial from tseguimiento a "
   sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
    sql = sql & " GROUP BY c.Territorial) z"
   sql = sql & " LEFT JOIN ("
   sql = sql & " select c.territorial, count(a.cr) as por_iniciar from tseguimiento a "
   sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
    sql = sql & " where a.EstatusObra = 0"
    sql = sql & " GROUP BY c.Territorial) y on z.territorial = y.territorial"
   sql = sql & " LEFT JOIN("
   sql = sql & " select c.territorial, count(a.cr) as en_tiempo from tseguimiento a "
   sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
    sql = sql & " where a.EstatusObra = 1"
    sql = sql & " GROUP BY c.Territorial) x on z.territorial = x.territorial"
   sql = sql & " LEFT JOIN("
   sql = sql & " select c.territorial, count(a.cr) as Con_Atraso  from tseguimiento a "
   sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
   sql = sql & " where a.EstatusObra = 2"
    sql = sql & " GROUP BY c.Territorial) w on z.territorial = w.territorial"
   sql = sql & " LEFT JOIN("
   sql = sql & " select c.territorial, count(a.cr) as Terminada from tseguimiento a "
   sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
   sql = sql & " where a.EstatusObra = 3"
    sql = sql & " GROUP BY c.Territorial) v on z.territorial = v.territorial"
   sql = sql & " LEFT JOIN("
   sql = sql & " select c.territorial, count(a.cr) as suspendida from tseguimiento a "
   sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
   sql = sql & " where a.EstatusObra = 4"
    sql = sql & " GROUP BY c.Territorial) u on z.territorial = u.territorial"
   sql = sql & " GROUP BY z.territorial)"

  'asignamos al objeto "rsTabla" el resultado de la ejecución de la consulta SQL 
  rsTabla.Open sql, conexion, 0
  
  'Recorremos todos los registros del objeto recordset y mostramos su valor 
 
    if rsTabla.eof then

    %>

     <%
         else
         %>
    <div class="datagrid">
 <table width="70%" align="center">
  <thead>
    <tr>
     <th>TERRITORIAL</th>
     <th>TOTAL</th>
     <th>TERMINADAS</th>
     <th>EN TIEMPO</th>
     <th>POR INICIAR</th>
     <th>CON ATRASO</th>
     <th>SUSPENDIDAS</th>
     </tr>
  </thead>
  <tbody>
     <%

  while not(rstabla.eof)

    %>


        <tr >
          <td ><%=rstabla("TERRITORIAL")%></td>
          <td ><%=rstabla("TOTAL")%></td>
          <td ><%=rstabla("TERMINADAS")%></td>
          <td ><%=rstabla("EN_TIEMPO")%></td>
          <td ><%=rstabla("POR_INICIAR")%></td>
          <td ><%=rstabla("CON_ATRASO")%></td>
          <td ><%=rstabla("SUSPENDIDAS")%></td>
        </tr>
     
  
     <%
     
		 rstabla.MoveNext 
		wend
      'cerramos el recordset y la conexión 
		 rsTabla.close 
         conexion.close 
		
         
  'liberamos los objetos 
          Set conexion = Nothing 
          Set rsTabla = Nothing 
	
         end if
		%>
</tbody>
</table>



 </div>

</div>
    <br />






     <div id="tabla2">
<%


 

  'creamos un objeto de tipo "connection" para la 
  'conexión con el origen de datos ODBC 
  set conexion = Server.CreateObject("ADODB.Connection")

  'nos conectamos al origen de datos ODBC "bdoracle"
  conexion.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};server=localhost;database=app_bnrt_2018; uid=root;pwd=; option=3"

  'creamos un objeto de tipo "recordset" (tabla) 
  Set rsTabla = Server.CreateObject("ADODB.Recordset") 


    sql = " (select"
    sql = sql & " z.cp, z.login_nombre,"
    sql = sql & " sum(ifnull(y.por_iniciar,0) + ifnull(x.en_tiempo,0) + ifnull(w.Con_Atraso,0) + ifnull(u.suspendida,0)) as total,"
    sql = sql & " ifnull(v.Terminada,0) as terminadas, "
    sql = sql & " ifnull(x.en_tiempo,0) as en_tiempo,"
    sql = sql & " ifnull(y.por_iniciar,0) as por_iniciar,"
    sql = sql & " ifnull(w.Con_Atraso,0) as con_atraso,"
    sql = sql & " ifnull(u.suspendida,0)as suspendidas"
    sql = sql & " from"
    sql = sql & " ("
    sql = sql & " select c.cp, d.login_nombre from tseguimiento a "
    sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
    sql = sql & " LEFT JOIN app_bnrt_login d on a.supervisorasignado = d.login_id"
    sql = sql & " WHERE c.Territorial like '" & region & "'"
    sql = sql & " GROUP BY c.cp) z"
    sql = sql & " LEFT JOIN ("
    sql = sql & " select c.cp, count(a.cr) as por_iniciar from tseguimiento a "
    sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
    sql = sql & " where a.EstatusObra = 0 and c.Territorial like '" & region & "'"
    sql = sql & " GROUP BY c.cp) y on z.cp = y.cp"
    sql = sql & " LEFT JOIN("
    sql = sql & " select c.cp, count(a.cr) as en_tiempo from tseguimiento a "
    sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
    sql = sql & " where a.EstatusObra = 1 and c.Territorial like '" & region & "'"
    sql = sql & " GROUP BY c.cp) x on z.cp = x.cp"
    sql = sql & " LEFT JOIN("
    sql = sql & " select c.cp, count(a.cr) as Con_Atraso  from tseguimiento a "
    sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
    sql = sql & " where a.EstatusObra = 2 and c.Territorial like '" & region & "'"
    sql = sql & " GROUP BY c.cp) w on z.cp = w.cp"
    sql = sql & " LEFT JOIN("
    sql = sql & " select c.cp, count(a.cr) as Terminada from tseguimiento a "
    sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
    sql = sql & " where a.EstatusObra = 3 and c.Territorial like '" & region & "'"
    sql = sql & " GROUP BY c.cp) v on z.cp = v.cp"
    sql = sql & " LEFT JOIN("
    sql = sql & " select c.cp, count(a.cr) as suspendida from tseguimiento a "
    sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
    sql = sql & " where a.EstatusObra = 4 and c.Territorial like '" & region & "'"
    sql = sql & " GROUP BY c.cp) u on z.cp = u.cp"
    sql = sql & " GROUP BY z.cp)"

  'asignamos al objeto "rsTabla" el resultado de la ejecución de la consulta SQL 
  rsTabla.Open sql, conexion, 0
  
  'Recorremos todos los registros del objeto recordset y mostramos su valor 
 
    if rsTabla.eof then

    %>

     <%
         else
     %>


       



    <div class="datagrid">
 <table width="70%" align="center">
  <thead>
    <tr>
     <th>ZONA</th>
     <th >SUPERVISOR</th>
     <th>TOTAL</th>
     <th>TERMINADAS</th>
     <th>EN TIEMPO</th>
     <th>POR INICIAR</th>
     <th>CON ATRASO</th>
     <th>SUSPENDIDAS</th>
     </tr>
  </thead>

     <%

  while not(rstabla.eof)

    %>

  <tbody>
        <tr >
          <td ><%=rstabla("cp")%></td>
          <td ><%=rstabla("login_nombre")%></td>
          <td ><%=rstabla("TOTAL")%></td>
          <td ><%=rstabla("TERMINADAS")%></td>
          <td ><%=rstabla("EN_TIEMPO")%></td>
          <td ><%=rstabla("POR_INICIAR")%></td>
          <td ><%=rstabla("CON_ATRASO")%></td>
          <td ><%=rstabla("SUSPENDIDAS")%></td>
        </tr>
     
  
     <%
     
		 rstabla.MoveNext 
		wend
      'cerramos el recordset y la conexión 
		 rsTabla.close 
         conexion.close 
		
         
  'liberamos los objetos 
          Set conexion = Nothing 
          Set rsTabla = Nothing 
	
         end if
		%>
</tbody>
</table>



 </div>
 </div>






 </form>
 </body>

</html>