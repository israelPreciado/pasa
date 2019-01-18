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
	#scroll {
     overflow:auto;
}
	.datagrid table { border-collapse: collapse; text-align: left; width: 100%; } .datagrid {font: normal 12px/150% Arial, Helvetica, sans-serif; background: #fff; overflow: hidden; border: 1px solid #991821; -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; }.datagrid table td, .datagrid table th { padding: 3px 10px; }.datagrid table thead th {background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #991821), color-stop(1, #80141C) );background:-moz-linear-gradient( center top, #991821 5%, #80141C 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#991821', endColorstr='#80141C');background-color:#991821; color:#FFFFFF; font-size: 15px; font-weight: bold; border-left: 1px solid #B01C26; } .datagrid table thead th:first-child { border: none; }.datagrid table tbody td { color: #80141C; border-left: 1px solid #F7CDCD;font-size: 12px;font-weight: normal; }.datagrid table tbody .alt td { background: #F7CDCD; color: #80141C; }.datagrid table tbody td:first-child { border-left: none; }.datagrid table tbody tr:last-child td { border-bottom: none; }.datagrid table tfoot td div { border-top: 1px solid #991821;background: #F7CDCD;} .datagrid table tfoot td { padding: 0; font-size: 12px } .datagrid table tfoot td div{ padding: 2px; }.datagrid table tfoot td ul { margin: 0; padding:0; list-style: none; text-align: right; }.datagrid table tfoot  li { display: inline; }.datagrid table tfoot li a { text-decoration: none; display: inline-block;  padding: 2px 8px; margin: 1px;color: #FFFFFF;border: 1px solid #991821;-webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #991821), color-stop(1, #80141C) );background:-moz-linear-gradient( center top, #991821 5%, #80141C 100% );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#991821', endColorstr='#80141C');background-color:#991821; }.datagrid table tfoot ul.active, .datagrid table tfoot ul a:hover { text-decoration: none;border-color: #80141C; color: #FFFFFF; background: none; background-color:#991821;}div.dhtmlx_window_active, div.dhx_modal_cover_dv { position: fixed !important; }
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
            max-width: 300px;

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
					"VERACRUZ": {
                        value: "23",
                        href: "#",
                        tooltip: {content: "<span style=\"font-weight:bold;\">CENTRO</span><br /><p>Por Iniciar :<%=numeroSucTerrRegional_EstatusZona("CENTRO", 0,0,1,session.contents("zonaDirector"))%></p><p>En Proceso : <%=numeroSucTerrRegional_EstatusZona("CENTRO", 1,2,1,session.contents("zonaDirector"))%></p><p>Terminadas : <%=numeroSucTerrRegional_EstatusZona("CENTRO", 3,3,1,session.contents("zonaDirector"))%></p><p>Entregadas : 0</p>"}
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
					"HIDALGO": {
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

function showDetalleAvance(territorial,query,estatusObra){
	//document.getElementById('loader').style.display="block"
	document.getElementById('estatusObra').value=estatusObra
	document.getElementById('query').value=query
	document.getElementById('territorial').value=territorial
	document.getElementById('pagina').value=1
	document.getElementById('frm_revisarAvance').action="modalTest_terr_regional_ConMenuSwip.asp"
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
%>
<body> 

<form name="frm_revisarAvance" id="frm_revisarAvance" method="post">
<input type="hidden" name="estatusObra" id="estatusObra" value="<%=estatusObra%>"/>
<input type="hidden" id="query" name="query"/>
<input type="hidden" name="territorial" id="territorial"/>
<input type="hidden" name="pagina" id="pagina"/>
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

			
			<!--INICIO MAPA-->
				<fieldset>
					<legend>AVANCE POR REGIONAL</legend>
						<div align="right">
							<table width="100%">
								<tr>
									<td align="center">
										<div class="container2">
											<div class="mapcontainer">
												<div class="map">
													<span>No se cargo correctamente el mapa</span>
												</div>
					
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="datagrid">
											<table >
												<thead>
													<tr>
														<th colspan="2" style="border:hidden">TERRITORIAL</TH>
														<th style="border:hidden">POR INICIAR</th>
														<th style="border:hidden">EN PROCESO</th>
														<th style="border:hidden">TERMINADAS</th>
														<th style="border:hidden">ENTREGADAS</th>
														<th style="border:hidden">TOTAL</th>
													</tr>
												</thead>
												<tfoot>
													<tr>
														<th  style="text-align:center" colspan="2">TOTAL</th>  
														<th  style="text-align:center" onclick="showDetalleAvance('',2,'porIniciar')"><%=numeroSucTerrRegional_EstatusZona(territorial, 0,0,query,session.contents("zonaDirector"))%></th>
														<th  style="text-align:center" onclick="showDetalleAvance('',2,'enProceso')"><%=numeroSucTerrRegional_EstatusZona(territorial, 1,2,query,session.contents("zonaDirector"))%></th>
														<th  style="text-align:center" onclick="showDetalleAvance('',2,'terminadas')"><%=numeroSucTerrRegional_EstatusZona(territorial, 3,3,query,session.contents("zonaDirector"))%></th>
														<th  style="text-align:center" >0</th>
														<th  style="text-align:center" onclick="showDetalleAvance('',2,'autorizadas')"><%=numeroSucTerritorialZona(session.contents("zonaDirector"))%></th>
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
														<td align="center" style="cursor:pointer;border:hidden"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'autorizadas')"><font size="+2"><span class="icon-search"></span></font></td><td><font color="#000000"><%=rs1("territorial")%></font></td>
														<td  align="center" style="cursor:pointer;border:hidden"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'porIniciar')"><font color="#920000"><%=rs1("porIniciar")%></font></td>
														<td align="center" style="cursor:pointer;border:hidden"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'enProceso')"><font color="#920000"><%=rs1("enProceso")%></font></td>
														<td  align="center" style="cursor:pointer;border:hidden"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'terminadas')"><font color="#920000"><%=rs1("terminadas")%></font></td>
														<td  align="center" style="cursor:pointer;border:hidden"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'entregadas')"><font color="#920000">0<font></td>
														<td align="center" style="cursor:pointer;border:hidden"  onclick="showDetalleAvance('<%=rs1("territorial")%>',1,'autorizadas')"><font color="#920000"><%=rs1("total")%></font></td>
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
								</tr>
							</table>
						</div>
					</fieldset>
					<!--Fin MAPA -->
	
<!--Fin Contenido-->
    </div>

<input type="hidden" name="hddn_estatus1" id="hddn_estatus1" />
<input type="hidden" name="hddn_estatus2" id="hddn_estatus2" />
<input type="hidden" name="hddn_territorial" id="hddn_territorial" />
</form>
</body>
</html>
