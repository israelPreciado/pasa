
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
	
 function home(){
	document.getElementById('frm_modulos').action="inicio.asp"
	document.getElementById('frm_modulos').submit()
}
 function exit(){
	 document.getElementById('frm_modulos').action="cerrar_sesion.asp"
	 document.getElementById('frm_modulos').submit()
 }
 function back(){
	document.getElementById('frm_modulos').action="modulos.asp"
	document.getElementById('frm_modulos').submit()
}
function validar2(){
	document.getElementById('fileFotografia').click()
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
 function verificaZona(cr){
	 if (document.getElementById('selectZonas').selectedIndex==0){
	 simulateClick(document.getElementById('alert'))
	}
	else{
		if(document.getElementById('fileFotografia').value==""){
			simulateClick(document.getElementById('alert3'))
		}
	 	else{
			//alert(document.getElementById('selectZonas').selectedIndex)
			guardaFoto()		
			//buscaZona(cr,document.getElementById('selectZonas').selectedIndex)
		}
	}
	
 }
 function buscaZona(cr,id_zona){
	$.ajax({
	type: "GET",
	url: "searchZona.asp?cr=" + cr + "&id_zona=" + id_zona , 
	dataType: "html", 
	success: function(response){ 
	//$("#dedede").html(response);
	if (response=="NO"){
		guardaFoto()		
		} 
		else{
			simulateClick(document.getElementById('confirm'))
		}
	}
   });
 }
function guardaFoto(){
	if (document.getElementById('selectZonas').selectedIndex==0){
	 simulateClick(document.getElementById('alert'))
	}
	else{
		if(document.getElementById('fileFotografia').value==""){
			simulateClick(document.getElementById('alert3'))
		}
		else{
			familia=document.getElementById('atxtComentario').value;
			if (familia.length == 0 || /^\s+$/.test(familia)){
				simulateClick(document.getElementById('alert10'))	
				document.getElementById('atxtComentario').value=""
				document.getElementById('atxtComentario').focus();
			}
			else{
				document.getElementById('hddnZona').value=document.getElementById('selectZonas').value
				//alert(document.getElementById('hddnZona').value)
				simulateClick(document.getElementById('alert5'))
				document.getElementById('frm_modulos').action="guardaFoto2.asp"
				document.getElementById('frm_modulos').submit()
			}
		}
	}
	//document.getElementById('frm_modulos').action="guardaFoto.asp"
	//document.getElementById('frm_modulos').submit()
}
function cargaAlbum(cr){
document.getElementById('tabla_principal').style.display="none"
document.getElementById('tabla_Album').style.display="block"

}

function enviar(){
if (document.getElementById('selectZonas').selectedIndex==0){
	 simulateClick(document.getElementById('alert'))
	}
	else{
	document.getElementById('frm_modulos').action=document.getElementById('selectZonas').value+ ".asp"
	document.getElementById('frm_modulos').submit()
	
	}
	
//alert(document.getElementById('selectZonas').selectedIndex)
//document.getElementById('selectZonas').style.display="none"
//document.getElementById('tabla_Album').style.display="block"

}

function showModalFotos(cr,dia,mes,anio){
document.getElementById('anio').value=anio
document.getElementById('mes').value=mes
document.getElementById('dia').value=dia
document.getElementById('frm_modulos').action="verImagenesCargadas.asp"
document.getElementById('frm_modulos').submit()
}
</script>
<%'if isempty(session("cr")) then
'response.Redirect("default.asp?logout=true")
'end if%>
<%
modulo=request("hddnEnviar")
'nombreModulo=buscaModulo(modulo)
%>
</head>
<body>
<form name="frm_modulos" id="frm_modulos" method="post" enctype="multipart/form-data">
<div id="pagina">
	<div id="header">
		<div id="logo"> 
			<p><strong>Modulo de supervisi&oacute;n de Obra</strong><p>   
		</div>
		<div id="barrasuperior">
			<table><tr><td width="35%" onclick="back()"><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-arrow-left"></span></font></a></td><td width="35%" onclick="home()"><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-home3"></span></font></a></td><td onclick="exit()"><a href="#" style="padding-left:55%"><font style="font-size:200%"><span class="icon-exit"></span></font></a></td></tr></table>
				&nbsp;
		</div>
	</div>
	<div align="center" id="menu_inicio">
		<div id="detalle">
			<table width="100%">
     			<tr>
     			 	<td width="40%"><p>CR: <strong><%=session.Contents("cr")%></strong></p></td>
      				<td><p><strong>Requerimiento a Terceros</strong></p></td>     
     			</tr>
   			 </table>
		</div>
		<br/>

		<table width="80%" style="padding-top:10%" id="tabla_principal">
     		<tr>
				<td align="center" colspan="3">    
<%
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
sql= "select * from cat_requerimietosTerceros"
rs.open sql,conn
if rs.eof then
%>
					<select>
						<option value="0">-- No se han cargado Requerimientos --</option>
					</select>
<%
else
%>
						<select id="selectZonas">
						<option ><font color="#FFFFFF"><strong>--SELECCIONA REQUERIMIENTO--</strong></font></option>
<%
	while not(rs.eof)
%>
						<option value="<%=rs("file")%>" ><%=rs("zona")%></option>
<%
	rs.movenext
	wend
%>  
					</select>
<%
end if
rs.close
conn.close 
set rs=nothing
set conn=nothing
%>
                
				</td>    
     		</tr>
	</table>

<table width="80%">
 <tr height="20px">
  <td>&nbsp;</td>
 </tr>
  <tr height="20px">
  <td>&nbsp;</td>
 </tr>
  <tr height="20px">
  <td>&nbsp;</td>
 </tr> <tr height="20px">
  <td>&nbsp;</td>
 </tr>
<tr>
  <td align="center"><input class="botonGrande" type="button" value="ENVIAR" onclick="enviar()" name="btnEnviar"/></td>
</tr>
</table>	
		<div style='display:none;padding-top:20%' align='center' id="tabla_Album">
			<table width='50%' align='center'>
				<tr>
					<td align='center'><p>Selecciona un Album</p></td>
				</tr>
			</table>	
			<%=cargaAlbum(session.Contents("cr"))%>
		</div>
		
	</div>
</div>
<input type="hidden" id="dia" name="dia">
<input type="hidden" id="mes" name="mes">
<input type="hidden" id="anio" name="anio">

<a href="#" id="alert" style="display:none"></a>
<a href="#" id="alert2" style="display:none">&nbsp;</a>
<a href="#" id="alert3" style="display:none">&nbsp;</a>
<a href="#" id="alert4" style="display:none">&nbsp;</a>
<a href="#" id="alert5" style="display:none">&nbsp;</a>
<a href="#" id="alert10" style="display:none">&nbsp;</a>
<a href="#" id="confirm" style="display:none">&nbsp;</a>
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
			alertify.alert("Debes elegir una opcion");
			return false;
		});
		$("#alert10").on( 'click', function () {
			reset();
			alertify.alert("Debes añadir un comentario");
			return false;
		});
		$("#alert2").on( 'click', function () {
			reset();
			alertify.alert("El elemento no se pudo actualizar");
			return false;
		});
		$("#alert3").on( 'click', function () {
			reset();
			alertify.alert("Debes elegir un archivo");
			return false;
		});
		$("#alert4").on( 'click', function () {
			reset();
			alertify.alert("Ya existe");
			return false;
		});
		$("#alert5").on( 'click', function () {
			reset();
			alertify.success("Espere un momento...");
			alertify.success("Guardando");
			return false;
		});
		  $("#confirm").on( 'click', function () {
			reset();
			alertify.confirm("Este CR ya contiene una foto para esta zona. ¿Quires reemplazarla?", function (e) {
				if (e) {
					guardaFoto()
					alertify.success("Espere un momento...");
					alertify.success("Guardando");
					return true;
				}
			});
			return false;
		});

		
	</script>
</body>
</html>
