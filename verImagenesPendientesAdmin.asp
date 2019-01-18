<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%> 
<!--#include file="xelupload.asp"-->
<!--#include file="funcion/funcion.inc"-->
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
</style>
<script>
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
	document.getElementById('frm_avanceObra').action="modulos.asp"
	document.getElementById('frm_avanceObra').submit()
}
</script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="js/jQueryRotate.js"></script>
  <script>
  function rotarImagen(imagen,angulo){
    $('#' + imagen).rotate({angle:parseInt(angulo)+90})
	document.getElementById('angulo').value=parseInt(angulo)+90	
}
  </script>
<%
cr=request("cr")
Dim objUpload, objFich
'Creamos el objeto 
set objUpload = new xelUpload

'Recibimos el formulario
objUpload.Upload()

fecha=Year(Now) & LPad(Month(Now),2,"0") & LPad(Day(Now),2,"0") & LPad(hour(time),2,"0") & LPad(minute(time),2,"0")  & LPad(second(time),2,"0")
 cr=request("cr")
id_pendiente=request("id_pendiente")
modulo=request("hddnEnviar")
 id_pendiente2=objUpload.Form("id_pendiente")
 modulo2=objUpload.Form("hddnEnviar")

set objUpload=nothing

%>
<body onLoad="showDivs(1)">
<form id="frm_avanceObra" name="frm_avanceObra">
 </form>    

			<br/>
             <table height="141" align="center">
                  <tr><td height="141"><em><label id="lblCostoAproximado">&nbsp;</label></em></td></tr></table>   
 
<br/>
<div class="w3-content" style="max-width:80%">
<%
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr	
sql="select *, DATE_FORMAT(a.fecha,'%d/%m/%Y %H:%i:%s')as fechaf from ctrl_fotografiasPendientes a LEFT JOIN cat_modulos b on a.id_modulo=b.id_modulo LEFT JOIN cat_perfil c on a.id_privilegio=c.ID_PERFIL LEFT JOIN pendientes d on a.id_pendiente=d.id_pendiente where a.cr='"& cr &"' and a.id_pendiente='" & id_pendiente & "' ORDER BY fecha desc"
rs.open sql,conn
if rs.eof then
%>
<table><tr><td>No se encontraron imagenes</td></tr></table>
<%else
cont=0
while not(rs.eof)
%>
  <img class='mySlides w3-animate-zoom' src='<%=rs("path") & rs("name")%>' style='width:100%' name='<font size="+4"><strong>Capitulo:</strong> <%=rs("modulo") & "<br/> <strong>Pendiente:</strong> " & rs("pendiente") & "<br/> <strong>Comentario:</strong> " & rs("comentario") & "<br/> <strong>Registrada Por:</strong> " & rs("id_usuario") &  "<br/> <strong>Fecha Registro:</strong> " & rs("fechaf") & "<br/> <strong>Perfil: </strong>" & rs("perfil") & "</font>"%>' id='<%=rs("id_foto")%>' onclick="rotarImagen(this.id,document.getElementById('angulo').value)">
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
