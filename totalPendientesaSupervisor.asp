
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
	document.getElementById('frm_avanceObra').action="detalleCR.asp"
	document.getElementById('frm_avanceObra').submit()
}
 function advertencia(id){
	 document.getElementById('hddnControl').value=id
	 if (document.getElementById('parrafo'+id).textContent=="T"){
	 simulateClick(document.getElementById('alert3'))	
	}
	else{
		if (document.getElementById('camara'+id).style.display=="block"){
			if(document.getElementById('fileFotografia').value==""){
				//simulateClick(document.getElementById('alertFoto'))
				simulateClick(document.getElementById('alertSubiendoFoto'))
				document.getElementById('id_pendiente').value=id
				document.getElementById('sinFoto').value="sinFoto"
				document.getElementById('pendiente').value=document.getElementById('input'+id).value
				document.getElementById('frm_avanceObra').action="guardaFotoPendienteASupervisorCel.asp"
				document.getElementById('frm_avanceObra').submit()
			}
			else{
				simulateClick(document.getElementById('alertSubiendoFoto'))
				document.getElementById('id_pendiente').value=id
				document.getElementById('pendiente').value=document.getElementById('input'+id).value
				document.getElementById('frm_avanceObra').action="guardaFotoPendienteASupervisorCel.asp"
				document.getElementById('frm_avanceObra').submit()
				//updateTotalPendientes(document.getElementById('hddnControl').value)
				//alertify.success("Estatus cambiado con Exito");
				return true;
			}
		}
		else{
			simulateClick(document.getElementById('confirm'))
		}
	}
	 
 }
 function updateTotalPendientes(id){
 alert(id)
//updateSuc(id)

}
function updateSuc(id_pendiente){
alert(id_pendiente)
	$.ajax({
	type: "GET",
	url: "updateCerrarPendientesaSupervisor.asp?id_pendiente=" + id_pendiente, 
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
	document.getElementById('frm_avanceObra').action="verImagenesPendientesSupervisorAdmin.asp"
	document.getElementById('frm_avanceObra').submit()
}
</script>
<%if isempty(session("cr")) then
response.Redirect("default.asp?logout=true")
end if%>
<%
modulo=request("hddnEnviar")
nombreModulo=buscaModulo(modulo)

%>

</head>
<body>
<form name="frm_avanceObra" id="frm_avanceObra" method="post" enctype="multipart/form-data">
<input type="hidden" id="hddnEnviar" name="hddnEnviar" value="<%=modulo%>"/>
<div id="pagina">
 
  <div id="header">
     
    <div id="logo">  
      <p><strong>Modulo de supervisi&oacute;n de Obra <%=modulo%></strong></p>
    </div><!--fin div logo -->

    <div id="barrasuperior">
    <table><tr><td width="35%"  onclick="back()"><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-arrow-left"></span></font></a></td><td width="35%"  <%if session.Contents("privilegio")=2 then%>onclick="home()"<%else%>onclick="home2()"<%end if%>><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-home3"></span></font></a></td><td  onclick="exit()"><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-exit"></span></font></a></td></tr></table>
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
      <p>Contratista: <strong><%=buscaContratista(rs12("ContratistaAsignado"))%></strong><p>
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
    		<p><strong>Relaci&oacute;n de Pendientes a Supervisor</strong></p>
             <table width="100%"><tr><td width="50%"><p>(A) Abierto</p></td><td><p>(T) Terminado</p></td></tr></table>    
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
sql4= "select * from cat_modulos where id_modulo='1'"

rs3.open sql4, conn3
if rs3.eof then
	rs3.close
	conn3.close 
	set rs3=nothing
	set conn3=nothing

else
while not (rs3.eof)
sql3= "SELECT a.*, CASE WHEN b.abiertos IS NULL THEN 0 ELSE b.abiertos END AS abiertos, CASE WHEN c.cerrados IS NULL THEN 0 ELSE c.cerrados END AS cerrados FROM pendientes_asupervisor a LEFT JOIN( SELECT cr AS cr, count(*) AS abiertos FROM pendientes_asupervisor WHERE cr = '" & session.Contents("cr") & "' AND id_estatus = 1) b ON a.cr = b.cr LEFT JOIN( SELECT cr, count(*) AS cerrados FROM pendientes_asupervisor WHERE cr = '" & session.Contents("cr") & "' AND id_estatus = 0) c ON a.cr = c.cr WHERE a.cr = '" & session.Contents("cr") & "';"
	rs6.open sql3, conn3
	if rs6.eof then
		rs6.close
		%>
		<tr>
         <td width="40%">
          <table style="display:block" width="100%">
		 <%
	else
	%>
        <tr>
         <td width="10%"><p style="font-size:48px"><strong>Pendientes</strong></p></td>
         <td width="15%"><img src="images/logos/drillDown.png" style="display:block" onclick="show(<%=rs3("id_modulo")%>)" width="96%" id="more<%=rs3("id_modulo")%>" name="more<%=rs3("id_modulo")%>"/><img src="images/logos/drillUp.png" style="display:none" onclick="cover(<%=rs3("id_modulo")%>)" id="minus<%=rs3("id_modulo")%>" name="minus<%=rs3("id_modulo")%>" width="32"/></td>
         <td width="70%"><pre style="font-size:32px; font-family:Arial, Helvetica, sans-serif">  (A) <font color="#2882c3"><strong><%=rs6("abiertos")%></strong></font>      (T) <font color="#2882c3"><strong><%=rs6("cerrados")%></strong></font></pre></td>
         </tr>
         
         <tr height="12px">
          <td colspan="3">&nbsp;</td>
         </tr>
         
 		<tr>
         <td colspan="3">
          <table style="display:none" id="tabla<%=rs3("id_modulo")%>">
         <%
		while not(rs6.eof)	
		%>
		
   			<tr>    
      			<td width="10%" valign="middle" align="center"><p id="parrafo<%=rs6("id_pendiente")%>" onclick="advertencia('<%=rs6("id_pendiente")%>')" style="text-decoration:underline; font-size:64px; color:#d51818"><strong><%if rs6("id_estatus")="1" then response.write("A") else response.Write("T") end if%></strong></p></td>
				<td colspan="2"><textarea class="area" id="input<%=rs6("id_pendiente")%>" name="input<%=rs6("id_pendiente")%>" type="text" style="display: block;" value="<%=rs6("pendiente")%>" disabled="disabled"><%=rs6("pendiente")%></textarea></td>
				<td><a href="#" style="padding-left:55%"><font style="font-size:200%"><span id="imagen<%=rs6("id_pendiente")%>" class="icon-image" onclick="verImagenes('<%=rs6("id_pendiente")%>')"></span></font></a></td>
				<td><a href="#" style="padding-left:55%"><font style="font-size:200%"><span id="camara<%=rs6("id_pendiente")%>" class="icon-camera" style="display:none" onclick="validar2(<%=rs3("id_modulo")%>)"></span></font></a></td>
            </tr>
            
<%
	rs6.movenext
	wend 
rs6.close
end if
%>
  </table>
  </td></tr>
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
<input type="hidden" id="pendiente" name="pendiente"/>
<input type="hidden" id="id_pendiente" name="id_pendiente"/>
<input type="hidden" id="sinFoto" name="sinFoto"/>
<input type="hidden" id="cierraPendiente" name="cierraPendiente" value="cerrar"/>
<input type="hidden" id="contratista" name="contratista" value="<%=contratista%>"/>
<input class="botonGrande" type="file" id="fileFotografia" name="fileFotografia" ENCTYPE="multipart/form-data" style="display:none"/>
        </table>
  
  </div>
<!--fin Obras Civiles--> 
	  <a href="#" id="confirm" style="display:none"></a>
      <a href="#" id="alert2" style="display:none">&nbsp;</a>
      <a href="#" id="alert3" style="display:none">&nbsp;</a> 
      <a href="#" id="alert4" style="display:none">&nbsp;</a> 
	  <a href="#" id="alertFoto" style="display:none"></a>
	  <a href="#" id="alertSubiendoFoto" style="display:none"></a>
	  
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
