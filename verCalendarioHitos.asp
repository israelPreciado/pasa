
<!--#include file="funcion/funcion_lobby.inc"-->
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
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<link href="css/login.css" rel="stylesheet" type="text/css">
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
	 <%if session.Contents("privilegio")="2" then%>
	 	document.getElementById('frm_avanceObra').action="inicioSupervisor_lobby.asp"	
	 <%else%>
	 	document.getElementById('frm_avanceObra').action="inicioContratista_lobby.asp"	
	 <%end if%>

	
	document.getElementById('frm_avanceObra').submit()
}
 function exit(){
	 document.getElementById('frm_avanceObra').action="cerrar_sesion.asp"
	 document.getElementById('frm_avanceObra').submit()
 }
 function back(){
	document.getElementById('frm_avanceObra').action="avanceObraHitos_lobby.asp"
	document.getElementById('frm_avanceObra').submit()
}

function obtenerFecha(modulo){
	//alert(modulo)
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

document.getElementById('frm_avanceObra').action="updateFechaTerminoHitos_lobby.asp"
document.getElementById('frm_avanceObra').submit()
//alert(document.getElementById('hddnFecha').value)
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

<%if isempty(session("cr")) then
response.Redirect("default.asp?logout=true")
end if%>
<%
modulo=request("hddnEnviar")
nombreModulo=buscaModuloHitos(modulo)
fechaProgramada=buscaFechaProgramadaLobby(session.Contents("cr"),modulo)
fechaRealTermino=buscaFechaRealTerminoLobby(session.Contents("cr"),modulo)
fechaRealTerminoContatista=buscaFechaRealTerminoContratistaLobby(session.Contents("cr"),modulo)
reprogramado=buscaFechaReprogramadoLobby(session.Contents("cr"),modulo)
%>
%>
<body>
<form id="frm_avanceObra" name="frm_avanceObra"> <input type="hidden" name="zonaFoto" id="zonaFoto"/>
<input type="hidden" id="angulo" value="0"/> 
<input type="hidden" id="hddnEnviar" name="hddnEnviar" value="<%=modulo%>"/> 
<input type="hidden" id="hddnFecha" name="hddnFecha"/> 
<input type="hidden" id="hddnID" name="hddnID"/>

 </form>    
    <p class="pe" style="font-size:50px"><strong>Modulo de supervisi&oacute;n de Obra</strong</p>


   <div id="barrasuperior">
    <table><tr><td width="35%"  onclick="back()"><a href="#" style="padding-left:55%"><font style="font-size:200%; color:white"><span class="icon-arrow-left"></span></font></a></td><td width="35%"  <%if session.Contents("privilegio")=2 then%>onclick="home()"<%else%>onclick="home2()"<%end if%>><a href="#" style="padding-left:55%"><font style="font-size:200%; color:white"><span class="icon-home3"></span></font></a></td><td  onclick="exit()"><a href="#" style="padding-left:55%"><font style="font-size:200%; color:white"><span class="icon-exit"></span></font></a></td></tr></table>
      &nbsp;
    </div>
        <div id="detalle">

<%
Set conn12 = Server.CreateObject("ADODB.Connection")
set rs12= Server.CreateObject("adodb.recordset")
Conn12.Open connstr
sql12= "select * from tseguimiento_lobby where cr='" & session.Contents("cr") & "'"
rs12.open sql12,conn12
if rs12.eof then
%> 
<p>No se encontro la informacion solicitada</p> 
<%else%>     
      <p>Lobby: <strong><%=rs12("nombre_lobby")%></strong></p>
     
	  <%if session.Contents("privilegio")=2 then%>
      <p>Contratista: <strong><%=buscaContratista(rs12("id_proveedor"))%></strong><p>
	  <%else%>
		 <%if session.Contents("privilegio")=3 then%>
		 <p>Supervisor: <strong><%=buscaSupervisor(rs12("id_supervisor"))%></strong><p>
		 <%else%>
			<p>Contratista: <strong><%=buscaContratista(rs12("id_proveedor"))%></strong><p>
			<p>Supervisor: <strong><%=buscaSupervisor(rs12("id_supervisor"))%></strong><p>
		 <%end if%>
	  <%end if%>
    </div>
<%
end if
rs12.close
conn12.close 
set rs12=nothing
set conn12=nothing
%> 
<!--inicio Obra Civil-->  
  	<div id="Obra_civil">
  		<div align="center" id="menu_inicio">
    		<div id="detalle">
    			<table width="100%">
     				<tr>
     				 	<td width="70%"><p>CR: <strong><%=session.Contents("cr")%></strong></p></td>  
     				</tr>
     				<tr>
     				 	<td width="70%"><p>HITO: <strong><%=Server.HTMLEncode(nombreModulo)%></strong></p></td>    
     				</tr>
     				<tr>
     				 	<td width="70%"><p>Fecha Programada de Termino: <strong><%=fechaProgramada%>  </strong><Font style='font-size:38px;color:blue;text-shadow: 0 0 30px #315822;'><%=reprogramado%></Font></p></td>    
     				</tr>
     				<tr>
     				 	<td width="70%"><p>Fecha Real de Termino: <strong><%=fechaRealTermino%></strong></p></td>    
     				</tr>
     				<tr>
     				 	<td width="70%"><p>Fecha Real de Termino Contratista: <strong><%=fechaRealTerminoContatista%></strong></p></td>    
     				</tr>

     				
   				 </table>
    		</div>
    	</div>
		<br />
  		<div id="logo">  
    		<p><strong></strong></p>		 
    	</div>
  		<div id="barrasuperior">
    		<table><tr><td><a class="a" href="#" style="padding-left:55%;"><spans></span></a></td></tr></table>
  		</div>
  		<br />
           	</div>
    </div>
	
<br/>
<div id="tabla_instrucciones" style="display:block" align="center">
			  <p class="pe" style="font-size:50px;color:blue"><strong>Elije la fecha de finalizaci&oacute;n</strong</p>
<br/>
</div>

<div id="calendar2" style="display:block"></div>
<div id="tabla_actualizar_evento" style="display:block">

<table  width="40%" align="center">
	<tr>
		<td align="center"><input class="botonGrande" type="button" value="Aplicar" onclick='obtenerFecha(<%=modulo%>)' name="btnEnviar"/></td>
		<!--<td width="31%" align="center"><button type="button" class="botonChico" onclick="obtenerFecha()" style="display:block"><span class="icon-floppy-disk"></span></button></td>-->
	</tr>
</table>
</div>	

<div id="calendar" style="display:none"></div>
 



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
