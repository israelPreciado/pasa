
<!--#include file="funcion/funcion.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Obras</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<link href="css/login.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
<link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<Script language="javascript">
 function Enviar(){
	 //document.getElementById("").value=modulo
	 //document.getElementById("frm_modulos").submit()
	  if (validar()){
		if (validarCC()){
		
			insertEstimacion(document.getElementById('hddnEnviar').value)
		}
		else{
			simulateClick(document.getElementById('alert31'))	
		}
	  }
	   else{
		simulateClick(document.getElementById('alert5'))	
	  }
	 }
		//insertEstimacion(document.getElementById('hddnEnviar').value)
		//document.getElementById("frm_modulos").action="insertEstimacion.asp"
		//document.getElementById("frm_modulos").submit()
	 
	// else{
	 //alert("no")
	// }
 
function validar(){
 var bandera=true
 familia=document.getElementById('para').value
 if(familia.length == 0 || /^\s+$/.test(familia)){
	simulateClick(document.getElementById('alert3'))	
	bandera=false
	}
 else{
	//correos=familia.split(',')
	//for (i = 0; i < correos.length; i++){
		//if (isValidEmail(correos[i])){
			bandera=true
			//}
		//else{
			//bandera=false
		//	break;
			//}
		
		//}	
	}
	return bandera
 }
 function validarCC(){
 var bandera=true
 familia=document.getElementById('cc').value
 if(familia.length == 0 || /^\s+$/.test(familia)){
	
	bandera=true
	}
 else{
	//correos=familia.split(',')
	//for (i = 0; i < correos.length; i++){
	//	if (isValidEmail(correos[i])){
			bandera=true
	//		}
	//	else{
	//		bandera=false
	//		break;
	//		}
		
		//}	
	}
	
	return bandera
 }
 
 
 function isValidEmail(mail) { 
  return /^\w+([\.\+\-\_]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/.test(mail); 
}
 
 
 
 
 function insertEstimacion(estimacion){

	$.ajax({
	type: "GET",
	url: "insertEstimacion.asp?cr=" + <%=session.contents("cr")%> + "&estimacion=" + estimacion + "&para=" + document.getElementById('para').value + "&cc=" + document.getElementById('cc').value, 
	dataType: "html", 
	success: function(response){ 
	var update=response
	//$("#dedede").html(response);
	if (update=="err"){
		simulateClick(document.getElementById('alert'))	
		} 
	else{
		 
		 simulateClick(document.getElementById('alert2'))
		}
	}
  });
}

 function home(){
	document.getElementById('frm_modulos').action="iniciosupervisor.asp"
	document.getElementById('frm_modulos').submit()
}
 function home2(){
	document.getElementById('frm_modulos').action="inicioContratista.asp"
	document.getElementById('frm_modulos').submit()
}
 function exit(){
	 document.getElementById('frm_modulos').action="cerrar_sesion.asp"
	 document.getElementById('frm_modulos').submit()
 }
 function back(){
	document.getElementById('frm_modulos').action="generarEstimacion.asp"
	document.getElementById('frm_modulos').submit()
}
function tomarFoto(){
	document.getElementById('frm_modulos').action="tomarFoto.asp"
	document.getElementById('frm_modulos').submit()
}
function simulateClick(control){
    if (document.all){
        control.click();
    }
    else{
        var evObj = document.createEvent('MouseEvents');
        evObj.initMouseEvent('click', true, true, window, 1, 12, 345, 7, 220, false, false, true, false, 0, null );
        control.dispatchEvent(evObj);
    }
 } 
</script>
<%estimacionCorrespondiente=buscarEstimacionCorrespondiente(session.contents("cr"))%>
<%if isempty(session("cr")) then
response.Redirect("default.asp?logout=true")
end if%>
</head>
<%if request("res")="tipo" then %>
<body onload="simulateClick(document.getElementById('alert3'))">
<%else%>
<%if request("res")="err" then %>
<body onload="simulateClick(document.getElementById('alert'))">
<%else%>
<%if request("res")="tamano" then %>
<body onload="simulateClick(document.getElementById('alert4'))">
<%else%>
<%if request("res")="ok" then %>
<body onload="simulateClick(document.getElementById('alert2'))">
<%else%>
<body>
<%end if%>
<%end if%>
<%end if%>
<%end if%>
<form name="frm_modulos" id="frm_modulos" method="post">
<div id="pagina">
<div id="header">
<div id="logo"> 
<p><strong>Modulo de supervisi&oacute;n de Obra</strong><p>   
</div>
    <div id="barrasuperior">
    <table><tr><td width="35%" onclick="back()"><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-arrow-left" ></span></font></a></td><td width="35%" <%if session.Contents("privilegio")=2 then%>onclick="home()"<%else%>onclick="home2()"<%end if%>><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-home3" ></span></font></a></td><td onclick="exit()"><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-exit" ></span></font></a></td></tr></table>
      &nbsp;
    </div>
</div>
<div align="center" id="menu_inicio">
    <div id="detalle">
<%
Set conn12 = Server.CreateObject("ADODB.Connection")
set rs12= Server.CreateObject("adodb.recordset")
Conn12.Open connstr
sql12= "select * from tseguimiento where cr='" & session.Contents("cr") & "'"
rs12.open sql12,conn12
if rs12.eof then
%> 
<p>No se encontro la informacion solicitada</p> 
<%else%>     
      
     <p>Sucursal: <strong><%=rs12("Sucursal")%></strong></p>
     <p>Tipo de transformaci&oacute;n: <strong><%=rs12("TipoTransformacion")%></strong></p>
     <p>Contratista: <strong><%=buscaContratista(rs12("ContratistaAsignado"))%></strong><p>
			 
    </div>
<%
end if
rs12.close
conn12.close 
set rs12=nothing
set conn12=nothing
%> 	
 <div id="detalle">
      <p>CR: <strong><%=session.Contents("cr")%></strong></p>
	  <p>Pedido: <strong><%=buscaPedido(session.Contents("cr"))%></strong></p> 
<p><font color="blue">Ingresa el correo a donde llegara la estimacion</font></p>
<p><font color="blue">Para agregar mas destinatarios separalos por comas(,)</font></p> 
<p><font color="blue"><strong>NOTA:</strong> no dejes espacio entre los correos</font></p> 
<p><font color="blue">Asegurate de escribir los correos correctamente para que estos puedan llegar</font></p>  	  	  
 </div>

<table width="80%">
 <tr>
  <td><p><font color="blue">PARA</font></p></td><td><input type="text" placeholder="correo1@correo.com, correo2@correo.com" id="para" name="para"></td>
 </tr>
 <tr>
  <td><p><font color="blue">CC</font></p></td><td><input type="text" placeholder="correo1@correo.com, correo2@correo.com" id="cc" name="cc"></td>
 </tr>
</table>


<table width="50%">
<tr>
  <td align="center"><input class="botonGrande" type="button" value="Generar Estimacion" onclick="Enviar()" name="btnEnviar"/></td>
 </tr>
 <tr height="20px">
  <td>&nbsp;</td>
 </tr>


</table>

    <input type="hidden" value="<%=estimacionCorrespondiente%>"  id="hddnEnviar" name="hddnEnviar"/>
 

</div>
<!--fin Obras Civiles--> 
	  <a href="#" id="alert" style="display:none"></a>
      <a href="#" id="alert2" style="display:none">&nbsp;</a>
      <a href="#" id="alert3" style="display:none">&nbsp;</a> 
	  <a href="#" id="alert31" style="display:none">&nbsp;</a> 
      <a href="#" id="alert4" style="display:none">&nbsp;</a> 
	  <a href="#" id="alert5" style="display:none">&nbsp;</a> 
</div>
</form>
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
	alertify.error("No se pudo crear la estimacion");
	return false;
 });
 $("#alert2").on( 'click', function () {
	reset();
	alertify.success("Estimacion creada con Exito");
	alertify.alert("En unos minutos recibira la estimacion generada");
	return false;
	});
 $("#alert3").on( 'click', function () {
	reset();
	alertify.alert("Debes ingresar al menos 1 <strong>destinatario</strong>");
	return false;
  });
    $("#alert31").on( 'click', function () {
	reset();
	alertify.alert("Los correos <strong>CC</strong> no son validos");
	return false;
  });
  $("#alert4").on( 'click', function () {
	reset();
	alertify.alert("El tamaño excede el maximo permitido (6M)");
	return false;
  });	
   $("#alert5").on( 'click', function () {
	reset();
	alertify.alert("Los correos <strong>PARA</strong> no son validos");
	return false;
  });
</script>
</body>
</html>
