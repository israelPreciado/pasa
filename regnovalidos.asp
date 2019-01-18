<!--#include file="funcion3/funcion.inc"-->
<%
Response.Charset = "UTF-8"
Response.ContentType = "application/vnd.ms-excel" 
Response.AddHeader "Content-Disposition", "attachment; filename=" & archivo 

        Response.Redirect ("Insertindex.asp")
 %>


<html>
    <head>

    </head>
    <body>
        <%
   

  set conexion = Server.CreateObject("ADODB.Connection")

    conexion.Open ConnStr


  'creamos un objeto de tipo "recordset" (tabla) 
  Set rsTabla = Server.CreateObject("ADODB.Recordset") 


    sql = " select Pos, cve_sap, material, cantidad, comentario, tiempo, fecha, cr, id_componente from cat_llegadamateriales_temp "
    sql = sql & " where LENGTH(pos) <= 2 or LENGTH(cve_sap) <= 2 or LENGTH(fecha) <= 2 or cr in ('') "

  'asignamos al objeto "rsTabla" el resultado de la ejecución de la consulta SQL 
  rsTabla.Open sql, conexion, 0
  
  'Recorremos todos los registros del objeto recordset y mostramos su valor 
 
    if rsTabla.eof then

    %>

     <%
         else
         %>
    <div class="datagrid">
 <table  align='center' cellpadding='0' class='display' id='example2'>
  <thead>
    <tr>
     <th>POS</th>
     <th>CVE SAP</th>
     <th>MATERIAL</th>
     <th>CANTIDAD</th>
     <th>COMENTARIO</th>
     <th>TIEMPO</th>
     <th>FECHA</th>
     <th>CR</th>
     <th>ID COMPONENTE</th>
     </tr>
  </thead>

     <%

  while not(rstabla.eof)

    %>

  <tbody>
        <tr >
          <td ><%=rstabla("pos")%></td>
          <td ><%=rstabla("cve_sap")%></td>
          <td ><%=rstabla("material")%></td>
          <td ><%=rstabla("cantidad")%></td>
          <td ><%=rstabla("comentario")%></td>
          <td ><%=rstabla("tiempo")%></td>
          <td ><%=rstabla("fecha")%></td>
          <td ><%=rstabla("cr")%></td>
          <td ><%=rstabla("id_componente")%></td>
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


         ' 

 


		%>
</tbody>
</table>

    </body>


</html>
