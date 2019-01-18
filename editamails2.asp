<!--#include file="funcion3/funcion.inc"-->
<!--#include file="funcion3/funcioncolin.inc"-->
<!--#include file="funcion3/funcion.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

 <link rel="stylesheet" href="css/tabla.css">
     <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
     <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
     <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />

    <script language="javascript">
        function prueba(id) {
          
                $.ajax({
                    type: "GET",
                    url: "consultamailsestimaciones.asp?id=" + id,
                    dataType: "html",
                    success: function (response) {
                        $("#myModal").html(response);
                    }
                });
            
        }

        function update() {
            para = document.mails.para.value;
            copia = document.mails.copia.value;
            id2 = document.mails.id2.value;

            $.ajax({
                type: "GET",
                url: "actualizamails.asp?para=" + para + "&copia=" + copia + "&id2=" + id2,
                dataType: "html",
                success: function (response) {
                    if (response == "errE") {
                        simulateClick(document.getElementById('alert2'))
                    }
                    else {
                        if (response == "ok") {
                            simulateClick(document.getElementById('alert4'))
                        }
                        else {
                            simulateClick(document.getElementById('alert5'))
                        }
                    }
                }
            });
            setTimeout("location.href='editamails2.asp'", 3000);
      
        }

        //simulacion de click
        function simulateClick(control) {
            if (document.all) {
                control.click();
            }
            else {
                var evObj = document.createEvent('MouseEvents');
                evObj.initMouseEvent('click', true, true, window, 1, 12, 345, 7, 220, false, false, true, false, 0, null);
                control.dispatchEvent(evObj);
            }
        }


        //validadort de correo
        function validadormail() {
            var email_para = document.mails.para.value
            var email_copia = document.mails.copia.value;

            if (validar_email(email_para)) {
                if (validar_email(email_copia)) {
                    update()
                }
                else {
                    simulateClick(document.getElementById('alert2'))
                }
            }
            else {
                simulateClick(document.getElementById('alert3'))
            }         
        }
        function validar_email(email) {
            var regex = /^(([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+)(([\s]*[;,]+[\s]*(([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+))*)$/;
            return regex.test(email) ? true : false;
        }

    </script>

     <style type="text/css">
      input[type="button"]{
 width:15%;
 background:#a40505;
 border:0;
 padding:1%;
 text-wrap:none;
 font-family:'Open Sans',sans-serif;
 font-size:100%;
 color:#fff;
 cursor:pointer;
 transition:background .3s;
 -webkit-transition:background .3s;
  -webkit-appearance: none;
 -webkit-border-radius: 0;
}
         </style>

   

</head>
     <%sucursal =request("selectsucursal") %>
 <body>

             <%
       
    
    Dim conexion, rsTabla 

  
  
     %>
    
<form  id="mails" name="mails" method="post" action="editamails2.asp"> 


     <div id="tabla1">


         <center>
  <div class="datagrid" id="tabla_cr">
     <div class="select">
          <table  align='center' cellpadding='0' class='display' id='Table1'>
        <thead>
            <tr>
                <th colspan ="4" align="center">Seleccione la Sucursal</th>
            </tr>
        </thead>
        <tbody>
        <tr>
            <td>
              <%=cargasucursales(0) %>
                </td>
            </tr>
            </tbody>
            </table>
         </div>
    <input type="button" value="Buscar" onclick="document.getElementById('mails').submit()"/>
      </div>

</center>

<%

  set conexion = Server.CreateObject("ADODB.Connection")

    conexion.Open ConnStr

  Set rsTabla = Server.CreateObject("ADODB.Recordset") 

    sql = "select cr, para, cc, if(estado=0,'Enviado', 'Pendiente') as estado, estimacion, id from ctrl_envioestimaciones where cr like '" & sucursal & "'"

  rsTabla.Open sql, conexion, 0
 
    if rsTabla.eof then

    %>

     <%
         else
         %>

         <br />

    <div class="datagrid">
 <table  align='center' cellpadding='0' class='display' id='example2'>
  <thead>
    <tr>
     <th>CR</th>
     <th>Para</th>
     <th>Con Copia</th>
     <th>Estado</th>
     <th>Estimacion</th>
     <th>-</th>
     </tr>
  </thead>

     <%

  while not(rstabla.eof)

    %>

  <tbody>
        <tr >
          <td width="3%"  style="cursor: pointer" onclick="prueba('<%=rstabla("id")%>')"><%=rstabla("cr")%></td>
          <td width="10%" align="center" onclick="prueba('<%=rstabla("id")%>')"><%=rstabla("para")%></td>
          <td  width="10%" align="center" onclick="prueba('<%=rstabla("id")%>')" ><%=rstabla("cc")%></td>
          <td  width="3%" align="center" onclick="prueba('<%=rstabla("id")%>')"><%=rstabla("estado")%></td>
          <td  width="5%" align="center" onclick="prueba('<%=rstabla("id")%>')" ><%=rstabla("estimacion")%></td>
          <td  width="5%" align="center" style="cursor: pointer" bgcolor="#993300" onclick="prueba('<%=rstabla("id")%>')"><p style="color:#fff";> <strong>Reenviar</strong></p></td>
        </tr>
     <%
		 rstabla.MoveNext 
		wend
    
		 rsTabla.close 
         conexion.close 
	
          Set conexion = Nothing 
          Set rsTabla = Nothing 
	
         end if
		%>
</tbody>
</table>
 </div>

</div>
    <br />
                 <div id="myModal">
    </div>
 </form>

        <a href="#" id="alert" style="display:none"></a>
      <a href="#" id="alert2" style="display:none">&nbsp;</a>
      <a href="#" id="alert3" style="display:none">&nbsp;</a>
      <a href="#" id="alert4" style="display:none">&nbsp;</a>
      <a href="#" id="alert5" style="display:none">&nbsp;</a>
      <a href="#" id="alert6" style="display:none">&nbsp;</a>


        <script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="menu.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
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
	alertify.alert("Campos de mail correctos");
    alertify.success("mails correctos");
	return false;
 });
 $("#alert2").on( 'click', function () {
	reset();
	alertify.alert("El <strong>Mail Copia</strong>  No es valido");
    alertify.success("vlidar formatos de correos");
	return false;
	});
 $("#alert3").on( 'click', function () {
	reset();
	alertify.alert("El <strong>Mail Para</strong> No es valido");
    alertify.success("validar formatos de correos ");
	return false;
  });	
     $("#alert4").on( 'click', function () {
	reset();
	alertify.alert("Estimacion en proceso de envio, en breve llegara a los correos actualizados");
    alertify.success("actualizacion correcta");
	return false;
  });		
    $("#alert5").on( 'click', function () {
	reset();
	alertify.alert("Todos los campos son obligatorios");
	return false;
  });	
     $("#alert6").on( 'click', function () {
	reset();
	alertify.alert("No se aceptan caracteres especiales");
	return false;
  });	
</script>
 </body>

</html>