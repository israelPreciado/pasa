
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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<Script language="javascript">
function enviar(){
	document.getElementById('frm_informe_cr').action="modulos.asp"
	document.getElementById('frm_informe_cr').submit();
}
function validar2(idControl){
document.getElementById('hddnEnviar').value=idControl
	document.getElementById('fileFotografia').click()
}
function agregar(idControl){
	var control=0
	var bandera=false
	familia=document.getElementById("input" + idControl).value;
	if (familia.length == 0 || /^\s+$/.test(familia)){
		simulateClick(document.getElementById('alert'))	
		document.getElementById("input" + idControl).value=""
		document.getElementById("input" + idControl).focus();
		bandera=false
	}
	else{
		bandera=true
	}
	if (bandera==true){

   if(idControl<5000200){
	  control=idControl+1
	  document.getElementById("input" + idControl).disabled=true
	  document.getElementById("agregar" + idControl).style.display="none"
	  document.getElementById("edit" + idControl).style.display="block"
	  
	  document.getElementById("input" + control).style.display = "block";
	  document.getElementById("agregar" + control).style.display="block"   	  
	  insertPendiente('<%=session.Contents("cr")%>',document.getElementById("input" + idControl).value,document.getElementById("hddnEnviar").value,1)
   }
   else{
	   simulateClick(document.getElementById('alert2'))		
	   document.getElementById("agregar" + idControl).style.display="none"
	   document.getElementById("input" + idControl).disabled=true
	   document.getElementById("edit" + idControl).style.display="block"
	   insertPendiente('<%=session.Contents("cr")%>',document.getElementById("input" + idControl).value,document.getElementById("hddnEnviar").value,1)

	   
   }
	}
 }
 
 function update(idControl){
	var control=0
	var bandera=false
	familia=document.getElementById("input" + idControl).value;
	if (familia.length == 0 || /^\s+$/.test(familia)){
		simulateClick(document.getElementById('alert'))	
		document.getElementById("input" + idControl).value=""
		document.getElementById("input" + idControl).focus();
		bandera=false
	}
	else{
		bandera=true
	}
	if (bandera==true){

	  document.getElementById("input" + idControl).disabled="false"
   	  document.getElementById("edit" + idControl).style.display="block"
	  document.getElementById("update" + idControl).style.display="none"
	  document.getElementById("input" + idControl).disabled="true"
	  updateSuc(document.getElementById("input" + idControl).value,idControl)
	}
 }
 
 function edit(idControl){
	var control=0	
	  document.getElementById("input" + idControl).disabled=false;  
	  document.getElementById("agregar" + idControl).style.display="none"
	  document.getElementById("edit" + idControl).style.display="none"
	  document.getElementById("update" + idControl).style.display="block"
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

 function recorreElementos(){
	var elemento = document.getElementById('login').getElementsByTagName('img');
	var nombre
	var res
	for (var i=0; i<elemento.length; i++){
		str = document.getElementById(elemento[i].name).name
		res = str.substring(0, 6);
		if (res=="update" && document.getElementById(elemento[i].name).style.display=="block"){
			simulateClick(document.getElementById('alert3'))
			break	
		}
		else{
			document.getElementById('frm_avanceObra').submit()
		}
	}
}
function insertPendiente(cr,pendiente,id_modulo,id_contratista){
	$.ajax({
	type: "GET",
	url: "insertPendiente.asp?cr=" + cr + "&pendiente=" + pendiente + "&id_modulo=" + id_modulo + "&id_contratista=" + id_contratista, 
	dataType: "html", 
	success: function(response){ 
	var insert=response
	//$("#dedede").html(response);
	if (insert=="err"){
		alert("El elemento no se pudo insertar")
		} 
	//else{
		//alert("LA SUCURSAL SE DIO DE ALTA CON EXITO")
	//	recorreElementosVaciar()
	//	}
	}
  });
}
 function home(){
	document.getElementById('frm_avanceObra').action="inicioSupervisor.asp"
	document.getElementById('frm_avanceObra').submit()
}
 function home2(){
	document.getElementById('frm_avanceObra').action="inicioContratista.asp"
	document.getElementById('frm_avanceObra').submit()
}
 function exit(){
	 document.getElementById('frm_avanceObra').action="cerrar_sesion.asp"
	 document.getElementById('frm_avanceObra').submit()
 }
 function back(){
	document.getElementById('frm_avanceObra').action="autorizarCostoObra.asp"
	document.getElementById('frm_avanceObra').submit()
}
 function advertencia(id){
	 document.getElementById('hddnControl').value=id
	 if (document.getElementById('parrafo'+id).textContent=="T"){
	 simulateClick(document.getElementById('alert3'))	
	}
	else{
	<%if session.Contents("privilegio")=3 then%>
		if (document.getElementById('camara'+id).style.display=="block"){
			if(document.getElementById('fileFotografia').value==""){
				//simulateClick(document.getElementById('alertFoto'))
				simulateClick(document.getElementById('alertSubiendoFoto'))
				document.getElementById('id_pendiente').value=id
				document.getElementById('pendiente').value=document.getElementById('input'+id).value
				document.getElementById('frm_avanceObra').action="guardaFotoPendiente.asp"
				document.getElementById('frm_avanceObra').submit()
			}
			else{
				simulateClick(document.getElementById('alertSubiendoFoto'))
				document.getElementById('id_pendiente').value=id
				document.getElementById('pendiente').value=document.getElementById('input'+id).value
				document.getElementById('comentario').value=document.getElementById('input_comentario'+id).value
				document.getElementById('frm_avanceObra').action="guardaFotoPendiente.asp"
				document.getElementById('frm_avanceObra').submit()
				//updateTotalPendientes(document.getElementById('hddnControl').value)
				//alertify.success("Estatus cambiado con Exito");
				return true;
			}
		}
		else{
			simulateClick(document.getElementById('confirm'))
		}
		<%else%>
		 simulateClick(document.getElementById('alert32'))	
	<%end if%>	
	}
	 
 }
 function updateTotalPendientes(id){
updateSuc(id)

}
function updateSuc(id_pendiente){
	$.ajax({
	type: "GET",
	url: "updateTotalPendientes.asp?id_pendiente=" + id_pendiente, 
	dataType: "html", 
	success: function(response){ 
	var update=response
	//$("#dedede").html(response);
	if (update=="err"){
		alert("El elemento no se pudo actualizar")
		} 
	else{
		document.getElementById('parrafo'+id_pendiente).innerHTML="T"
		}
	}
  });
}
function show(id){
	document.getElementById('tabla' + id).style.display="block"
	document.getElementById('more' + id).style.display="none"
	document.getElementById('minus' + id).style.display="block"
}
function cover(id){
	document.getElementById('tabla' + id).style.display="none"
	document.getElementById('more' + id).style.display="block"
	document.getElementById('minus' + id).style.display="none"
}
function verImagenes(idControl){
	document.getElementById('id_pendiente').value=idControl
	document.getElementById('frm_avanceObra').action="verImagenesPendientes.asp"
	document.getElementById('frm_avanceObra').submit()
}
function verDetalle(componente){
detSearchCostoEstimado(componente)

}
function detSearchCostoEstimadSucursal(){

	$.ajax({
	type: "GET",
	url: "searchCostoEstimado.asp?cr=" + document.getElementById('cr').value, 
	dataType: "html", 
	success: function(response){ 

	$("#costoEstimado").html(response)

	}
  });

}

function detSearchCostoEstimadPartida(){

	$.ajax({
	type: "GET",
	url: "searchCostoEstimadoPartida.asp?cr=" + document.getElementById('cr').value + "&componente=" + document.getElementById('componente').value , 
	dataType: "html", 
	success: function(response){ 

	$("#costoEstimadoPartida").html(response)

	}
  });

}


function detSearchCostoEstimado(id){
	$.ajax({
	type: "GET",
	url: "searchDetalleClaveSap.asp?id=" + id, 
	dataType: "html", 
	success: function(response){ 

	$("#id01").html(response)
	simulateClick(document.getElementById('button1'))
	}
  });

}

function detUpdateCantidad(id,cantidad){
	$.ajax({
	type: "GET",
	url: "updateCantidadConceptoSapSupervisor.asp?id=" + id + "&cantidad=" + cantidad, 
	dataType: "html", 
	success: function(response){ 
	var update=response
	//$("#dedede").html(response);
	if (update=="err"){
		alert("El elemento no se pudo actualizar")
		} 
	else{
		document.getElementById('cantidad_'+id).innerHTML=cantidad
	//	document.getElementById('frm_avanceObra').action="autorizarCostoObra.asp"
	//document.getElementById('frm_avanceObra').submit()
		}
	}
  });
}

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
function updatecantidad(id,caja){
if (validarCampo(caja)){
document.getElementById('id01').style.display='none'
cantidad=document.getElementById(caja).value
detUpdateCantidad(id,cantidad)
detSearchCostoEstimadSucursal()
detSearchCostoEstimadPartida()
}

}
function soloNumeros(e){
	var key = window.Event ? e.which : e.keyCode
	return (key >= 46 && key <= 57)
}

function validarCampo(cajaTexto){	
	familia=document.getElementById(cajaTexto).value;
	if (familia.length == 0 || /^\s+$/.test(familia)){
		alert("Debes ingresar un valor")
		document.getElementById(cajaTexto).value=""
		document.getElementById(cajaTexto).focus();
		return false
	}
	else
	{
		if (/^[0-9\.]+$/.test(familia)){
			if(isNaN(familia)){
				alert('La cantidad ingresada no es valida');
				document.getElementById(cajaTexto).focus();
				return false
			}
			else
			{
				return true	
			}
		}
		else
		{
			alert('NO SE PUEDEN INCLUIR CARACTERES ESPECIALES');
			document.getElementById(cajaTexto).focus();
			return false
		}		
	}
}
</script>
<%if isempty(session("cr")) then
response.Redirect("default.asp?logout=true")
end if%>
<%
componente=request("componente")
%>

</head>
<body onload="detSearchCostoEstimadSucursal();detSearchCostoEstimadPartida()">

<div class="w3-container">
  <div id="id01" class="w3-modal">
   
  </div>
</div>

<form name="frm_avanceObra" id="frm_avanceObra" method="get" enctype="multipart/form-data">
<input class="botonGrande" type="file" id="fileFotografia" name="fileFotografia" ENCTYPE="multipart/form-data" style="display:none"/>
<input type="hidden" id="hddnEnviar" name="hddnEnviar" value="<%=modulo%>"/>
<div id="pagina">
 
  <div id="header">
     
    <div id="logo">  
      <p><strong>Modulo de supervisi&oacute;n de Obra</strong></p>
    </div><!--fin div logo -->

    <div id="barrasuperior">
    <table><tr><td width="35%"  onclick="back()"><a href="#" style="padding-left:55%"><font style="font-size:200%; color:#fff"><span class="icon-arrow-left"></span></font></a></td><td width="35%"  <%if session.Contents("privilegio")=2 then%>onclick="home()"<%else%>onclick="home2()"<%end if%>><a href="#" style="padding-left:55%"><font style="font-size:200%;color:#fff""><span class="icon-home3"></span></font></a></td><td  onclick="exit()"><a href="#" style="padding-left:55%"><font style="font-size:200%; color:#fff""><span class="icon-exit"></span></font></a></td></tr></table>
      &nbsp;
    </div>
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
	  <%if session.Contents("privilegio")=2 then%>
      <p>Contratista: <strong><%=buscaContratista(rs12("ContratistaAsignado"))%></strong><p>
	  <%else%>
		 <%if session.Contents("privilegio")=3 then%>
		 <p>Supervisor: <strong><%=buscaSupervisor(rs12("supervisorAsignado"))%></strong><p>
		 <%else%>
			<p>Contratista: <strong><%=buscaContratista(rs12("ContratistaAsignado"))%></strong><p>
			<p>Supervisor: <strong><%=buscaSupervisor(rs12("supervisorAsignado"))%></strong><p>
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
      					<td><p><strong><%=nombreModulo%></strong></p></td>     
     				</tr>
   				 </table>
    		</div>
    	</div>
		<br />
  		<div id="logo">  
    		<p><strong>Distribuci&oacute;n del Costo de Obra</strong></p>
			<p>Partida: <strong><%=componente%></strong></p>
			<table width="100%"><tr><td width="50%"><p><strong><div id="costoEstimado"><%=costoEstimado(session.Contents("cr"))%></div></strong></p></td></tr></table>    
             <table width="100%"><tr><td width="50%"><p><strong><div id="costoEstimadoPartida"><%=costoEstimadoPartida(session.Contents("cr"),componente)%></div></strong></p></td></tr></table>    
    	</div>
  		<div id="barrasuperior">
    		<table><tr><td><a class="a" href="#" style="padding-left:55%;"><spans></span></a></td></tr></table>
  		</div>
  		<br />
           	</div>
    </div>
<!--fin Obras Civiles-->     
	    	<div id="loginee">
<table width="90%" align="center" style="padding-left:5%">


 <%
set conn3=server.CreateObject("adodb.connection")
set rs6=server.CreateObject("adodb.recordset")
set rs3=server.CreateObject("adodb.recordset")
conn3.open connstr
if componente="otros" then
sql4= "select id,CLAVE_SAP_CONCURSO,clave_sap_zona,descorta as descripcion_corta,deslarga as descripcion_larga,pu,cantidad,und,cantidad * pu as estimacion,componente,fecha_ingreso from nuevocosto_estimadoobra where componente = '" & componente &"' and cr='" & session.Contents("cr") &"';"
else
sql4= "select a.id,a.CLAVE_SAP_CONCURSO,a.clave_sap_zona,b.DESCRIPCION_CORTA,b.DESCRIPCION_LARGA,a.pu,a.cantidad,b.und,a.cantidad * a.pu as estimacion,a.componente,a.fecha_ingreso from nuevocosto_estimadoobra a LEFT JOIN cat_sap_2017 b on a.CLAVE_SAP_CONCURSO=b.CLAVE_SAP_CONCURSO where a.componente = '" & componente &"' and cr='" & session.Contents("cr") &"'; "
end if

rs3.open sql4, conn3
if rs3.eof then
	rs3.close
	conn3.close 
	set rs3=nothing
	set conn3=nothing

else
while not (rs3.eof)
%>
		<tr>
		 <th width="5%"></th>
         <th width="20%"><p style="font-size:-2">Clave Sap</p></th>
         <th width="65%"><p style="font-size:-2">Des. Corta</p></th>
		 <th width="8%"  align="center"><p style="font-size:-2">Cant.</p></th>
		 <th width="2%" align="right"><p style="font-size:-2">UND</p></th>
		</tr>
        <tr>
		 <td width="5%" onclick="verDetalle('<%=rs3("id")%>')"><p style="font-size:48px"><strong><span class="icon-search"></span></strong></p></td>
         <td width="20%"  align="center"><font size="-1"><p><%=rs3("clave_sap_concurso")%></p></font></td>
         <td width="65%" align="left"><font size="-1"><p><%=rs3("descripcion_corta")%></p></font></td>
		 <td width="8%" align="center"><font size="-1"><p id='cantidad_<%=rs3("id")%>'><%=rs3("cantidad")%></p></font></td>
		 <td width="2%" align="right"><font size="-1"><p><%=rs3("und")%></p></font></td>
         </tr>
         
         <tr height="12px">
          <td colspan="3">&nbsp;</td>
         </tr>
         

<%
rs3.movenext
wend 
rs3.close
conn3.close 
set rs6=nothing
set conn3=nothing
end if
%>

<input type="hidden" id="hddnControl" name="hddnControl"/>
<input type="hidden" id="cr" name="cr" value="<%=session.contents("cr")%>"/>
<input type="hidden" id="id_pendiente" name="id_pendiente"/>
<input type="hidden" id="componente" name="componente" value="<%=componente%>"/>
<input type="hidden" id="cierraPendiente" name="cierraPendiente" value="cerrar"/>
<input type="hidden" id="contratista" name="contratista" value="<%=contratista%>"/>

        </table>
  
  </div>
  

<!--fin Obras Civiles--> 
	  <a href="#" id="confirm" style="display:none"></a>
      <a href="#" id="alert2" style="display:none">&nbsp;</a>
      <a href="#" id="alert3" style="display:none">&nbsp;</a> 
	   <a href="#" id="alert32" style="display:none">&nbsp;</a> 
      <a href="#" id="alert4" style="display:none">&nbsp;</a> 
	  <a href="#" id="alertFoto" style="display:none"></a>
	  <a href="#" id="alertSubiendoFoto" style="display:none"></a>
	  
</div>


</form>
  <button id="button1" onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-black" style="display:none">Open Modal</button>
  
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
	alertify.alert("TODOS LOS CAMPOS DEBEN ESTAR LLENOS");
	return false;
 });
 $("#alert2").on( 'click', function () {
	reset();
	alertify.alert("Ya no puedes agregar mas Cajas de Texto");
	return false;
	});
 $("#alert3").on( 'click', function () {
	reset();
	alertify.error("El elemento ya esta Cerrado");
	return false;
  });
     $("#alert32").on( 'click', function () {
	reset();
	alertify.alert("Solo el contratista puede cerrar el pendiente");
	return false;
  });
  $("#alert4").on( 'click', function () {
	reset();
	alertify.alert("Elemento Actualizado Exitosamente");
	return false;
  });	
  $("#alertFoto").on( 'click', function () {
	reset();
	alertify.alert("Puedes cargar una foto antes de cerrar el pendiente");
	return false;
 });
 $("#alertSubiendoFoto").on( 'click', function () {
	reset();
	alertify.success("Cerrando Pendiente");
	alertify.success("Esto puede tardar un poco");
	return false;
 });
  $("#confirm").on( 'click', function () {
			reset();
			alertify.confirm("¿Quieres cambiar el estatus de este pendiente?", function (e) {
				if (e) {
					var control=document.getElementById('hddnControl').value
					document.getElementById('imagen' + control).style.display="none"
					document.getElementById('camara' + control).style.display="block"
					document.getElementById('pInstruccion' + control).style.display="block"
					document.getElementById('input_comentario' + control).style.display="block"
					if(document.getElementById('fileFotografia').value==""){
						simulateClick(document.getElementById('alertFoto'))
					}
					else{
						updateTotalPendientes(document.getElementById('hddnControl').value)
						alertify.success("Estatus cambiado con Exito");
						return true;
					}
				}
			});
			return false;
		});
</script>
</body>
</html>
