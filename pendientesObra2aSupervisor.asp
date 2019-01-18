
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
function confirmaSinFoto(idControl){
if(document.getElementById('fileFotografia').value==""){
			document.getElementById('idControl').value=idControl
			simulateClick(document.getElementById('confirm'))
		}
		else{
			agregar(idControl)
		}
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
   if(document.getElementById('fileFotografia').value==""){
document.getElementById('login').style.display="none"
	document.getElementById('loading').style.display="block"
   simulateClick(document.getElementById('alert4'))
			insertPendiente('<%=session.Contents("cr")%>',document.getElementById("input" + idControl).value,document.getElementById("hddnEnviar").value,document.getElementById("contratista").value)
		}
		else{
   	document.getElementById('login').style.display="none"
	document.getElementById('loading').style.display="block"
   simulateClick(document.getElementById('alert4'))
   document.getElementById('accion').value=1
	  control=idControl+1
	  document.getElementById("input" + idControl).disabled=true
	  document.getElementById("agregar" + idControl).style.display="none"
	  document.getElementById("edit" + idControl).style.display="block"
	  document.getElementById("input" + control).style.display = "block";
	  document.getElementById("agregar" + control).style.display="block"
	  document.getElementById('frm_avanceObra').action="guardaFotoPendiente.asp"
	  document.getElementById('pendiente').value=document.getElementById("input" + idControl).value
	  document.getElementById('frm_avanceObra').submit()
 	 } 
	  //insertPendiente(''session.Contents("cr")',document.getElementById("input" + idControl).value,document.getElementById("hddnEnviar").value,1)
   }
   else{

	   simulateClick(document.getElementById('alert2'))		
	   document.getElementById("agregar" + idControl).style.display="none"
	   document.getElementById("input" + idControl).disabled=true
	   document.getElementById("edit" + idControl).style.display="block"
	   document.getElementById('frm_avanceObra').action="guardaFotoPendiente.asp"
	   document.getElementById('pendiente').value=document.getElementById("input" + idControl).value
	   document.getElementById('accion').value=1
	   document.getElementById('frm_avanceObra').submit()
	   
	   //insertPendiente(''session.Contents("cr")',document.getElementById("input" + idControl).value,document.getElementById("hddnEnviar").value,1)

	   
   }
	}
 }
 function confirmaSinFotoUpdate(idControl){
if(document.getElementById('fileFotografia').value==""){
			document.getElementById('idControl').value=idControl
			simulateClick(document.getElementById('confirmUpdate'))
		}
		else{
			update(idControl)
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
if(document.getElementById('fileFotografia').value==""){
   	document.getElementById('login').style.display="none"
	document.getElementById('loading').style.display="block"
   simulateClick(document.getElementById('alert4'))
			updateSuc(document.getElementById("input" + idControl).value,idControl,document.getElementById('hddnEnviar').value)
		}
		else{
		   	document.getElementById('login').style.display="none"
	document.getElementById('loading').style.display="block"
   simulateClick(document.getElementById('alert4'))
	  document.getElementById("input" + idControl).disabled="false"
   	  document.getElementById("edit" + idControl).style.display="block"
	  document.getElementById("update" + idControl).style.display="none"
	  document.getElementById("input" + idControl).disabled="true"
	  document.getElementById('frm_avanceObra').action="guardaFotoPendiente.asp"
	  document.getElementById('pendiente').value=document.getElementById("input" + idControl).value
	  document.getElementById('accion').value=2
	  document.getElementById('id_pendiente').value=idControl
	  document.getElementById('frm_avanceObra').submit()
	}
	}
 }
 
 function edit(idControl){
	var control=0	
	  document.getElementById("input" + idControl).disabled=false;  
	  document.getElementById("agregar" + idControl).style.display="none"
	  document.getElementById("edit" + idControl).style.display="none"
	  document.getElementById("camara" + idControl).style.display="block"
	  document.getElementById("imagen" + idControl).style.display="none"
	  document.getElementById("update" + idControl).style.display="block"
	  document.getElementById('fileFotografia').value="" 
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
	document.getElementById('frm_avanceObra').action="insertPendiente2.asp?cr=" + cr + "&pendiente=" + pendiente + "&id_modulo=" + id_modulo + "&id_contratista=" + id_contratista
document.getElementById('frm_avanceObra').submit()
}
 function home(){
	 <%if session.Contents("privilegio")="2" then%>
	document.getElementById('frm_avanceObra').action="inicio.asp"
	<%else%>
	document.getElementById('frm_avanceObra').action="inicioContratista.asp"
	<%end if%>
	document.getElementById('frm_avanceObra').submit()
}
 function exit(){
	 document.getElementById('frm_avanceObra').action="cerrar_sesion.asp"
	 document.getElementById('frm_avanceObra').submit()
 }
 function back(){
	document.getElementById('frm_avanceObra').action="totalpendientes.asp"
	document.getElementById('frm_avanceObra').submit()
}
function updateSuc(pendiente,id_pendiente,modulo){
	
	document.getElementById('frm_avanceObra').action="updatePendiente2.asp?pendiente=" + pendiente + "&id_pendiente=" + id_pendiente + "&modulo=" + modulo
document.getElementById('frm_avanceObra').submit()


}

function validar2(idControl){

	document.getElementById('fileFotografia').click()

}
function verImagenes(idControl){
	document.getElementById('id_pendiente').value=idControl
	document.getElementById('frm_avanceObra').action="verImagenesPendientes.asp"
	document.getElementById('frm_avanceObra').submit()
}
session.Contents("cr")
</script>
<%if isempty(session("cr")) then
response.Redirect("default.asp?logout=true")
end if%>
<%
modulo=request("hddnEnviar")
nombreModulo=buscaModulo(modulo)
contratista=buscaContratistaAsignado(session.Contents("cr"))
%>

</head>
<body>
<form name="frm_avanceObra" id="frm_avanceObra" method="post" enctype="multipart/form-data">
<input type="hidden" id="hddnEnviar" name="hddnEnviar" value="<%=modulo%>"/>
<div id="pagina">
 
  <div id="header">
     
    <div id="logo">  
      <p><strong>Modulo de supervisi&oacute;n de Obra</strong></p>
    </div><!--fin div logo -->

    <div id="barrasuperior">
    <table><tr><td width="35%"><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-arrow-left" onclick="back()"></span></font></a></td><td width="35%"><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-home3" onclick="home()"></span></font></a></td><td><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-exit" onclick="exit()"></span></font></a></td></tr></table>
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
    		<p><strong>Pendientes a Supervisor</strong></p>
    	</div>
  		<div id="barrasuperior">
    		<table><tr><td><a class="a" href="#" style="padding-left:55%;"><span></span></a></td></tr></table>
  		</div>
  		<br />
           	</div>
    </div>
<!--fin Obras Civiles-->   
<table><tr><td>
 <div id="loading" style="display:none"><img class='loading' src="images/logos/ajax-loader.gif">  </div> 
 </td></tr>
 </table>
	    	<div id="login">
<table width="90%" align="center" style="padding-left:5%">
 
<%
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from pendientes_asupervisor a where cr=" & session.Contents("cr")
rs2.open sql3, conn3
if rs2.eof then
	rs2.close
	conn3.close 
	set rs2=nothing
	set conn3=nothing

else
	while not(rs2.eof)	
	%>
   			<tr>    
      			<td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(<%=rs2("id_pendiente")%>)" id="agregar<%=rs2("id_pendiente")%>" name="agregar<%=rs2("id_pendiente")%>"/>
					<img src="images/logos/edit.png" onclick="edit(<%=rs2("id_pendiente")%>)" id="edit<%=rs2("id_pendiente")%>" name="edit<%=rs2("id_pendiente")%>" style="display:block"/>
					<img src="images/logos/update.png" onclick="confirmaSinFotoUpdate(<%=rs2("id_pendiente")%>)" id="update<%=rs2("id_pendiente")%>" name="update<%=rs2("id_pendiente")%>" style="display:none"/></td>
				<td width="55%"><textarea class="area" id="input<%=rs2("id_pendiente")%>" name="input<%=rs2("id_pendiente")%>" type="text" style="display: block;" value="<%=rs2("pendiente")%>" disabled="disabled"><%=rs2("pendiente")%></textarea></td>
				<td align="left" width="15%" ><a href="#" style="padding-left:55%"><font style="font-size:200%"><span id="imagen<%=rs2("id_pendiente")%>" class="icon-image" onclick="verImagenes('<%=rs2("id_pendiente")%>')"></span></font></a></td>
				<td align="right" width="15%" ><a href="#" style="padding-left:55%"><font style="font-size:200%"><span id="camara<%=rs2("id_pendiente")%>" class="icon-camera" onclick="validar2('<%=rs2("id_pendiente")%>')" style="display:none"></span></font></a></td>
            </tr>
            
<%
	rs2.movenext
	wend 
rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
end if

%>
			<tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:block" onclick="confirmaSinFoto(5000100)" id="agregar5000100" name="agregar5000100"/><img src="images/logos/edit.png" onclick="edit(5000100)" id="edit5000100" name="edit5000100" style="display:none"/><img src="images/logos/update.png" onclick="update(5000100)" id="update5000100" name="update5000100" style="display:none"/></td><td><textarea class="area" id="input5000100" name="input5000100" style="overflow:auto;border:solid .3px #e9e9e9;"></textarea></td><td onclick="verImagenes('5000100')"><a href="#" style="padding-left:55%"><font style="font-size:200%"><span id="imagen5000100" class="icon-image" style="display:none"></span></font></a></td><td onclick="validar2()"><a href="#" style="padding-left:55%"><font style="font-size:200%"><span id="camara5000100" class="icon-camera"></span></font></a></td>    
     		</tr>
<%
For i = 5000101 To 5000200
%>			
			<tr>    
      			<td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(<%=i%>)" id="agregar<%=i%>" name="agregar<%=i%>"/><img src="images/logos/edit.png" onclick="edit(<%=i%>)" id="edit<%=i%>" name="edit<%=i%>" style="display:none"/><img src="images/logos/update.png" onclick="update(<%=i%>)" id="update<%=i%>" style="display:none"/></td><td><textarea class="area" id="input<%=i%>" name="input<%=i%>" type="text" style="display: none;" ></textarea></td><td onclick="verImagenes('<%=i%>')"><a href="#" style="padding-left:55%"><font style="font-size:200%"><span id="imagen<%=i%>" class="icon-image" style="display:none"></span></font></a></td><td onclick="validar2()"><a href="#" style="padding-left:55%"><font style="font-size:200%"><span id="camara<%=i%>" class="icon-camera" style="display:none"></span></font></a></td>
            </tr>
<%
next
%>
<tr>
<td align="center" colspan="2"><input class="botonGrande" type="file" id="fileFotografia" name="fileFotografia" ENCTYPE="multipart/form-data" style="display:none"/></td>
</tr>
        </table>
  
  </div>
<!--fin Obras Civiles--> 
	  <a href="#" id="alert" style="display:none"></a>
      <a href="#" id="alertFoto" style="display:none"></a>
      <a href="#" id="alert2" style="display:none">&nbsp;</a>
      <a href="#" id="alert3" style="display:none">&nbsp;</a> 
      <a href="#" id="alert4" style="display:none">&nbsp;</a> 
	  <a href="#" id="confirm" style="display:none">&nbsp;</a> 
	  <a href="#" id="confirmUpdate" style="display:none">&nbsp;</a>
</div>
<input type="hidden" id="pendiente" name="pendiente"/>
<input type="hidden" id="id_pendiente" name="id_pendiente"/>
<input type="hidden" id="accion" name="accion"/>
<input type="hidden" id="sinFoto" name="sinFoto"/>
<input type="hidden" id="idControl" name="idControl"/>
<input type="hidden" id="contratista" name="contratista" value="<%=contratista%>"/>
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
	alertify.alert("El campo de pendiente debe estar lleno");
	return false;
 });
 $("#alertFoto").on( 'click', function () {
	reset();
	alertify.alert("Debes cargar una foto");
	return false;
 });
 $("#alert2").on( 'click', function () {
	reset();
	alertify.alert("Ya no puedes agregar mas Cajas de Texto");
	return false;
	});
 $("#alert3").on( 'click', function () {
	reset();
	alertify.alert("Hay campos que aun no Actualizas");
	return false;
  });
  $("#alert41").on( 'click', function () {
	reset();
	alertify.alert("Elemento Actualizado Exitosamente");
	return false;
  });
$("#alert4").on( 'click', function () {
	reset();
	alertify.alert("Subiendo pendiente");
	alertify.success("Subiendo pendiente");
	alertify.success("esto puede tardar un poco");
	return false;
  });  
  $("#confirm").on( 'click', function () {
			reset();
			alertify.confirm("¿Quieres continuar sin cargar una foto?", function (e) {
				if (e) {
					document.getElementById('sinFoto').value="sinFoto"
					agregar(document.getElementById('idControl').value)
				}
			});
			return false;
		});
		 $("#confirmUpdate").on( 'click', function () {
			reset();
			alertify.confirm("¿Quieres continuar sin cargar una foto?", function (e) {
				if (e) {
					document.getElementById('sinFoto').value="sinFoto"
					update(document.getElementById('idControl').value)
				}
			});
			return false;
		});
</script>
</body>
</html>
