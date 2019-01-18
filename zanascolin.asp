<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="UTF-8">
	<title>datatablevegueta</title>
	 <link rel="stylesheet" href="css/tabla.css">
</head>
     <%cp =request("oso") %>

 <body>


             <%
       
    
    Dim conexion, rsTabla 

  set conexion = Server.CreateObject("ADODB.Connection")
  conexion.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};server=localhost;database=app_bnrt_2018; uid=root;pwd=; option=3"
  Set rsTabla = Server.CreateObject("ADODB.Recordset") 

  sql =  "select cp from cat_sucursales where territorial like 'occidente' GROUP BY cp"

  rsTabla.Open sql, conexion, 0
  
  
     %>
    
<form  id="form_inmueble" method="post" action="zanasColin.asp"> 

<center>
<div class="center-on-page">
     <div class="select">
            <select name="oso" >
               
                 <%
                 while not(rstabla.eof)
                 %>
                 <option selected="selected" value="<%=rstabla("cp")%>"><%=rstabla("cp")%> </option>
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





       <div id="Div1">
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
    sql = sql & " WHERE c.Territorial like 'Occidente'"
    sql = sql & " GROUP BY c.cp) z"
    sql = sql & " LEFT JOIN ("
    sql = sql & " select c.cp, count(a.cr) as por_iniciar from tseguimiento a "
    sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
    sql = sql & " where a.EstatusObra = 0 and c.Territorial like 'Occidente'"
    sql = sql & " GROUP BY c.cp) y on z.cp = y.cp"
    sql = sql & " LEFT JOIN("
    sql = sql & " select c.cp, count(a.cr) as en_tiempo from tseguimiento a "
    sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
    sql = sql & " where a.EstatusObra = 1 and c.Territorial like 'Occidente'"
    sql = sql & " GROUP BY c.cp) x on z.cp = x.cp"
    sql = sql & " LEFT JOIN("
    sql = sql & " select c.cp, count(a.cr) as Con_Atraso  from tseguimiento a "
    sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
    sql = sql & " where a.EstatusObra = 2 and c.Territorial like 'Occidente'"
    sql = sql & " GROUP BY c.cp) w on z.cp = w.cp"
    sql = sql & " LEFT JOIN("
    sql = sql & " select c.cp, count(a.cr) as Terminada from tseguimiento a "
    sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
    sql = sql & " where a.EstatusObra = 3 and c.Territorial like 'Occidente'"
    sql = sql & " GROUP BY c.cp) v on z.cp = v.cp"
    sql = sql & " LEFT JOIN("
    sql = sql & " select c.cp, count(a.cr) as suspendida from tseguimiento a "
    sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
    sql = sql & " where a.EstatusObra = 4 and c.Territorial like 'Occidente'"
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

<br />






  <div id="tabla1">
<%
 
  'creamos un objeto de tipo "connection" para la 
  'conexión con el origen de datos ODBC 
  set conexion = Server.CreateObject("ADODB.Connection")

  'nos conectamos al origen de datos ODBC "bdoracle"
  conexion.Open "DRIVER={MySQL ODBC 5.3 ANSI Driver};server=localhost;database=app_bnrt_2018; uid=root;pwd=; option=3"

  'creamos un objeto de tipo "recordset" (tabla) 
  Set rsTabla = Server.CreateObject("ADODB.Recordset") 


    sql = " select c.territorial, c.cp,"
    sql = sql & " a.FechaInicio, a.FechaTermino,"
    sql = sql & " if(a.fechainicio > curdate(),0, if(a.fechatermino <= curdate(),1,((DATEDIFF(curdate(), a.fechainicio))/DATEDIFF(a.fechatermino,a.fechainicio))* 100)) as prog,"
    sql = sql & " a.obra_civil, '' as insttecnologia, viniles, a.ATM_Paneles522, atms, '' as aa, SUM_sillasPatioPublico, a.senalizacionExt,"
    sql = sql & " seguridad, SUM_BancoQM"
    sql = sql & " from tseguimiento a "
    sql = sql & " LEFT JOIN cat_sucursales c on a.cr = c.CR"
    sql = sql & " where c.cp like '" & cp & "'"

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
     <th>TERRITORIO</th>
     <th >SUCURSAL</th>
     <th>INICIO PROYECTO</th>
     <th>FIN PROYECTO</th>
     <th>% PROG</th>
     <th>% OBRA</th>
     <th>INST. TECNO.</th>
     <th>VINILES</th>
     <th>PANELES AT´S</th>
     <th>ATM´S</th>
     <th>AA</th>
     <th>SILLAS</th>
     <th>SEÑ. EXT.</th>
     <th>INST. SEGURIDAD.</th>
     <th>BANCO QM</th>
     </tr>
  </thead>

     <%

  while not(rstabla.eof)

    %>

  <tbody>
        <tr >
          <td ><%=rstabla("territorial")%></td>
          <td ><%=rstabla("CP")%></td>
          <td ><%=rstabla("FechaInicio")%></td>
          <td ><%=rstabla("FechaTermino")%></td>
          <td ><%=rstabla("prog")%></td>
          <td ><%=rstabla("obra_civil")%></td>
          <td ><%=rstabla("insttecnologia")%></td>
          <td ><%=rstabla("viniles")%></td>
          <td ><%=rstabla("ATM_Paneles522")%></td>
          <td ><%=rstabla("atms")%></td>
          <td ><%=rstabla("aa")%></td>
          <td ><%=rstabla("SUM_sillasPatioPublico")%></td>
          <td ><%=rstabla("senalizacionExt")%></td>
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
     <br />





 </form>
 </body>

</html>