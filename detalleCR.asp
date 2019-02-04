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
    function enviar() {
      document.getElementById('frm_informe_cr').action = "modulos.asp"
      document.getElementById('frm_informe_cr').submit();
    }
    function home() {
      document.getElementById('frm_informe_cr').action = "iniciosupervisor.asp"
      document.getElementById('frm_informe_cr').submit()
    }
    function home2() {
<%if isempty(session.Contents("director"))then %>
	<%if isempty(session.Contents("gerente"))then %>
        document.getElementById('frm_informe_cr').action="inicioContratista.asp"
          <%else%>
            document.getElementById('frm_informe_cr').action="inicioGerente.asp"
              <% end if%>
 <%else%>
        document.getElementById('frm_informe_cr').action="inicioDirector.asp"
          <% end if%>
            document.getElementById('frm_informe_cr').submit()
}
    function exit() {
      document.getElementById('frm_informe_cr').action = "cerrar_sesion.asp"
      document.getElementById('frm_informe_cr').submit()
    }
    function validar2() {
      document.getElementById('frm_informe_cr').action = "totalPendientes.asp"
      document.getElementById('frm_informe_cr').submit();

    }
    function validar3() {
      document.getElementById('frm_informe_cr').action = "verCalendario.asp"
      document.getElementById('frm_informe_cr').submit();

    }
    function validar4() {
      document.getElementById('frm_informe_cr').action = "totalPendientesaSupervisor.asp"
      document.getElementById('frm_informe_cr').submit();

    }
    function validar5() {
      document.getElementById('frm_informe_cr').action = "llenadoPDF1.asp"
      document.getElementById('frm_informe_cr').submit();

    }
    function validar6() {
      document.getElementById('frm_informe_cr').action = "autorizarCostoObra.asp"
      document.getElementById('frm_informe_cr').submit();

    }

    function validar7() {
      if (<%= estimacionOK(session.Contents("cr")) %>=="1") {
        if (<%= estimacionConPedimento(session.Contents("cr")) %>=="1") {
          document.getElementById('frm_informe_cr').action = "GenerarEstimacion.asp"
          document.getElementById('frm_informe_cr').submit();
        }
     else {
          alert("Esta sucursal aun no regitra el numero de pedimento, por favor ingrese el pedimento")
        }
      }
	else {
        alert("Esta sucursal todavia no alcanza el porcentaje requerido para realizar la estimacion")
      }

      //document.getElementById('frm_informe_cr').action="autorizarCostoObra.asp"
      //document.getElementById('frm_informe_cr').submit();

    }

    function validar8() {
      detSearchEstatus()
    }
    function validar9() {
      detSearchPrimVisita()
    }

    function detSearchEstatus() {
      $.ajax({
        type: "GET",
        url: "searchEstatusObra.asp?cr=" + <%=session.Contents("cr") %>,
        dataType: "html",
        success: function (response) {
          if (response == "entregada") {
            alert("esta sucursal ya se entrego")
          }
          else {
            if (response == "3") {
              detUpdateEntregaMtto()

            }
            else {
              alert("no se entrga a mtto")
            }
          }

          //$("#costoEstimado").html(response)

        }
      });

    }

    function detSearchPrimVisita() {
      $.ajax({
        type: "GET",
        url: "searchEstatusPrimVisita.asp?cr=" + <%=session.Contents("cr") %>,
        dataType: "html",
        success: function (response) {
          if (response == "PrimVisitaReg") {
            alert("Esta sucursal ya registro su numero de Pedimento")
          }
          else {
            detSucursal()
            //detUpdateEntregaMtto()
          }

          //$("#costoEstimado").html(response)

        }
      });

    }

    function soloNumeros(e) {
      var key = window.Event ? e.which : e.keyCode
      return (key >= 46 && key <= 57)
    }

    function detUpdateEntregaMtto() {
      $.ajax({
        type: "GET",
        url: "updateEntregaMtto.asp?cr=" + <%=session.Contents("cr") %>,
        dataType: "html",
        success: function (response) {
          if (response == "ok") {
            alert("Actualizacion ok")
          }
          else {
            alert("error")
          }
          //$("#costoEstimado").html(response)

        }
      });

    }
    function detSearchCostoEstimado() {
      $.ajax({
        type: "GET",
        url: "searchCostoEstimado.asp?cr=" + <%=session.Contents("cr") %>,
        dataType: "html",
        success: function (response) {

          $("#costoEstimado").html(response)

        }
      });

    }
    function updatePrimVisita(id) {

      $.ajax({
        type: "GET",
        url: "updatePrimVisita.asp?pedimento=" + id,
        dataType: "html",
        success: function (response) {

          if (response == "ok") {
            alert("Pedimento registrado con Exito")
            document.getElementById("myModal").style.display = "none"
          }
          else {
            alert("error")
          }

        }
      });

    }
    function updatePedimento(id) {
      var bandera = false
      familia = id;
      if (familia.length == 0 || /^\s+$/.test(familia)) {
        alert('Debes ingresar pedimento')
        bandera = false
      }
      else {
        bandera = true
      }
      if (bandera == true) {
        updatePrimVisita(id)
      }
    }
    function detSucursal() {
      $.ajax({
        type: "GET",
        url: "formPrimVisita.asp",
        dataType: "html",
        success: function (response) {
          $("#infSucursal").html(response);
          //document.getElementById('loader').style.display="none"
          showModal()
        }
      });

    }
    function showModal() {
      //detComp(cr)
      document.getElementById('myModal').style.display = 'block';
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
          <p><strong>Modulo de supervisi&oacute;n de Obra</strong></p>
        </div>
        <div id="barrasuperior">
          <table>
            <tr>
              <td width="85%" <%if session.Contents("privilegio")=2 then%>onclick="home()"
                <%else%>onclick="home2()"
                <%end if%>><a href="#" style="padding-left:75%;color:white;">
                  <font style="font-size:200%"><span class="icon-home3"></span></font>
                </a></td>
              <td onclick="exit()"><a href="#" style="padding-left:50%;color:white;">
                  <font style="font-size:200%"><span class="icon-exit"></span></font>
                </a></td>
            </tr>
          </table>
          &nbsp;
        </div>
      </div>
      <div align="center" id="menu_inicio">
        <div id="detalle">
          <p>CR: <strong>
              <%=session.Contents("cr")%></strong></p>
        <%  
        Set conn12 = Server.CreateObject("ADODB.Connection")
        set rs12= Server.CreateObject("adodb.recordset")
        Conn12.Open connstr
        sql12= "select * from tseguimiento where cr='" & session.Contents("cr") & "'"
        rs12.open sql12,conn12
        if rs12.eof then %>
          <p>No se encontro la informacion solicitada</p>
        <%else%>








          <p>Sucursal: <strong>
              <%=rs12("Sucursal")%></strong></p>
          <p>Tipo de transformaci&oacute;n: <strong>
              <%=rs12("TipoTransformacion")%></strong></p>
          <%if session.Contents("privilegio")=2 then%>
            <p>Contratista: <strong>
              <%=buscaContratista(rs12("ContratistaAsignado"))%></strong>
            <p>
          <%else%>
            <%if session.Contents("privilegio")=3 then%>
              <p>Supervisor: <strong>
                  <%=buscaSupervisor(rs12("supervisorAsignado"))%></strong>
                <p>
            <%else%>
                <p>Contratista: <strong>
                  <%=buscaContratista(rs12("ContratistaAsignado"))%></strong>
                <p>
                  <p>Supervisor: <strong>
                      <%=buscaSupervisor(rs12("supervisorAsignado"))%></strong>
                  <p>
            <%end if%>
          <%end if%>
          
          </div>
          
          <br />
          <div id="detalleRojo">
            <p>Fecha Inicio: <strong>
                <%=rs12("fechaInicio")%></strong></p>
            <p>Fecha T&eacute;rminino: <strong>
                <%=rs12("fechaTermino")%></strong></p>
            <%if buscaReasignacion(session.Contents("cr"))= "1" then %>
            <p>Fecha Reprogramacion: <strong>
                <%=rs12("fechaReasignacion")%></strong></p>
            <%end if%>
            <p>&Uacute;ltimo Reporte: <strong>
                <%=Mid(rs12("fUltimoReporte"),1,10)%></strong></p>
            <p>Importe Contrato: <strong>
                <%=costoEstimado(session.Contents("cr"))%></strong></p>
          </div>
          <br />

          <!-- START FALLA -->
          <div id="detalle">
              <p>Estatus de Obra:<strong>
                  <%if buscaReasignacion(session.Contents("cr"))= "1" then %>
                  <!--<img src="images/indicadores/verde.png"/>--> En Tiempo Reprogramada
                  <%else if (cDbl(calculaAvanceProyectado7030(session.Contents("cr"),rs12("fechaInicio")))>cDbl(calculaAvanceGeneral(session.Contents("cr"),"G"))) then %>
                  <!--<img src="images/indicadores/rojo_1.png"/>-->
                  <%else%>
                  <!--<img src="images/indicadores/verde.png"/>-->
                  <%end if%>
                  <%=buscaEstatus(rs12("EstatusObra"))%>
                  <%end if%></strong></p>
              <table width="100%" align="center">
                <tr>
                  <td>
                    <p>Prog: <strong>
                        <%if buscaReasignacion(session.Contents("cr"))= "1" then response.write(calculaAvanceGeneral(session.Contents("cr"),"G")) else response.write(calculaAvanceProyectado7030(session.Contents("cr"),rs12("fechaInicio"))) end if%>
                        % </strong></p>
                  </td>
                  <td align="right">
                    <p><strong>Real:
                        <%=calculaAvanceGeneral(session.Contents("cr"),"G")%> % </strong></p>
                  </td>
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
            <!-- END FALLA -->

            <%if session.Contents("privilegio")=2 then%>
            <table width="80%" align="center">
              <tr>
                <td align="center"><input class="botonGrande" type="button" value="Actualizar Reporte Obra" onclick="enviar()"
                    name="btnEnviar" /></td>
              </tr>
              <tr height="20px">
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td align="center"><input class="botonGrande" type="button" value="Detalle Costo Obra" onclick="validar6()"
                    name="btnEnviar" /></td>
              </tr>
              <tr height="20px">
                <td>&nbsp;</td>
              </tr>
              <tr height="20px">
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td align="center"><input class="botonGrande" type="button" value="Generar Estimacion" onclick="validar7()"
                    name="btnEnviar" /></td>
              </tr>
              <tr height="20px">
                <td>&nbsp;</td>
              </tr>
              <tr height="20px">
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td align="center"><input class="botonGrande" type="button" value="Registrar Pedimento" onclick="validar9()"
                    name="btnEnviar" /></td>
              </tr>
              <tr height="20px">
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td align="center"><input class="botonGrande" type="button" value="Suc. Entregada a Mtto." onclick="validar8()"
                    name="btnEnviar" /></td>
              </tr>
              <tr height="20px">
                <td>&nbsp;</td>
              </tr>

              <tr>
                <td align="center"><input class="botonGrande" type="button" value="Total Pendientes" onclick="validar2()"
                    name="btnEnviar" /></td>
              </tr>
              <tr height="20px">
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td align="center"><input class="botonGrande" type="button" value="Pendientes a Supervisor" onclick="validar4()"
                    name="btnEnviar" /></td>
              </tr>
              <tr height="20px">
                <td>&nbsp;</td>
              </tr>
              <!--
              <tr>
                    <td align="center"><input class="botonGrande" type="button" value="Entrega Sucursal" onclick="validar5()" name="btnEnviar"/></td>
                  </tr>
              <tr height="20px">
                    <td>&nbsp;</td>
                  </tr>
              -->
              <tr>
                <td align="center"><input class="botonGrande" type="button" value="Calendario Suministros" onclick="validar3()"
                    name="btnEnviar" /></td>
              </tr>
            </table>
            <input type="hidden" value="true" name="hddnEnviar" />
          <%else%>
            <%if session.Contents("privilegio")=5 then%>
              <table width="80%" align="center">
                <tr>
                  <td align="center"><input class="botonGrande" type="button" value="Ver Reporte de Obra" onclick="enviar()"
                      name="btnEnviar" /></td>
                </tr>
                <tr height="20px">
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td align="center">
                    <p>Pendientes Reportados: <strong>
                        <%=cuentaPendientes(session.Contents("cr"))%></strong></p>
                  </td>
                </tr>
                <tr height="20px">
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td align="center"><input class="botonGrande" type="button" value="Gesti&oacute;n de Pendientes" onclick="validar2()"
                      name="btnEnviar" /></td>
                </tr>
                <tr height="20px">
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td align="center"><input class="botonGrande" type="button" value="Detalle Costo Obra" onclick="validar6()"
                      name="btnEnviar" /></td>
                </tr>
                <tr height="20px">
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td align="center"><input class="botonGrande" type="button" value="Calendario Suministros" onclick="validar3()"
                      name="btnEnviar" /></td>
                </tr>
              </table>
              <input type="hidden" value="true" name="hddnEnviar" />
            <%else%>
              <table width="80%" align="center">
                <tr>
                  <td align="center"><input class="botonGrande" type="button" value="Ver Reporte de Obra" onclick="enviar()"
                      name="btnEnviar" /></td>
                </tr>
                <tr height="20px">
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td align="center">
                    <p>Pendientes Reportados: <strong>
                        <%=cuentaPendientes(session.Contents("cr"))%></strong></p>
                  </td>
                </tr>
                <tr height="20px">
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td align="center"><input class="botonGrande" type="button" value="Gesti&oacute;n de Pendientes" onclick="validar2()"
                      name="btnEnviar" /></td>
                </tr>
                <tr>
                  <td align="center"><input class="botonGrande" type="button" value="Calendario Suministros" onclick="validar3()"
                      name="btnEnviar" /></td>
                </tr>
              </table>
              <input type="hidden" value="true" name="hddnEnviar" />
          <%end if%>










        <%end if%>
      </div>
    </div>
    <div id="infSucursal">

    </div>

  </form>

  <script src="menu.js"></script>

  <script>
    function showModal() {
      //detComp(cr)
      document.getElementById('myModal').style.display = 'block';
    }
  </script>
  <script>
    // Get the modal
    var modal = document.getElementById('myModal');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    }
  </script>
</body>

</html>