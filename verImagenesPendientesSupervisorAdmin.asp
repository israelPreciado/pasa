<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%> 
<!--#include file="xelupload.asp"-->
<!--#include file="funcion3/funcion.inc"-->
<!DOCTYPE html>
<html>
<title>Pendientes Cargados</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
  <link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />

<style>
.mySlides {display:none}
a{
 font-size:200%;
 color:rgb(230,165,165);
 text-shadow: 1px 0px 1px rgba(255,255,255,0.5);
}
#barrasuperior {
	background: #920000;
	display: block;
	float:inherit;
	margin: 5% auto;
	width: 100%;
}
#barrasuperior table {
	width: 100%;
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

</style>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="js/jQueryRotate.js"></script>
  <script>
  function rotarImagen(imagen,angulo){
    $('#' + imagen).rotate({angle:parseInt(angulo)+90})
	document.getElementById('angulo').value=parseInt(angulo)+90	
}
  </script>
<%
Dim objUpload, objFich
'Creamos el objeto 
set objUpload = new xelUpload

'Recibimos el formulario
objUpload.Upload()

fecha=Year(Now) & LPad(Month(Now),2,"0") & LPad(Day(Now),2,"0") & LPad(hour(time),2,"0") & LPad(minute(time),2,"0")  & LPad(second(time),2,"0")
 cr=session.contents("cr")
 id_pendiente=objUpload.Form("id_pendiente")
 modulo=objUpload.Form("hddnEnviar")
set objUpload=nothing
%>
<body onLoad="showDivs(1)">
<form id="frm_avanceObra" name="frm_avanceObra">
 </form>    
    <p><font size="+4"><strong>Modulo de supervisi&oacute;n de Obra</strong></font></p>


    <div id="barrasuperior">
    <table><tr><td width="35%"  onclick="back()"><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-arrow-left"></span></font></a></td><td width="35%"  <%if session.Contents("privilegio")=2 then%>onclick="home()"<%else%>onclick="home2()"<%end if%>><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-home3"></span></font></a></td><td  onclick="exit()"><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-exit"></span></font></a></td></tr></table>
      &nbsp;
    </div>
			<br/>
             <table height="141" align="center">
                  <tr><td height="141"><em><label id="lblCostoAproximado">&nbsp;</label></em></td></tr></table>   
 
<br/>
<div class="w3-content" style="max-width:80%">

<%
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr	
sql="select *, DATE_FORMAT(a.fecha,'%d/%m/%Y %H:%i:%s')as fechaf from ctrl_fotografiasPendientes_asupervisor a LEFT JOIN cat_modulos b on a.id_modulo=b.id_modulo LEFT JOIN cat_perfil c on a.id_privilegio=c.ID_PERFIL LEFT JOIN pendientes_asupervisor d on a.id_pendiente=d.id_pendiente where a.cr='"& cr &"' and a.id_pendiente='" & id_pendiente & "' ORDER BY fecha desc"
rs.open sql,conn
if rs.eof then
%>
<table><tr><td>No se encontraron imagenes</td></tr></table>
<%else
cont=0
while not(rs.eof)
%>
  <img class='mySlides w3-animate-zoom' src='<%=rs("path") & rs("name")%>' style='width:100%' name='<font size="+4"> <strong>Pendiente:</strong> <%=rs("pendiente")%><br/> <strong>Fecha Registro:</strong><%=rs("fechaf")%></font>' id='<%=rs("id_foto")%>' onclick="rotarImagen(this.id,document.getElementById('angulo').value)">
<%
cont=cont+1
rs.movenext
wend
%>
</div>
<%
end if
rs.close
conn.close 
set rs=nothing
set conn=nothing
%>
<div class="w3-center">
  <div class="w3-section">
    <button class="w3-button w3-light-grey" onclick="plusDivs(-1)"><font size="+6">Prev</font></button>
    <button class="w3-button w3-light-grey" onclick="plusDivs(1)"><font size="+6">Next</font></button>
  </div>
<% for i=1 to cont%>  
  <button class="w3-button demo" onclick="currentDiv(<%=i%>)"><font size="+4"><%=i%></font></button> 
<%next%>  
<a href="#" id="alert" style="display:none"></a>
 <input type="hidden" name="zonaFoto" id="zonaFoto"/>
<input type="hidden" id="angulo" value="0"/> 
<input type="hidden" id="hddnEnviar" value="<%=modulo%>"/> 
</div>
<br/>
   <table width="40%" align="center">
     <tr>
     <td width="10%">&nbsp;</td>
      <td width="20%"><input type="button" value="Regresar" onclick="regresar()" name="btnEnviar" /></td>
      <td width="10%">&nbsp;</td>
     </tr>
    </table>
  <br/>
<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-red", "");
  }
  x[slideIndex-1].style.display = "block"; 
  document.getElementById('zonaFoto').value=x[slideIndex-1].name
  
  dots[slideIndex-1].className += " w3-red";
  actualizaNombre()
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
<script src="alertify.js-0.3.11/lib/alertify.min.js"></script>
<script>
function actualizaNombre(){
	document.getElementById('lblCostoAproximado').innerHTML=document.getElementById('zonaFoto').value;
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
			$("#footer").html(document.getElementById('zonaFoto').value);
			//alertify.success(document.getElementById('zonaFoto').value );
			return false;
		});
		$("#sinPendientes").on( 'click', function () {
			reset();
			//$("#footer").html(document.getElementById('zonaFoto').value);
			alertify.error("No hay pendientes que mostrar");
			return false;
		});
		
	</script>
</body>
</html>
