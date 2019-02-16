<!--#include file="funcion3/funcion.inc"-->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	
    <title>Map with a legend for areas</title>
	<link href="css3/bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css4/styleMenuSwipeable.css" type="text/css" media="screen" charset="utf-8">
<link rel="stylesheet" href="css3/animate.css">
  <link href="css3/login2.css" rel="stylesheet" type="text/css">

    <style type="text/css">
	#div1 {
     overflow:scroll;
     height:100%;
     width:50%;
	 align:center;
}

	
	.datagrid table { 
	border-collapse: collapse; 
	text-align: left; width: 95%; 
	} 
	.datagrid {
	font: normal 12px/100% Arial,
	Helvetica, sans-serif; background: #fff;
	/*
	border: 1px solid #991821; 
	*/
	-webkit-border-radius: 3px; 
	-moz-border-radius: 3px; 
	border-radius: 3px; }
	.datagrid table td, .datagrid table th { 
	padding: 3px 10px; 
	}
	.datagrid table thead th {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #991821), color-stop(1, #80141C) );
	background:-moz-linear-gradient( center top, #991821 5%, #80141C 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#991821', endColorstr='#80141C');
	background-color:#991821; 
	color:#FFFFFF; 
	font-size: 12px; 
	font-weight: bold; 
	border-left: 1px solid #B01C26; 
	} 
	.datagrid table thead th:first-child { 
	border: none; 
	}
	.datagrid table tbody td { 
	color: #80141C; 
	border-left: 1px solid #F7CDCD;
	font-size: 12px;
	font-weight: normal; 
	}
	.datagrid table tbody .alt td {
	background: #F7CDCD; 
	color: #80141C; 
	}
	.datagrid table tbody td:first-child { 
	border-left: none; 
	}
	.datagrid table tbody tr:last-child td {
	border-bottom: none; 
	}
	.datagrid table tfoot td div { 
	border-top: 1px solid #991821;
	background: #F7CDCD;} 
	.datagrid table tfoot td {
	padding: 0; font-size: 12px 
	} 
	.datagrid table tfoot td div{ 
	padding: 2px; 
	}
	.datagrid table tfoot td ul { 
	margin: 0; padding:0; list-style: none; text-align: right; 
	}
	.datagrid table tfoot  li {
	display: inline; 
	}
	.datagrid table tfoot li a {
	text-decoration: none;
	display: inline-block;  
	padding: 2px 8px;
	margin: 1px;color: #FFFFFF;
	border: 1px solid #991821;
	-webkit-border-radius: 3px; 
	-moz-border-radius: 3px; 
	border-radius: 3px; 
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #991821), color-stop(1, #80141C) );
	background:-moz-linear-gradient( center top, #991821 5%, #80141C 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#991821', endColorstr='#80141C');
	background-color:#991821; }
	.datagrid table tfoot ul.active, .datagrid table tfoot ul a:hover {
	text-decoration: none;border-color: #80141C;
	color: #FFFFFF;
	background: none;
	background-color:#991821;
	}
	div.dhtmlx_window_active, div.dhx_modal_cover_dv {
	position: fixed !important; 
	}
}

        body {
            color: #5d5d5d;
            font-family: Helvetica, Arial, sans-serif;
        }

        h1 {
            font-size: 18px;
            margin: auto;
        }

        .container2 {
            max-width: 50%;

        }

        /* Specific mapael css class are below
         * 'mapael' class is added by plugin
        */

        .mapael .map {
            position: relative;
        }

        .mapael .mapTooltip {
            position: absolute;
            background-color: #fff;
            moz-opacity: 0.85;
            opacity: 0.85;
            filter: alpha(opacity=85);
            border-radius: 10px;
            padding: 10px;
            z-index: 1000;
            max-width: 200px;
            display: none;
            color: #343434;
        }
    </style>
	

		<style>
		/* estilo Grafica
        */
	canvas{
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
	</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
	<script src="utils.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js" charset="utf-8"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js"
            charset="utf-8"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.2.0/raphael-min.js" charset="utf-8"></script>
    <script src="jsMapa/jquery.mapael.js" charset="utf-8"></script>
    <script src="jsMapa/maps/france_departments.js" charset="utf-8"></script>
    <script src="jsMapa/maps/world_countries.js" charset="utf-8"></script>
    <script src="jsMapa/maps/usa_states.js" charset="utf-8"></script>


    <script type="text/javascript">
        $(function () {
            $(".mapcontainer").mapael({
                map: {
                    name: "usa_states",
                    defaultArea: {
                        attrs: {
                            stroke: "#fff",
                            "stroke-width": 1
                        },
                        attrsHover: {
                            "stroke-width": 2
                        }
                    }
                },
                legend: {
                    area: {
                        title: "Distribucion de Obras",
                        slices: [
                            {
                                max: 10,
                                attrs: {
                                    fill: "#ee2f36"
                                },
                                label: "NOROESTE"
                            },
                            {
                                min: 31,
                                max: 40,
                                attrs: {
                                    fill: "#e71a71"
                                },
                                label: "OCCIDENTE"
                            }
							,
                            {
                                min: 21,
                                max: 30,
                                attrs: {
                                    fill: "#e79e8c"
                                },
                                label: "CENTRO"
                            },
							{
                                min: 11,
                                max: 20,
                                attrs: {
                                    fill: "#b4212c"
                                },
                                label: "NORTE"
                            }
                        ]
                    }
                },
                areas: {
                    "SONORA": {
                        value: "3",
                        href: "#",
                        tooltip: {content: "<span style=\"font-weight:bold;\">NOROESTE</span><br /><p>Por Iniciar : <%=numeroSucTerrRegional_EstatusZona("NOROESTE", 0,0,1,session.contents("zonaDirector"))%></p><p>En Proceso : <%=numeroSucTerrRegional_EstatusZona("NOROESTE", 1,2,1,session.contents("zonaDirector"))%></p><p>Terminadas : <%=numeroSucTerrRegional_EstatusZona("NOROESTE", 3,3,1,session.contents("zonaDirector"))%></p><p>Entregadas : 0</p>"}
                    },
					 "BCN": {
                        value: "3",
                        href: "#",
                        tooltip: {content: "<span style=\"font-weight:bold;\">NOROESTE</span><br /><p>Por Iniciar : <%=numeroSucTerrRegional_EstatusZona("NOROESTE", 0,0,1,session.contents("zonaDirector"))%></p><p>En Proceso : <%=numeroSucTerrRegional_EstatusZona("NOROESTE", 1,2,1,session.contents("zonaDirector"))%></p><p>Terminadas : <%=numeroSucTerrRegional_EstatusZona("NOROESTE", 3,3,1,session.contents("zonaDirector"))%></p><p>Entregadas : 0</p>"}
                    },
					"BCS": {
                        value: "3",
                        href: "#",
                        tooltip: {content: "<span style=\"font-weight:bold;\">NOROESTE</span><br /><p>Por Iniciar : <%=numeroSucTerrRegional_EstatusZona("NOROESTE", 0,0,1,session.contents("zonaDirector"))%></p><p>En Proceso : <%=numeroSucTerrRegional_EstatusZona("NOROESTE", 1,2,1,session.contents("zonaDirector"))%></p><p>Terminadas : <%=numeroSucTerrRegional_EstatusZona("NOROESTE", 3,3,1,session.contents("zonaDirector"))%></p><p>Entregadas : 0</p>"}
                    },
					"CHIHUAHUA": {
                        value: "3",
                        href: "#",
                        tooltip: {content: "<span style=\"font-weight:bold;\">NOROESTE</span><br /><p>Por Iniciar : <%=numeroSucTerrRegional_EstatusZona("NOROESTE", 0,0,1,session.contents("zonaDirector"))%></p><p>En Proceso : <%=numeroSucTerrRegional_EstatusZona("NOROESTE", 1,2,1,session.contents("zonaDirector"))%></p><p>Terminadas : <%=numeroSucTerrRegional_EstatusZona("NOROESTE", 3,3,1,session.contents("zonaDirector"))%></p><p>Entregadas : 0</p>"}
                    },
					"SINALOA": {
                        value: "3",
                        href: "#",
                        tooltip: {content: "<span style=\"font-weight:bold;\">NOROESTE</span><br /><p>Por Iniciar : <%=numeroSucTerrRegional_EstatusZona("NOROESTE", 0,0,1,session.contents("zonaDirector"))%></p><p>En Proceso : <%=numeroSucTerrRegional_EstatusZona("NOROESTE", 1,2,1,session.contents("zonaDirector"))%></p><p>Terminadas : <%=numeroSucTerrRegional_EstatusZona("NOROESTE", 3,3,1,session.contents("zonaDirector"))%></p><p>Entregadas : 0</p>"}
                    },
					"COAHUILA": {
                        value: "13",
                        href: "#",
                        tooltip: {content: "<span style=\"font-weight:bold;\">NORTE</span><br /><p>Por Iniciar : <%=numeroSucTerrRegional_EstatusZona("NORTE", 0,0,1,session.contents("zonaDirector"))%></p><p>En Proceso : <%=numeroSucTerrRegional_EstatusZona("NORTE", 1,2,1,session.contents("zonaDirector"))%></p><p>Terminadas : <%=numeroSucTerrRegional_EstatusZona("NORTE", 3,3,1,session.contents("zonaDirector"))%></p><p>Entregadas : 0</p>"}
                    },
					"DURANGO": {
                        value: "13",
                        href: "#",
                        tooltip: {content: "<span style=\"font-weight:bold;\">NORTE</span><br /><p>Por Iniciar :<%=numeroSucTerrRegional_EstatusZona("NORTE", 0,0,1,session.contents("zonaDirector"))%></p><p>En Proceso : <%=numeroSucTerrRegional_EstatusZona("NORTE", 1,2,1,session.contents("zonaDirector"))%></p><p>Terminadas : <%=numeroSucTerrRegional_EstatusZona("NORTE", 3,3,1,session.contents("zonaDirector"))%></p><p>Entregadas : 0</p>"}
                    },
					"NUEVOLEON": {
                        value: "13",
                        href: "#",
                        tooltip: {content: "<span style=\"font-weight:bold;\">NORTE</span><br /><p>Por Iniciar :<%=numeroSucTerrRegional_EstatusZona("NORTE", 0,0,1,session.contents("zonaDirector"))%></p><p>En Proceso : <%=numeroSucTerrRegional_EstatusZona("NORTE", 1,2,1,session.contents("zonaDirector"))%></p><p>Terminadas : <%=numeroSucTerrRegional_EstatusZona("NORTE", 3,3,1,session.contents("zonaDirector"))%></p><p>Entregadas : 0</p>"}
                    },
					"TAMAULIPAS": {
                        value: "13",
                        href: "#",
                        tooltip: {content: "<span style=\"font-weight:bold;\">NORTE</span><br /><p>Por Iniciar :<%=numeroSucTerrRegional_EstatusZona("NORTE", 0,0,1,session.contents("zonaDirector"))%></p><p>En Proceso : <%=numeroSucTerrRegional_EstatusZona("NORTE", 1,2,1,session.contents("zonaDirector"))%></p><p>Terminadas : <%=numeroSucTerrRegional_EstatusZona("NORTE", 3,3,1,session.contents("zonaDirector"))%></p><p>Entregadas : 0</p>"}
                    },
					
					"AGUASCALIENTES": {
                        value: "23",
                        href: "#",
                        tooltip: {content: "<span style=\"font-weight:bold;\">CENTRO</span><br /><p>Por Iniciar :<%=numeroSucTerrRegional_EstatusZona("CENTRO", 0,0,1,session.contents("zonaDirector"))%></p><p>En Proceso : <%=numeroSucTerrRegional_EstatusZona("CENTRO", 1,2,1,session.contents("zonaDirector"))%></p><p>Terminadas : <%=numeroSucTerrRegional_EstatusZona("CENTRO", 3,3,1,session.contents("zonaDirector"))%></p><p>Entregadas : 0</p>"}
                    },
					"SANLUISPOTOSI": {
                        value: "23",
                        href: "#",
                        tooltip: {content: "<span style=\"font-weight:bold;\">CENTRO</span><br /><p>Por Iniciar :<%=numeroSucTerrRegional_EstatusZona("CENTRO", 0,0,1,session.contents("zonaDirector"))%></p><p>En Proceso : <%=numeroSucTerrRegional_EstatusZona("CENTRO", 1,2,1,session.contents("zonaDirector"))%></p><p>Terminadas : <%=numeroSucTerrRegional_EstatusZona("CENTRO", 3,3,1,session.contents("zonaDirector"))%></p><p>Entregadas : 0</p>"}
                    },
					"ZACATECAS": {
                        value: "23",
                        href: "#",
                        tooltip: {content: "<span style=\"font-weight:bold;\">CENTRO</span><br /><p>Por Iniciar :<%=numeroSucTerrRegional_EstatusZona("CENTRO", 0,0,1,session.contents("zonaDirector"))%></p><p>En Proceso : <%=numeroSucTerrRegional_EstatusZona("CENTRO", 1,2,1,session.contents("zonaDirector"))%></p><p>Terminadas : <%=numeroSucTerrRegional_EstatusZona("CENTRO", 3,3,1,session.contents("zonaDirector"))%></p><p>Entregadas : 0</p>"}
                    },

					"QUERETARO": {
                        value: "23",
                        href: "#",
                        tooltip: {content: "<span style=\"font-weight:bold;\">CENTRO</span><br /><p>Por Iniciar :<%=numeroSucTerrRegional_EstatusZona("CENTRO", 0,0,1,session.contents("zonaDirector"))%></p><p>En Proceso : <%=numeroSucTerrRegional_EstatusZona("CENTRO", 1,2,1,session.contents("zonaDirector"))%></p><p>Terminadas : <%=numeroSucTerrRegional_EstatusZona("CENTRO", 3,3,1,session.contents("zonaDirector"))%></p><p>Entregadas : 0</p>"}
                    },

					"GUANAJUATO": {
                        value: "23",
                        href: "#",
                        tooltip: {content: "<span style=\"font-weight:bold;\">CENTRO</span><br /><p>Por Iniciar :<%=numeroSucTerrRegional_EstatusZona("CENTRO", 0,0,1,session.contents("zonaDirector"))%></p><p>En Proceso : <%=numeroSucTerrRegional_EstatusZona("CENTRO", 1,2,1,session.contents("zonaDirector"))%></p><p>Terminadas : <%=numeroSucTerrRegional_EstatusZona("CENTRO", 3,3,1,session.contents("zonaDirector"))%></p><p>Entregadas : 0</p>"}
                    },
					"COLIMA": {
                        value: "33",
                        href: "#",
                        tooltip: {content: "<span style=\"font-weight:bold;\">OCCIDENTE</span><br /><p>Por Iniciar :<%=numeroSucTerrRegional_EstatusZona("OCCIDENTE", 0,0,1,session.contents("zonaDirector"))%></p><p>En Proceso : <%=numeroSucTerrRegional_EstatusZona("OCCIDENTE", 1,2,1,session.contents("zonaDirector"))%></p><p>Terminadas : <%=numeroSucTerrRegional_EstatusZona("OCCIDENTE", 3,3,1,session.contents("zonaDirector"))%></p><p>Entregadas : 0</p>"}
                    },
					"JALISCO": {
                        value: "33",
                        href: "#",
                        tooltip: {content: "<span style=\"font-weight:bold;\">OCCIDENTE</span><br /><p>Por Iniciar :<%=numeroSucTerrRegional_EstatusZona("OCCIDENTE", 0,0,1,session.contents("zonaDirector"))%></p><p>En Proceso : <%=numeroSucTerrRegional_EstatusZona("OCCIDENTE", 1,2,1,session.contents("zonaDirector"))%></p><p>Terminadas : <%=numeroSucTerrRegional_EstatusZona("OCCIDENTE", 3,3,1,session.contents("zonaDirector"))%></p><p>Entregadas : 0</p>"}
                    },
					"MICHOACAN": {
                        value: "33",
                        href: "#",
                        tooltip: {content: "<span style=\"font-weight:bold;\">OCCIDENTE</span><br /><p>Por Iniciar :<%=numeroSucTerrRegional_EstatusZona("OCCIDENTE", 0,0,1,session.contents("zonaDirector"))%></p><p>En Proceso : <%=numeroSucTerrRegional_EstatusZona("OCCIDENTE", 1,2,1,session.contents("zonaDirector"))%></p><p>Terminadas : <%=numeroSucTerrRegional_EstatusZona("OCCIDENTE", 3,3,1,session.contents("zonaDirector"))%></p><p>Entregadas : 0</p>"}
                    },
					"NAYARIT": {
                        value: "33",
                        href: "#",
                        tooltip: {content: "<span style=\"font-weight:bold;\">OCCIDENTE</span><br /><p>Por Iniciar :<%=numeroSucTerrRegional_EstatusZona("OCCIDENTE", 0,0,1,session.contents("zonaDirector"))%></p><p>En Proceso : <%=numeroSucTerrRegional_EstatusZona("OCCIDENTE", 1,2,1,session.contents("zonaDirector"))%></p><p>Terminadas : <%=numeroSucTerrRegional_EstatusZona("OCCIDENTE", 3,3,1,session.contents("zonaDirector"))%></p><p>Entregadas : 0</p>"}
                    }
                }
            });
        });
    </script>

  <script src="js/bootstrap.min.js"></script>
 
	<script type="text/javascript" src="js/jsplug.js"></script>
  <script language="javascript">
    function buscarCR(){
	document.getElementById('frm_revisarAvance').action="modalTestBuscarCR_ConMenuSwip.asp"
	document.getElementById('frm_revisarAvance').submit()
	//cambiarClase2()	
}

function showDetalleAvance(territorial,query,estatusObra,entregada){
	//document.getElementById('loader').style.display="block"
	document.getElementById('estatusObra').value=estatusObra
	document.getElementById('query').value=query
	document.getElementById('territorial').value=territorial
	document.getElementById('pagina').value=1
	document.getElementById('entregada').value=entregada
	document.getElementById('frm_revisarAvance').action="modalTest_terr_regional_ConMenuSwip.asp"
	document.getElementById('frm_revisarAvance').submit()
	
}
function verDetalle(){
document.getElementById('zona_territorial').value=<%=session.contents("zonaDirector")%>
document.getElementById('frm_revisarAvance').action="moduloFinanciero_ConMenuSwip_paso0.asp"
document.getElementById('frm_revisarAvance').submit()
}
  </script>
<title>Documento sin título</title>

</head>
<%
session("pagina")="1"
if isempty(session("xmd")) then
response.Redirect("default.asp?logout=true")
end if
eneP="0"
febP="0"
marP="0"
abrP="0"
mayP="0"
junP="0"
julP="0"
agoP="0"
sepP="0"
octP="0"
novP="0"
dicP="0"
eneR="0"
febR="0"
marR="0"
abrR="0"
mayR="0"
junR="0"
julR="0"
agoR="0"
sepR="0"
octR="0"
novR="0"
dicR="0"

%>
<body> 

<form name="frm_revisarAvance" id="frm_revisarAvance" method="get">
<input type="hidden" name="estatusObra" id="estatusObra" value="<%=estatusObra%>"/>
<input type="hidden" id="query" name="query"/>
<input type="hidden" name="territorial" id="territorial"/>
<input type="hidden" name="zona_territorial" id="zona_territorial"/>
<input type="hidden" name="pagina" id="pagina"/>
<input type="hidden" name="entregada" id="entregada"/>
<div class="container">
    <div id="sidebar">
        <ul>
            <li><a href="revisar_avanceGraficas_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Home</a></li>
            <li><a href="busqueda_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Buscar un CR</a></li>
            <li><a href="revisar_avance_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Avance General</a></li>
			<li><a href="controlAcciones_proyGral_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Proyecto General</a></li>
			<li><a href="modalTestPag1_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Informe Ejecutivo</a></li>
			<li><a href="modalTestPag5_ConMenuSwip.asp" target = "contenido" style="text-decoration:none">Informe General</a></li>
            <li><a href="controlAccionesTacticas_ConMenuSwip.asp">Acciones T&aacute;cticas</a></li>
        </ul>
    </div>
    <div class="main-content">
    <div class="swipe-area"></div>
    <a href="#" data-toggle=".container" id="sidebar-toggle">
		<span class="bar"></span>
        <span class="bar"></span>
        <span class="bar"></span>
    </a>
    <div class="content" >
<!--inicio Contenido-->
<table width="90%">
	<tr>
		<!--Inicio Titulo GENERAL-->
		<td>
			<fieldset>
				<legend>AVANCE GENERAL</legend>
			</fieldset>		
		</td>
		<!--Fin Titulo GENERAL-->
		<!--Inicio Titulo REGIONAL-->
		<td>
			<fieldset>
				<legend>AVANCE REGIONAL</legend>
			</fieldset>	
		</td>
		<!--Fin Titulo REGIONAL-->
	</tr>
	<tr>
		<!--Inicio GRAFICA-->
		<td ROWSPAN="2" width="50%">
			<div style="width:100%;height:300%;" align="center">
				<canvas id="canvas"></canvas>
			</div>
		</td>
		<!--Fin GRAFICA-->
		<!--Inicio Mapa-->
		<td align="center" style = "vertical-align: bottom">
			<div class="container2">
				<div class="mapcontainer">
					<div class="map">
						<span>No se cargo correctamente el mapa</span>
					</div>
				</div>
			</div>
		</td>
		<!--Fin Mapa-->
	</tr>
	<tr>
		<!--Inicio Tabla Mapa-->
		<td width="50%" valign="bottom">
			<div class="datagrid">
				<table width="80%" align="center">
					<thead>
						<tr>
							<th width="50%" colspan="2" style="border:hidden">TERRITORIAL</TH>
							<th width="10%" style="border:hidden">POR INI.</th>
							<th width="10%" style="border:hidden">EN PROC.</th>
							<th width="10%" style="border:hidden">TERM.</th>
							<th width="10%" style="border:hidden">ENTR.</th>
							<th width="10%" style="border:hidden">TOTAL</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th  style="text-align:center" colspan="2">TOTAL</th>  
							<th  style="text-align:center" onclick="showDetalleAvance('',2,'porIniciar',0)"><%=numeroSucTerrRegional_EstatusZona(territorial, 0,0,query,session.contents("zonaDirector"))%></th>
							<th  style="text-align:center" onclick="showDetalleAvance('',2,'enProceso',0)"><%=numeroSucTerrRegional_EstatusZona(territorial, 1,2,query,session.contents("zonaDirector"))%></th>
							<th  style="text-align:center" onclick="showDetalleAvance('',2,'terminadas',0)"><%=numeroSucTerrRegional_EstatusZona(territorial, 3,3,query,session.contents("zonaDirector"))%></th>
							<th  style="text-align:center" onclick="showDetalleAvance('',2,'terminadas',1)"><%=numeroSucTerrRegional_EstatusZonaEntregadas(territorial, 3,3,query,session.contents("zonaDirector"))%></th>
							<th  style="text-align:center" onclick="showDetalleAvance('',2,'autorizadas',0)"><%=numeroSucTerritorialZona(session.contents("zonaDirector"))%></th>
						</tr>
					</tfoot>
					<tbody>
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr


sql1="SELECT z.Territorial, CASE WHEN a.total IS NULL THEN 0 ELSE a.total END AS porIniciar, CASE WHEN b.total IS NULL THEN 0 ELSE b.total END AS enProceso, CASE WHEN c.total IS NULL THEN 0 ELSE c.total END AS terminadas, CASE WHEN d.total IS NULL THEN 0 ELSE d.total END AS entregadas, CASE WHEN a.total IS NULL THEN 0 ELSE a.total END + CASE WHEN b.total IS NULL THEN 0 ELSE b.total END + CASE WHEN c.total IS NULL THEN 0 ELSE c.total END AS total FROM( SELECT Territorial FROM cat_sucursales WHERE zona_territorial = " &  session.contents("zonaDirector") & " GROUP BY Territorial) z LEFT JOIN( SELECT b.Territorial, COUNT(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE a.EstatusObra = 0 AND b.territorial IS NOT NULL AND b.zona_territorial = " &  session.contents("zonaDirector") & " GROUP BY b.Territorial) a ON z.Territorial = a.Territorial LEFT JOIN( SELECT b.Territorial, COUNT(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE( a.EstatusObra = 1 OR a.EstatusObra = 2) AND b.territorial IS NOT NULL AND b.zona_territorial = " &  session.contents("zonaDirector") & " GROUP BY b.Territorial) b ON z.Territorial = b.Territorial LEFT JOIN( SELECT b.Territorial, COUNT(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE(a.EstatusObra = 3) AND b.territorial IS NOT NULL AND b.zona_territorial = " &  session.contents("zonaDirector") & " GROUP BY b.Territorial) c ON z.Territorial = c.Territorial LEFT JOIN( SELECT Territorial, count(*) AS total FROM( SELECT b.Territorial, a.cr FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE entregada = 1 AND b.territorial IS NOT NULL AND b.zona_territorial = " &  session.contents("zonaDirector") & ") a GROUP BY territorial) d ON z.Territorial = d.Territorial"
  
rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close
else
	while not (rs1.eof)
%>
						<tr>
							<td align="left" style="cursor:pointer;border:hidden"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'autorizadas',0)"><font size="+2"><span class="icon-search"></span></font></td><td align="left" ><font color="#000000"><%=rs1("territorial")%></font></td>
							<td  align="center" style="cursor:pointer;border:hidden"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'porIniciar',0)"><font color="#920000"><%=rs1("porIniciar")%></font></td>
							<td align="center" style="cursor:pointer;border:hidden"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'enProceso',0)"><font color="#920000"><%=rs1("enProceso")%></font></td>
							<td  align="center" style="cursor:pointer;border:hidden"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'terminadas',0)"><font color="#920000"><%=rs1("terminadas")%></font></td>
							<td  align="center" style="cursor:pointer;border:hidden"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'terminadas',1)"><font color="#920000"><%=rs1("entregadas")%><font></td>
							<td align="center" style="cursor:pointer;border:hidden"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'autorizadas',0)"><font color="#920000"><%=rs1("total")%></font></td>
						</tr>
<%
		rs1.movenext
	wend 
	rs1.close
	conn3.close 
	set rs1=nothing
	set conn3=nothing
end if 
%> 
					</tbody>
				</table>
			</div>
		</td>
		<!--Fin Tabla Mapa-->
	</tr>
	<tr>
		<!--Inicio Tabla GRAFICA-->
		<td ROWSPAN="2" width="50%">
			<div class="datagrid">
				<table width="100%">
					<thead>
						<tr>
							<th width="6.78%" style="border:hidden">T&eacute;rminos de Obra</TH>
							<th width="6.78%" style="border:hidden">ENE</th>
							<th width="6.78%" style="border:hidden">FEB</th>
							<th width="6.78%" style="border:hidden">MAR</th>
							<th width="6.78%" style="border:hidden">ABR</th>
							<th width="6.78%" style="border:hidden">MAY</th>
							<th width="6.78%" style="border:hidden">JUN</th>
							<th width="6.78%" style="border:hidden">JUL</th>
							<th width="6.78%" style="border:hidden">AGO</th>
							<th width="6.78%" style="border:hidden">SEP</th>
							<th width="6.78%" style="border:hidden">OCT</th>
							<th width="6.78%" style="border:hidden">NOV</th>
							<th width="6.78%" style="border:hidden">DIC</th>
							<th width="6.78%" style="border:hidden">TOTAL</th>
						</tr>
					</thead>
					<tbody>
<%
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
  sql1="SELECT * FROM( SELECT 'Programado' AS Terminos_obra, enero.total AS enero, febrero.total AS febrero, marzo.total AS marzo, abril.total AS abril, mayo.total AS mayo, junio.total AS junio, julio.total AS julio, agosto.total AS agosto, septiembre.total AS septiembre, octubre.total AS octubre, noviembre.total AS noviembre, diciembre.total AS diciembre, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total + octubre.total + noviembre.total + diciembre.total AS Total FROM( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-01-01' AND '2019-01-31' AND b.zona_territorial = " & session.contents("zonaDirector") & ") AS enero LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-02-01' AND '2019-02-28' AND b.zona_territorial = " &  session.contents("zonaDirector") & ") AS febrero ON enero.tem = febrero.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-03-01' AND '2019-03-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS marzo ON enero.tem = marzo.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-04-01' AND '2019-04-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS abril ON enero.tem = abril.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-05-01' AND '2019-05-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS mayo ON enero.tem = mayo.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-06-01' AND '2019-06-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS junio ON enero.tem = junio.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-07-01' AND '2019-07-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS julio ON enero.tem = julio.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-08-01' AND '2019-08-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS agosto ON enero.tem = agosto.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-09-01' AND '2019-09-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS septiembre ON enero.tem = septiembre.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-10-01' AND '2019-10-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS octubre ON enero.tem = octubre.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-11-01' AND '2019-12-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS noviembre ON enero.tem = noviembre.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-12-01' AND '2019-12-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS diciembre ON enero.tem = diciembre.tem) programado UNION( SELECT 'Real' AS Terminos_obra, enero.total AS enero, febrero.total AS febrero, marzo.total AS marzo, abril.total AS abril, mayo.total AS mayo, junio.total AS junio, julio.total AS julio, agosto.total AS agosto, septiembre.total AS septiembre, octubre.total AS octubre, noviembre.total AS noviembre, diciembre.total AS diciembre, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total + octubre.total + noviembre.total + diciembre.total AS Total FROM( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-01-01' AND '2019-01-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS enero LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-02-01' AND '2019-02-28' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS febrero ON enero.tem = febrero.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-03-01' AND '2019-03-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS marzo ON enero.tem = marzo.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-04-01' AND '2019-04-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS abril ON enero.tem = abril.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-05-01' AND '2019-05-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS mayo ON enero.tem = mayo.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-06-01' AND '2019-06-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS junio ON enero.tem = junio.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-07-01' AND '2019-07-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS julio ON enero.tem = julio.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-08-01' AND '2019-08-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS agosto ON enero.tem = agosto.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-09-01' AND '2019-09-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS septiembre ON enero.tem = septiembre.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-10-01' AND '2019-10-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS octubre ON enero.tem = octubre.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-11-01' AND '2019-12-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS noviembre ON enero.tem = noviembre.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-12-01' AND '2019-12-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS diciembre ON enero.tem = diciembre.tem) UNION( SELECT '%Avance' AS Terminos_obra, enero.total AS enero, febrero.total AS febrero, marzo.total AS marzo, abril.total AS abril, mayo.total AS mayo, junio.total AS junio, julio.total AS julio, agosto.total AS agosto, septiembre.total AS septiembre, octubre.total AS octubre, noviembre.total AS noviembre, diciembre.total AS diciembre, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total + octubre.total + noviembre.total + diciembre.total AS Total FROM( SELECT 1 AS tem, CASE WHEN reales.total / programadas.total IS NULL THEN 0 ELSE reales.total / programadas.total END AS total FROM( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-01-01' AND '2019-01-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS reales LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-01-01' AND '2019-01-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS programadas ON programadas.tem = reales.tem) AS enero LEFT JOIN( SELECT 1 AS tem, CASE WHEN reales.total / programadas.total IS NULL THEN 0 ELSE reales.total / programadas.total END AS total FROM( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-02-01' AND '2019-02-28' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS reales LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-02-01' AND '2019-02-28' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS programadas ON programadas.tem = reales.tem) AS febrero ON enero.tem = febrero.tem LEFT JOIN( SELECT 1 AS tem, CASE WHEN reales.total / programadas.total IS NULL THEN 0 ELSE reales.total / programadas.total END AS total FROM( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-03-01' AND '2019-03-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS reales LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-03-01' AND '2019-03-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS programadas ON programadas.tem = reales.tem) AS marzo ON enero.tem = marzo.tem LEFT JOIN( SELECT 1 AS tem, CASE WHEN reales.total / programadas.total IS NULL THEN 0 ELSE reales.total / programadas.total END AS total FROM( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-04-01' AND '2019-04-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS reales LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-04-01' AND '2019-04-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS programadas ON programadas.tem = reales.tem) AS abril ON enero.tem = abril.tem LEFT JOIN( SELECT 1 AS tem, CASE WHEN reales.total / programadas.total IS NULL THEN 0 ELSE reales.total / programadas.total END AS total FROM( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-05-01' AND '2019-05-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS reales LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-05-01' AND '2019-05-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS programadas ON programadas.tem = reales.tem) AS mayo ON enero.tem = mayo.tem LEFT JOIN( SELECT 1 AS tem, CASE WHEN reales.total / programadas.total IS NULL THEN 0 ELSE reales.total / programadas.total END AS total FROM( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-06-01' AND '2019-06-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS reales LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-06-01' AND '2019-06-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS programadas ON programadas.tem = reales.tem) AS junio ON enero.tem = junio.tem LEFT JOIN( SELECT 1 AS tem, CASE WHEN reales.total / programadas.total IS NULL THEN 0 ELSE reales.total / programadas.total END AS total FROM( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-07-01' AND '2019-07-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS reales LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-07-01' AND '2019-07-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS programadas ON programadas.tem = reales.tem) AS julio ON enero.tem = julio.tem LEFT JOIN( SELECT 1 AS tem, CASE WHEN reales.total / programadas.total IS NULL THEN 0 ELSE reales.total / programadas.total END AS total FROM( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-08-01' AND '2019-08-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS reales LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-08-01' AND '2019-08-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS programadas ON programadas.tem = reales.tem) AS agosto ON enero.tem = agosto.tem LEFT JOIN( SELECT 1 AS tem, CASE WHEN reales.total / programadas.total IS NULL THEN 0 ELSE reales.total / programadas.total END AS total FROM( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-09-01' AND '2019-09-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS reales LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-09-01' AND '2019-09-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS programadas ON programadas.tem = reales.tem) AS septiembre ON enero.tem = septiembre.tem LEFT JOIN( SELECT 1 AS tem, CASE WHEN reales.total / programadas.total IS NULL THEN 0 ELSE reales.total / programadas.total END AS total FROM( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-10-01' AND '2019-10-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS reales LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-10-01' AND '2019-10-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS programadas ON programadas.tem = reales.tem) AS octubre ON enero.tem = octubre.tem LEFT JOIN( SELECT 1 AS tem, CASE WHEN reales.total / programadas.total IS NULL THEN 0 ELSE reales.total / programadas.total END AS total FROM( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-11-01' AND '2019-11-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS reales LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-11-01' AND '2019-11-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS programadas ON programadas.tem = reales.tem) AS noviembre ON enero.tem = noviembre.tem LEFT JOIN( SELECT 1 AS tem, CASE WHEN reales.total / programadas.total IS NULL THEN 0 ELSE reales.total / programadas.total END AS total FROM( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-12-01' AND '2019-12-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS reales LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-12-01' AND '2019-12-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS programadas ON programadas.tem = reales.tem) AS diciembre ON enero.tem = diciembre.tem) UNION( SELECT 'Programado Acumulado' AS Terminos_obra, enero.total AS enero, enero.total + febrero.total AS febrero, enero.total + febrero.total + marzo.total AS marzo, enero.total + febrero.total + marzo.total + abril.total AS abril, enero.total + febrero.total + marzo.total + abril.total + mayo.total AS mayo, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total AS junio, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total AS julio, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total AS agosto, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total AS septiembre, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total + octubre.total AS octubre, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total + octubre.total + noviembre.total AS noviembre, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total + octubre.total + noviembre.total + diciembre.total AS diciembre, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total + octubre.total + noviembre.total + diciembre.total AS Total FROM( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-01-01' AND '2019-01-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS enero LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-02-01' AND '2019-02-28' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS febrero ON enero.tem = febrero.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-03-01' AND '2019-03-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS marzo ON enero.tem = marzo.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-04-01' AND '2019-04-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS abril ON enero.tem = abril.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-05-01' AND '2019-05-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS mayo ON enero.tem = mayo.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-06-01' AND '2019-06-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS junio ON enero.tem = junio.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-07-01' AND '2019-07-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS julio ON enero.tem = julio.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-08-01' AND '2019-08-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS agosto ON enero.tem = agosto.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-09-01' AND '2019-09-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS septiembre ON enero.tem = septiembre.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-10-01' AND '2019-10-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS octubre ON enero.tem = octubre.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-11-01' AND '2019-12-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS noviembre ON enero.tem = noviembre.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-12-01' AND '2019-12-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & ") AS diciembre ON enero.tem = diciembre.tem) UNION( SELECT 'Real Acumulado' AS Terminos_obra, enero.total AS enero, enero.total + febrero.total AS febrero, enero.total + febrero.total + marzo.total AS marzo, enero.total + febrero.total + marzo.total + abril.total AS abril, enero.total + febrero.total + marzo.total + abril.total + mayo.total AS mayo, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total AS junio, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total AS julio, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total AS agosto, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total AS septiembre, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total + octubre.total AS octubre, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total + octubre.total + noviembre.total AS noviembre, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total + octubre.total + noviembre.total + diciembre.total AS diciembre, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total + octubre.total + noviembre.total + diciembre.total AS Total FROM( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-01-01' AND '2019-01-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS enero LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-02-01' AND '2019-02-28' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS febrero ON enero.tem = febrero.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-03-01' AND '2019-03-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS marzo ON enero.tem = marzo.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-04-01' AND '2019-04-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS abril ON enero.tem = abril.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-05-01' AND '2019-05-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS mayo ON enero.tem = mayo.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-06-01' AND '2019-06-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS junio ON enero.tem = junio.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-07-01' AND '2019-07-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS julio ON enero.tem = julio.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-08-01' AND '2019-08-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS agosto ON enero.tem = agosto.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-09-01' AND '2019-09-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS septiembre ON enero.tem = septiembre.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-10-01' AND '2019-10-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS octubre ON enero.tem = octubre.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-11-01' AND '2019-12-30' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS noviembre ON enero.tem = noviembre.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-12-01' AND '2019-12-31' AND b.zona_territorial = " & SESSION.contents("zonaDirector") & " ) AS diciembre ON enero.tem = diciembre.tem)"
rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close
else
while not (rs1.eof)

%>
					<%if rs1("Terminos_obra") = "Programado Acumulado" then 
							eneP=rs1("enero")
							febP=rs1("febrero")
							marP=rs1("marzo")
							abrP=rs1("abril")
							mayP=rs1("mayo")
							junP=rs1("junio")
							julP=rs1("julio")
							agoP=rs1("agosto")
							sepP=rs1("septiembre")
							octP=rs1("octubre")
							novP=rs1("noviembre")
							dicP=rs1("diciembre")
                            tP=cdbl(rs1("total"))
					end if
					if rs1("Terminos_obra") = "Real Acumulado" then
							eneR=rs1("enero")
							febR=rs1("febrero")
							marR=rs1("marzo")
							abrR=rs1("abril")
							mayR=rs1("mayo")
							junR=rs1("junio")
							julR=rs1("julio")
							agoR=rs1("agosto")
							sepR=rs1("septiembre")
							octR=rs1("octubre")
							novR=rs1("noviembre")
							dicR=rs1("diciembre")
                            tR=cdbl(rs1("total"))
					end if

                    %>
					<% if rs1("Terminos_obra") = "%Avance" then %>
						<tr>
							<td align="left" style="cursor:pointer;border:hidden"  ><font color="#000000"><%=rs1("Terminos_obra")%></font></td>
							<td align="center" style="cursor:pointer;border:hidden"  ><%=cdbl(round(rs1("enero"),2)*100)%> %</td>
							<td align="center" style="cursor:pointer;border:hidden"  ><%=cdbl(round(rs1("febrero"),2)*100)%> %</td>
							<td align="center" style="cursor:pointer;border:hidden"  ><%=cdbl(round(rs1("marzo"),2)*100)%> %</td>
							<td align="center" style="cursor:pointer;border:hidden"  ><%=cdbl(round(rs1("abril"),2)*100)%> %</td>
							<td align="center" style="cursor:pointer;border:hidden"  ><%=cdbl(round(rs1("mayo"),2)*100)%> %</td>
							<td align="center" style="cursor:pointer;border:hidden"  ><%=cdbl(round(rs1("junio"),2)*100)%> %</td>
							<td align="center" style="cursor:pointer;border:hidden"  ><%=cdbl(round(rs1("julio"),2)*100)%> %</td>
							<td align="center" style="cursor:pointer;border:hidden"  ><%=cdbl(round(rs1("agosto"),2)*100)%> %</td>
							<td align="center" style="cursor:pointer;border:hidden"  ><%=cdbl(round(rs1("septiembre"),2)*100)%> %</td>
							<td align="center" style="cursor:pointer;border:hidden"  ><%=cdbl(round(rs1("octubre"),2)*100)%> %</td>
							<td align="center" style="cursor:pointer;border:hidden"  ><%=cdbl(round(rs1("noviembre"),2)*100)%> %</td>
							<td align="center" style="cursor:pointer;border:hidden"  ><%=cdbl(round(rs1("diciembre"),2)*100)%> %</td>
							<td align="center" style="cursor:pointer;border:hidden"  ><%%></td>
   
						</tr>
                    <% else %>  
                    <tr>
                            <td align="left" style="cursor:pointer;border:hidden"  ><font color="#000000"><%=rs1("Terminos_obra")%></font></td>
                            <td align="center" style="cursor:pointer;border:hidden"  ><%=rs1("enero")%></td>
                            <td align="center" style="cursor:pointer;border:hidden"  ><%=rs1("febrero")%></td>
                            <td align="center" style="cursor:pointer;border:hidden"  ><%=rs1("marzo")%></td>
                            <td align="center" style="cursor:pointer;border:hidden"  ><%=rs1("abril")%></td>
                            <td align="center" style="cursor:pointer;border:hidden"  ><%=rs1("mayo")%></td>
                            <td align="center" style="cursor:pointer;border:hidden"  ><%=rs1("junio")%></td>
                            <td align="center" style="cursor:pointer;border:hidden"  ><%=rs1("julio")%></td>
                            <td align="center" style="cursor:pointer;border:hidden"  ><%=rs1("agosto")%></td>
                            <td align="center" style="cursor:pointer;border:hidden"  ><%=rs1("septiembre")%></td>
                            <td align="center" style="cursor:pointer;border:hidden"  ><%=rs1("octubre")%></td>
                            <td align="center" style="cursor:pointer;border:hidden"  ><%=rs1("noviembre")%></td>
                            <td align="center" style="cursor:pointer;border:hidden"  ><%=rs1("diciembre")%></td>
                            <td align="center" style="cursor:pointer;border:hidden"  ><%=rs1("total")%></td>
                        
                        </tr>  
				    <% end if %>
<%

rs1.movenext
	wend 
rs1.close
conn3.close 
set rs1=nothing
set conn3=nothing
end if 
if (cdbl(eneP)=0 and cdbl(eneR)=0)  then
ene=0
else
ene=cdbl(eneR)/cdbl(eneP)
end if
if (cdbl(febP)=0 and cdbl(febR)=0)  then
feb=0
else
feb=cdbl(febR)/cdbl(febP)
end if
if (cdbl(marP)=0 and cdbl(marR)=0)  then
mar=0
else
mar=cdbl(marR)/cdbl(marP)
end if
if (cdbl(abrP)=0 and cdbl(abrR)=0)  then
abr=0
else
abr=cdbl(abrR)/cdbl(abrP)
end if
if (cdbl(mayP)=0 and cdbl(mayR)=0)  then
may=0
else
may=cdbl(mayR)/cdbl(mayP)
end if
if (cdbl(junP)=0 and cdbl(junR)=0)  then
jun=0
else
jun=cdbl(junR)/cdbl(junP)
end if
if (cdbl(julP)=0 and cdbl(julR)=0)  then
jul=0
else
jul=cdbl(julR)/cdbl(julP)
end if
if (cdbl(agoP)=0 and cdbl(agoR)=0)  then
ago=0
else
ago=cdbl(agoR)/cdbl(agoP)
end if
if (cdbl(sepP)=0 and cdbl(sepR)=0)  then
sep=0
else
sep=cdbl(sepR)/cdbl(sepP)
end if
if (cdbl(octP)=0 and cdbl(octR)=0)  then
octu=0
else
octu=cdbl(octR)/cdbl(octP)
end if
if (cdbl(novP)=0 and cdbl(novR)=0)  then
nov=0
else
nov=cdbl(novR)/cdbl(novP)
end if
if (cdbl(dicP)=0 and cdbl(dicR)=0)  then
dic=0
else
dic=cdbl(dicR)/cdbl(dicP)
end if


%> 
						<tr>
							<td align="left" style="cursor:pointer;border:hidden"  ><font color="#000000">%Acumulado</font></td>
							<td align='center' style='cursor:pointer;border:hidden'  ><%=round(ene,2)*100%> %</td>
							<td a<td align='center' style='cursor:pointer;border:hidden'  ><%=round(feb,2)*100%></td>
<td align='center' style='cursor:pointer;border:hidden'  ><%=round(mar,2)*100%> %</td>
<td align='center' style='cursor:pointer;border:hidden'  ><%=round(abr,2)*100%> %</td>
<td align='center' style='cursor:pointer;border:hidden'  ><%=round(may,2)*100%> %</td>
<td align='center' style='cursor:pointer;border:hidden'  ><%=round(jun,2)*100%> %</td>
<td align='center' style='cursor:pointer;border:hidden'  ><%=round(jul,2)*100%> %</td>
<td align='center' style='cursor:pointer;border:hidden'  ><%=round(ago,2)*100%> %</td>
<td align='center' style='cursor:pointer;border:hidden'  ><%=round(sep,2)*100%> %</td>
<td align='center' style='cursor:pointer;border:hidden'  ><%=round(octu,2)*100%> %</td>
<td align='center' style='cursor:pointer;border:hidden'  ><%=round(nov,2)*100%> %</td>
<td align='center' style='cursor:pointer;border:hidden'  ><%=round(dic,2)*100%> %</td>
<% if tP = 0 then %>
	<td align='center' style='cursor:pointer;border:hidden'  >0 %</td>
<% else %>
	<td align='center' style='cursor:pointer;border:hidden'  ><%=ROUND(tr/tp,2)*100%> %</td>
<% end if %>
						</tr>
					</tbody>
				</table>
			</div>
			</div>
		</td>
		<!--fin Tabla GRAFICA-->
		<!--Inicio Titulo Financiero-->
		<td>
			<fieldset>
				<legend>AVANCE FINANCIERO</legend>
			</fieldset>	
		</td>
		<!--Fin Titulo Financiero-->
	</tr>
	
</table>
	
<!--Fin Contenido-->
    </div>

<input type="hidden" name="hddn_estatus1" id="hddn_estatus1" />
<input type="hidden" name="hddn_estatus2" id="hddn_estatus2" />
<input type="hidden" name="hddn_territorial" id="hddn_territorial" />
<script>
		var MONTHS = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
		var config = {
			type: 'line',
			data: {
				labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio','Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
				datasets: [{
					label: 'Programadas',
					
					backgroundColor: "rgba(233,0,16,0.05)",
					borderColor: "rgba(233,0,16,0.5)",
					data: [<%=cargaProgramadas%>],
					fill: true,
			
				}, {
					label: 'Reales',
					fill: true,
					backgroundColor: "rgba(79,156,238,0.05)",
					borderColor: "rgba(79,156,238,0.5)",
					data: [<%=cargaReales%>],
				}]
			},
			options: {
				responsive: true,
				title: {
					display: true,
					text: 'Avance General'
				},
				tooltips: {
					mode: 'index',
					intersect: false,
				},
				hover: {
					mode: 'nearest',
					intersect: true
				},
				scales: {
					xAxes: [{
						display: true,
						scaleLabel: {
							display: true,
							labelString: 'Meses'
						}
					}],
					yAxes: [{
						display: true,
						scaleLabel: {
							display: true,
							labelString: 'Avance'
						}
					}]
				}
			}
		};

		window.onload = function() {
			var ctx = document.getElementById('canvas').getContext('2d');
			window.myLine = new Chart(ctx, config);
		};

		document.getElementById('randomizeData').addEventListener('click', function() {
			config.data.datasets.forEach(function(dataset) {
				dataset.data = dataset.data.map(function() {
					return randomScalingFactor();
				});

			});

			window.myLine.update();
		});

		var colorNames = Object.keys(window.chartColors);
		document.getElementById('addDataset').addEventListener('click', function() {
			var colorName = colorNames[config.data.datasets.length % colorNames.length];
			var newColor = window.chartColors[colorName];
			var newDataset = {
				label: 'Dataset ' + config.data.datasets.length,
				backgroundColor: newColor,
				borderColor: newColor,
				data: [],
				fill: false
			};

			for (var index = 0; index < config.data.labels.length; ++index) {
				newDataset.data.push(randomScalingFactor());
			}

			config.data.datasets.push(newDataset);
			window.myLine.update();
		});

		document.getElementById('addData').addEventListener('click', function() {
			if (config.data.datasets.length > 0) {
				var month = MONTHS[config.data.labels.length % MONTHS.length];
				config.data.labels.push(month);

				config.data.datasets.forEach(function(dataset) {
					dataset.data.push(randomScalingFactor());
				});

				window.myLine.update();
			}
		});

		document.getElementById('removeDataset').addEventListener('click', function() {
			config.data.datasets.splice(0, 1);
			window.myLine.update();
		});

		document.getElementById('removeData').addEventListener('click', function() {
			config.data.labels.splice(-1, 1); // remove the label first

			config.data.datasets.forEach(function(dataset) {
				dataset.data.pop();
			});

			window.myLine.update();
		});
	</script>

</form>
</body>
</html>
