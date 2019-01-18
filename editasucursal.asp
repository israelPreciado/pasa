<!--#include file="funcion3/funcion.inc"-->
<!--#include file="funcion3/funcioncolin.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

 <link rel="stylesheet" href="css/tabla.css">
     <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
     <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
     <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />

    <script language="javascript">
        function buscarcr() {
            sucursal = document.sucursales.selectsucursal.value;
           
                $.ajax({
                    type: "GET",
                    url: "actualizarcr.asp?sucursal=" + sucursal,
                    dataType: "html",
                    success: function (response) {
                        $("#myModal").html(response);
                    }
                });         
        }

        function updatecr() {
            cr = document.sucursales.sucursal2.value;
            zonap = document.sucursales.selectzonaprecio.value;
            bloque = document.sucursales.bloque.value;
            territorial = document.sucursales.territorial.value;
            sucursal = document.sucursales.sucursal3.value;
            alcancet = document.sucursales.alcancet.value;
            domicilio = document.sucursales.domicilio.value;
            colonia = document.sucursales.colonia.value;
            m2 = document.sucursales.m2.value;
            regional = document.sucursales.regional.value;
            ciudad = document.sucursales.ciudad.value;
            estado = document.sucursales.selectestado.value;
            zonat = document.sucursales.zonat.value;

            $.ajax({
                type: "GET",
                url: "updatesucursales.asp?cr=" + cr + "&zonap=" + zonap + "&bloque=" + bloque + "&territorial=" + territorial + "&sucursal=" + sucursal + "&alcancet=" + alcancet + "&domicilio=" + domicilio + "&colonia=" + colonia + "&m2=" + m2 + "&regional=" + regional + "&ciudad=" + ciudad + "&estado=" + estado + "&zonat=" + zonat,
                dataType: "html",
                success: function (response) {
                    if (response == "errE") {
                        simulateClick(document.getElementById('alert2'))
                    }
                    else {
                        if (response == "ok") {
                            simulateClick(document.getElementById('alert3'))
                        }
                        else {
                            simulateClick(document.getElementById('alert4'))
                        }
                    }
                }
            });
            setTimeout("location.href='editasucursal.asp'", 1000);
      
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
 <body>

             <%   
    Dim conexion, rsTabla   
     %>
    
<form  id="sucursales" name="sucursales" method="post" action="editasucursal.asp"> 


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
              <%=cargasucursalesedit(0) %>
                </td>
            </tr>
            </tbody>
            </table>
         </div>
    <input type="button" value="Buscar" onclick="buscarcr()"/>
</div>
             <br />
             <input type="button" value="Ir a Insertar Sucursal" onclick="location.href = 'ingresasuc.asp'"/>
</center>

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
	alertify.alert("El <strong>CR</strong> es obligatorio");
	return false;
 });
 $("#alert2").on( 'click', function () {
	reset();
	alertify.alert("El <strong>CR</strong> ya existe");
	return false;
	});
 $("#alert3").on( 'click', function () {
	reset();
	alertify.alert("El <strong>CR</strong> se Actualizo exitosamente");
    alertify.success("El <strong>CR</strong> se Actualizo exitosamente");
	return false;
  });	
     $("#alert4").on( 'click', function () {
	reset();
	alertify.alert("No se que paso");
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