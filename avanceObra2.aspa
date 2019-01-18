
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
 function showGif(ocultar,mostrar){
	 document.getElementById(ocultar).style.display="none"
	 document.getElementById(mostrar).style.display="block"
 }
</script>
<%modulo=request("hddnEnviar")
%>
</head>
<%if modulo="Obra_civil" then%>
<body onload="document.getElementById('Obra_civil').style.display='block'">
<%elseif modulo="Viniles" then%>
<body onload="document.getElementById('Viniles').style.display='block'">
<%elseif modulo="ATMs" then%>
<body onload="document.getElementById('ATMs').style.display='block'">
<%elseif modulo="Seguridad" then%>
<body onload="document.getElementById('Seguridad').style.display='block'">
<%elseif modulo="Suministros" then%>
<<body onload="document.getElementById('Suministros').style.display='block'">
<%elseif modulo="Senalizacion" then%>
<body onload="document.getElementById('Senalizacion').style.display='block'">
<%elseif modulo="Sistemas_Instal" then%>
<body onload="document.getElementById('Sistemas_Instal').style.display='block'">
<%elseif modulo="Sistemas_Config" then%>
<body onload="document.getElementById('Sistemas_Config').style.display='block'">
<%else%>
<body>
<%end if%>
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
  <div id="Obra_civil" style="display:none">
  <div align="center" id="menu_inicio">
    <div id="detalle">
    <table width="100%">
     <tr>
      <td width="70%"><p>CR: <strong><%=session.Contents("cr")%></strong></p></td>
      <td><p><strong>Obra Civil</strong></p></td>     
     </tr>
    </table>
    </div>
    <br />
    <div id="detalle2">
    <table width="90%">
     <tr>
      <td width="70%"><p>Canceleria y Cristal:</p></td>
      <td width="10%"><img src="images/logos/loading.gif"  id="OB_load1" style="display:none"/><img src="images/logos/update.png" id="OB_update1" onclick="showGif(this.id,'OB_load1')" style="display:none"/><img src="images/logos/edit.png" id="OB_edit1" onclick="showGif(this.id,'OB_update1')"/></td> 
      <td><%=cargaPorcentajesAvance("OC_CanceleriaCristal",4567)%></td>     
     </tr>
	 <tr>
      <td><p>Inst EQ AA Lobby:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Marco de Acceso:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Muro Block Lobby 24 hrs:</p></td>
      <td><p>70%</p></td>
     </tr>
	 <tr>
      <td><p>Pintura Exteror:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Pintura Interior:</p></td>
      <td><p>70%</p></td>
     </tr>
	 <tr>
      <td><p>Piso Lobby 24 hrs:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Salidas Electricas:</p></td>
      <td><p>80%</p></td>
     </tr>
	 <tr>
      <td><p>Salidas Voz-Datos:</p></td>
      <td><p>0.4</p></td>
     </tr>
	 <tr>
      <td><p>Salidas Seguridad:</p></td>
      <td><p>40%</p></td>
     </tr>
	 <tr>
      <td><p>Mueble Banca Digital:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Marco Atrás de Cajas:</p></td>
      <td><p>NA</p></td>
     </tr>
    </table>
    </div>
    <br />
  </div>
  </div>
<!--fin Obras Civiles-->
<!--inicio Viniles-->  
  <div id="Viniles" style="display:none">
  <div align="center" id="menu_inicio">
    <div id="detalle">
    <table width="100%">
     <tr>
      <td width="70%"><p>CR: <strong><%=session.Contents("cr")%></strong></p></td>
      <td><p><strong>Viniles</strong></p></td>     
     </tr>
    </table>
    </div>
    <br />

    <div id="detalle2">
    <table width="90%">
	 <tr>
      <td width="80%"><p>Lobby 24 Hrs Atm's:</p></td>
      <td><p>70%</p></td>
     </tr>
	 <tr>
      <td><p>Atm's Depositador:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Atm's Dispensador:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Cenefa Brujula:</p></td>
      <td><p>70%</p></td>
     </tr>
	 <tr>
      <td><p>Back Light Totem:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Atención Preferencial</p></td>
      <td><p>70%</p></td>
     </tr>
	 <tr>
      <td><p>Numeros Caja/Func:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Burbuja(s) Roja/Func:</p></td>
      <td><p>80%</p></td>
     </tr>
	 <tr>
      <td><p>Etiquetas QM</p></td>
      <td><p>0.4</p></td>
     </tr>
	 <tr>
      <td><p>Tapiz Vatos:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Vinil Rojo Atrás de Cajas:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Textos Banca Digital:</p></td>
      <td><p>NA</p></td>
     </tr>
    </table>
    </div>
    <br />
  </div>
  </div>
<!--fin Viniles-->
<!--inicio ATMS-->
  <div id="ATMs" style="display:none">
  <div align="center" id="menu_inicio">
    <div id="detalle">
    <table width="100%">
     <tr>
      <td width="70%"><p>CR: <strong><%=session.Contents("cr")%></strong></p></td>
      <td><p><strong>ATMs</strong></p></td>     
     </tr>
    </table>
    </div>
    <br />

    <div id="detalle2">
    <table width="90%">
	 <tr>
      <td  width="80%"><p>ATM's Diebold 522:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>ATM's Diebold 6622:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>ATM's Diebold 720:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>ATM's Wincor 280:</p></td>
      <td><p>100%</p></td>
     </tr>
	 <tr>
      <td><p>ATM's NCR 6632:</p></td>
      <td><p>100%</p></td>
     </tr>
	 <tr>
      <td><p>Panele(s) ATM 522:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Panele(s) ATM 6622:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Panele(s) ATM Win 280:</p></td>
      <td><p>100%</p></td>
     </tr>
	 <tr>
      <td><p>Panele(s) ATM 6632:</p></td>
      <td><p>100%</p></td>
     </tr>
	 <tr>
      <td><p>Panele(s) ATM 720:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Panel Puerta ETV:</p></td>
      <td><p>NA</p></td>
     </tr>

    </table>
    </div>
    <br />
  </div>
  </div>
<!--Fin ATMS--> 
<!--inicio Seguridad-->
  <div id="Seguridad" style="display:none">
  <div align="center" id="menu_inicio">
    <div id="detalle">
    <table width="100%">
     <tr>
      <td width="70%"><p>CR: <strong><%=session.Contents("cr")%></strong></p></td>
      <td><p><strong>Seguridad</strong></p></td>     
     </tr>
    </table>
    </div>
    <br />

    <div id="detalle2">
    <table width="90%">
     <tr>
      <td width="80%"><p>Pta Blindada/Mirilla:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Roto_Transfer:</p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>Ventana Blindada:</p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>Pta Blindada/Chapa R:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Sub_Ensamble/Transf:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Equipos de Seguridad:</p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>Señ Seguridad:</p></td>
      <td><p>-</p></td>
     </tr>
    </table>
    </div>
    <br />
  </div>
  </div>
<!--Fin Seguridad-->
<!--inicio Suministros-->
  <div id="Suministros" style="display:none">
  <div align="center" id="menu_inicio">
    <div id="detalle">
    <table width="100%">
     <tr>
      <td width="70%"><p>CR: <strong><%=session.Contents("cr")%></strong></p></td>
      <td><p><strong>Suministros</strong></p></td>     
     </tr>
    </table>
    </div>
    <br />

    <div id="detalle2">
    <table width="90%">
     <tr>
      <td width="80%"><p>Banco QM:</p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>Sillas Patio Publico:</p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>Cesto Basura Lobby:</p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>Totem de Acceso:</p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>Arbol(es) de la Vida:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Logo Banorte / Cajas:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Marcos de Funcionarios:</p></td>
      <td><p>NA</p></td>
     </tr>
     <tr>
      <td><p>Minimamparas:</p></td>
      <td><p>NA</p></td>
     </tr>
    </table>
    </div>
    <br />
  </div>
  </div>
<!--Fin Suministros-->
<!--inicio Señalizacion Ext-->
  <div id="Senalizacion" style="display:none">
  <div align="center" id="menu_inicio">
    <div id="detalle">
    <table width="100%">
     <tr>
      <td width="60%"><p>CR: <strong><%=session.Contents("cr")%></strong></p></td>
      <td><p><strong>Señalizacion Ext</strong></p></td>     
     </tr>
    </table>
    </div>
    <br />
    <div id="detalle2">
    <table width="90%">
	 <tr>
      <td width="80%"><p>Marquesina(s) Panel Alum:</p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>Panel Acceso 24 hrs / Ext:</p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>Leyenda(s) Block Banorte:</p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>Bandera 24 Hrs Banorte:</p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>Lona Unipolar:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Mantto Gral Unipolar:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Retiro Flecha Atm:</p></td>
      <td><p>NA</p></td>
     </tr>
    </table>
    </div>
    <br />
  </div>
  </div>
<!--Fin Señalizacion Ext-->
<!--inicio Sistemas Instal-->
  <div id="Sistemas_Instal" style="display:none">
  <div align="center" id="menu_inicio">
    <div id="detalle">
    <table width="100%">
     <tr>
      <td width="60%"><p>CR: <strong><%=session.Contents("cr")%></strong></p></td>
      <td><p><strong>Sistemas Instal</strong></p></td>     
     </tr>
    </table>
    </div>
    <br />

    <div id="detalle2">
    <table width="90%">
	 <tr>
      <td width="80%"><p>Queue Manager (QM) </p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>Pantalla Turnos</p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>Switch </p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>Telefónos </p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>UPS</p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>PC All in One Bca Digital</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Pin Pad Bca Digital</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>Impresora Bca Digital</p></td>
      <td><p>NA</p></td>
     </tr>
    </table>
    </div>
    <br />
  </div>
  </div>
<!--Fin Sistemas Instal--> 
<!--inicio Sistemas Config-->
  <div id="Sistemas_Config" style="display:none">
  <div align="center" id="menu_inicio">
    <div id="detalle">
    <table width="100%">
     <tr>
      <td width="60%"><p>CR: <strong><%=session.Contents("cr")%></strong></p></td>
      <td><p><strong>Sistemas Config</strong></p></td>     
     </tr>
    </table>
    </div>
    <br />

    <div id="detalle2">
    <table width="90%">
	 <tr>
      <td width="80%"><p>Queue Manager (QM)</p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>Pantalla Turnos</p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>Switch </p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>Telefónos </p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>PC All in One </p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>ATM's Diebold 522:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>ATM's Diebold 6622:</p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>ATM's Diebold 720:</p></td>
      <td><p>-</p></td>
     </tr>
	 <tr>
      <td><p>ATM's Wincor 280:</p></td>
      <td><p>NA</p></td>
     </tr>
	 <tr>
      <td><p>ATM's NCR 6632:</p></td>
      <td><p>NA</p></td>
     </tr>
    </table>
    </div>
    <br />
  </div>
  </div>    
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
</div>
</form>
</body>
</html>
