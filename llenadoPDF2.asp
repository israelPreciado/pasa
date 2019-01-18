
<!--#include file="funcion/funcion.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Obras</title>

<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<link href="css/loginPDF.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
<link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />
<Script language="javascript">
 function Enviar(concepto,respustaStandard){

  if(respustaStandard==2){
	document.getElementById("frm_modulos").action="llenadoPDF3_1.asp"
  }
  if(respustaStandard==3){
	document.getElementById("frm_modulos").action="llenadoPDF3_2.asp"
  }
  else{
	document.getElementById("frm_modulos").action="llenadoPDF3.asp"
  }
	 document.getElementById("concepto").value=concepto
	 document.getElementById("respustaStandard").value=respustaStandard
	 document.getElementById("frm_modulos").submit()
 }
 function home(){
	document.getElementById('frm_modulos').action="inicio.asp"
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
	document.getElementById('frm_modulos').action="detalleCR.asp"
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
<%'if isempty(session("cr")) then
'response.Redirect("default.asp?logout=true")
'end if
capitulo=request("capitulo")
cr=request("cr")
%>
</head>
<body>
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


<table  width="80%" align="center">
<%
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
sql= "select a.id_concepto, b.concepto, c.respuetasStandard from cat_preguntas a LEFT JOIN cat_conceptos b on a.id_concepto=b.id_conceptos LEFT JOIN cat_capitulos c on a.id_capitulo=c.id_capitulo where a.id_capitulo=" & capitulo &  " GROUP BY a.id_concepto"
rs.open sql,conn
if rs.eof then
%> 
<tr><td><p>No se encontro la informacion solicitada</p></td></tr>
<%
else
while not(rs.eof)
%>
<tr>
<%if buscaCtrlCapitulosContestado(capitulo,rs("id_concepto"),cr) = "existe" then%>
  <td align="center"><input class="botonGrandeVerde" type="button" value="<%=Ucase(rs("concepto"))%>" onclick="simulateClick(alert5)" name="btnEnviar"/></td>
  <%else%>
  <td align="center"><input class="botonGrande" type="button" value="<%=Ucase(rs("concepto"))%>" onclick="Enviar('<%=rs("id_concepto")%>','<%=rs("respuetasStandard")%>')" name="btnEnviar"/></td>
  <%end if%> 
 </tr>
 <tr height="20px">
  <td>&nbsp;</td>
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

    <input type="hidden"  id="capitulo" name="capitulo" value="<%=capitulo%>"/>
	 <input type="hidden"  id="cr" name="cr" value="<%=cr%>"/>
	<input type="hidden"  id="concepto" name="concepto"/>
	<input type="hidden"  id="respustaStandard" name="respustaStandard"/>

</div>
<!--fin Obras Civiles--> 
	  <a href="#" id="alert" style="display:none"></a>
      <a href="#" id="alert2" style="display:none">&nbsp;</a>
      <a href="#" id="alert3" style="display:none">&nbsp;</a> 
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
  $("#alert5").on( 'click', function () {
	reset();
	alertify.alert("Este modulo ya fue completado");
	return false;
  });
</script>
</body>
</html>
