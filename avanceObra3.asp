
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
 function enviarPendientes(){
	document.getElementById('frm_avanceObra').action="pendientesObra2.asp"
	document.getElementById('frm_avanceObra').submit();
}
 function home(){
	document.getElementById('frm_avanceObra').action="inicio.asp"
	document.getElementById('frm_avanceObra').submit()
}
 function exit(){
	 document.getElementById('frm_avanceObra').action="cerrar_sesion.asp"
	 document.getElementById('frm_avanceObra').submit()
 }
 function back(){
	document.getElementById('frm_avanceObra').action="modulos.asp"
	document.getElementById('frm_avanceObra').submit()
}
function tomarFoto(){
	document.getElementById('frm_avanceObra').action="tomarFoto.asp"
	document.getElementById('frm_avanceObra').submit()
}
 function showGif(ocultar,mostrar,muestraControl,ocultaControl){
	 document.getElementById(ocultar).style.display="none"
	 document.getElementById(mostrar).style.display="block"
	 document.getElementById(muestraControl).style.display="block"
	 document.getElementById(ocultaControl).style.display="none"
 }
 function fieldUpdate(campo,cr,id){
	 //document.getElementById('frm_avanceObra').action='updateAvanceObra.asp?campo=' + campo + '&cr=' + cr
	 //document.getElementById('frm_avanceObra').submit()
	updateAvanceObra(campo,cr,id)
 }
function updateAvanceObra(campo,cr,id){
	 $.ajax({
	type: "GET",
	url: "updateAvanceObra.asp?campo=" + campo + "&cr=" + cr,
	dataType: "html", 
	success: function(response){ 
	//$("#dedede").html(response);
	if (response=="err"){
		alert("El elemento no se pudo actualizar")
		} 
		else{
			alert("ok")
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

 
</script>

</head>
<%modulo=request("hddnEnviar")
nombreModulo=buscaModulo(modulo)
%>
</head>

<body onload="updateAvanceObra('','0345','')">

<form name="frm_avanceObra" id="frm_avanceObra" method="post">
<div id="pagina">
  <div id="header">
    <div id="logo">  
      <p><strong>Modulo de supervisi&oacute;n de Obra</strong></p>
    </div>
    <div id="barrasuperior">
    <table><tr><td width="35%"><a href="#" style="padding-left:55%"><span class="icon-arrow-left" onclick="back()"></span></a></td><td width="35%"><a href="#" style="padding-left:55%"><span class="icon-home3" onclick="home()"></span></a></td><td><a href="#" style="padding-left:55%"><span class="icon-exit" onclick="exit()"></span></a></td></tr></table>
      &nbsp;
    </div>
  </div>
<!--inicio Obra Civil-->  

  <div align="center" id="menu_inicio">
    <div id="detalle">
    <table width="100%">
     <tr>
      <td width="70%"><p>CR: <strong><%=session.Contents("cr")%></strong></p></td>
      <td><p><strong><%=nombreModulo%></strong></p></td>     
     </tr>
    </table>
    </div>
    <br />
    <div id="detalle2">
    <table width="90%">
    
<%
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
sql= "select * from cat_componentes where id_modulo='" & modulo &"'"
rs.open sql,conn
if rs.eof then
%> 
	<tr>
      <td width="70%"><p>No se encontro el detalle buscado</p></td>    
     </tr>
<%
else
while not(rs.eof)
%>
	<tr>
      <td width="70%"><p><%=rs("componente")%></p></td>
      <td width="10%"><img src="images/logos/loading.gif"  id="OB_load<%=rs("id_componente")%>" style="display:none"/><img src="images/logos/update.png" id="OB_update<%=rs("id_componente")%>" onclick="showGif(this.id,'OB_load<%=rs("id_componente")%>','parrafo<%=rs("id_componente")%>','select<%=rs("id_componente")%>');fieldUpdate('<%=rs("nameBD")%>','<%=session.Contents("cr")%>',<%=rs("id_componente")%>)" style="display:none"/><img src="images/logos/edit.png" id="OB_edit<%=rs("id_componente")%>" onclick="showGif(this.id,'OB_update<%=rs("id_componente")%>','select<%=rs("id_componente")%>','parrafo<%=rs("id_componente")%>')"/></td>
      <td><%=cargaPorcentajesAvance(rs("id_componente"))%> <p id="parrafo<%=rs("id_componente")%>"><%=cargaAvance(rs("nameBD"),session.Contents("cr"))%></p></td>    
     </tr>

<%
rs.movenext
wend

end if
rs.close
conn.close 
set rs=nothing
set conn=nothing
%>   
    </table>
    </div>
    <br />
  </div>
  </div>
<!--fin Obras Civiles-->
<br />
<br />
    <div id="login" style="padding-left:10%">
      <table width="80%" align="center">
        <tr>
          <td align="center"><button type="button" class="botonGrande" onclick="enviarPendientes()">Pendientes &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</button><input type="hidden"  id="hddnEnviar" name="hddnEnviar" value="<%=modulo%>"/>
        </tr>
        <tr height="20px">
          <td>&nbsp;</td>
        </tr>
        <tr>
         <td align="center"><button type="button" class="botonGrande" onclick="tomarFoto()">Subir Foto &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class="icon-camera"></span></button><input type="hidden"  id="hddnEnviar" name="hddnEnviar" value="<%=modulo%>"/>
         </td>
        </tr>
      </table>
    </div>

<!--Fin Sistemas Config-->       
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
			alertify.alert("<strong>CR</strong>  no encontrado!");
			return false;
		});
		$("#alert2").on( 'click', function () {
			reset();
			alertify.alert("El <strong>CR</strong> solo debe contener <strong>numeros</strong>");
			return false;
		});
		$("#alert3").on( 'click', function () {
			reset();
			alertify.alert("El <strong>CR</strong>  debe ser de <strong>4</strong> digitos");
			return false;
		});

		
	</script>
</body>
</html>
