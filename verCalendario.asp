
<!--#include file="funcion/funcion.inc"-->
<!DOCTYPE html>
<html>
<title>Imagenes Cargadas</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.mySlides {display:none}
a{
 font-size:200%;
 color:rgb(230,165,165);
 text-shadow: 1px 0px 1px rgba(255,255,255,0.5);
}
#barrasuperior {
	background: #920000;
	display: block;
	float:inherit;
	margin: 5% auto;
	width: 100%;
}
#barrasuperior table {
	width: 100%;
}
.botonGrande{
 width:90%;
 background:#a40505;
 border:0;
 padding:5%;
 font-family:'Open Sans',sans-serif;
 font-size:250%;
 color:#fff;
 cursor:pointer;
 transition:background .3s;
 -webkit-transition:background .3s;
  -webkit-appearance: none;
 -webkit-border-radius: 0;
}
.botonChico{
 width:15%;
 background:#a40505;
 border:0;
 padding:3%;
 font-family:'Open Sans',sans-serif;
 font-size:250%;
 color:#fff;
 cursor:pointer;
 transition:background .3s;
 -webkit-transition:background .3s;
  -webkit-appearance: none;
 -webkit-border-radius: 0;
}
</style>
<%cr=session.contents("cr")
'cr="0146"
%>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="cssCalendario/reset.css" type="text/css" rel="stylesheet" />
<link href="cssCalendario/dp_calendar.css" type="text/css" rel="stylesheet" />
<link href="cssCalendario/demo.css" type="text/css" rel="stylesheet" />
<link href="themesCalendario/ui-lightness/jquery.ui.all.css" type="text/css" rel="stylesheet" />
<script type='text/javascript' src='jsCalendario/jquery-1.11.1.min.js'></script> 
<script type="text/javascript" src="uiCalendario/jquery.ui.core.js"></script> 
<script type="text/javascript" src="uiCalendario/jquery.ui.position.js"></script>
<script type="text/javascript" src="uiCalendario/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="jsCalendario/date.js"></script>
<script type="text/javascript" src="jsCalendario/jquery.dp_calendar.js"></script>
<script type="text/javascript" src="jsCalendario/jquery.dp_calendar-es.js"></script>


<script type="text/javascript">
 function home(){
	document.getElementById('frm_avanceObra').action="detalleCR.asp"
	document.getElementById('frm_avanceObra').submit()
}
 function exit(){
	 document.getElementById('frm_avanceObra').action="cerrar_sesion.asp"
	 document.getElementById('frm_avanceObra').submit()
 }
 function back(){
	document.getElementById('frm_avanceObra').action="detalleCR.asp"
	document.getElementById('frm_avanceObra').submit()
}

function obtenerFecha(){
var anio=""
var mes=""
var dia=""
anio=$.fn.dp_calendar.getYear()
mes=$.fn.dp_calendar.getMonth()+1
dia=$.fn.dp_calendar.getDay()
if(mes <10){
mes="0" + mes
}
if(dia<10){
dia="0"+dia
}
document.getElementById('hddnFecha').value=anio + "-" + mes + "-" + dia

document.getElementById('frm_avanceObra').action="updateLlegadaMateriales.asp"
document.getElementById('frm_avanceObra').submit()
//alert(document.getElementById('hddnID').value)
//window.location.replace("detalleCR.asp");
} 

function detUpdatellegadaMateriales(){

	$.ajax({
	type: "GET",
	url: "updateLlegadaMateriales.asp?hddnFecha=" + document.getElementById('hddnFecha').value + "&hddnID=" + document.getElementById('hddnID').value, 
	dataType: "html", 
	success: function(response){ 
	var update=response
	//$("#dedede").html(response);
	if (update=="err"){
		alert('error')
		//simulateClick(document.getElementById('alert'))	
		} 
	else{
		 alert('ok')
		 //simulateClick(document.getElementById('alert2'))
		}
	}
  });
}


function cambiarFecha(id){
document.getElementById('calendar').style.display="none"
document.getElementById('calendar2').style.display="block"
document.getElementById('tabla_actualizar_evento').style.display="block"
document.getElementById('tabla_instrucciones').style.display="block"
document.getElementById('hddnID').value=id
}

$(document).ready(function(){  
	
	var events_array = new Array(
<%	
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "select *,left(fecha,4) as anio, RIGHT(fecha,2) as dia, RIGHT(left(fecha,7),2)-1 as mes from cat_llegadamateriales where cr='" & cr & "' ORDER BY fecha;"
rs1.open sql1, conn3
if rs1.eof then
%>
		{
			startDate: new Date(2000,1),
			endDate: new Date(2000,1,1),
			title: "",
			description: "",
			allDay: false,
			priority: 1, // 1 = Low, 2 = Medium, 3 = Urgent
			frecuency: 1 // 1 = Daily, 2 = Weekly, 3 = Monthly, 4 = Yearly
		},
<%		
	rs1.close
	conn3.close
else
while not (rs1.eof)
%>
		{
			startDate: new Date(<%=rs1("anio")%>,<%=rs1("mes")%>,<%=rs1("dia")%>),
			endDate: new Date(<%=rs1("anio")%>,<%=rs1("mes")%>,<%=rs1("dia")%>),
			title: "<%=rs1("material")%>",
			description: "<p>Cantidad: <%=rs1("cantidad")%></p><p>Comentario: <%=rs1("comentario")%></p><p>Tiempo: <%=rs1("tiempo")%> semanas</p><p>PR <%=rs1("cve_sap")%></p><p><button type='button' class='botonChico' onclick='cambiarFecha(<%=rs1("id_pedido")%>)' style='display:block'><font style='font-size:50%;color:white'><span class='icon-pencil2'></span></font></button></p>",
			//description: "<p>Cantidad: <%=rs1("cantidad")%></p><p>Comentario: <%=rs1("comentario")%></p><p>Tiempo: <%=rs1("tiempo")%> semanas</p><p>Pos: <%=rs1("pos")%></p><p>Clave Sap: <%=rs1("cve_sap")%></p>",
			allDay: false,
			priority: 1, // 1 = Low, 2 = Medium, 3 = Urgent
			frecuency: 1 // 1 = Daily, 2 = Weekly, 3 = Monthly, 4 = Yearly
		},
<%
rs1.movenext
wend 
rs1.close
conn3.close 
set rs1=nothing
set conn3=nothing
end if 
%>
	);	
	$("#calendar").dp_calendar({
		events_array: events_array
	});
	
		var events_array = new Array(
		{
			startDate: new Date(2000,1),
			endDate: new Date(2000,1,1),
			title: "",
			description: "",
			allDay: false,
			priority: 1, // 1 = Low, 2 = Medium, 3 = Urgent
			frecuency: 1 // 1 = Daily, 2 = Weekly, 3 = Monthly, 4 = Yearly
		},
	);	
	$("#calendar2").dp_calendar({
		events_array: events_array
	});
}); 
</script>


<body>
<form id="frm_avanceObra" name="frm_avanceObra"> <input type="hidden" name="zonaFoto" id="zonaFoto"/>
<input type="hidden" id="angulo" value="0"/> 
<input type="hidden" id="hddnEnviar" value="<%=modulo%>"/> 
<input type="hidden" id="hddnFecha" name="hddnFecha"/> 
<input type="hidden" id="hddnID" name="hddnID"/>

 </form>    
    <p class="pe" style="font-size:50px"><strong>Modulo de supervisi&oacute;n de Obra</strong</p>


    <div id="barrasuperior">
    <table><tr><td width="35%"  onclick="back()"><a href="#" style="padding-left:55%"><font style="font-size:300%;color:white"><span class="icon-arrow-left"></span></font></a></td><td width="35%"  <%if session.Contents("privilegio")=2 then%>onclick="home()"<%else%>onclick="home2()"<%end if%>><a href="#" style="padding-left:55%"><font style="font-size:300%;color:white"><span class="icon-home3"></span></font></a></td><td  onclick="exit()"><a href="#" style="padding-left:55%"><font style="font-size:300%;color:white"><span class="icon-exit"></span></font></a></td></tr></table>
      &nbsp;
    </div>
	
<br/>
<div id="tabla_instrucciones" style="display:none" align="center">
			  <p class="pe" style="font-size:50px;color:blue"><strong>Elije la nueva fecha </strong</p>
<br/>
</div>

<div id="calendar2" style="display:none"></div>
<div id="tabla_actualizar_evento" style="display:none">

<table  width="40%" align="center">
	<tr>
		<td align="center"><input class="botonGrande" type="button" value="Actualizar Evento" onclick='obtenerFecha()' name="btnEnviar"/></td>
		<!--<td width="31%" align="center"><button type="button" class="botonChico" onclick="obtenerFecha()" style="display:block"><span class="icon-floppy-disk"></span></button></td>-->
	</tr>
</table>
</div>	

<div id="calendar"></div>
 



<a href="#" id="alert" style="display:none"></a>
 
</div>

<script>

function simulateClick(control){
    if (document.all)
    {
        control.click();
    }
    else
    {
        var evObj = document.createEvent('MouseEvents');
        evObj.initMouseEvent('click', true, true, window, 1, 12, 345, 7, 220, false, false, true, false, 0, null );
        control.dispatchEvent(evObj);
    }
}  
</script>

	
	
</body>
</html>
