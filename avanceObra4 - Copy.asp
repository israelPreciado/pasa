
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

 function enviarTotalPendientes(){
	document.getElementById('frm_avanceObra').action="totalPendientes.asp"
	document.getElementById('frm_avanceObra').submit();
}
 function home(){
	document.getElementById('frm_avanceObra').action="inicio.asp"
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
	document.getElementById('frm_avanceObra').action="modulos.asp"
	document.getElementById('frm_avanceObra').submit()
}

 function showGif(ocultar,mostrar,muestraControl,ocultaControl){
	 document.getElementById(ocultar).style.display="none"
	 document.getElementById(mostrar).style.display="block"
	 document.getElementById(muestraControl).style.display="block"
	 document.getElementById(ocultaControl).style.display="none"
 }
 function fieldUpdate(campo,cr,id){
	 if (document.getElementById('select' +id).selectedIndex==0){
		 simulateClick(document.getElementById('alert'))
		 document.getElementById('OB_load' +id).style.display="none"
		 document.getElementById('parrafo'+id).style.display="none"
		 document.getElementById('select'+id).style.display="block"
		 document.getElementById('OB_update' +id).style.display="block"
	 }
	 else{
		 updateAvanceObra(campo,cr,id,document.getElementById('select'+id).value)
	 }
	
	 //document.getElementById('frm_avanceObra').action='updateAvanceObra.asp?campo=' + campo + '&cr=' + cr
	 //document.getElementById('frm_avanceObra').submit()
	//updateAvanceObra(campo,cr,id)
 }
 function showEdit(id,valor){
	 if (valor=="err"){
		document.getElementById('OB_edit'+id).style.display="block"
		document.getElementById('OB_load' +id).style.display="none"
		document.getElementById('select'+id).style.display="none"
		document.getElementById('parrafo'+id).style.display="block"		
	 }
	 else{
		document.getElementById('OB_edit'+id).style.display="block"
		document.getElementById('OB_load' +id).style.display="none"
		document.getElementById('select'+id).style.display="none"
		document.getElementById('parrafo' + id).innerText=valor * 100 +" %"
		document.getElementById('parrafo'+id).style.display="block"
	 }
	 
 }
function updateAvanceObra(campo,cr,id,valor){
	 $.ajax({
	type: "GET",
	url: "updateAvanceObra.asp?campo=" + campo + "&cr=" + cr +"&valor=" +valor + "&tabla=" + 1,
	dataType: "html", 
	success: function(response){ 
	//$("#dedede").html(response);
	if (response=="err"){
		simulateClick(document.getElementById('alert2'))
		showEdit(id,'err')
		} 
		else{
			showEdit(id,valor)
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
<%if isempty(session("cr")) then
response.Redirect("default.asp?logout=true")
end if%>
<%modulo=request("hddnEnviar")
nombreModulo=buscaModulo(modulo)
%>
</head>

<body>

<form name="frm_avanceObra" id="frm_avanceObra" method="post">
<div id="pagina">
  <div id="header">
    <div id="logo">  
      <p><strong>Modulo de supervisi&oacute;n de Obra</strong></p>
    </div>
    <div id="barrasuperior">
    <table><tr><td width="35%" onclick="back()"><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-arrow-left"></span></font></a></td><td width="35%" <%if session.Contents("privilegio")=2 then%>onclick="home()"<%else%>onclick="home2()"<%end if%>><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-home3"></span></font></a></td><td onclick="exit()"><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-exit"></span></font></a></td></tr></table>
      &nbsp;
    </div>
  </div>
<!--inicio Obra Civil-->  
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
    <table width="100%">
     <tr>
      <td width="60%"><p>CR: <strong><%=session.Contents("cr")%></strong></p></td>
      <td><p><strong><%=nombreModulo%></strong></p></td>
      <td><p><strong>&nbsp;</strong></p></td>      
     </tr>
     <tr>
      <td width="60%"><p>&nbsp;</p></td>
      <td><p><strong>Sup</strong></p></td>
      <td><p><strong>Cont</strong></p></td>        
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
<%if modulo="3" then%>
	<tr>
      <td width="55%"><p><%=rs("componente")%></p></td>
      <td width="10%"><img src="images/logos/loading.gif"  id="OB_load<%=rs("id_componente")%>" style="display:none"/><img src="images/logos/update.png" id="OB_update<%=rs("id_componente")%>" onclick="showGif(this.id,'OB_load<%=rs("id_componente")%>','parrafo<%=rs("id_componente")%>','select<%=rs("id_componente")%>');fieldUpdate('<%=rs("nameBD")%>','<%=session.Contents("cr")%>',<%=rs("id_componente")%>)" style="display:none"/><%if session.Contents("privilegio")=2 then%><img src="images/logos/edit.png" id="OB_edit<%=rs("id_componente")%>" onclick="showGif(this.id,'OB_update<%=rs("id_componente")%>','select<%=rs("id_componente")%>','parrafo<%=rs("id_componente")%>')" <%if cargaAvance(rs("nameBD"),session.Contents("cr"))="NA" then%> style="display:none"<%end if%>/><%end if%></td>
      <td><%=cargaPorcentajesAvanceAtms(rs("id_componente"))%> <p id="parrafo<%=rs("id_componente")%>"><%=cargaAvance(rs("nameBD"),session.Contents("cr"))%></p></td><td><%=cargaPorcentajesAvanceAtms(rs("id_componente"))%> <p id="parrafo<%=rs("id_componente")%>"><%=cargaAvanceContratista(rs("nameBD"),session.Contents("cr"))%></p></td>    
     </tr>
<%else%>
<tr>
      <td width="55%"><p><%=rs("componente")%></p></td>
      <td width="10%"><img src="images/logos/loading.gif"  id="OB_load<%=rs("id_componente")%>" style="display:none"/><img src="images/logos/update.png" id="OB_update<%=rs("id_componente")%>" onclick="showGif(this.id,'OB_load<%=rs("id_componente")%>','parrafo<%=rs("id_componente")%>','select<%=rs("id_componente")%>');fieldUpdate('<%=rs("nameBD")%>','<%=session.Contents("cr")%>',<%=rs("id_componente")%>)" style="display:none"/><%if session.Contents("privilegio")=2 then%><img src="images/logos/edit.png" id="OB_edit<%=rs("id_componente")%>" onclick="showGif(this.id,'OB_update<%=rs("id_componente")%>','select<%=rs("id_componente")%>','parrafo<%=rs("id_componente")%>')" <%if cargaAvance(rs("nameBD"),session.Contents("cr"))="NA" then%> style="display:none"<%end if%>/><%end if%></td>
      <td><%=cargaPorcentajesAvance(rs("id_componente"))%> <p id="parrafo<%=rs("id_componente")%>"><%=cargaAvance(rs("nameBD"),session.Contents("cr"))%></p></td><td><%=cargaPorcentajesAvance(rs("id_componente"))%> <p id="parrafo<%=rs("id_componente")%>"><%=cargaAvanceContratista(rs("nameBD"),session.Contents("cr"))%></p></td>    
     </tr>
<%end if%>
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
<div align="center">
      <table width="80%" align="center">
      <%if session.Contents("privilegio")=2 then%>
        <tr>
          <td align="center"  style="padding-left:20px"><button type="button"  class="botonGrande" onclick="enviarPendientes()">Pendientes</button><input type="hidden"  id="hddnEnviar" name="hddnEnviar" value="<%=modulo%>"/><td>
        </tr>
        <tr height="20px">
         <td align="center">-<td>
        </tr>
       <%else%> 
        <tr>
          <td align="center" style="padding-left:20px"><button type="button"  class="botonGrande" onclick="enviarTotalPendientes()">Pendientes &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</button><input type="hidden"  id="hddnEnviar" name="hddnEnviar" value="<%=modulo%>"/></td>
        </tr>
       <%end if%> 
        <tr height="20px">
          <td>&nbsp;</td>
        </tr>
        </tr>
      </table>
  </div>
    <br />
<br />
 
 <a href="#" id="alert" style="display:none"></a>
      <a href="#" id="alert2" style="display:none">&nbsp;</a>
      <a href="#" id="alert3" style="display:none">&nbsp;</a>
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
			alertify.alert("Debes elegir un valor");
			return false;
		});
		$("#alert2").on( 'click', function () {
			reset();
			alertify.alert("El elemento no se pudo actualizar");
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
