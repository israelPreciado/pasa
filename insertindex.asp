<!-- insertindex.asp -->
<html>
<head>
	<title>Cargar Base</title>
      <link rel="stylesheet" href="css/tabla.css">
     <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
     <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />





	<style>
		body, input { font-family:verdana,arial; font-size:10pt; }
            input[type="submit"],  input[type="button"]{
 
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

    <form name="archivo" method="POST" enctype="multipart/form-data" action="Insert.asp">
    <div class="datagrid">
	<table align="center">	
	<thead>
    <tr>
	  <th>Fichero :</th>
        <th>
		  <input type="file" name="file" value="Examinar" accept=".csv" size="40">           
        </th>
    </tr>
        </thead> 
        <tr>
    <th><input type="submit" value="Cargar Archivo"></th></tr>

	</table>
        <br />
      
    <table align="center">
        <thead>
            <tr>
               <th colspan="10"> Layout de archivo de carga </th>
            </tr>
            <tr>
             <th>CVE SAP</th>
             <th>MATERIAL</th>
             <th>CANTIDAD</th>
             <th>COMENTARIO</th>
             <th>TIEMPO</th>
             <th>FECHA</th>
             <th>CR</th>
             <th>ID COMPONENTE</th>
             <th>ID PEDIDO</th>
            </tr>
        </thead>
    </table>
       <br /><br />
        <a href="uploaded/plantilla.csv" download="plantilla.csv">Descargar Plantilla</a>


    </div>
    </form>
   
</body>
</html>