
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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
a:link {
    text-decoration: none;
}

.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 50%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);

}
.modal-content2 {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 60%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);

}
/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 18px;
    font-weight: bold;
}
  .modal-header, h4 {
      background-color: #90191c;
      color:white !important;
      text-align: center;
      font-size: 10px;
  }
  .modal-footer {
      background-color: #fcbdbd;
    color:#90191c !important;
    text-align: center;
      font-size:10px;
  }
  </style>
<Script language="javascript">
function enviar(){

	document.getElementById('frm_informe_cr').action="modulos_lobby.asp"
	document.getElementById('frm_informe_cr').submit();
}
function home(){
  <%if session.Contents("privilegio")="2" then%>
    document.getElementById('frm_informe_cr').action="inicioSupervisor_lobby.asp" 
   <%else%>
    document.getElementById('frm_informe_cr').action="inicioContratista_lobby.asp"  
   <%end if%>
	document.getElementById('frm_informe_cr').submit()
}
function home2(){
<%if isempty(session.Contents("director"))then%>
	<%if isempty(session.Contents("gerente"))then%>
	document.getElementById('frm_informe_cr').action="inicioContratista.asp"
	 <%else%>
	 document.getElementById('frm_informe_cr').action="inicioGerente.asp"
	 <%end if%>
 <%else%>
	document.getElementById('frm_informe_cr').action="inicioDirector.asp"
 <%end if%>
	document.getElementById('frm_informe_cr').submit()
}
 function exit(){
	 document.getElementById('frm_informe_cr').action="cerrar_sesion.asp"
	 document.getElementById('frm_informe_cr').submit()
 }
 function validar2(){
	 document.getElementById('frm_informe_cr').action="totalPendientes.asp"
	document.getElementById('frm_informe_cr').submit();
	 
 }
  function validar3(){
	 document.getElementById('frm_informe_cr').action="verCalendario.asp"
	document.getElementById('frm_informe_cr').submit();
	 
 }
 function validar4(){
	 document.getElementById('frm_informe_cr').action="totalPendientesaSupervisor.asp"
	document.getElementById('frm_informe_cr').submit();
	 
 }
  function validar5(){
	 document.getElementById('frm_informe_cr').action="llenadoPDF1.asp"
	document.getElementById('frm_informe_cr').submit();
	 
 }
   function validar6(){
	 document.getElementById('frm_informe_cr').action="autorizarCostoObra.asp"
	document.getElementById('frm_informe_cr').submit();
	 
 }
    function validar7(){
	if (<%=estimacionOK(session.Contents("cr"))%>=="1"){
		 document.getElementById('frm_informe_cr').action="GenerarEstimacion.asp"
		 document.getElementById('frm_informe_cr').submit();
	}
	else{
		alert("Esta sucursal todavia no alcanza el porcentaje requerido para realizar la estimacion")
	}
	
	//document.getElementById('frm_informe_cr').action="autorizarCostoObra.asp"
	//document.getElementById('frm_informe_cr').submit();
	 
 }
 
 function validar8(){
	detSearchEstatus()
 }
  function validar9(){
  detSearchPrimVisita()
 }
 
 function detSearchEstatus(){
	$.ajax({
	type: "GET",
	url: "searchEstatusObra.asp?cr=" + <%=session.Contents("cr")%>, 
	dataType: "html", 
	success: function(response){
		if(response=="entregada"){
			alert("esta sucursal ya se entrego")
		}
		else{
			if(response=="3"){
				detUpdateEntregaMtto()
			
			}
			else{
				alert("no se entrga a mtto")
			}
		}
		
	//$("#costoEstimado").html(response)

	}
  });

}

function detSearchPrimVisita(){
  $.ajax({
  type: "GET",
  url: "searchEstatusPrimVisita.asp?cr=" + <%=session.Contents("cr")%>, 
  dataType: "html", 
  success: function(response){
    if(response=="PrimVisitaReg"){
      alert("Esta sucursal ya registro su numero de Pedimento")
    }
    else{
      detSucursal()
        //detUpdateEntregaMtto()
    }
    
  //$("#costoEstimado").html(response)

  }
  });

}

function soloNumeros(e){
  var key = window.Event ? e.which : e.keyCode
  return (key >= 46 && key <= 57)
}

function detUpdateEntregaMtto(){
	$.ajax({
	type: "GET",
	url: "updateEntregaMtto.asp?cr=" + <%=session.Contents("cr")%>, 
	dataType: "html", 
	success: function(response){ 
		if(response=="ok"){
				alert("Actualizacion ok")
			}
		else{
				alert("error")
			}
	//$("#costoEstimado").html(response)

	}
  });

}
 function detSearchCostoEstimado(){
	$.ajax({
	type: "GET",
	url: "searchCostoEstimado.asp?cr=" + <%=session.Contents("cr")%>, 
	dataType: "html", 
	success: function(response){ 

	$("#costoEstimado").html(response)

	}
  });

}
function updatePrimVisita(id){

  $.ajax({
  type: "GET",
  url: "updatePrimVisita.asp?pedimento=" + id, 
  dataType: "html", 
  success: function(response){ 

  if(response=="ok"){
        alert("Pedimento registrado con Exito")
        document.getElementById("myModal").style.display="none"
      }
    else{
        alert("error")
      }

  }
  });

}
function updatePedimento(id){
  var bandera=false
 familia=id;
  if (familia.length == 0 || /^\s+$/.test(familia)){
    alert('Debes ingresar pedimento')
    bandera=false
  }
  else{
    bandera=true
  }
  if (bandera==true){
    updatePrimVisita(id)
  }
}
 function detSucursal(){
  $.ajax({
  type: "GET",
  url: "formPrimVisita.asp", 
  dataType: "html", 
  success: function(response){ 
  $("#infSucursal").html(response);
  //document.getElementById('loader').style.display="none"
  showModal()
  }
  });

}
function showModal(){
  //detComp(cr)
     document.getElementById('myModal').style.display='block';
}


</script>
<%if isempty(session("cr")) then
response.Redirect("default.asp?logout=true")
end if%>
</head>
<body>
<form name="frm_informe_cr" id="frm_informe_cr" method="post">
<div id="pagina">
  <div id="header">
    <div id="logo">  
      <p><strong>Modulo de supervisi&oacute;n de Lobby</strong></p>
    </div>
    <div id="barrasuperior">
    <table><tr><td width="85%" onclick="home()"><a href="#" style="padding-left:75%;color:white;"><font style="font-size:200%"><span class="icon-home3"></span></font></a></td><td onclick="exit()"><a href="#" style="padding-left:50%;color:white;"><font style="font-size:200%"><span class="icon-exit"></span></font></a></td></tr></table>
      &nbsp;
    </div>
  </div>
  <div align="center" id="menu_inicio">
    <div id="detalle">
      <p>CR: <strong><%=session.Contents("cr")%></strong></p>
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
    <br />
    <div id="detalleRojo">
      <p>Fecha Inicio: <strong><%=rs12("fecha_inicio_obra")%></strong></p>
      <p>Fecha T&eacute;rminino: <strong><%=rs12("fecha_termino_obra")%></strong></p>

	  <p>Fecha Entrega Comercial: <strong><%=rs12("fecha_entrega_comercial")%></strong></p>
	
      <p>&Uacute;ltimo Reporte: <strong><%=Mid(rs12("last_update"),1,10)%></strong></p>
	  <p>Importe Contrato: <strong><%=costoEstimado(session.Contents("cr"))%></strong></p>
    </div>
    <br />
    <div id="detalle">
      <p>Estatus de Obra:<strong></strong></p> 
      <table width="100%" align="center">
        <tr>
          <td><p>Prog: <strong></strong></p></td>
          <td align="right"><p><strong>Real: </strong></p></td>
          </tr>
<%
end if
rs12.close
conn12.close 
set rs12=nothing
set conn12=nothing
%>          
      </table>
    </div>
    <br />
  


       <table  width="80%" align="center">
        <tr>
          <td align="center"><input class="botonGrande" type="button" value="Ver Reporte de Obra" onclick="enviar()" name="btnEnviar"/></td>
        </tr>
        <tr height="20px">
          <td>&nbsp;</td>
        </tr>
      <input type="hidden" value="true"  name="hddnEnviar"/>
  </div>
</div>
<div id="infSucursal">

</div>

</form>

  <script src="menu.js"></script>

<script>
function showModal(){
  //detComp(cr)
     document.getElementById('myModal').style.display='block';
}
</script>
<script>
// Get the modal
var modal = document.getElementById('myModal');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
</body>
</html>
