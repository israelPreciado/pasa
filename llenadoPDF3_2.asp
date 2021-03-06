
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
<style>
section {
  display: flex;
  flex-flow: row wrap;
}
section > div {
  flex: 1;
  padding: 0.5rem;
}
input[type="radio"] {
  display: none;
  &:not(:disabled) ~ label {
    cursor: pointer;
  }
  &:disabled ~ label {
    color: hsla(150, 5%, 75%, 1);
    border-color: hsla(150, 5%, 75%, 1);
    box-shadow: none;
    cursor: not-allowed;
  }
}
label {
  height: 100%;
  display: block;
  background: white;
  border: 2px solid hsla(150, 75%, 50%, 1);
  border-radius: 20px;
  padding: 1rem;
  margin-bottom: 1rem;
  //margin: 1rem;
  text-align: center;
  box-shadow: 0px 3px 10px -2px hsla(150, 5%, 65%, 0.5);
  position: relative;
}

input[type="radio"]:checked + label {
  background: hsla(150, 75%, 50%, 1);
  color: hsla(215, 0%, 100%, 1);
  box-shadow: 0px 0px 20px hsla(150, 100%, 50%, 0.75);
  &::after {
    color: hsla(215, 5%, 25%, 1);
    font-family: FontAwesome;
    border: 2px solid hsla(150, 75%, 45%, 1);
    content: "\f00c";
    font-size: 24px;
    position: absolute;
    top: -25px;
    left: 50%;
    transform: translateX(-50%);
    height: 50px;
    width: 50px;
    line-height: 50px;
    text-align: center;
    border-radius: 50%;
    background: white;
    box-shadow: 0px 2px 5px -2px hsla(0, 0%, 0%, 0.25);
  }
}

@media only screen and (max-width: 700px) {
  section {
    flex-direction: column;
  }
}

</style>
<Script language="javascript">
 function Enviar(modulo){
	 document.getElementById("frm_modulos").action="llenadoPDF4.asp"
	 document.getElementById("hddnEnviar").value=modulo
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
 
 function showComentarios(div,respuesta){
	//alert(div)
	if (respuesta>2){
	document.getElementById(div).style.display="block"
	}
	else{
	document.getElementById(div).style.display="none"
	}
 }
 
 function guardar(){
if (validaRadio()){
//document.getElementById('frm_modulos').action="llenadoPDF4.asp"
 //document.getElementById('frm_modulos').submit()
 validaTipo()
}
else{
 simulateClick(alert5)
}
 //document.getElementById('frm_modulos').action="llenadoPDF4.asp"
 //document.getElementById('frm_modulos').submit()
 }
 
function validarCaja(cajaTexto){	
	familia=document.getElementById(cajaTexto).value;
	if (familia.length == 0 || /^\s+$/.test(familia)){
		document.getElementById(cajaTexto).value=""
		document.getElementById(cajaTexto).focus();
		return false
	}
	else
	{
			return true		
	}
}

</script>
<%'if isempty(session("cr")) then
'response.Redirect("default.asp?logout=true")
'end if
capitulo=request("capitulo")
concepto=request("concepto")
cr=request("cr")
respustaStandard=request("respustaStandard")
response.write(capitulo)
response.write(concepto)
%>
</head>
<body>
<form name="frm_modulos" id="frm_modulos" method="get">
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

<%if respustaStandard="3" and concepto="9" then%>
<table  width="80%" align="center">
<%
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
sql= "select * from cat_preguntas a LEFT JOIN preguntas_coordenadas b on a.id_pregunta =b.id_pregunta where id_capitulo=" & capitulo &" and id_concepto=" & concepto & " and b.id_tipoRespuesta=1"
rs.open sql,conn
	if rs.eof then
%> 
<tr><td><p>No se encontro la informacion solicitada</p></td></tr>
<%
	else
i=6
%>

<tr>
  <td align="center"><h1>EQUIPO(S) DE AIRE ACONDICIONADO</h1></td>
 </tr>
 
<tr>
  <td align="center"><p id="parrafoPregunta123">1.- Tipo</p></td>
 </tr>
 
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="EAA_123" name="EAA_123" placeholder="Tipo" maxlength="17" >
</div>
</section>
</td>
 </tr>
 
 <tr>
  <td align="center"><p id="parrafoPregunta124">2.- Marca</p></td>
 </tr>
 
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="EAA_124" name="EAA_124" placeholder="Marca" maxlength="15" >
</div>
</section>
</td>
 </tr>
 
 <tr>
  <td align="center"><p id="parrafoPregunta125">3.- Modelo</p></td>
 </tr>
 
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="EAA_125" name="EAA_125" placeholder="Modelo" maxlength="13" >
</div>
</section>
</td>
 </tr>
 
 <tr>
  <td align="center"><p id="parrafoPregunta126">4.- No. Serie</p></td>
 </tr>
 
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="EAA_126" name="EAA_126" placeholder="No. Serie" maxlength="11" >
</div>
</section>
</td>
 </tr>
 
 <tr>
  <td align="center"><p id="parrafoPregunta127">5.- No. Inventario</p></td>
 </tr>
 
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="EAA_127" name="EAA_127" placeholder="No. Inventario" maxlength="11" >
</div>
</section>
</td>
 </tr>
 
 <tr>
  <td align="center"><p id="parrafoPregunta128">6.- Capacidad</p></td>
 </tr>
 
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="EAA_128" name="EAA_128" placeholder="Capacidad" maxlength="17" >
</div>
</section>
</td>
 </tr>
 <%
while not(rs.eof)
i=i+1
%>
 <tr>
  <td align="center"><p id="parrafoPregunta<%=capitulo%>_<%=concepto%>_<%=rs("id_pregunta")%>"><%=i%>.- <%=rs("pregunta")%></p></td>
 </tr>
		<%if i>6 then%>
 <tr>
  <td align="center">

<section>
<div>
  <input type="radio" id="control_E<%=rs("id_pregunta")%>" name="cond_<%=rs("id_pregunta")%>" value="1">
  <label for="control_E<%=rs("id_pregunta")%>">
    <h2>Excelente</h2>
  </label>
</div>
<div>
  <input type="radio" id="control_B<%=rs("id_pregunta")%>" name="cond_<%=rs("id_pregunta")%>" value="2">
  <label for="control_B<%=rs("id_pregunta")%>">
    <h2>Bueno</h2>
  </label>
</div>
<div>
  <input type="radio" id="control_R<%=rs("id_pregunta")%>" name="cond_<%=rs("id_pregunta")%>" value="3">
  <label for="control_R<%=rs("id_pregunta")%>">
    <h2>Regular</h2>
  </label>
</div>
<div>
  <input type="radio" id="control_M<%=rs("id_pregunta")%>" name="cond_<%=rs("id_pregunta")%>" value="4">
  <label for="control_M<%=rs("id_pregunta")%>">
    <h2>Malo</h2>
  </label>
</div>
</section>
</td>
  </tr>
  
  <tr height="80px">
  <td> <section>
&nbsp;
</section>
</td>
 </tr>
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="tipo_<%=rs("id_pregunta")%>" name="tipo_<%=rs("id_pregunta")%>" placeholder="Tipo" maxlength="9" >
</div>
</section>
</td>
 </tr>
		<%if rs("id_pregunta")=133 then%>
<tr height="80px">
  <td> <section>
<div>
  <input type="text" id="lectura_V_A_B_<%=rs("id_pregunta")%>" name="lectura_V_A_B_<%=rs("id_pregunta")%>" placeholder="Lectura V(A-B)" maxlength="6" >
</div>
</section>
</td>
 </tr>
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="lectura_V_B_C_<%=rs("id_pregunta")%>" name="lectura_V_B_C_<%=rs("id_pregunta")%>" placeholder="Lectura V(B-C)" maxlength="6" >
</div>
</section>
</td>
 </tr>
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="lectura_V_C_A_<%=rs("id_pregunta")%>" name="lectura_V_C_A_<%=rs("id_pregunta")%>" placeholder="Lectura V(C-A)" maxlength="5" >
</div>
</section>
</td>
 </tr>
		<%else%>
			<%if rs("id_pregunta")=134 then%>
<tr height="80px">
  <td> <section>
<div>
  <input type="text" id="lectura_amp_A_<%=rs("id_pregunta")%>" name="lectura_amp_A_<%=rs("id_pregunta")%>" placeholder="Lectura Amp (A)" maxlength="5" >
</div>
</section>
</td>
 </tr>
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="lectura_amp_B_<%=rs("id_pregunta")%>" name="lectura_amp_B_<%=rs("id_pregunta")%>" placeholder="Lectura Amp (B)" maxlength="5" >
</div>
</section>
</td>
 </tr>
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="lectura_amp_C_<%=rs("id_pregunta")%>" name="lectura_amp_C_<%=rs("id_pregunta")%>" placeholder="Lectura Amp (C)" maxlength="4" >
</div>
</section>
</td>
 </tr>
			<%else%>
<tr height="80px">
  <td> <section>
<div>
  <input type="text" id="comentarios_<%=rs("id_pregunta")%>" name="comentarios_<%=rs("id_pregunta")%>" placeholder="Lectura o Comentarios" maxlength="42" >
</div>
</section>
</td>
 </tr>
			<%end if%>
		<%end if%>
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
<input type="button" class="botonGrande" value="Guardar" onclick="guardar()"/>

    <input type="hidden"  id="capitulo" name="capitulo" value="<%=capitulo%>"/>
	<input type="hidden"  id="concepto" name="concepto" value="<%=concepto%>"/>
		 <input type="hidden"  id="cr" name="cr" value="<%=cr%>"/>
	<input type="hidden"  id="respustaStandard" name="respustaStandard" value="<%=respustaStandard%>"/>
</div>

<%else%>


<%if respustaStandard="3" and concepto="10" then%>
<table  width="80%" align="center">
<%
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
sql= "select * from cat_preguntas a LEFT JOIN preguntas_coordenadas b on a.id_pregunta =b.id_pregunta where id_capitulo=" & capitulo &" and id_concepto=" & concepto & " and b.id_tipoRespuesta=1"
rs.open sql,conn
	if rs.eof then
%> 
<tr><td><p>No se encontro la informacion solicitada</p></td></tr>
<%
	else
i=0
while not(rs.eof)
i=i+1
%>
 <tr>
  <td align="center"><p id="parrafoPregunta<%=capitulo%>_<%=concepto%>_<%=rs("id_pregunta")%>"><%=i%>.- <%=rs("pregunta")%></p></td>
 </tr>

 <tr>
  <td align="center">

<section>
<div>
  <input type="radio" id="control_E<%=rs("id_pregunta")%>" name="cond_<%=rs("id_pregunta")%>" value="1">
  <label for="control_E<%=rs("id_pregunta")%>">
    <h2>Excelente</h2>
  </label>
</div>
<div>
  <input type="radio" id="control_B<%=rs("id_pregunta")%>" name="cond_<%=rs("id_pregunta")%>" value="2">
  <label for="control_B<%=rs("id_pregunta")%>">
    <h2>Bueno</h2>
  </label>
</div>
<div>
  <input type="radio" id="control_R<%=rs("id_pregunta")%>" name="cond_<%=rs("id_pregunta")%>" value="3">
  <label for="control_R<%=rs("id_pregunta")%>">
    <h2>Regular</h2>
  </label>
</div>
<div>
  <input type="radio" id="control_M<%=rs("id_pregunta")%>" name="cond_<%=rs("id_pregunta")%>" value="4">
  <label for="control_M<%=rs("id_pregunta")%>">
    <h2>Malo</h2>
  </label>
</div>
</section>
</td>
  </tr>
  
  <tr height="80px">
  <td> <section>
&nbsp;
</section>
</td>
 </tr>
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="tipo_<%=rs("id_pregunta")%>" name="tipo_<%=rs("id_pregunta")%>" placeholder="Tipo" maxlength="9" >
</div>
</section>
</td>
 </tr>
		<%if rs("id_pregunta")=138 then%>
<tr height="80px">
  <td> <section>
<div>
  <input type="text" id="lectura_V_A_B_<%=rs("id_pregunta")%>" name="lectura_V_A_B_<%=rs("id_pregunta")%>" placeholder="Lectura V(A-B)" maxlength="6" >
</div>
</section>
</td>
 </tr>
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="lectura_V_B_C_<%=rs("id_pregunta")%>" name="lectura_V_B_C_<%=rs("id_pregunta")%>" placeholder="Lectura V(B-C)" maxlength="6" >
</div>
</section>
</td>
 </tr>
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="lectura_V_C_A_<%=rs("id_pregunta")%>" name="lectura_V_C_A_<%=rs("id_pregunta")%>" placeholder="Lectura V(C-A)" maxlength="5" >
</div>
</section>
</td>
 </tr>
		<%else%>
			<%if rs("id_pregunta")=139 then%>
<tr height="80px">
  <td> <section>
<div>
  <input type="text" id="lectura_amp_A_<%=rs("id_pregunta")%>" name="lectura_amp_A_<%=rs("id_pregunta")%>" placeholder="Lectura Amp (A)" maxlength="5" >
</div>
</section>
</td>
 </tr>
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="lectura_amp_B_<%=rs("id_pregunta")%>" name="lectura_amp_B_<%=rs("id_pregunta")%>" placeholder="Lectura Amp (B)" maxlength="5" >
</div>
</section>
</td>
 </tr>
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="lectura_amp_C_<%=rs("id_pregunta")%>" name="lectura_amp_C_<%=rs("id_pregunta")%>" placeholder="Lectura Amp (C)" maxlength="4" >
</div>
</section>
</td>
 </tr>
			<%else%>
			<%if rs("id_pregunta")=140 then%>
			<tr height="80px">
  <td> <section>
<div>
  <input type="text" id="lectura_ap<%=rs("id_pregunta")%>" name="lectura_ap<%=rs("id_pregunta")%>" placeholder="Lectura AP" maxlength="8" >
</div>
</section>
</td>
 </tr>
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="lectura_bp<%=rs("id_pregunta")%>" name="lectura_bp<%=rs("id_pregunta")%>" placeholder="Lectura BP" maxlength="8" >
</div>
</section>
</td>
 </tr>
			<%else%>
			<tr height="80px">
  <td> <section>
<div>
  <input type="text" id="comentarios_<%=rs("id_pregunta")%>" name="comentarios_<%=rs("id_pregunta")%>" placeholder="Lectura o Comentarios" maxlength="42" >
</div>
</section>
</td>
 </tr>
			<%end if%>

			<%end if%>
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
<input type="button" class="botonGrande" value="Guardar" onclick="guardar()"/>

    <input type="hidden"  id="capitulo" name="capitulo" value="<%=capitulo%>"/>
	<input type="hidden"  id="concepto" name="concepto" value="<%=concepto%>"/>
		 <input type="hidden"  id="cr" name="cr" value="<%=cr%>"/>
	<input type="hidden"  id="respustaStandard" name="respustaStandard" value="<%=respustaStandard%>"/>
</div>

<%else%>
	<%if respustaStandard="3" and concepto="11" then%>
	<table  width="80%" align="center">
<%
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
sql= "select * from cat_preguntas a LEFT JOIN preguntas_coordenadas b on a.id_pregunta =b.id_pregunta where id_capitulo=" & capitulo &" and id_concepto=" & concepto & " and b.id_tipoRespuesta=1"
rs.open sql,conn
	if rs.eof then
%> 
<tr><td><p>No se encontro la informacion solicitada</p></td></tr>
<%
	else
i=0
while not(rs.eof)
i=i+1
%>
 <tr>
  <td align="center"><p id="parrafoPregunta<%=capitulo%>_<%=concepto%>_<%=rs("id_pregunta")%>"><%=i%>.- <%=rs("pregunta")%></p></td>
 </tr>

 <tr>
  <td align="center">

<section>
<div>
  <input type="radio" id="control_E<%=rs("id_pregunta")%>" name="cond_<%=rs("id_pregunta")%>" value="1">
  <label for="control_E<%=rs("id_pregunta")%>">
    <h2>Excelente</h2>
  </label>
</div>
<div>
  <input type="radio" id="control_B<%=rs("id_pregunta")%>" name="cond_<%=rs("id_pregunta")%>" value="2">
  <label for="control_B<%=rs("id_pregunta")%>">
    <h2>Bueno</h2>
  </label>
</div>
<div>
  <input type="radio" id="control_R<%=rs("id_pregunta")%>" name="cond_<%=rs("id_pregunta")%>" value="3">
  <label for="control_R<%=rs("id_pregunta")%>">
    <h2>Regular</h2>
  </label>
</div>
<div>
  <input type="radio" id="control_M<%=rs("id_pregunta")%>" name="cond_<%=rs("id_pregunta")%>" value="4">
  <label for="control_M<%=rs("id_pregunta")%>">
    <h2>Malo</h2>
  </label>
</div>
</section>
</td>
  </tr>
  
  <tr height="80px">
  <td> <section>
&nbsp;
</section>
</td>
 </tr>
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="tipo_<%=rs("id_pregunta")%>" name="tipo_<%=rs("id_pregunta")%>" placeholder="Tipo" maxlength="9" >
</div>
</section>
</td>
 </tr>
		<%if rs("id_pregunta")=148 then%>
<tr height="80px">
  <td> <section>
<div>
  <input type="text" id="lectura_V_A_B_<%=rs("id_pregunta")%>" name="lectura_V_A_B_<%=rs("id_pregunta")%>" placeholder="Lectura V(A-B)" maxlength="6" >
</div>
</section>
</td>
 </tr>
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="lectura_V_B_C_<%=rs("id_pregunta")%>" name="lectura_V_B_C_<%=rs("id_pregunta")%>" placeholder="Lectura V(B-C)" maxlength="6" >
</div>
</section>
</td>
 </tr>
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="lectura_V_C_A_<%=rs("id_pregunta")%>" name="lectura_V_C_A_<%=rs("id_pregunta")%>" placeholder="Lectura V(C-A)" maxlength="5" >
</div>
</section>
</td>
 </tr>
		<%else%>
			<%if rs("id_pregunta")=149 then%>
<tr height="80px">
  <td> <section>
<div>
  <input type="text" id="lectura_amp_A_<%=rs("id_pregunta")%>" name="lectura_amp_A_<%=rs("id_pregunta")%>" placeholder="Lectura Amp (A)" maxlength="5" >
</div>
</section>
</td>
 </tr>
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="lectura_amp_B_<%=rs("id_pregunta")%>" name="lectura_amp_B_<%=rs("id_pregunta")%>" placeholder="Lectura Amp (B)" maxlength="5" >
</div>
</section>
</td>
 </tr>
 <tr height="80px">
  <td> <section>
<div>
  <input type="text" id="lectura_amp_C_<%=rs("id_pregunta")%>" name="lectura_amp_C_<%=rs("id_pregunta")%>" placeholder="Lectura Amp (C)" maxlength="4" >
</div>
</section>
</td>
 </tr>
			<%else%>
			<tr height="80px">
  <td> <section>
<div>
  <input type="text" id="comentarios_<%=rs("id_pregunta")%>" name="comentarios_<%=rs("id_pregunta")%>" placeholder="Lectura o Comentarios" maxlength="42" >
</div>
</section>
</td>
 </tr>
	

			<%end if%>
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
<input type="button" class="botonGrande" value="Guardar" onclick="guardar()"/>

    <input type="hidden"  id="capitulo" name="capitulo" value="<%=capitulo%>"/>
	<input type="hidden"  id="concepto" name="concepto" value="<%=concepto%>"/>
	<input type="hidden"  id="cr" name="cr" value="<%=cr%>"/>
	<input type="hidden"  id="respustaStandard" name="respustaStandard" value="<%=respustaStandard%>"/>
</div>
	<%end if%>
<%end if%>





<%end if%> 

<br/>
<br/>
<!--fin Obras Civiles--> 
	  <a href="#" id="alert" style="display:none"></a>
      <a href="#" id="alert2" style="display:none">&nbsp;</a>
      <a href="#" id="alert3" style="display:none">&nbsp;</a> 
      <a href="#" id="alert4" style="display:none">&nbsp;</a>
	  <a href="#" id="alert5" style="display:none">&nbsp;</a> 
<a href="#" id="alert6" style="display:none">&nbsp;</a> 	  
</div>
</form>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="menu.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="alertify.js-0.3.11/lib/alertify.min.js"></script>
<script>
function validaRadio(){
	bandera=true ;
<%
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
sql= "select * from cat_preguntas a LEFT JOIN preguntas_coordenadas b on a.id_pregunta =b.id_pregunta where id_capitulo=" & capitulo &" and id_concepto=" & concepto & " and b.id_tipoRespuesta=1"
rs.open sql,conn
i=0
while not(rs.eof)
i=i+1
%>
  
  if (bandera){
		 var selectedOption = $("input:radio[name=cond_<%=rs("id_pregunta")%>]:checked").val()
		 if(selectedOption==1 || selectedOption==2 || selectedOption==3 || selectedOption==4){
			 if (bandera){
					bandera=true;
				}
				else{
					bandera=false;
				}
		 }
		 else{
				bandera=false;
		 }
	}
<%
rs.movenext
wend
rs.close
conn.close 
set rs=nothing
set conn=nothing
%>   

return bandera;
	

}

function validaTipo(){
var bandera=true
var i;
var j;
<%if respustaStandard="3" and concepto="9" then%>
i=128;
j=138;
<%end if%>
<%if respustaStandard="3" and concepto="10" then%>
i=137;
j=143;
<%end if%>
<%if respustaStandard="3" and concepto="11" then%>
i=142;
j=151;
<%end if%>
 for (i = i+1; i < j; i++) { 
    if (validarCaja('tipo_' + i )){
		if(bandera){
			bandera=true
		}
		else{
			bandera=false
		}
	}
	else{
		bandera=false
	}
 }
 if(bandera){
			validaComentarios()
		}
		else{
			simulateClick(alert5)
		}
}

function validaComentarios(){
var bandera=true
var i;
var j;
<%if respustaStandard="3" and concepto="9" then%>
i=128;
j=133;
<%end if%>
<%if respustaStandard="3" and concepto="10" then%>
i=140;
j=143;
<%end if%>
<%if respustaStandard="3" and concepto="11" then%>
i=142;
j=148;
<%end if%>

for (i = i+1; i < j; i++) { 
    if (validarCaja('comentarios_' + i )){
		if(bandera){
			bandera=true
		}
		else{
			bandera=false
			break;
		}
	}
	else{
		bandera=false
		break;
	}
 }
 if(bandera){
 <%if respustaStandard="3" and concepto="9" then%>
validaComentarios2()
<%end if%>
 <%if respustaStandard="3" and concepto="10" then%>
alert("cdcddc")
<%end if%>
 <%if respustaStandard="3" and concepto="11" then%>
validaComentarios2()
<%end if%>

 document.getElementById('frm_modulos').action="llenadoPDF4_2.asp"
 document.getElementById('frm_modulos').submit()
		}
		else{
			simulateClick(alert5)
		}
}

function validaComentarios2(){
var bandera=true
var i;
var j;
<%if respustaStandard="3" and concepto="9" then%>
i=135;
j=138;
<%end if%>

<%if respustaStandard="3" and concepto="11" then%>
i=149;
j=151;
<%end if%>

for (i = i+1; i < j; i++) { 
    if (validarCaja('comentarios_' + i )){
		if(bandera){
			bandera=true
		}
		else{
			bandera=false
			break;
		}
	}
	else{
		bandera=false
		break;
	}
 }
 if(bandera){
 <%if respustaStandard="3" and concepto="9" then%>
validarEAA()
<%else%>
 document.getElementById('frm_modulos').action="llenadoPDF4_2.asp"
 document.getElementById('frm_modulos').submit()
<%end if%>

		}
		else{
			simulateClick(alert5)
		}
}

function validarEAA(){
var bandera=true
var i;
var j;
i=122
for (i = i+1; i < j; i++) { 
    if (validarCaja('EAA_' + i )){
		if(bandera){
			bandera=true
		}
		else{
			bandera=false
			break;
		}
	}
	else{
		bandera=false
		break;
	}
 }
 if(bandera){
 document.getElementById('frm_modulos').action="llenadoPDF4_2.asp"
 document.getElementById('frm_modulos').submit()
		}
		else{
			simulateClick(alert5)
		}
}



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
	alertify.alert("FALTAN PREGUNTAS POR RESPONDER");
	return false;
  });
  $("#alert6").on( 'click', function () {
	reset();
	alertify.alert("No se admiten caracteres especiales");
	return false;
  });
</script>
</body>
</html>
