<!--#include file="funcion3/funcioncolin.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

    <link rel="stylesheet" href="css/tabla.css">
     <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
     <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
     <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />

    <script language="javascript">
        var cr = null

        function soloNumeros(e) {
            var key = window.Event ? e.which : e.keyCode
            return ((key >= 48 && key <= 57) || key == 8)
        }

        function validar2(cajaTexto) {
            //alert(cajaTexto)
            familia = document.getElementById(cajaTexto).value;
            if (familia.length == 0 || /^\s+$/.test(familia)) {
                //alert("todos los campos son obligatorios")
                simulateClick(document.getElementById('alert5'))
                document.getElementById(cajaTexto).value = ""
                document.getElementById(cajaTexto).focus();
                return false
            }
            else {
                if (/^[0-9a-zA-Z\sñÑ.()-]+$/.test(familia)) {
                    return true
                }
                else {
                    simulateClick(document.getElementById('alert6'))
                    document.getElementById(cajaTexto).focus();
                    return false
                }
            }
        }

        function validaFormulario(tabla) {
            if (recorreElementos(tabla, 'input')) {
                if (recorreSelect(tabla)) {
                    prueba()
                }

            }
        }

        function recorreSelect(div) {
            var elemento = document.getElementById(div).getElementsByTagName('select');
            var bandera = false
            for (var i = 0; i < elemento.length; i++) {
                if (elemento[i].type != "hidden") {
                    // if (document.getElementById('select_login_privilegio').value == 7) {
                    if (valor_select(elemento[i].name) == 0) {
                        bandera = false
                        simulateClick(document.getElementById('alert5'))
                        document.getElementById(elemento[i].name).focus();
                        break;
                    }
                    else {
                        bandera = true
                    }
                }
                else {
                    bandera = true
                    // }
                }
            }
            return bandera
        }

        function valor_select(nombre_select) {
            var opcion = 0
            var elemento = 0
            opcion = document.getElementById(nombre_select).options;
            indexSeleccionado = document.getElementById(nombre_select).selectedIndex;
            return indexSeleccionado;
        }


        function recorreElementos(div, tipoElemento) {
            var elemento = document.getElementById(div).getElementsByTagName(tipoElemento);
            var bandera = false
            for (var i = 0; i < elemento.length; i++) {
                if (elemento[i].type != "hidden") {
                    if (elemento[i].type == "text" || elemento[i].type == "date") {
                        if (elemento[i].name == "domicilio" || elemento[i].name == "colonia" || elemento[i].name == "bloque") {

                        }
                        else {
                            if (!validar2(elemento[i].name)) {
                                bandera = false
                                break;
                            }
                            else {
                                bandera = true
                            }
                        }

                    }
                }
            }
            return bandera
        }

        function prueba() {
            cr = document.sucursales.cr.value;
            zonap = document.sucursales.selectzonaprecio.value;
            bloque = document.sucursales.bloque.value;
            territorial = document.sucursales.selectterritorial.value;
            sucursal = document.sucursales.sucursal.value;
            alcancet = document.sucursales.alcancet.value;
            inicio = document.sucursales.inicio.value;
            fin = document.sucursales.fin.value;
            domicilio = document.sucursales.domicilio.value;
            colonia = document.sucursales.colonia.value;
            m2 = document.sucursales.m2.value;
            regional = document.sucursales.regional.value;
            ciudad = document.sucursales.ciudad.value;
            estado = document.sucursales.selectestado.value;
            zonat = document.sucursales.zonat.value;





            $.ajax({
                type: "GET",
                url: "insertasuc.asp?cr=" + cr + "&zonap=" + zonap + "&bloque=" + bloque + "&territorial=" + territorial + "&sucursal=" + sucursal + "&alcancet=" + alcancet + "&inicio=" + inicio + "&fin=" + fin + "&domicilio=" + domicilio + "&colonia=" + colonia + "&m2=" + m2 + "&regional=" + regional + "&ciudad=" + ciudad + "&estado=" + estado + "&zonat=" + zonat,
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
<form  name="sucursales" method="post" action="regiones2.asp"> 
<div class="datagrid" id="tabla_cr">
    <table  align='center' cellpadding='0' class='display' id='example2'>
        <thead>
            <tr>
                <th colspan ="4" align="center">Ingresa los datos</th>
            </tr>
        </thead>
        <tbody>
        <tr>
            <td> CR * </td>
            <td><input type="text" id="cr" name="cr" onkeypress="return soloNumeros(event)" maxlength="4" placeholder="ej. 0003" /></td>
            <td> Sucursal * </td><td><input type="text" id="sucursal" name="sucursal" /></td>
        </tr>
        <tr>
            <td> Zona Precio * </td>
            <td>
               <%=cargaZonaprecio(0)%>
            </td>
            <td> Bloque </td>
            <td><input type="text" name="bloque" id="bloque" /></td>
        </tr>
        <tr>
            <td> Territorial * </td>
     <td>
         <%=cargaTerritoriales(0)%>
     </td>
            <td> Alcance Tipo * </td>
            <td><input type="text" name="alcancet" id="alcancet" /></td>
         </tr>
         <tr>
            <td> Inicio Proyecto * </td>
            <td><input type="date" name="inicio" id="inicio" /></td>
            <td> Fin Proyecto * </td>
            <td><input type="date" name="fin" id="fin" /></td>
        </tr>
     <tr>
          <td> Domicilio </td><td><input type="text" name="domicilio" id="domicilio" /></td>
          <td> Colonia </td><td><input type="text" name="colonia" id="colonia"/></td>    
    </tr>
     <tr>
          <td> M2 Construidos </td><td><input type="text" name="m2" id="m2" /></td>
          <td> Regional * </td><td><input type="text" name="regional" id ="regional"/></td>
    
     </tr>
     <tr>
          <td> Ciudad * </td><td><input type="text" name="ciudad" id="ciudad" /></td>
        <td> Estado * </td><td>
        <%=cargaEstado(0)%>
          </td>
         </tr>
         <tr>
          <td> Zona Territorial * </td><td>
             <select id="zonat" name="zonat">
                <option value="0">--SELECCION--</option>
                <option>1</option>
                <option>2</option>
                </select></td>
            <td></td>
       </tr>
  </tbody>
 </table>

    <br />
    <br />

   <h2>Los campos identificados con * son obligatorios</h2> 

</div>
 
 </form>
     
     <center>
       <!-- <input  type="button" value="Ingresar Sucursal" onclick="prueba()" name="btnEnviar" />-->
       <input  type="button" value="Ingresar Sucursal" onclick="validaFormulario('tabla_cr')" name="btnEnviar" />
         <br />
         <br />
      <input type="button" value="Ir a Editar Sucursal" onclick="location.href = 'editasucursal.asp'"/>
       </center> 

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
	alertify.alert("El <strong>CR</strong> se inserto exitosamente");
    alertify.success("El <strong>CR</strong> se inserto exitosamente");
	return false;
  });	
     $("#alert4").on( 'click', function () {
	reset();
	alertify.alert("No se que paso");
	return false;
  });		
    $("#alert5").on( 'click', function () {
	reset();
	alertify.alert("Todos los campos con * son obligatorios");
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