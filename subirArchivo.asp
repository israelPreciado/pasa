
<!--#include file="funcion/funcion.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Obras</title>
<link href="style.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="css3/animate.css">
<link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
<link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />
<style>
input[type="button"]{
 width:106%;
 background:#a40505;
 border:0;
 padding:2%;
 text-wrap:none;
 font-family:'Open Sans',sans-serif;
 font-size:100%;
 color:#fff;
 cursor:pointer;
 transition:background .3s;
 -webkit-transition:background .3s;
  -webkit-appearance: none;
 -webkit-border-radius: 0;
}
</style>
<Script language="javascript">
	
function validar2(){
	document.getElementById('fileFotografia').click()
}
function validarArchivo(){
	if (document.getElementById('fileFotografia').value==""){
		simulateClick(document.getElementById('alert3'))
	}
	else{
		document.getElementById('frm_modulos').action="guardaArchivo.asp"
		document.getElementById('frm_modulos').submit()
	}
}
function informa(texto){
	if (texto=="ok"){
		simulateClick(document.getElementById('alert11'))
	}
	if (texto=="tipo"){
		simulateClick(document.getElementById('alert12'))
	}
	if (texto=="err"){
		simulateClick(document.getElementById('alert13'))
	}
	if (texto=="tamano"){
		simulateClick(document.getElementById('alert14'))
	}
	if (texto=="name"){
		simulateClick(document.getElementById('alert15'))
	}

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

</script>

<%
res=request("res")
'nombreModulo=buscaModulo(modulo)
%>
</head>
<%if res="" then%>
<body>
<%else%>
<body onload="informa('<%=res%>')">
<%end if%>
<form name="frm_modulos" id="frm_modulos" method="post" enctype="multipart/form-data">
		<br />
	
	<table width="40%" align="center" class="animated zoomIn">
   		<tr height="30%">
    		<td width="15%" height="137">&nbsp;</td>
     	</tr>
     	<tr height="10%">
     		<td width="15%" height="53">&nbsp;</td>
      		<td width="55%"><input  type="button" value="Seleciona Archivo" onclick="validar2()" name="btnEnviar" /></td>
      		<td width="30%">&nbsp;</td>
     	</tr>
     	<tr>
     		<td width="15%" height="53">&nbsp;</td>
      		<td width="55%"><input  type="button" value="Subir Archivo"  onclick="validarArchivo()" name="btnEnviar" /></td>
      		<td width="30%">&nbsp;</td>
     	</tr>
	</table>
		<table width="80%" style="padding-top:10%" id="tabla_principal">
			<tr>
				<td align="center" colspan="2"><input class="botonGrande" type="file" id="fileFotografia" name="fileFotografia" ENCTYPE="multipart/form-data" style="display:none" accept=".csv"/></td>
			</tr>
		</table>		
	</div>
</div>

<a href="#" id="alert" style="display:none"></a>
<a href="#" id="alert2" style="display:none">&nbsp;</a>
<a href="#" id="alert3" style="display:none">&nbsp;</a>
<a href="#" id="alert4" style="display:none">&nbsp;</a>
<a href="#" id="alert5" style="display:none">&nbsp;</a>
<a href="#" id="alert10" style="display:none">&nbsp;</a>
<a href="#" id="alert11" style="display:none">&nbsp;</a>
<a href="#" id="alert12" style="display:none">&nbsp;</a>
<a href="#" id="alert13" style="display:none">&nbsp;</a>
<a href="#" id="alert14" style="display:none">&nbsp;</a>
<a href="#" id="alert15" style="display:none">&nbsp;</a>
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
			alertify.alert("Debes elegir una zona");
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
				$("#alert11").on( 'click', function () {
			reset();
			alertify.success("Archivo Guardado");
			alertify.success("En Aprox. 30 seg se veran los cambios");
			return false;
		});
				$("#alert12").on( 'click', function () {
			reset();
			alertify.error("Archivo no compatible");
			alertify.error("comprube que es un archivo .csv");
			return false;
		});
				$("#alert13").on( 'click', function () {
			reset();
			alertify.error("No se a podido guardar el archivo");
			return false;
		});
		$("#alert14").on( 'click', function () {
			reset();
			alertify.error("El archivo supera la capacidad permitida");
			return false;
		});
		$("#alert15").on( 'click', function () {
			reset();
			alertify.error("Nombre del archivo incorrecto");
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
