
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
 function exit(){
	 document.getElementById('frm_informe_cr').action="cerrar_sesion.asp"
	 document.getElementById('frm_informe_cr').submit()
 }
 function back(){
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
 function soloNumeros(e){
	var key = window.Event ? e.which : e.keyCode
	if (key == 13){
		enter(e)
	}
	return (key >= 48 && key <= 57)
 }
 
 function enter(e) {
  tecla = (document.all) ? e.keyCode : e.which;
  if (tecla==13) validar();
 } 

 function validar(){
  if (document.getElementById('txt_buscar').value.length<4){
		simulateClick(document.getElementById('alert3'))	
		document.getElementById('txt_buscar').focus();
   }
  else{
	 if (isNaN(document.getElementById('txt_buscar').value * 1)){
		simulateClick(document.getElementById('alert2'))	
		document.getElementById('txt_buscar').value="";
		document.getElementById('txt_buscar').focus();
	 }
	 else{
		enviar(document.getElementById('txt_buscar').value)		
	 }
   }
 }
 function enviar(cr){
	document.getElementById('hdd_cr').value=cr
	document.getElementById('frm_informe_cr').action="detalleCR.asp"
	sucDet(cr)
 }

function sucDet(cr){

	$.ajax({
	type: "GET",
	url: "searchCR.asp?cr=" + cr , 
	dataType: "html", 
	success: function(response){ 
	//$("#dedede").html(response);
	if (response=="NO"){
		simulateClick(document.getElementById('alert'))
		//alert('nega')		
		} 
		else{
			document.getElementById('frm_informe_cr').submit();
	//		alert('afirma')
		}
	}
  });
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

 function detSucursal(cr){

	$.ajax({
	type: "GET",
	url: "searchInfSucursal.asp?cr=" + cr, 
	dataType: "html", 
	success: function(response){ 
	$("#infSucursal").html(response);
	//document.getElementById('loader').style.display="none"
	showModal()
	}
  });

}
</script>

</head>

<%'if isempty(session("nombre_usuario")) then
'response.Redirect("default.asp?logout=true")
'send if
estatusObra=request("hdd_Enviar")
estatusObra2=request("hdd_Enviar2")
tipoVista=request("hdd_Enviar3")
if estatusObra2="" then
estatusObra2=estatusObra
end if
division=request("hdd_valorSelectDivision")
supervisor=request("hdd_valorSelectSupervisor")

%>
<body>
<form name="frm_informe_cr" id="frm_informe_cr" method="post">
<div id="pagina">
<div id="header">
<div id="logo">  
<p><strong>Modulo de supervisi&oacute;n de Obra <%=supervisor%></strong></p> 
</div>
    <div id="barrasuperior">
    <table><tr><td width="85%" onclick="back()"><a href="#" style="padding-left:75%"><font style="font-size:200%;color:white"><span class="icon-arrow-left"></span></font></a></td><td onclick="exit()"><a href="#" style="padding-left:50%;color:white"><font style="font-size:200%"><span class="icon-exit" ></span></font></a></td></tr></table>
      &nbsp;
    </div>
</div>
<div align="left" id="menu_inicioC">
 <%if isempty(session.Contents("director"))then%>
<p><font size="+5"><strong><%=server.HTMLEncode(session.Contents("nombre_usuario"))%></strong></font></p>
<%end if%>
</div> 
<div align="center">
<table width="100%" align="center">
 <tr height="80px"><td colspan="3"><p><font size="+5"><strong>Obras <%=buscaEstatus(estatusObra)%></strong></font></p></td></tr>

  <tr>
  <td width="10%">&nbsp;</td><td align="center" width="25%"><p><font size="+2"><strong>CR</strong></font></p></td><td align="center" width="20%"><p><font size="+2"><strong>SUC.</strong></font></p></td><td align="center" width="20%"><p><font size="+2"><strong>TERR.</strong></font></p></td><td align="center" width="25%"><p><font size="+2"><strong>Pendientes</strong></font></p></td>
 </tr>

 <%

Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
'perfil director
if not(isempty(session.Contents("director"))) then
 if supervisor="" and not(division="") then
  sql= "SELECT a.CR,c.territorial,c.nombre_sucursal, a.FechaTermino, CASE WHEN b.pendientes IS NULL THEN 0 ELSE b.pendientes END AS pendientes FROM tseguimiento a LEFT JOIN app_bnrt_login d on a.supervisorAsignado =d.login_id LEFT JOIN cat_sucursales c on a.CR=c.CR LEFT JOIN( SELECT cr, COUNT(cr) AS pendientes FROM pendientes where id_estatus=1 GROUP BY cr) b ON a.cr = b.cr WHERE (a.EstatusObra = '" & estatusObra & "' or a.EstatusObra='" & estatusObra2 & "')  and c.territorial='"& division &"' ORDER BY FechaTermino asc"
  sql2= "select * from (SELECT a.CR, a.sucursal as nombre_sucursal,a.FechaTermino,c.Territorial, CASE WHEN b.pendientes IS NULL THEN 0 ELSE b.pendientes END AS pendientes FROM tseguimiento a LEFT JOIN cat_sucursales c on a.cr=c.cr LEFT JOIN( SELECT cr, COUNT(cr) AS pendientes FROM pendientes where id_estatus=1 GROUP BY cr) b ON a.cr = b.cr WHERE (a.EstatusObra = '" & estatusObra & "' or a.EstatusObra='" & estatusObra2 & "') and c.territorial='"& division &"' ORDER BY FechaTermino asc)a where pendientes>0"
 end if

 if not(supervisor="") and division="" then
  sql= "SELECT a.CR,c.territorial,c.nombre_sucursal, a.FechaTermino, CASE WHEN b.pendientes IS NULL THEN 0 ELSE b.pendientes END AS pendientes FROM tseguimiento a LEFT JOIN app_bnrt_login d on a.supervisorAsignado =d.login_id LEFT JOIN cat_sucursales c on a.CR=c.CR LEFT JOIN( SELECT cr, COUNT(cr) AS pendientes FROM pendientes where id_estatus=1 GROUP BY cr) b ON a.cr = b.cr WHERE (a.EstatusObra = '" & estatusObra & "' or a.EstatusObra='" & estatusObra2 & "')  and  d.login_nombre like '" & supervisor &"%' ORDER BY FechaTermino asc"
  sql2= "select * from (SELECT a.CR, a.sucursal as nombre_sucursal,a.FechaTermino,c.Territorial, CASE WHEN b.pendientes IS NULL THEN 0 ELSE b.pendientes END AS pendientes FROM tseguimiento a LEFT JOIN app_bnrt_login d on a.supervisorAsignado =d.login_id LEFT JOIN cat_sucursales c on a.cr=c.cr LEFT JOIN( SELECT cr, COUNT(cr) AS pendientes FROM pendientes where id_estatus=1 GROUP BY cr) b ON a.cr = b.cr WHERE (a.EstatusObra = '" & estatusObra & "' or a.EstatusObra='" & estatusObra2 & "') and  d.login_id = '" & supervisor &"%' ORDER BY FechaTermino asc)a where pendientes>0"
 end if

 if not(supervisor="") and not(division="") then
  sql= "SELECT a.CR,c.territorial,c.nombre_sucursal, a.FechaTermino, CASE WHEN b.pendientes IS NULL THEN 0 ELSE b.pendientes END AS pendientes FROM tseguimiento a LEFT JOIN app_bnrt_login d on a.supervisorAsignado =d.login_id LEFT JOIN cat_sucursales c on a.CR=c.CR LEFT JOIN( SELECT cr, COUNT(cr) AS pendientes FROM pendientes where id_estatus=1 GROUP BY cr) b ON a.cr = b.cr WHERE (a.EstatusObra = '" & estatusObra & "' or a.EstatusObra='" & estatusObra2 & "')  and c.territorial='" & division &"' and d.login_id = '"& supervisor &"' ORDER BY FechaTermino asc"
  sql2= "select * from (SELECT a.CR, a.sucursal as nombre_sucursal,a.FechaTermino,c.Territorial,CASE WHEN b.pendientes IS NULL THEN 0 ELSE b.pendientes END AS pendientes FROM tseguimiento a LEFT JOIN app_bnrt_login d on a.supervisorAsignado =d.login_id LEFT JOIN cat_sucursales c on a.cr=c.cr LEFT JOIN( SELECT cr, COUNT(cr) AS pendientes FROM pendientes where id_estatus=1 GROUP BY cr) b ON a.cr = b.cr WHERE (a.EstatusObra = '" & estatusObra & "' or a.EstatusObra='" & estatusObra2 & "') and c.territorial='" & division &"' and d.login_id = '"& supervisor &"'  ORDER BY FechaTermino asc)a where pendientes>0"
 end if

 if supervisor="" and division="" then
  sql= "SELECT a.CR,c.territorial,c.nombre_sucursal, a.FechaTermino, CASE WHEN b.pendientes IS NULL THEN 0 ELSE b.pendientes END AS pendientes FROM tseguimiento a LEFT JOIN app_bnrt_login d on a.supervisorAsignado =d.login_id LEFT JOIN cat_sucursales c on a.CR=c.CR LEFT JOIN( SELECT cr, COUNT(cr) AS pendientes FROM pendientes where id_estatus=1 GROUP BY cr) b ON a.cr = b.cr WHERE (a.EstatusObra = '" & estatusObra & "' or a.EstatusObra='" & estatusObra2 & "')  ORDER BY FechaTermino asc"
  sql2= "select * from (SELECT a.CR, a.sucursal as nombre_sucursal,a.FechaTermino,c.Territorial, CASE WHEN b.pendientes IS NULL THEN 0 ELSE b.pendientes END AS pendientes FROM tseguimiento a LEFT JOIN cat_sucursales c on a.cr=c.cr LEFT JOIN( SELECT cr, COUNT(cr) AS pendientes FROM pendientes where id_estatus=1 GROUP BY cr) b ON a.cr = b.cr WHERE (a.EstatusObra = '" & estatusObra & "' or a.EstatusObra='" & estatusObra2 & "')  ORDER BY FechaTermino asc)a where pendientes>0"
 end if
 
else
'perfil gerente
 if not(isempty(session.Contents("gerente"))) then
  if supervisor="" then
   sql="SELECT a.CR,c.territorial,c.nombre_sucursal, a.FechaTermino, CASE WHEN b.pendientes IS NULL THEN 0 ELSE b.pendientes END AS pendientes, a.supervisorAsignado, f.id_gerente FROM tseguimiento a LEFT JOIN app_bnrt_login d on a.supervisorAsignado =d.login_id LEFT JOIN cat_sucursales c on a.CR=c.CR LEFT JOIN( SELECT cr, COUNT(cr) AS pendientes FROM pendientes where id_estatus=1 GROUP BY cr) b ON a.cr = b.cr  LEFT JOIN cat_gerentes_supervisores f on f.id_supervisor=a.supervisorAsignado WHERE (a.EstatusObra = '" & estatusObra &"' or a.EstatusObra='" & estatusObra2 &"') and f.id_gerente=" &session.contents("id") & "  ORDER BY FechaTermino asc"
   sql2="select * from (SELECT a.CR,c.territorial,c.nombre_sucursal, a.FechaTermino, CASE WHEN b.pendientes IS NULL THEN 0 ELSE b.pendientes END AS pendientes, a.supervisorAsignado, f.id_gerente FROM tseguimiento a LEFT JOIN app_bnrt_login d on a.supervisorAsignado =d.login_id LEFT JOIN cat_sucursales c on a.CR=c.CR LEFT JOIN( SELECT cr, COUNT(cr) AS pendientes FROM pendientes where id_estatus=1 GROUP BY cr) b ON a.cr = b.cr  LEFT JOIN cat_gerentes_supervisores f on f.id_supervisor=a.supervisorAsignado WHERE (a.EstatusObra = '" & estatusObra &"' or a.EstatusObra='" & estatusObra2 &"') and f.id_gerente=" &session.contents("id") & "  ORDER BY FechaTermino asc)z where pendientes>1"
  end if
  
  if not(supervisor="") then
   sql="SELECT a.CR,c.territorial,c.nombre_sucursal, a.FechaTermino, CASE WHEN b.pendientes IS NULL THEN 0 ELSE b.pendientes END AS pendientes, a.supervisorAsignado, f.id_gerente FROM tseguimiento a LEFT JOIN app_bnrt_login d on a.supervisorAsignado =d.login_id LEFT JOIN cat_sucursales c on a.CR=c.CR LEFT JOIN( SELECT cr, COUNT(cr) AS pendientes FROM pendientes where id_estatus=1 GROUP BY cr) b ON a.cr = b.cr  LEFT JOIN cat_gerentes_supervisores f on f.id_supervisor=a.supervisorAsignado WHERE (a.EstatusObra = '" & estatusObra &"' or a.EstatusObra='" & estatusObra2 &"') and f.id_gerente=" &session.contents("id") & " and d.login_nombre='" & supervisor &"'  ORDER BY FechaTermino asc"
   sql2="select * from (SELECT a.CR,c.territorial,c.nombre_sucursal, a.FechaTermino, CASE WHEN b.pendientes IS NULL THEN 0 ELSE b.pendientes END AS pendientes, a.supervisorAsignado, f.id_gerente FROM tseguimiento a LEFT JOIN app_bnrt_login d on a.supervisorAsignado =d.login_id LEFT JOIN cat_sucursales c on a.CR=c.CR LEFT JOIN( SELECT cr, COUNT(cr) AS pendientes FROM pendientes where id_estatus=1 GROUP BY cr) b ON a.cr = b.cr  LEFT JOIN cat_gerentes_supervisores f on f.id_supervisor=a.supervisorAsignado WHERE (a.EstatusObra = '" & estatusObra &"' or a.EstatusObra='" & estatusObra2 &"') and f.id_gerente=" &session.contents("id") & " and d.login_nombre='" & supervisor &"'  ORDER BY FechaTermino asc)z where pendientes>1"
  end if
 else
'otro perfil
  sql= "SELECT a.CR, a.FechaTermino,c.nombre_sucursal,c.Territorial, CASE WHEN b.pendientes IS NULL THEN 0 ELSE b.pendientes END AS pendientes FROM tseguimiento a LEFT JOIN cat_sucursales c on a.CR=c.CR LEFT JOIN( SELECT cr, COUNT(cr) AS pendientes FROM pendientes where id_estatus=1 GROUP BY cr) b ON a.cr = b.cr WHERE (a.EstatusObra = '" & estatusObra & "' or a.EstatusObra='" & estatusObra2 & "') and a.ContratistaAsignado='" & session.Contents("contratista") & "' ORDER BY FechaTermino asc"
  sql2= "select * from (SELECT a.CR, a.sucursal as nombre_sucursal,a.FechaTermino,c.Territorial,	 CASE WHEN b.pendientes IS NULL THEN 0 ELSE b.pendientes END AS pendientes FROM tseguimiento a LEFT JOIN cat_sucursales c on a.cr=c.cr LEFT JOIN( SELECT cr, COUNT(cr) AS pendientes FROM pendientes where id_estatus=1 GROUP BY cr) b ON a.cr = b.cr WHERE (a.EstatusObra = '" & estatusObra & "' or a.EstatusObra='" & estatusObra2 & "') and ContratistaAsignado='" & session.Contents("contratista") & "' ORDER BY FechaTermino asc)a where pendientes>0"
 end if
end if

if tipoVista =2 then
rs.open sql2,conn
else
rs.open sql,conn
end if
if rs.eof then
%> 
<tr><td><p>No se encontro la informacion solicitada</p></td></tr>
<%
else
while not(rs.eof)
%>
<tr height="80px"><td align="left"  onclick="detSucursal('<%=rs("cr")%>')"><a href="#"><font style="font-size:200%;"><span class="icon-eye"></span></font></a></td><td style="padding-left:10%" onclick="enviar('<%=rs("cr")%>')"><font size="100%" color='#d51818' style="text-decoration:underline"><strong><%=rs("cr")%></strong></font></td><td align="center"><font size="+2"><%=rs("nombre_sucursal")%></font></td><td align="center"><font size="+2"><%=rs("territorial")%></font></td><td style="padding-left:10%"><font size="100%"><%=rs("pendientes")%></font></td></tr>
<% 

rs.movenext
wend

end if
rs.close
conn.close 
set rs=nothing
set conn=nothing
%>  
 <tr height="20px"><td>&nbsp;</td></tr>
</table>

 </div>  
   <input type="hidden" id="hdd_cr" name="hdd_cr"/>
</div>

<div id="infSucursal">

</div




 	  <a href="#" id="alert" style="display:none"></a>
      <a href="#" id="alert2" style="display:none">&nbsp;</a>
      <a href="#" id="alert3" style="display:none">&nbsp;</a>
</form>

      
      
 	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="menu.js"></script>
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="alertify.js-0.3.11/lib/alertify.min.js"></script>
<script>
function showModal(){
	//detComp(cr)
		 document.getElementById('myModal').style.display='block';
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
			alertify.alert("<strong>CR</strong>  no encontrado!");
			return false;
		});
		$("#alert2").on( 'click', function () {
			reset();
			alertify.alert("El <strong>CR</strong> solo debe contener <strong>numeros</strong>");
			return false;
		});
		$("#alert3").on( 'click', function () {
			reset();
			alertify.alert("El <strong>CR</strong>  debe ser de <strong>4</strong> digitos");
			return false;
		});

		
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
