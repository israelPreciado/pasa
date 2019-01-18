<!--#include file="funcion3/funcion.inc"-->
<%
id=request("id")

set conexion = Server.CreateObject("ADODB.Connection")

 conexion.Open ConnStr


  Set rsTabla = Server.CreateObject("ADODB.Recordset") 

    sql = " Select cr, para, cc, id from ctrl_envioestimaciones where id = '" & id & "'"

  rsTabla.Open sql, conexion, 0


    if not(rsTabla.eof) then

regresar=regresar & "<div class='datagrid'>"
regresar=regresar & " <table  align='center' cellpadding='0' cellspacing='0' class='display' id='example1'>"
regresar=regresar & "  <thead>"
regresar=regresar & "    <tr>"
regresar=regresar & "     <th>CR</th>"
regresar=regresar & "     <th >Para</th>"
regresar=regresar & "     <th>Con Copia</th>"
regresar=regresar & "     <th></th>"
regresar=regresar & "  </thead>"
regresar=regresar & "  <tbody>"

  while not(rstabla.eof)


regresar=regresar & "        <tr >"
regresar=regresar & "          <td width='3%' >" & rstabla("cr") & "</td>"
regresar=regresar & "          <td width='42%'><textarea rows='3' cols='60' name='para' id='para' >" & rstabla("para") & "</textarea ></td>"
regresar=regresar & "          <td width='42%'><textarea rows='3' cols='60' name='copia' id='copia' >" & rstabla("cc")& "</textarea ></td>"
regresar=regresar & "          <td width='42%'><input type='hidden' name='id2' id='id2' value='" & rstabla("id")& "'></td>"
regresar=regresar & "        </tr>"
 
		 rstabla.MoveNext 
		wend

		 rsTabla.close 
         conexion.close 

          Set conexion = Nothing 
          Set rsTabla = Nothing 
	
          end if
    regresar=regresar & " </tbody>"
    regresar=regresar & " </table>"
    regresar=regresar & " <center>* Favor de validar las direcciones de correo electrónico *</center>"
    regresar=regresar & " <center><input  type='button' value='Reenviar Estimación' onclick='validadormail()' name='btnupdate' /></center>"
    regresar=regresar & " </div>"



    response.write(regresar)

%>
