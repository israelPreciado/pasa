
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
	
 function home(){
 	<%if session.Contents("privilegio")="2" then%>
	 	document.getElementById('frm_avanceObra').action="inicioSupervisor_lobby.asp"	
	 <%else%>
	 	document.getElementById('frm_avanceObra').action="inicioContratista_lobby.asp"	
	 <%end if%>
}
 function exit(){
	 document.getElementById('frm_modulos').action="cerrar_sesion.asp"
	 document.getElementById('frm_modulos').submit()
 }
 function back(){
	document.getElementById('frm_modulos').action="modulos_lobby.asp"
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
				document.getElementById('frm_modulos').action="guardaFoto2_lobby.asp"
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
function showModalFotos(cr,dia,mes,anio){
document.getElementById('anio').value=anio
document.getElementById('mes').value=mes
document.getElementById('dia').value=dia
document.getElementById('frm_modulos').action="verImagenesCargadas_lobby.asp"
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
      				<td><p><strong>Archivo Fotografico</strong></p></td>     
     			</tr>
   			 </table>
		</div>
		<br/>
                
  <!--               <table width="100%">-->
<!--                 	<tr height="30px">-->
 <!--      					<td width="40%"><p class="ascdc"><strong>&nbsp;</strong></p></td><td width="30%"><p><strong>&nbsp;</strong></p></td> <td width="30%"><p><strong>&nbsp;</strong></p></td>   --> 
 <!--     				</tr>-->
 <!--     				<tr>-->
 <!--      					<td colspan="2"><p class="ascdc"><strong>Cargas Realizadas</strong></p></td><td><p><strong>&nbsp;</strong></p></td> -->    
 <!--     				</tr>-->
<%
'Set conn = Server.CreateObject("ADODB.Connection")
'set rs= Server.CreateObject("adodb.recordset")
'Conn.Open connstr
'sql= "SELECT a.*, b.zona FROM ctrl_fotografias a LEFT JOIN cat_zonafotografica b ON a.id_zona = b.id_zona WHERE a.CR = '"& session.Contents("cr") &"' GROUP BY a.id_zona"
'rs.open sql,conn
'if rs.eof then
%>                    
                    
<!-- 				    <tr>-->
<!--     				<td><p  class="ascdc"><strong>&nbsp;</strong></p></td><td align="left" class="ascdc"  colspan="2"><p style="font-style:oblique">A&uacute;n no se cargan Fotografias</p></td> -->    
<!--    				</tr>-->
                    
<%
'else
'while not(rs.eof)
%>
<!--		   <tr>-->
<!--   				<td><p  class="ascdc"><strong>&nbsp;</strong></p></td><td align="left" class="ascdc"  colspan="2"><p style="font-style:oblique"><%'=rs("zona")%></p></td>   -->  
<!--			   </tr> -->
<%
'	rs.movenext
'	wend
'end if
'rs.close
'conn.close 
'set rs=nothing
'set conn=nothing
%>                    
 <!--   				 </table>-->
		<br />
				 
		<table width="80%" style="padding-top:10%" id="tabla_principal">
     		<tr>
				<td align="center" colspan="3">    
<%
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
sql= "select * from cat_zonaFotografica"
rs.open sql,conn
if rs.eof then
%>
					<select>
						<option value="0">-- No se han cargado Zonas --</option>
					</select>
<%
else
%>
						<select id="selectZonas">
						<option ><font color="#FFFFFF"><strong>--SELECCIONA ZONA--</strong></font></option>
<%
	while not(rs.eof)
%>
						<option value="<%=rs("id_zona")%>" ><%=rs("zona")%></option>
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
			<tr height="100px">
				<td colspan="3">&nbsp;</textarea></td>
			</tr>
			<tr height="100px">
				<td colspan="3"><textarea class="area" id="atxtComentario" name="atxtComentario" type="text" style="display: block;" placeholder="A&ntilde;ade un comentario"></textarea></td>
			</tr>
			<tr height="100px">
				<td colspan="3"></td>
			</tr>
			<tr>
				<td width="35%" align="center"><button type="button" class="botonChico" onclick="validar2()"  style="display:block"><span class="icon-camera"></span></button><input type="hidden"  id="hddnEnviar" name="hddnEnviar" value="<%=modulo%>"/><input type="hidden"  id="hddnZona" name="hddnZona"/><input type="hidden"  id="hddnCR" name="hddnCR" value="<%=session.Contents("cr")%>"/></td>
				<td width="31%" align="center"><button type="button" class="botonChico" onclick="verificaZona('<%=session.Contents("cr")%>')" style="display:block"><span class="icon-floppy-disk"></span></button></td>
				<td width="34%" align="center"><button type="button" class="botonChico" onclick="cargaAlbum('<%=session.Contents("cr")%>')" style="display:block"><span class="icon-image"></span></button></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input class="botonGrande" type="file" id="fileFotografia" name="fileFotografia" ENCTYPE="multipart/form-data" style="display:none"/></td>
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
