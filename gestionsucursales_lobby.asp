<!--#include file="funcion3/funcioncolin.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

    <link rel="stylesheet" href="css/tabla.css">
     <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
     <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
     <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />

    

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
      <br />
         <br />
    <div class="datagrid" id="tabla_cr">
<center>
       <input type="button" value="Insertar Sucursal" onclick="location.href = 'ingresasuc_lobby.asp'"/>
         <br />
         <br />
      <input type="button" value="Editar Sucursal" onclick="location.href = 'editasucursal_lobby.asp'"/>
       </center> 
        </div>
 
 </form>
     

 </body>
</html>