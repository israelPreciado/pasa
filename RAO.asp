<!--#include file="funcion3/funcion.inc"-->
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="style.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css">
  <link href="https://cdn.datatables.net/fixedcolumns/3.2.6/css/fixedColumns.dataTables.min.css" rel="stylesheet" type="text/css">
  <link href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css">
  
  <style>

  th, td { 
    .td-limit { 
    max-width: 70px; 
    text-overflow: ellipsis; 
    white-space: nowrap; 
    overflow: hidden; 
    }  
  }
    div.dataTables_wrapper {
        width: 1500px;
      
    }


#encabezadoRojo{
  background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #991821), color-stop(1, #80141C) );
  background:-moz-linear-gradient( center top, #991821 5%, #80141C 100% );
  filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#991821', endColorstr='#80141C'); 
background-color:#991821; 
 color:#FFFFFF; 
 font-size: 10px; 
 font-weight: bold; 
 border-left: 1px solid #80141C; 
} 
#encabezadoGris{
  background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #7b7b7b), color-stop(1, #4f4e4e) );
  background:-moz-linear-gradient( center top, #7b7b7b 5%, #4f4e4e 100% );
  filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#7b7b7b', endColorstr='#4f4e4e'); 
background-color:#7b7b7b; 
 color:#FFFFFF; 
 font-size: 10px; 
 font-weight: bold; 
 border-left: 1px solid #4f4e4e; 
} 

#encabezadoAzul{
  background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #2f74b5), color-stop(1, #1b446b) );
  background:-moz-linear-gradient( center top, #2f74b5 5%, #1b446b 100% );
  filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#2f74b5', endColorstr='#1b446b'); 
background-color:#2f74b5; 
 color:#FFFFFF; 
 font-size: 10px; 
 font-weight: bold; 
 border-left: 1px solid #1b446b; 
} 
#encabezadoLila{
  background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #b3c6e7), color-stop(1, #758094) );
  background:-moz-linear-gradient( center top, #b3c6e7 5%, #758094 100% );
  filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#b3c6e7', endColorstr='#758094'); 
background-color:#b3c6e7; 
 color:#FFFFFF; 
 font-size: 10px; 
 font-weight: bold; 
 border-left: 1px solid #758094; 
} 
#encabezadoAmarillo{
  background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ffe699), color-stop(1, #b8a66d) );
  background:-moz-linear-gradient( center top, #ffe699 5%, #b8a66d 100% );
  filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffe699', endColorstr='#b8a66d'); 
background-color:#ffe699; 
 color:#FFFFFF; 
 font-size: 10px; 
 font-weight: bold; 
 border-left: 1px solid #b8a66d; 
} 
#encabezadoVerde{
  background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #a9d08f), color-stop(1, #708c5e) );
  background:-moz-linear-gradient( center top, #a9d08f 5%, #708c5e 100% );
  filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#a9d08f', endColorstr='#708c5e'); 
background-color:#a9d08f; 
 color:#FFFFFF; 
 font-size: 10px; 
 font-weight: bold; 
 border-left: 1px solid #708c5e; 
}
#encabezadoBlanco{
  background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f8f3f3), color-stop(1, #dcdcdc) );
  background:-moz-linear-gradient( center top, #f8f3f3 5%, #dcdcdc 100% );
  filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f8f3f3', endColorstr='#dcdcdc'); 
background-color:#f8f3f3; 
 color:#727272; 
 font-size: 10px; 
 font-weight: bold; 
 border-left: 1px solid #dcdcdc; 
}
#celdaEnTiempo{
  background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #87df4e), color-stop(1, #6db53f) );
  background:-moz-linear-gradient( center top, #87df4e 5%, #6db53f 100% );
  filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#87df4e', endColorstr='#6db53f'); 
background-color:#87df4e; 
 color:#FFFFFF; 
 font-size: 10px; 
 font-weight: bold; 
 border-left: 1px solid #6db53f; 
} 
#celdaFueraTiempo{
  background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #2c6d03), color-stop(1, #163403) );
  background:-moz-linear-gradient( center top, #2c6d03 5%, #163403 100% );
  filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#87df4e', endColorstr='#163403'); 
background-color:#2c6d03; 
 color:#FFFFFF; 
 font-size: 10px; 
 font-weight: bold; 
 border-left: 1px solid #163403; 
} 
#celdaReprog{
  background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f2d920), color-stop(1, #b19f18) );
  background:-moz-linear-gradient( center top, #f2d920 5%, #b19f18 100% );
  filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#87df4e', endColorstr='#b19f18'); 
background-color:#f2d920; 
 color:#FFFFFF; 
 font-size: 10px; 
 font-weight: bold; 
 border-left: 1px solid #b19f18; 
} 
#celdaVencido{
  background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #e61729), color-stop(1, #a81623) );
  background:-moz-linear-gradient( center top, #e61729 5%, #a81623 100% );
  filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#87df4e', endColorstr='#a81623'); 
background-color:#e61729; 
 color:#FFFFFF; 
 font-size: 10px; 
 font-weight: bold; 
 border-left: 1px solid #a81623; 
} 
</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/fixedcolumns/3.2.6/js/dataTables.fixedColumns.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>

<script type="text/javascript" src="js/jsplug.js"></script>

<script>
//funcion para poner estilo a la tabla principal
$(document).ready(function() {
  $('#example1' ).DataTable( {
     dom:            "Bfrtip",
        scrollY:        true,
     scrollX:        true,
        scrollCollapse: true,
        paging:         true,
        "lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
       "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Spanish.json"
        },
        buttons:        [ {text:'Mostrar / Ocultar Columnas',extend:'colvis'} ],
        fixedColumns:   {
            leftColumns: 7  ,
            rightColumns: 0
        },
       
    } );
 
} );
</script>

</head>
<body>
<form name="frm_revisarAvance" id="frm_revisarAvance" method="post" enctype="multipart/form-data">
  <div class="animated zoomIn" align="center" >
    <table width="95%" align="center">
      <tr>
        <td>
          <div class="datagrid">
            <table cellpadding="0" cellspacing="0" class="stripe row-border order-column" style="width:100%" id="example1">
              <thead>
              <tr>
                  <th id="encabezadoRojo" rowspan="2">&nbsp;</th>
                  <th id="encabezadoRojo" rowspan="2">CR</th>
                  <th id="encabezadoRojo" rowspan="2">ZONA</th>
                  <th id="encabezadoRojo" rowspan="2">TERRITORIO</th>
                  <th id="encabezadoRojo" rowspan="2">SUPERV</th>
                  <th id="encabezadoRojo" rowspan="2">SUCURSAL</th>
                  <th id="encabezadoRojo" rowspan="2">CONTRAT</th>
                  <th id="encabezadoRojo" rowspan="2">FECHA INI</th>
                  <th id="encabezadoRojo" rowspan="2">FECHA FIN</th>
                  <th id="encabezadoRojo" rowspan="2">FECHA REPROG</th>
                  <th id="encabezadoGris" colspan="3" >AVANCE GENERAL</th>
                  <th id="encabezadoAzul" colspan="3">OBRA CIVIL</th>
                  <th id="encabezadoAzul">OBRA CIVIL</th>
                  <th id="encabezadoLila">SISTEMAS</th>
                  <th id="encabezadoAmarillo">SEGURIDAD</th>
                  <th id="encabezadoBlanco">GENERAL</th>
                  <th id="encabezadoLila" colspan="8">SISTEMAS</th>
                  <th id="encabezadoAmarillo" colspan="4">SEGURIDAD</th>
                  <th id="encabezadoVerde" colspan="6">INSUMOS</th>               
                </tr>
                <tr>
                  <th id="encabezadoGris">PROG</th>
                  <th id="encabezadoGris">REAL</th>
                  <th id="encabezadoGris">DESVIACION</th>
                  <th id="encabezadoAzul">PROG</th>
                  <th id="encabezadoAzul">REAL</th>
                  <th id="encabezadoAzul">DESVIACION</th>
                  <th id="encabezadoAzul">ESTATUS</th>
                  <th id="encabezadoLila">ESTATUS</th>
                  <th id="encabezadoAmarillo">ESTATUS</th>
                  <th id="encabezadoBlanco">ESTATUS</th>
                  <th id="encabezadoLila" >SOLICITUD DE ENLACES DE TELMEX</th>
                  <th id="encabezadoLila">PRIMERA VISITA DE TELMEX</th>
                  <th id="encabezadoLila">ENVIO EVIDENCIAS DE LOBBY PARA ATMS</th>
                  <th id="encabezadoLila">TERMINACION DE COMUNICACIONES</th>
                  <th id="encabezadoLila">ENVIO DE EVIDENCIAS TELMEX</th>
                  <th id="encabezadoLila">ACTIVACION DE ENLACES</th>
                  <th id="encabezadoLila">RECEPCION DE ATMS</th>
                  <th id="encabezadoLila">CONFIG ATMS</th>
                  <th id="encabezadoAmarillo">RECEPCION DE BLINDADOS</th>
                  <th id="encabezadoAmarillo">TERMINACION DE CANALIZACIONES</th>
                  <th id="encabezadoAmarillo">TERMINACION DE CABLEADO YISP</th>
                  <th id="encabezadoAmarillo">ENLACES Y PRUEBAS</th>
                  <th id="encabezadoVerde">EQIPOS AIRE ACOND</th>
                  <th id="encabezadoVerde">UPS</th>
                  <th id="encabezadoVerde">ACONDICIONADOR ENERGIA</th>  
                  <th id="encabezadoVerde">INSTALACION VINILES</th>
                  <th id="encabezadoVerde">INSTALACION PANELES</th>
                  <th id="encabezadoVerde">SE&NTILDE;ALIZACION EXTERIOR</th>                   
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>            
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>
                  <th>&nbsp;</th>

                </tr>
              </tfoot>

              <tbody>
              <%=cargaLobbysRAO%>
              <!--
                <tr>
                 <td><font size="+2"><span class="icon-search"></span></font></td>
                  <td>Tiger</td>
                  <td>zona 1</td>
                  <td>System Architect</td>
                  <td>Edinburgh</td>
                  <td>61</td>
                  <td>2011/04/25</td>
                  <td>$320,800</td>
                  <td>5421</td>
                  <td>t.nixon@datatables.net</td>
                  <td id="celdaFueraTiempo">5421</td>
                  <td id="celdaEnTiempo">Tiger</td>
                  <td id="celdaVencido">Nixon</td>
                  <td>System Architect</td>
                  <td id="celdaEnTiempo">Edinburgh</td>
                  <td id="celdaFueraTiempo" >61</td>
                  <td id="celdaReprog">2011/04/25</td>
                  <td>System Architect</td>
                  <td id="celdaEnTiempo">Edinburgh</td>
                  <td id="celdaFueraTiempo" >61</td>
                  <td id="celdaReprog">2011/04/25</td>
                  <td>$320,800</td>
                  <td id="celdaEnTiempo">5421</td>
                  <td id="celdaEnTiempo">t.nixon@datatables.net</td>
                  <td id="celdaReprog">5421</td>
                  <td id="celdaVencido">Tiger</td>
                  <td>Nixon</td>
                  <td id="celdaFueraTiempo">System Architect</td>
                  <td id="celdaVencido">Edinburgh</td>
                  <td>61</td>
                  <td id="celdaFueraTiempo">2011/04/25</td>
                  <td id="celdaEnTiempo">$320,800</td>
                  <td id="celdaReprog">5421</td>
                  <td id="celdaVencido">t.nixon@datatables.net</td>
                  <td id="celdaReprog">5421</td>
                  <td id="celdaFueraTiempo">System Architect</td>
                  <td>5421</td>
                  <td>System Architect</td>

                </tr>
                <tr>
                 <td><font size="+2"><span class="icon-search"></span></font></td>
                  <td>TigerDDDD</td>
                  <td>zona 2</td>
                  <td>System Architect</td>
                  <td>Edinburgh</td>
                  <td>61</td>
                  <td>2011/04/25</td>
                  <td>$320,800</td>
                  <td>5421</td>
                  <td>t.nixon@datatables.net</td>
                  <td id="celdaVencido">5421</td>
                  <td>Tdiger</td>
                  <td id="celdaEnTiempo">Nixon</td>
                  <td id="celdaEnTiempo">System Architect</td>
                  <td id="celdaFueraTiempo">Edinburgh</td>
                  <td id="celdaReprog">61</td>
                  <td id="celdaVencido">2011/04/25</td>
                  <td id="celdaVencido">$320,800</td>
                  <td id="celdaFueraTiempo">5421</td>
                  <td>System Architect</td>
                  <td id="celdaEnTiempo">Edinburgh</td>
                  <td id="celdaFueraTiempo" >61</td>
                  <td id="celdaReprog">2011/04/25</td>
                  <td id="celdaEnTiempo">t.nixon@datatables.net</td>
                  <td id="celdaFueraTiempo">5421</td>
                  <td >Tiger</td>
                  <td id="celdaEnTiempo">Nixon</td>
                  <td id="celdaVencido">System Architect</td>
                  <td id="celdaReprog">Edinburgh</td>
                  <td id="celdaReprog">61</td>
                  <td id="celdaEnTiempo">2011/04/25</td>
                  <td id="celdaFueraTiempo">$320,800</td>
                  <td id="celdaEnTiempo">5421</td>
                  <td>t.nixon@datatables.net</td>
                  <td id="celdaFueraTiempo">5421</td>
                  <td id="celdaEnTiempo">System Architect</td>
                  <td>5421</td>
                  <td id="celdaVencido">System Architect</td>

                </tr>
                <tr>
                 <td><font size="+2"><span class="icon-search"></span></font></td>
                  <td>Tiger</td>
                  <td>zona 1</td>
                  <td>System Architect</td>
                  <td>Edinburgh</td>
                  <td>61</td>
                  <td>2011/04/25</td>
                  <td>$320,800</td>
                  <td>5421</td>
                  <td>t.nixon@datatables.net</td>
                  <td id="celdaVencido">5421</td>
                  <td>Tdiger</td>
                  <td id="celdaEnTiempo">Nixon</td>
                  <td id="celdaEnTiempo">System Architect</td>
                  <td id="celdaFueraTiempo">Edinburgh</td>
                  <td id="celdaReprog">61</td>
                  <td id="celdaVencido">2011/04/25</td>
                  <td>System Architect</td>
                  <td id="celdaEnTiempo">Edinburgh</td>
                  <td id="celdaFueraTiempo" >61</td>
                  <td id="celdaReprog">2011/04/25</td>
                  <td id="celdaVencido">$320,800</td>
                  <td id="celdaFueraTiempo">5421</td>
                  <td id="celdaEnTiempo">t.nixon@datatables.net</td>
                  <td id="celdaFueraTiempo">5421</td>
                  <td >Tiger</td>
                  <td id="celdaEnTiempo">Nixon</td>
                  <td id="celdaVencido">System Architect</td>
                  <td id="celdaReprog">Edinburgh</td>
                  <td id="celdaReprog">61</td>
                  <td id="celdaEnTiempo">2011/04/25</td>
                  <td id="celdaFueraTiempo">$320,800</td>
                  <td id="celdaEnTiempo">5421</td>
                  <td>t.nixon@datatables.net</td>
                  <td id="celdaFueraTiempo">5421</td>
                  <td id="celdaEnTiempo">System Architect</td>
                  <td>5421</td>
                  <td id="celdaVencido">System Architect</td>

                </tr>
-->
              </tbody>
                              
            </table>
          </div>
        </td>
      </tr>
    <table>
    <br/>
    <!--
    <table width="40%" align="center">
      <tr>
        <td width="10%">&nbsp;</td>
        <td width="20%"><input  type="button" value="Regresar" onclick="regresar()" name="btnEnviar" /></td>
        <td width="10%">&nbsp;</td>
      </tr>
    </table>-->
    <br/>
  </div>
</form>
</body>
</html>
