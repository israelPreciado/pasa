
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
	document.getElementById('frm_avanceObra').action="avanceCostoObra.asp"
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
document.getElementById('elemento').value=componente
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
function detSearchCostoExcesoPorPartida(){

	$.ajax({
	type: "GET",
	url: "SearchCostoExcesoPorPartida.asp?cr=" + document.getElementById('cr').value + "&componente=" + document.getElementById('componente').value , 
	dataType: "html", 
	success: function(response){ 

	$("#costoEstimadoExcexoPartida").html(response)

	}
  });

}



function detSearchCostoEstimaoPorPartida(){

	$.ajax({
	type: "GET",
	url: "searchCostoEstimadoPorPartida.asp?cr=" + document.getElementById('cr').value + "&componente=" + document.getElementById('componente').value , 
	dataType: "html", 
	success: function(response){ 

	$("#costoEstimadoPorPartida").html(response)

	}
  });

}

function detSearchCostoEstimado(id){
	$.ajax({
	type: "GET",
	url: "searchDetalleClaveSap_AvanceCostoObra.asp?id=" + id, 
	dataType: "html", 
	success: function(response){ 

	$("#id01").html(response)
	simulateClick(document.getElementById('button1'))
	}
  });

}

function detSearchAvanceElemento(id){
	$.ajax({
	type: "GET",
	url: "searchAvanceElemento.asp?id=" + id, 
	dataType: "html", 
	success: function(response){ 

	$("#avance" + id).html(response)
	}
  });

}
function detSearchAvanceElementoContratista(id){
	$.ajax({
	type: "GET",
	url: "searchAvanceElementoContratista.asp?id=" + id, 
	dataType: "html", 
	success: function(response){ 

	$("#avanceContratista" + id).html(response)
	}
  });

}

function detSearchElementoCerrado(id){
	$.ajax({
	type: "GET",
	url: "searchElementoCerrado.asp?id=" + id, 
	dataType: "html", 
	success: function(response){ 
	if (response=="1") {
		simulateClick(document.getElementById('alert3'))
	}
	else{
		verDetalle(id)
	}
	}
  });

}

function detUpdateCantidad(id,cantidad){
	$.ajax({
	type: "GET",
	url: "updateCantidadAvanceCostoEstimado.asp?id=" + id + "&cantidad=" + cantidad + "&cr=" + document.getElementById("cr").value, 
	dataType: "html", 
	success: function(response){ 
	var update=response
	//$("#dedede").html(response);
	if (update=="max"){
		simulateClick(document.getElementById('UpdateMax'))	
		}
		else{
			if (update=="maxEx"){
				simulateClick(document.getElementById('UpdateMaxEx'))	
			}
			else{
			if (update=="okE"){
				simulateClick(document.getElementById('UpdateOK'))	
				simulateClick(document.getElementById('EstimacionOK'))	
				simulateClick(document.getElementById('EstimacionOK2'))	
				//detSearchCostoEstimadPorPartida()
				//detSearchCostoEstimadoPorPartida()
				detSearchCostoEstimaoPorPartida()
				detSearchCostoExcesoPorPartida()
				detSearchAvanceElemento(id)
			}
			else{
				simulateClick(document.getElementById('UpdateOK'))	
				//detSearchCostoEstimadPorPartida()
				//detSearchCostoEstimadoPorPartida()
				detSearchCostoEstimaoPorPartida()
				detSearchCostoExcesoPorPartida()
				detSearchAvanceElemento(id)
			}
		}
		}	
		
	}
  });
}

function detUpdateCantidadContratista(id,cantidad){
	$.ajax({
	type: "GET",
	url: "updateCantidadAvanceCostoEstimadoContratista.asp?id=" + id + "&cantidad=" + cantidad + "&cr=" + document.getElementById("cr").value, 
	dataType: "html", 
	success: function(response){ 
	var update=response
	//$("#dedede").html(response);
	if (update=="max"){
		simulateClick(document.getElementById('UpdateMax'))	
		} 
		else{
		simulateClick(document.getElementById('UpdateOK'))	
		//detSearchCostoEstimadPorPartida()
		detSearchAvanceElementoContratista(id)
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
function updatecantidad(id,caja,max){
if (validarCampo(caja)){
document.getElementById('id01').style.display='none'
cantidad=document.getElementById(caja).value
document.getElementById('cantMax').value=max
//if(parseFloat(document.getElementById(caja).value) > parseFloat(document.getElementById('cantMax').value)){
//simulateClick(document.getElementById('max'))	
//}
//else{
detUpdateCantidad(id,cantidad)
//}

//alert(cantidad)


//detSearchCostoEstimadSucursal()
//detSearchCostoEstimadPartida()
}

}

function updatecantidadContratista(id,caja,max){
if (validarCampo(caja)){
document.getElementById('id01').style.display='none'
cantidad=document.getElementById(caja).value
document.getElementById('cantMax').value=max
//if(parseFloat(document.getElementById(caja).value) > parseFloat(document.getElementById('cantMax').value)){
//simulateClick(document.getElementById('max'))	
//}
//else{
detUpdateCantidadContratista(id,cantidad)
//}

//alert(cantidad)


//detSearchCostoEstimadSucursal()
//detSearchCostoEstimadPartida()
}

}

function cerrarConcepto(id){
detCerrarConcepto(id)
}

function detCerrarConcepto(id){
//alert(id)
	$.ajax({
	type: "GET",
	url: "updateCerrarConcepto.asp?id=" + id, 
	dataType: "html", 
	success: function(response){ 
	var update=response
	//$("#dedede").html(response);
	if (update=="ok"){
		simulateClick(document.getElementById('UpdateOK'))	
		} 
		else{
			if (update=="okE"){
				simulateClick(document.getElementById('UpdateOK'))	
				simulateClick(document.getElementById('EstimacionOK'))	
				simulateClick(document.getElementById('EstimacionOK2'))	
			}
			else{
				if (update=="max"){
					simulateClick(document.getElementById('UpdateMax'))	
				}
				else{
					if (update=="noClose"){
						simulateClick(document.getElementById('NoClose'))	
					}
					else{alert(update)}
				}
			}
		//detSearchCostoEstimadPorPartida()
		//detSearchAvanceElementoContratista(id)
		}
	}
  });
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
<body onload="detSearchCostoEstimadSucursal();detSearchCostoEstimadPartida();detSearchCostoEstimaoPorPartida();detSearchCostoExcesoPorPartida()">

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
    		<p><strong>Actualizar Avance de Obra</strong></p>
			<p>Partida: <strong><%=componente%></strong></p>
			<table width="100%"><tr><td width="50%"><p><strong><div id="costoEstimado"><%=costoEstimado(session.Contents("cr"))%></div></strong></p></td></tr></table>    
             <table width="100%"><tr><td width="50%"><p><strong><div id="costoEstimadoPartida"><%=costoEstimadoPartida(session.Contents("cr"),componente)%></div></strong></p></td></tr></table>    
			 <table width="100%"><tr><td width="50%"><p><div id="costoEstimadoPorPartida"><font size="+2"><strong>Porcentaje de Avance de la Partida:  <%=porcentajeAvancePartida(session.Contents("cr"),componente)%> %</strong><font></div></p></td></tr></table>
			 <table width="100%"><tr><td width="50%"><p><div id="costoEstimadoExcexoPartida"><font size="+2"><strong>Porcentaje de Exceso de la Partida:  <%=porcentajeExcesoPartida(session.Contents("cr"),componente)%> %</strong><font></div></p></td></tr></table>
    	</div>
  		<div id="barrasuperior">
    		<table><tr><td><a class="a" href="#" style="padding-left:55%;"><spans></span></a></td></tr></table>
  		</div>
  		<br />
           	</div>
    </div>
<!--fin Obras Civiles-->     
	    	<div id="loginee">

			
<!--SUPERVISOR-->
<%
 if session.contents("privilegio")="2" then%>	
<!-- empieza el contenido-->	
			
<!--Inicio contenido-->    
	<table width="90%" align="center" style="padding-left:5%">


 <%
set conn3=server.CreateObject("adodb.connection")
set rs6=server.CreateObject("adodb.recordset")
set rs3=server.CreateObject("adodb.recordset")
conn3.open connstr
if componente="Otros" then
sql4= "select id,CLAVE_SAP_CONCURSO,clave_sap_zona,descorta as descripcion_corta,deslarga as descripcion_larga,pu,cantidad,und,cantidad * pu as estimacion,componente,fecha_ingreso, avance,round(avanceContratista,2) as avanceContratista,case when avanceCompletado =1 then 'rojo' when avanceCompletado is null and avance is null then 'verde' else 'amarillo' end as color, avanceCompletado from nuevocosto_estimadoobra where componente = '" & componente &"' and cr='" & session.Contents("cr") &"'  order by CLAVE_SAP_CONCURSO desc;"
'sql4= "select id,CLAVE_SAP_CONCURSO,clave_sap_zona,descorta as descripcion_corta,deslarga as descripcion_larga,pu,cantidad,und,cantidad * pu as estimacion,componente,fecha_ingreso, avance,round(avanceContratista,2) as avanceContratista,case when avanceCompletado =1 then 'rojo' when avanceCompletado is null and avance is null then 'verde' else 'amarillo' end as color, avanceCompletado from nuevocosto_estimadoobra where componente = '" & componente &"' and cr='" & session.Contents("cr") &"' and avanceContratista is not null order by CLAVE_SAP_CONCURSO desc;"
else
if componente="ATMS" then
sql4= "select a.id,a.CLAVE_SAP_CONCURSO,a.clave_sap_zona,b.DESCRIPCION_CORTA,b.DESCRIPCION_LARGA,a.pu,a.cantidad,b.und,a.cantidad * a.pu as estimacion,a.componente,a.fecha_ingreso, avance,round(avanceContratista,2) as avanceContratista,case when avanceCompletado =1 then 'rojo' when avanceCompletado is null and avance is null then 'verde' else 'amarillo' end as color, avanceCompletado from nuevocosto_estimadoobra a LEFT JOIN cat_sap_atms_2017 b on a.CLAVE_SAP_CONCURSO=b.CLAVE_SAP_CONCURSO where a.componente = '" & componente &"' and cr='" & session.Contents("cr") &"' group by a.CLAVE_SAP_CONCURSO order by CLAVE_SAP_CONCURSO desc; "
'sql4= "select a.id,a.CLAVE_SAP_CONCURSO,a.clave_sap_zona,b.DESCRIPCION_CORTA,b.DESCRIPCION_LARGA,a.pu,a.cantidad,b.und,a.cantidad * a.pu as estimacion,a.componente,a.fecha_ingreso, avance,round(avanceContratista,2) as avanceContratista,case when avanceCompletado =1 then 'rojo' when avanceCompletado is null and avance is null then 'verde' else 'amarillo' end as color, avanceCompletado from nuevocosto_estimadoobra a LEFT JOIN cat_sap_atms_2017 b on a.CLAVE_SAP_CONCURSO=b.CLAVE_SAP_CONCURSO where a.componente = '" & componente &"' and cr='" & session.Contents("cr") &"' and avanceContratista is not null order by CLAVE_SAP_CONCURSO desc; "
else
sql4= "select a.id,a.CLAVE_SAP_CONCURSO,a.clave_sap_zona,b.DESCRIPCION_CORTA,b.DESCRIPCION_LARGA,a.pu,a.cantidad,b.und,a.cantidad * a.pu as estimacion,a.componente,a.fecha_ingreso, avance,round(avanceContratista,2) as avanceContratista,case when avanceCompletado =1 then 'rojo' when avanceCompletado is null and avance is null then 'verde' else 'amarillo' end as color, avanceCompletado from nuevocosto_estimadoobra a LEFT JOIN cat_sap_2017 b on a.CLAVE_SAP_CONCURSO=b.CLAVE_SAP_CONCURSO where a.componente = '" & componente &"' and cr='" & session.Contents("cr") &"' group by a.CLAVE_SAP_CONCURSO order by CLAVE_SAP_CONCURSO desc; "
'sql4= "select a.id,a.CLAVE_SAP_CONCURSO,a.clave_sap_zona,b.DESCRIPCION_CORTA,b.DESCRIPCION_LARGA,a.pu,a.cantidad,b.und,a.cantidad * a.pu as estimacion,a.componente,a.fecha_ingreso, avance,round(avanceContratista,2) as avanceContratista,case when avanceCompletado =1 then 'rojo' when avanceCompletado is null and avance is null then 'verde' else 'amarillo' end as color, avanceCompletado from nuevocosto_estimadoobra a LEFT JOIN cat_sap_2017 b on a.CLAVE_SAP_CONCURSO=b.CLAVE_SAP_CONCURSO where a.componente = '" & componente &"' and cr='" & session.Contents("cr") &"' and avanceContratista is not null order by CLAVE_SAP_CONCURSO desc; "
end if
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
         <th width="20%"><p style="font-size:2em">Clave Sap</p></th>
         <th width="37%"><p style="font-size:2em">Des. Corta</p></th>
		 <th width="8%"  align="center"><p style="font-size:2em">Cant.</p></th>
		 <th width="2%" align="center"><p style="font-size:2em">UND</p></th>
		 <th width="14%" align="center"><p style="font-size:2em">SUP.</p></th>
		 <th width="14%" align="center"><p style="font-size:2em">CONT.</p></th>
		</tr>
        <tr>
		 <td width="5%" onclick="detSearchElementoCerrado('<%=rs3("id")%>')"><p style="font-size:48px"><strong><span class="icon-search"></span></strong></p></td>
         <td width="20%"  align="center"><%if rs3("color")="rojo" then%><p style="font-size:1.5em;color:red;"><strong><%else%><%if rs3("color")="amarillo" then%><p style="font-size:1.5em;color:#E8B526;"><strong><%else%><%if rs3("color")="verde" then%><p style="font-size:1.5em;color:green;"><strong><%else%><p style="font-size:1.5em;"><strong><%end if%><%end if%><%end if%><%=rs3("clave_sap_concurso")%></strong></p></td>
         <td width="37%" align="left"><p style="font-size:1.5em"><%=rs3("descripcion_corta")%></p></td>
		 <td width="8%" align="center"><p style="font-size:2em" id='cantidad_<%=rs3("id")%>'><%=rs3("cantidad")%></p></td>
		 <td width="2%" align="center"><p style="font-size:2em"><%=rs3("und")%></p></td>
		 <td width="14%" align="center"><p style="font-size:2em" id='avance<%=rs3("id")%>'><%=rs3("avance")%></p></td>
		 <td width="14%" align="center"><p style="font-size:2em" id='avanceContratista<%=rs3("id")%>'><%=rs3("avanceContratista")%></p></td>
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
<input type="hidden" id="cantMax" name="cantMax"/>
<input type="hidden" id="componente" name="componente" value="<%=componente%>"/>
<input type="hidden" id="cierraPendiente" name="cierraPendiente" value="cerrar"/>
<input type="hidden" id="contratista" name="contratista" value="<%=contratista%>"/>
<input type="hidden" id="elemento" name="elemento"/>
        </table>
<!--fin contenido-->
<!--CONTRATISTA-->
<%else%>
<!-- empieza el contenido-->	
			
<!--Inicio contenido-->    
	<table width="90%" align="center" style="padding-left:5%">


 <%
set conn3=server.CreateObject("adodb.connection")
set rs6=server.CreateObject("adodb.recordset")
set rs3=server.CreateObject("adodb.recordset")
conn3.open connstr
if componente="Otros" then
sql4= "select id,CLAVE_SAP_CONCURSO,clave_sap_zona,descorta as DESCRIPCION_CORTA,deslarga as DESCRIPCION_LARGA,pu,cantidad,und,cantidad * pu as estimacion,componente,fecha_ingreso, avance,case when avanceContratista is null then avanceContratista else round(avanceContratista,2) end as avanceContratista,case when avanceCompletado =1 then 'rojo' when avanceCompletado is null and avance is null then 'verde' else 'amarillo' end as color, avanceCompletado from nuevocosto_estimadoobra where componente = '" & componente &"' and cr='" & session.Contents("cr") &"' order by CLAVE_SAP_CONCURSO desc;"
else
if componente="ATMS" then
sql4= "select a.id,a.CLAVE_SAP_CONCURSO,a.clave_sap_zona,b.DESCRIPCION_CORTA,b.DESCRIPCION_LARGA,a.pu,a.cantidad,b.und,a.cantidad * a.pu as estimacion,a.componente,a.fecha_ingreso, avance,case when avanceContratista is null then avanceContratista else round(avanceContratista,2) end as avanceContratista,case when avanceCompletado =1 then 'rojo' when avanceCompletado is null and avance is null then 'verde' else 'amarillo' end as color, avanceCompletado  from nuevocosto_estimadoobra a LEFT JOIN cat_sap_atms_2017 b on a.CLAVE_SAP_CONCURSO=b.CLAVE_SAP_CONCURSO where a.componente = '" & componente &"' and cr='" & session.Contents("cr") &"' order by CLAVE_SAP_CONCURSO desc; "
else
sql4= "select a.id,a.CLAVE_SAP_CONCURSO,a.clave_sap_zona,b.DESCRIPCION_CORTA,b.DESCRIPCION_LARGA,a.pu,a.cantidad,b.und,a.cantidad * a.pu as estimacion,a.componente,a.fecha_ingreso, avance,case when avanceContratista is null then avanceContratista else round(avanceContratista,2) end as avanceContratista,case when avanceCompletado =1 then 'rojo' when avanceCompletado is null and avance is null then 'verde' else 'amarillo' end as color, avanceCompletado  from nuevocosto_estimadoobra a LEFT JOIN cat_sap_2017 b on a.CLAVE_SAP_CONCURSO=b.CLAVE_SAP_CONCURSO where a.componente = '" & componente &"' and cr='" & session.Contents("cr") &"' order by CLAVE_SAP_CONCURSO desc; "
end if
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
         <th width="20%"><p style="font-size:2em">Clave Sap</p></th>
         <th width="37%"><p style="font-size:2em">Des. Corta</p></th>
		 <th width="8%"  align="center"><p style="font-size:2em">Cant.</p></th>
		 <th width="2%" align="center"><p style="font-size:2em">UND</p></th>
		 <th width="14%" align="center"><p style="font-size:2em">SUP.</p></th>
		 <th width="14%" align="center"><p style="font-size:2em">CONT.</p></th>
		</tr>
        <tr>
		 <td width="5%" onclick="detSearchElementoCerrado('<%=rs3("id")%>')"><p style="font-size:48px"><strong><span class="icon-search"></span></strong></p></td>
        <td width="20%"  align="center"><%if rs3("color")="rojo" then%><p style="font-size:1.5em;color:red;"><strong><%else%><%if rs3("color")="amarillo" then%><p style="font-size:1.5em;color:#E8B526;"><strong><%else%><%if rs3("color")="verde" then%><p style="font-size:1.5em;color:green;"><strong><%else%><p style="font-size:1.5em;"><strong><%end if%><%end if%><%end if%><%=rs3("clave_sap_concurso")%></strong></p></td>
         <td width="37%" align="left"><p style="font-size:1.5em"><%=rs3("descripcion_corta")%></p></td>
		 <td width="8%" align="center"><p style="font-size:2em" id='cantidad_<%=rs3("id")%>'><%=rs3("cantidad")%></p></td>
		 <td width="2%" align="center"><p style="font-size:2em"><%=rs3("und")%></p></td>
		 <td width="14%" align="center"><p style="font-size:2em" id='avance<%=rs3("id")%>'><%=rs3("avance")%></p></td>
		 <td width="14%" align="center"><p style="font-size:2em" id='avanceContratista<%=rs3("id")%>'><%=rs3("avanceContratista")%></p></td>
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
<input type="hidden" id="cantMax" name="cantMax"/>
<input type="hidden" id="componente" name="componente" value="<%=componente%>"/>
<input type="hidden" id="cierraPendiente" name="cierraPendiente" value="cerrar"/>
<input type="hidden" id="contratista" name="contratista" value="<%=contratista%>"/>
<input type="hidden" id="elemento" name="elemento"/>

        </table>
<!--fin contenido-->	
<%end if%> 
  </div>
  

<!--fin Obras Civiles--> 
	  <a href="#" id="confirm" style="display:none"></a>
      <a href="#" id="alert2" style="display:none">&nbsp;</a>
      <a href="#" id="alert3" style="display:none">&nbsp;</a> 
	   <a href="#" id="alert32" style="display:none">&nbsp;</a> 
      <a href="#" id="alert4" style="display:none">&nbsp;</a> 
	  <a href="#" id="max" style="display:none">&nbsp;</a> 
	  <a href="#" id="alertFoto" style="display:none"></a>
	  <a href="#" id="UpdateOK" style="display:none"></a>
	  <a href="#" id="UpdateMax" style="display:none"></a>
	  <a href="#" id="NoClose" style="display:none"></a>
	  <a href="#" id="UpdateMaxEx" style="display:none"></a>
	  <a href="#" id="EstimacionOK" style="display:none"></a>
	  <a href="#" id="EstimacionOK2" style="display:none"></a>
	  
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
	 $("#max").on( 'click', function () {
	reset();
	alertify.alert("La cantidad no puede ser mayor a " +  document.getElementById('cantMax').value);
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
 $("#UpdateOK").on( 'click', function () {
	reset();
	alertify.success("Actualizacion Correcta");
	return false;
 });
  $("#EstimacionOK").on( 'click', function () {
	reset();
	alertify.success("Estimacion Alcanzada");
	return false;
 });
 $("#EstimacionOK2").on( 'click', function () {
	reset();
	alertify.alert("Estimado Supervisor, ya puede realizar la estimacion correspondiente a esta Sucursal");
	return false;
 });
 $("#UpdateMax").on( 'click', function () {
	reset();
	alertify.error("Se Excede para Estimacion");
	return false;
 });
  $("#UpdateMaxEx").on( 'click', function () {
	reset();
	alertify.error("Se Excede mas del <strong>9.99 %</strong> del total Auorizado");
	return false;
 });
  $("#NoClose").on( 'click', function () {
	reset();
	alertify.error("Este elemento no se puede cerrar");
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
