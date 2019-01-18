
<!--#include file="funcion/funcion.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Obras</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/login.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.core.css" />
<link rel="stylesheet" href="alertify.js-0.3.11/themes/alertify.default.css" id="toggleCSS" />
<Script language="javascript">
function enviar(){
	document.getElementById('frm_informe_cr').action="modulos.asp"
	document.getElementById('frm_informe_cr').submit();
}

function agregar(idControl){
	var control=0
	var bandera=false
	familia=document.getElementById("input" + idControl).value;
	if (familia.length == 0 || /^\s+$/.test(familia)){
		simulateClick(document.getElementById('alert'))	
		document.getElementById("input" + idControl).value=""
		document.getElementById("input" + idControl).focus();
		bandera=false
	}
	else{
		bandera=true
	}
	if (bandera==true){


   if(idControl<25){
	  control=idControl+1
	  document.getElementById("parrafo" + idControl).textContent=document.getElementById("input" + idControl).value
	  document.getElementById("parrafo" + idControl).style.display="block"
	  document.getElementById("input" + control).style.display = "block";
   	  document.getElementById("agregar" + control).style.display="block"
	  document.getElementById("agregar" + idControl).style.display="none"
	  document.getElementById("input" + idControl).style.display="none"
	  document.getElementById("edit" + idControl).style.display="block"
   }
   else{
	   simulateClick(document.getElementById('alert2'))		
	   document.getElementById("agregar" + idControl).style.display="none"
	   document.getElementById("parrafo" + idControl).textContent=document.getElementById("input" + idControl).value
	   document.getElementById("parrafo" + idControl).style.display="block"
	   document.getElementById("input" + idControl).style.display="none"
	   document.getElementById("edit" + idControl).style.display="block"
	   document.getElementById("input" + idControl).disabled
	   
   }
	}
 }
 
 function update(idControl){
	var control=0
	var bandera=false
	familia=document.getElementById("input" + idControl).value;
	if (familia.length == 0 || /^\s+$/.test(familia)){
		simulateClick(document.getElementById('alert'))	
		document.getElementById("input" + idControl).value=""
		document.getElementById("input" + idControl).focus();
		bandera=false
	}
	else{
		bandera=true
	}
	if (bandera==true){

	  document.getElementById("parrafo" + idControl).textContent=document.getElementById("input" + idControl).value
	  document.getElementById("parrafo" + idControl).style.display="block"
   	  document.getElementById("edit" + idControl).style.display="block"
	  document.getElementById("update" + idControl).style.display="none"
	  document.getElementById("input" + idControl).style.display="none"
	}
 }
 
 function edit(idControl){
	var control=0
	var bandera=false
	
	  document.getElementById("parrafo" + idControl).style.display="none"	  
	  document.getElementById("agregar" + idControl).style.display="none"
	  document.getElementById("input" + idControl).style.display="block"
	  document.getElementById("edit" + idControl).style.display="none"
	  document.getElementById("update" + idControl).style.display="block"
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
</head>
<body>
<form name="frm_avanceObra" id="frm_avanceObra" method="post">
<div id="pagina">
  <div id="header">
    <div id="logo">  
      <p><strong>Modulo de supervisi&oacute;n de Obra</strong></p>
    </div><!--fin div logo -->
    <div id="barrasuperior">
      &nbsp;
    </div>
    
<!--inicio Obra Civil-->  
  	<div id="Obra_civil">
  		<div align="center" id="menu_inicio">
    		<div id="detalle">
    			<table width="100%">
     				<tr>
     				 	<td width="70%"><p>CR: <strong><%=session.Contents("cr")%></strong></p></td>
      					<td><p><strong>Obra Civil</strong></p></td>     
     				</tr>
   				 </table>
    		</div>
    	</div>
		<br />
  		<div id="logo">  
    		<p><strong>Pendientes de Obra</strong></p>
    	</div>
  		<div id="barrasuperior">
    		&nbsp;
  		</div>
  		<br />
           	</div>
    </div>
	    	<div id="login">
<table width="80%" align="center" style="padding-left:10%">
     		<tr>
     			<td width="15%" valign="middle"><img src="images/logos/plus.png" onclick="agregar(1)" id="agregar1"/><img src="images/logos/edit.png" onclick="edit(1)" id="edit1" style="display:none"/><img src="images/logos/update.png" onclick="update(1)" id="update1" style="display:none"/></td><td><input id="input1" type="text"/><p id="parrafo1" style="display:none"></p></td>
            </tr>    
            <tr>    
      			<td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(2)" id="agregar2"/><img src="images/logos/edit.png" onclick="edit(2)" id="edit2" style="display:none"/><img src="images/logos/update.png" onclick="update(2)" id="update2" style="display:none"/></td><td><input id="input2" type="text" style="display: none;" /><p id="parrafo2" style="display:none"></p></td>
            </tr>    
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(3)" id="agregar3"/><img src="images/logos/edit.png" onclick="edit(3)" id="edit3" style="display:none"/><img src="images/logos/update.png" onclick="update(3)" id="update3" style="display:none"/></td><td><input id="input3" type="text" style="display: none;" /><p id="parrafo3" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(4)" id="agregar4"/><img src="images/logos/edit.png" onclick="edit(4)" id="edit4" style="display:none"/><img src="images/logos/update.png" onclick="update(4)" id="update4" style="display:none"/></td><td><input id="input4" type="text" style="display: none;" /><p id="parrafo4" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(5)" id="agregar5"/><img src="images/logos/edit.png" onclick="edit(5)" id="edit5" style="display:none"/><img src="images/logos/update.png" onclick="update(5)" id="update5" style="display:none"/></td><td><input id="input5" type="text" style="display: none;" /><p id="parrafo5" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(6)" id="agregar6"/><img src="images/logos/edit.png" onclick="edit(6)" id="edit6" style="display:none"/><img src="images/logos/update.png" onclick="update(6)" id="update6" style="display:none"/></td><td><input id="input6" type="text" style="display: none;" /><p id="parrafo6" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(7)" id="agregar7"/><img src="images/logos/edit.png" onclick="edit(7)" id="edit7" style="display:none"/><img src="images/logos/update.png" onclick="update(7)" id="update7" style="display:none"/></td><td><input id="input7" type="text" style="display: none;" /><p id="parrafo7" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(8)" id="agregar8"/><img src="images/logos/edit.png" onclick="edit(8)" id="edit8" style="display:none"/><img src="images/logos/update.png" onclick="update(8)" id="update8" style="display:none"/></td><td><input id="input8" type="text" style="display: none;" /><p id="parrafo8" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(9)" id="agregar9"/><img src="images/logos/edit.png" onclick="edit(9)" id="edit9" style="display:none"/><img src="images/logos/update.png" onclick="update(9)" id="update9" style="display:none"/></td><td><input id="input9" type="text" style="display: none;" /><p id="parrafo9" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(10)" id="agregar10"/><img src="images/logos/edit.png" onclick="edit(10)" id="edit10" style="display:none"/><img src="images/logos/update.png" onclick="update(10)" id="update10" style="display:none"/></td><td><input id="input10" type="text" style="display: none;"/><p id="parrafo10" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(11)" id="agregar11"/><img src="images/logos/edit.png" onclick="edit(11)" id="edit11" style="display:none"/><img src="images/logos/update.png" onclick="update(11)" id="update11" style="display:none"/></td><td><input id="input11" type="text" style="display: none;" /><p id="parrafo11" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(12)" id="agregar12"/><img src="images/logos/edit.png" onclick="edit(12)" id="edit12" style="display:none"/><img src="images/logos/update.png" onclick="update(12)" id="update12" style="display:none"/></td><td><input id="input12" type="text" style="display: none;" /><p id="parrafo12" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(13)" id="agregar13"/><img src="images/logos/edit.png" onclick="edit(13)" id="edit13" style="display:none"/><img src="images/logos/update.png" onclick="update(13)" id="update13" style="display:none"/></td><td><input id="input13" type="text" style="display: none;" /><p id="parrafo13" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(14)" id="agregar14"/><img src="images/logos/edit.png" onclick="edit(14)" id="edit14" style="display:none"/><img src="images/logos/update.png" onclick="update(14)" id="update14" style="display:none"/></td><td><input id="input14" type="text" style="display: none;" /><p id="parrafo14" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(15)" id="agregar15"/><img src="images/logos/edit.png" onclick="edit(15)" id="edit15" style="display:none"/><img src="images/logos/update.png" onclick="update(15)" id="update15" style="display:none"/></td><td><input id="input15" type="text" style="display: none;" /><p id="parrafo15" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(16)" id="agregar16"/><img src="images/logos/edit.png" onclick="edit(16)" id="edit16" style="display:none"/><img src="images/logos/update.png" onclick="update(16)" id="update16" style="display:none"/></td><td><input id="input16" type="text" style="display: none;" /><p id="parrafo16" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(17)" id="agregar17"/><img src="images/logos/edit.png" onclick="edit(17)" id="edit17" style="display:none"/><img src="images/logos/update.png" onclick="update(17)" id="update17" style="display:none"/></td><td><input id="input17" type="text" style="display: none;" /><p id="parrafo17" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(18)" id="agregar18"/><img src="images/logos/edit.png" onclick="edit(18)" id="edit18" style="display:none"/><img src="images/logos/update.png" onclick="update(18)" id="update18" style="display:none"/></td><td><input id="input18" type="text" style="display: none;" /><p id="parrafo18" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(19)" id="agregar19"/><img src="images/logos/edit.png" onclick="edit(19)" id="edit19" style="display:none"/><img src="images/logos/update.png" onclick="update(19)" id="update19" style="display:none"/></td><td><input id="input19" type="text" style="display: none;" /><p id="parrafo19" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(20)" id="agregar20"/><img src="images/logos/edit.png" onclick="edit(20)" id="edit20" style="display:none"/><img src="images/logos/update.png" onclick="update(20)" id="update20" style="display:none"/></td><td><input id="input20" type="text" style="display: none;" /><p id="parrafo20" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(21)" id="agregar21"/><img src="images/logos/edit.png" onclick="edit(21)" id="edit21" style="display:none"/><img src="images/logos/update.png" onclick="update(21)" id="update21" style="display:none"/></td><td><input id="input21" type="text" style="display: none;" /><p id="parrafo21" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(22)" id="agregar22"/><img src="images/logos/edit.png" onclick="edit(22)" id="edit22" style="display:none"/><img src="images/logos/update.png" onclick="update(22)" id="update22" style="display:none"/></td><td><input id="input22" type="text" style="display: none;" /><p id="parrafo22" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(23)" id="agregar23"/><img src="images/logos/edit.png" onclick="edit(23)" id="edit23" style="display:none"/><img src="images/logos/update.png" onclick="update(23)" id="update23" style="display:none"/></td><td><input id="input23" type="text" style="display: none;" /><p id="parrafo23" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(24)" id="agregar24"/><img src="images/logos/edit.png" onclick="edit(24)" id="edit24" style="display:none"/><img src="images/logos/update.png" onclick="update(24)" id="update24" style="display:none"/></td><td><input id="input24" type="text" style="display: none;" /><p id="parrafo24" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td width="15%" valign="middle"><img src="images/logos/plus.png" style="display:none" onclick="agregar(25)" id="agregar25"/><img src="images/logos/edit.png" onclick="edit(25)" id="edit25" style="display:none"/><img src="images/logos/update.png" onclick="update(25)" id="update25" style="display:none"/></td><td><input id="input25" type="text" style="display: none;" /><p id="parrafo25" style="display:none"></p></td>    
     		</tr>
            <tr>    
                <td colspan="2"><input type="button" value="Actualizar Reporte" onclick="validar2()" name="btnEnviar"/></td>     
     		</tr>
        </table>
  
  </div>
<!--fin Obras Civiles--> 
	  <a href="#" id="alert" style="display:none"></a>
      <a href="#" id="alert2" style="display:none">&nbsp;</a>
      <a href="#" id="alert3" style="display:none">&nbsp;</a>  
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
	alertify.alert("TODOS LOS CAMPOS DEBEN ESTAR LLENOS");
	return false;
 });
 $("#alert2").on( 'click', function () {
	reset();
	alertify.alert("Ya no puedes agregar mas Cajas de Texto");
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
