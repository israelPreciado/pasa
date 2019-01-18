<!--#include file="funcion3/funcion.inc"-->
<!--#include file="funcion3/funcioncolin.inc"-->
<%

cr=request("cr")
zona=request("zona")
contador = 0

set conexion = Server.CreateObject("ADODB.Connection")

 conexion.Open ConnStr
  Set rsTabla = Server.CreateObject("ADODB.Recordset") 

    sql = "select cr, concat(path,`name`) as file, fecha, id_foto, SUBSTR(path,10,LENGTH(path)-INSTR(path,'/')-1) as zona, path"
    sql = sql & " from ctrl_fotografias where cr = '" & cr & "'"
    sql = sql & " and path like '%" & zona & "%'"

  rsTabla.Open sql, conexion, 0
    if not(rsTabla.eof) then

     regresar=regresar & " <center>"
     regresar=regresar & " <div id='carrusel'>"
     regresar=regresar & " <a href='#' class='izquierda_flecha'><img src='adjuntos/izquierda.png' /></a>"
	 regresar=regresar & " <a href='#' class='derecha_flecha'><img src='adjuntos/derecha.png' /></a>"
     regresar=regresar & " <div class='carrusel'>"
        
    while not(rstabla.eof)

	  regresar=regresar & " <div class='product' id='product_" & contador & "'>"
      regresar=regresar & "   	<img class='img_carrusel' src='" & rstabla("file") & "' width='195px' height='100px' />"
      regresar=regresar & "        <p style='background:red; cursor: pointer;  text-align:center' onclick='elimina(" & rstabla("id_foto") & ")'>Eliminar Foto</p>"
      regresar=regresar & "   </div>"
       
         contador = contador + 1
		 rstabla.MoveNext 
		wend	

	  regresar=regresar & " </div>"
      regresar=regresar & " </div>"
      regresar=regresar & " </center>"
	  
	  else
	  
	  regresar = regresar & " <center> "
	  regresar = regresar & " <strong> No Hay Registros"
      regresar = regresar & " </strong> "
	  regresar = regresar & " </center> "
	  
      end if 


         
		 rsTabla.close 
         conexion.close 

          Set conexion = Nothing 
          Set rsTabla = Nothing 

     response.write(regresar)

    
	
       
     %>


