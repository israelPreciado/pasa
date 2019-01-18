
<!--#include file="funcion/funcion_lobby.inc"-->
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
 function Enviar(modulo){
	 <%if session.Contents("privilegio")="2" then%>
	 if(modulo==1){
	  document.getElementById('frm_modulos').action="avanceCostoObra_lobby.asp"
	 }else{
	 document.getElementById("frm_modulos").action="avanceObraHitos_lobby.asp"
	 }
	 <%else%>
	
	 	 if(modulo==1){
	  document.getElementById('frm_modulos').action="avanceCostoObra_lobby.asp"
	 }else{
	 document.getElementById("frm_modulos").action="avanceObraHitos_lobby.asp"
	 }
	 
	 <%end if%>
	 document.getElementById("hddnEnviar").value=modulo
	 document.getElementById("frm_modulos").submit()
 }

 function home(){
 	<%if session.Contents("privilegio")="2" then%>
	 	document.getElementById('frm_modulos').action="inicioSupervisor_lobby.asp"	
	 <%else%>
	 	document.getElementById('frm_modulos').action="inicioContratista_lobby.asp"	
	 <%end if%>
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
	document.getElementById('frm_modulos').action="detalleCR_lobby.asp"
	document.getElementById('frm_modulos').submit()
}
function tomarFoto(){
	document.getElementById('frm_modulos').action="tomarFoto_lobby.asp"
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
 function menuR3ros(){
	document.getElementById('frm_modulos').action="menuRequrimiento3ros.asp"
	document.getElementById('frm_modulos').submit()
}
</script>
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
<p><strong>Modulo de supervisi&oacute;n de Lobby</strong><p>   
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
 <div id="detalle">
      <p>CR: <strong><%=session.Contents("cr")%></strong></p>
 </div>



<table  width="80%" align="center">
<%
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
sql= "select * from cat_modulos_lobby where id_modulo=1"
rs.open sql,conn
if rs.eof then
%> 
<tr><td><p>No se encontro la informacion solicitada</p></td></tr>
<%
else
while not(rs.eof)
%>
<tr>
  <td align="center"><input class="botonGrande" type="button" value="<%=rs("modulo")%>" onclick="Enviar('<%=rs("id_modulo")%>')" name="btnEnviar"/></td>
 </tr>
 <tr height="20px">
  <td>&nbsp;</td>
 </tr>
 <tr height="20px">
 <td align="center"><input class="botonGrande" type="button" value="HITOS" onclick="Enviar('2')" name="btnEnviar"/></td>
 </tr>
 <tr height="20px">
  <td>&nbsp;</td>
 </tr>
 <tr>
  <td align="center"><input class="botonGrande" type="button" value="Archivo Fotografico" onclick="tomarFoto()" name="btnEnviar"/></td>
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

<!--<tr>
  <td align="center"><input class="botonGrande" type="button" value="Archivo Fotografico" onclick="tomarFoto()" name="btnEnviar"/></td>
 </tr>-->
  <tr height="20px">
  <td>&nbsp;</td>
 </tr>

</table>

    <input type="hidden" value="true"  id="hddnEnviar" name="hddnEnviar"/>
 

</div>
<!--fin Obras Civiles--> 
	  <a href="#" id="alert" style="display:none"></a>
      <a href="#" id="alert2" style="display:none">&nbsp;</a>
      <a href="#" id="alert3" style="display:none">&nbsp;</a> 
      <a href="#" id="alert4" style="display:none">&nbsp;</a> 
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
	alertify.error("No se pudo insertar control");
	return false;
 });
 $("#alert2").on( 'click', function () {
	reset();
	alertify.success("Foto cargada con exito");
	return false;
	});
 $("#alert3").on( 'click', function () {
	reset();
	alertify.alert("El tipo de formato no es compatible");
	return false;
  });
  $("#alert4").on( 'click', function () {
	reset();
	alertify.alert("El tamaño excede el maximo permitido (6M)");
	return false;
  });	
</script>
</body>
</html>
