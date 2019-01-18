<!--#include file="funcion3/funcion.inc"-->
<%
sucursal=request("sucursal")

set conexion = Server.CreateObject("ADODB.Connection")

 conexion.Open ConnStr
  Set rsTabla = Server.CreateObject("ADODB.Recordset") 

    sql = " Select * from cat_sucursales where cr = '" & sucursal & "'"

  rsTabla.Open sql, conexion, 0


    if not(rsTabla.eof) then

regresar=regresar & "<div class='datagrid'>"
regresar=regresar & " <table  align='center' cellpadding='0' cellspacing='0' class='display' id='example1'>"
regresar=regresar & "  <thead>"
regresar=regresar & "    <tr>"
regresar=regresar & "     <th align='center' colspan='4'>Valida Informacion</th>"
regresar=regresar & "  </thead>"
regresar=regresar & "  <tbody>"


regresar=regresar & "        <tr >"
regresar=regresar & "          <td width='3%' >CR</td>"
regresar=regresar & "          <td width='3%' ><input type='text' name='sucursal2' id='sucursal2' value='" &  rstabla("cr") & "' disabled /></td>"
regresar=regresar & "          <td width='3%' >Sucursal</td>"
regresar=regresar & "          <td width='3%' ><input type='text' name='sucursal3' id='sucursal3' value='" &  rstabla("Nombre_sucursal") & "' /> </td>"
regresar=regresar & "        </tr>"

     regresar=regresar & "   <tr>"
     regresar=regresar & "       <td> Zona Precio </td>"
     regresar=regresar & "<td><select id='selectzonaprecio' name='selectzonaprecio'>"
     regresar=regresar & "           <option>" & rsTabla("zona") & "</option>"
     regresar=regresar & "           <option>1</option>"
     regresar=regresar & "           <option>2</option>"
     regresar=regresar & "           <option>3</option>"
     regresar=regresar & "           </select></td>"
     regresar=regresar & "      <td> Bloque </td>"
     regresar=regresar & "       <td><input type='text' name='bloque' id='bloque' value='" & rsTabla("bloque") & "' /></td>"
     regresar=regresar & "   </tr>"

     regresar=regresar & "   <tr>"
     regresar=regresar & "       <td> Territorial </td>"
     regresar=regresar & "<td><select id='territorial' name='territorial'>"
     regresar=regresar & "           <option>" & rstabla("territorial") & "</option>"
     regresar=regresar & "           <option>CENTRO</option>"
     regresar=regresar & "           <option>MEXICO NTE</option>"
     regresar=regresar & "           <option>MEXICO SUR</option>"
     regresar=regresar & "           <option>NOROESTE</option>"
     regresar=regresar & "           <option>NORTE</option>"
     regresar=regresar & "           <option>OCCIDENTE</option>"
     regresar=regresar & "           <option>PENINSULAR</option>"
     regresar=regresar & "           <option>SUR</option>"
     regresar=regresar & "           </select></td>"
     regresar=regresar & "       <td> Alcance Tipo </td>"
     regresar=regresar & "       <td><input type='text' name='alcancet' id='alcancet' value='" & rsTabla("alcance_tipo") & "' /></td>"
     regresar=regresar & "    </tr>"

     'regresar=regresar & "    <tr>"
     'regresar=regresar & "       <td> Inicio Proyecto </td>"
     'regresar=regresar & "       <td><input type='date' name='inicio' id='inicio' value='" & rsTabla("inicioproyecto") & "' /></td>"
     'regresar=regresar & "       <td> Fin Proyecto </td>"
     'regresar=regresar & "       <td><input type='date' name='fin' id='fin' value='" & rsTabla("finproyecto") & "' /></td>"
     'regresar=regresar & "   </tr>"

     regresar=regresar & "<tr>"
     regresar=regresar & "     <td> Domicilio </td><td><input type='text' name='domicilio' id='domicilio' value='" & rsTabla("domicilio") & "'/></td>"
     regresar=regresar & "     <td> Colonia </td><td><input type='text' name='colonia' id='colonia' value='" & rsTabla("colonia") & "'/></td>"   
     regresar=regresar & "</tr>"

     regresar=regresar & "<tr>"
     regresar=regresar & "     <td> M2 Construidos </td><td><input type='text' name='m2' id='m2' value='" & rsTabla("m2_construccion") & "'/></td>"
     regresar=regresar & "     <td> Regional </td><td><input type='text' name='regional' id ='regional' value='" & rsTabla("regional") & "'/></td>"
     regresar=regresar & " </tr>"

     regresar=regresar & "<tr>"
     regresar=regresar & "     <td> Ciudad </td><td><input type='text' name='ciudad' id='ciudad' value='" & rsTabla("ciudad") & "'/></td>"
     regresar=regresar & "   <td> Estado </td>"

     regresar=regresar & "<td><select id='selectestado' name='selectestado'>"
     regresar=regresar & "           <option>" & rstabla("estado") & "</option>"
     regresar=regresar & "           <option>AGUASCALIENTES</option>"
regresar=regresar & "           <option>BAJA CALIFORNIA</option>"
regresar=regresar & "           <option>BAJA CALIFORNIA SUR</option>"
regresar=regresar & "           <option>CAMPECHE</option>"
regresar=regresar & "           <option>CHIAPAS</option>"
regresar=regresar & "           <option>CHIHUAHUA</option>"
regresar=regresar & "           <option>CIUDAD DE MEXICO</option>"
regresar=regresar & "           <option>COAHUILA</option>"
regresar=regresar & "           <option>COLIMA</option>"
regresar=regresar & "           <option>DURANGO</option>"
regresar=regresar & "           <option>GUANAJUATO</option>"
regresar=regresar & "           <option>GUERRERO</option>"
regresar=regresar & "           <option>HIDALGO</option>"
regresar=regresar & "           <option>JALISCO</option>"
regresar=regresar & "           <option>MEXICO</option>"
regresar=regresar & "           <option>MICHOACAN</option>"
regresar=regresar & "           <option>MORELOS</option>"
regresar=regresar & "           <option>NAYARIT</option>"
regresar=regresar & "           <option>NUEVO LEON</option>"
regresar=regresar & "           <option>OAXACA</option>"
regresar=regresar & "           <option>PUEBLA</option>"
regresar=regresar & "           <option>QUERETARO</option>"
regresar=regresar & "           <option>QUINTANA ROO</option>"
regresar=regresar & "           <option>SAN LUIS POTOSI</option>"
regresar=regresar & "           <option>SINALOA</option>"
regresar=regresar & "           <option>SONORA</option>"
regresar=regresar & "           <option>TABASCO</option>"
regresar=regresar & "           <option>TAMAULIPAS</option>"
regresar=regresar & "           <option>TLAXCALA</option>"
regresar=regresar & "           <option>VERACRUZ</option>"
regresar=regresar & "           <option>YUCATAN</option>"
regresar=regresar & "           <option>ZACATECAS</option>"
regresar=regresar & "</select>"
regresar = regresar& " </td></tr>"
regresar=regresar & "    <tr>"
     regresar=regresar & "     <td> Zona Territorial </td><td>"
     regresar=regresar & "        <select id='zonat' name='zonat'>"
     regresar=regresar & "           <option>" & rstabla("zona_territorial") & "</option>"
     regresar=regresar & "           <option>1</option>"
     regresar=regresar & "           <option>2</option>"
     regresar=regresar & "           </select></td>"
     regresar=regresar & "       <td></td>"
     regresar=regresar & "  </tr>"


		 rsTabla.close 
         conexion.close 

          Set conexion = Nothing 
          Set rsTabla = Nothing 
	
          end if
    regresar=regresar & " </tbody>"
    regresar=regresar & " </table>"
    regresar=regresar & " <center><input  type='button' value='Actualiza Informacion' onclick='updatecr()' name='btnupdate' /></center>"
    regresar=regresar & " </div>"

   ' regresar= "kakaroto" & sucursal

    response.write(regresar)

%>
