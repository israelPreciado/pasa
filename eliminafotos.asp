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
        function consultafotos() {
            cr = document.fotos.selectsucursalfot.value;
            zona = document.fotos.seleczona.value;
            $.ajax({
                type: "GET",
                url: "consultafotosprueba2.asp?cr=" + cr +"&zona=" + zona,
                dataType: "html",
                success: function (response) {
                    $("#myModal").html(response);
                }
            });

        }




        function elimina(id) {

            if (confirm('Estas seguro de eliminar la foto?')) {
              


                $.ajax({
                    type: "GET",
                    url: "deletefotos.asp?id=" + id,
                    dataType: "html",
                    success: function (response) {
                        if (response == "errE") {
                            simulateClick(document.getElementById('alert2'))
                        }
                        else {
                            if (response == "ok") {
                                simulateClick(document.getElementById('alert2'))
                            }
                            else {
                                simulateClick(document.getElementById('alert4'))
                            }
                        }
                    }
                });
                simulateClick(document.getElementById('alert2'))

            } else {
                
            }
     
            
            consultafotos()
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
#carrusel{float:left; width:95%; overflow:hidden; height:205px; position:relative; margin-top:50px;}
#carrusel .izquierda_flecha{position:absolute; left:3px; z-index:1; top:50%; margin-top:-9px;}
#carrusel .derecha_flecha{position:absolute; right:3px; z-index:1; top:50%; margin-top:-9px;}
.carrusel{width:4000px;left:0px; position:absolute; z-index:0}
.carrusel>div{
    float: left;
    height: 203px;
    margin-right: 5px;
    width: 195px;
	text-align:center;
}
.carrusel .img_carrusel{cursor:pointer;}

#content {
	float:left;
	width:600px;
	margin-bottom:40px;
	margin:0px auto;
}

.product {
	border:#CCCCCC 1px solid;
}

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
 $("#alert2").on( 'click', function () {
	reset();
	alertify.alert("La fotografia a sido eliminada");
    alertify.success("foto eliminada");
	return false;
	});	
</script>




             <%   
    Dim conexion, rsTabla  
     %>    
<form  id="fotos" name="fotos" method="post" action=""> 
     <div id="tabla1">
         <center>
  <div class="datagrid" id="tabla_cr">
     <div class="select">
          <table  align='center' cellpadding='0' class='display' id='Table1'>
        <thead>
            <tr>
                <th align="center">Seleccione la Sucursal</th>
            
                <th align="center">Zona</th>
            </tr>
        </thead>
        <tbody>
        <tr>
                <td>
                  <%=cargasfotosuc(0) %>
                </td>
                 <td>
                  <%=cargazona(0) %>
                </td>
            </tr>
            </tbody>
            </table>
         </div>   
       <input type="button" value="Buscar" onclick="consultafotos()" />
</div>
</center>
</div>

    <br />
      
 </form>

       <div id="myModal">
    </div>

<script src="jquery.js" type="text/javascript"></script>
<script>
    // jQuery.noConflict();
    var posicion = 0;
    var imagenes = new Array();
    $(document).ready(function () {
        //alert(jQuery('.texto').html());
        var numeroImatges = 6;
        if (numeroImatges <= 3) {
            $('.derecha_flecha').css('display', 'none');
            $('.izquierda_flecha').css('display', 'none');
        }

        $('.izquierda_flecha').live('click', function () {
            if (posicion > 0) {
                posicion = posicion - 1;
            } else {
                posicion = numeroImatges - 3;
            }
            $(".carrusel").animate({ "left": -($('#product_' + posicion).position().left) }, 600);
            return false;
        });

        $('.izquierda_flecha').hover(function () {
            $(this).css('opacity', '0.5');
        }, function () {
            $(this).css('opacity', '1');
        });

        $('.derecha_flecha').hover(function () {
            $(this).css('opacity', '0.5');
        }, function () {
            $(this).css('opacity', '1');
        });

        $('.derecha_flecha').live('click', function () {
            if (numeroImatges > posicion + 3) {
                posicion = posicion + 1;
            } else {
                posicion = 0;
            }
            $(".carrusel").animate({ "left": -($('#product_' + posicion).position().left) }, 600);
            return false;
        });

    });
</script>

     </form>

     
      
 </body>

</html>