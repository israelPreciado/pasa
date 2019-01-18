<%
'ConnStr="DRIVER={MySQL ODBC 5.3 ANSI Driver};server=scanda500;database=prueba_sistema; uid=xmd7310;pwd=XMD7310; option=3"
'ConnStr="DRIVER={MySQL ODBC 3.51 Driver};server=162.242.164.14;database=prueba_sistema; uid=xmd7550;pwd=XMD7550; option=3"
ConnStr="DRIVER={MySQL ODBC 3.51 Driver};server=localhost;database=prueba_sistema; uid=root;pwd=; option=3"

function cargaLlegadaMateriales(cr)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "SELECT c.pos, c.cve_sap, a.componente, c.cantidad, c.comentario, c.tiempo, concat(year(c.fecha),'-',lpad(month(c.fecha),2,'0'),'-',lpad(day(c.fecha),2,'0')) as fecha, c.cr, a.id_componente, b.modulo, ifnull(c.id_pedido,'0') as id_pedido, a.id_modulo FROM cat_componentes_ALTA a LEFT JOIN cat_modulos b ON a.id_modulo = b.id_modulo LEFT JOIN( SELECT * FROM cat_llegadamateriales WHERE cr = '"& cr & "') c ON a.id_componente = c.id_componente WHERE a.id_modulo NOT IN('1', '12', '8') ORDER BY a.id_modulo"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaLlegadaMateriales=response.write("")
else
	while not(rs2.eof)	
		regresar=regresar & "<tr><td>" & server.HTMLEncode(rs2("modulo").value) & "</td><td>" & server.HTMLEncode(rs2("componente").value) & "<input type='text' id='suministro_" & rs2("id_componente") & "' style='display:none' value='" & server.HTMLEncode(rs2("componente").value) & "'> </td><td><input id='cantidad_" & rs2("id_componente") & "' type='text' value='" & rs2("cantidad") & "' onkeypress='return soloNumeros(event)'></td><td><input id='Clave_SAP_" & rs2("id_componente") & "' type='text'  value='" & rs2("cve_sap") & "'></td><td><input id='semanas_" & rs2("id_componente") & "' type='text' value='" & rs2("tiempo") & "' onkeypress='return soloNumeros(event)' ></td><td><input id='fecha_" & rs2("id_componente") & "'  type='date' value='" & rs2("fecha") & "' onkeypress='return soloNumerosCalendario(event)'></td><td><input id='comentario_" & rs2("id_componente") & "' type='text' value='" & rs2("comentario") & "'></td><td align='right'><img src='images/logos/SAVE32.png' align='left' title='EDITAR USUARIO' style='cursor:pointer' onclick='editUser(" & rs2("id_pedido") &"," & rs2("id_componente") &" )'/></td></tr>"
	rs2.movenext
	wend  
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaLlegadaMateriales=response.write(regresar)
end function

function cargaClavesSapATMS(cr,zona,anio)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from (select case when a.componente is null then ' ' else a.componente end as componente, a.CLAVE_SAP_CONCURSO,a.DESCRIPCION_CORTA,a.DESCRIPCION_LARGA,a.UND,a.Zona" & zona & " as zona,a.PU_Zona" & zona &" as pu from cat_sap_atms_2017 a where a.anio='"& anio &"') a LEFT JOIN (select CLAVE_SAP_CONCURSO clave_sap from nuevocosto_estimadoobra where cr='" & cr & "' and estatus=0) b on a.CLAVE_SAP_CONCURSO=b.clave_sap where b.clave_sap is null;;"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaClavesSapATMS=response.write("")
else
	while not(rs2.eof)	
		regresar=regresar & "<tr><td>" & rs2("clave_sap_concurso") & "</td><td><font size='-3'>" & server.HTMLEncode(rs2("descripcion_corta").value) & "</font></td><td><font size='-3'>" & server.HTMLEncode(rs2("descripcion_larga").value) & "</font></td><td align='right'>$" & rs2("PU")  & "</td><td align='center'><input type='text' width='20' name='" & rs2("clave_sap_concurso") & "' id='" & rs2("clave_sap_concurso") & "' placeholder='Cantidad' onkeypress='return soloNumeros(event)'></td><td align='left'>" & rs2("UND")  & "</td><td align='center'><font size='-3'>" & server.HTMLEncode(rs2("componente").value)  & "</font></td><td align='right'><img src='images/logos/add_notes32.png' align='left' title='Agregar Elemento' style='cursor:pointer' onclick='ingresarElemento(""" & rs2("clave_sap_concurso") & """,""" & rs2("zona") & """,""" & rs2("pu") & """,""" & rs2("componente") & """)' /></td></tr>"
	rs2.movenext
	wend  
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaClavesSapATMS=response.write(regresar)
end function

function cargaClavesSap(cr,zona,anio)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from (select case when b.componente is null then ' ' else b.componente end as componente, a.CLAVE_SAP_CONCURSO,a.DESCRIPCION_CORTA,a.DESCRIPCION_LARGA,a.UND,a.Zona" & zona & " as zona,a.PU_Zona" & zona &" as pu from cat_sap_2017 a LEFT JOIN cat_componentes b on a.componente=b.id_componente where anio='"& anio &"') a LEFT JOIN (select CLAVE_SAP_CONCURSO clave_sap from nuevocosto_estimadoobra where cr='" & cr & "' and estatus=0) b on a.CLAVE_SAP_CONCURSO=b.clave_sap where b.clave_sap is null;"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaClavesSap=response.write("")
else
	while not(rs2.eof)	
		regresar=regresar & "<tr><td>" & rs2("clave_sap_concurso") & "</td><td><font size='-3'>" & server.HTMLEncode(rs2("descripcion_corta").value) & "</font></td><td><font size='-3'>" & server.HTMLEncode(rs2("descripcion_larga").value) & "</font></td><td align='right'>$" & rs2("PU")  & "</td><td align='center'><input type='text' width='20' name='" & rs2("clave_sap_concurso") & "' id='" & rs2("clave_sap_concurso") & "' placeholder='Cantidad' onkeypress='return soloNumeros(event)'></td><td align='left'>" & rs2("UND")  & "</td><td align='center'><font size='-3'>" & server.HTMLEncode(rs2("componente").value)  & "</font></td><td align='right'><img src='images/logos/add_notes32.png' align='left' title='Agregar Elemento' style='cursor:pointer' onclick='ingresarElemento(""" & rs2("clave_sap_concurso") & """,""" & rs2("zona") & """,""" & rs2("pu") & """,""" & rs2("componente") & """)' /></td></tr>"
	rs2.movenext
	wend  
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaClavesSap=response.write(regresar)
end function

function cargaClavesSapCargadas(cr)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from (SELECT  a.id,a.CLAVE_SAP_CONCURSO,a.clave_sap_zona,case when b.DESCRIPCION_CORTA is null then ' ' else b.descripcion_corta end as descripcion_corta, case when b.DESCRIPCION_LARGA is null then ' ' else b.descripcion_larga end as descripcion_larga,a.pu,a.cantidad,b.UND, ROUND(a.pu * a.cantidad,2) as estimacion,case when a.componente is null then ' ' else a.componente end as componente,concat(left(a.fecha_ingreso,4),'-',right(left(a.fecha_ingreso,7),2),'-',right(left(a.fecha_ingreso,10),2),' ',right(a.fecha_ingreso,8))  as fecha_ingreso,estatus from nuevoCosto_estimadoObra a LEFT JOIN cat_sap_2017 b on a.CLAVE_SAP_CONCURSO=b.CLAVE_SAP_CONCURSO where cr = '" & CR & "' and a.componente not like 'Otros' AND a.componente not like 'ATMS' ) as a UNION (select id,CLAVE_SAP_CONCURSO,clave_sap_zona,descorta as descripcion_corta,deslarga as descripcion_larga,pu,cantidad,und,ROUND(pu * cantidad,2) as estimacion,componente,fecha_ingreso,estatus from nuevocosto_estimadoobra where componente = 'Otros' and cr = '" & CR & "') UNION (SELECT  a.id,a.CLAVE_SAP_CONCURSO,a.clave_sap_zona,case when b.DESCRIPCION_CORTA is null then ' ' else b.descripcion_corta end as descripcion_corta, case when b.DESCRIPCION_LARGA is null then ' ' else b.descripcion_larga end as descripcion_larga,a.pu,a.cantidad,b.UND, ROUND(a.pu * a.cantidad,2) as estimacion,case when a.componente is null then ' ' else a.componente end as componente,concat(left(a.fecha_ingreso,4),'-',right(left(a.fecha_ingreso,7),2),'-',right(left(a.fecha_ingreso,10),2),' ',right(a.fecha_ingreso,8))  as fecha_ingreso,estatus from nuevoCosto_estimadoObra a LEFT JOIN cat_sap_aTMS_2017 b on a.CLAVE_SAP_CONCURSO=b.CLAVE_SAP_CONCURSO where cr = '" & CR & "' and  a.componente like 'ATMS')  ;"
'sql3= "select * from (select a.CLAVE_SAP_CONCURSO,a.clave_sap_zona, b.DESCRIPCION_CORTA,a.pu,a.cantidad,b.UND, a.componente, concat(left(a.fecha_ingreso,4),'-',right(left(a.fecha_ingreso,7),2),'-',right(left(a.fecha_ingreso,10),2),' ',right(a.fecha_ingreso,8))  as fecha_ingreso from nuevoCosto_estimadoObra a LEFT JOIN cat_sap_2017 b on a.CLAVE_SAP_CONCURSO=b.CLAVE_SAP_CONCURSO  where cr ='" & cr & "' AND  A.componente NOT like 'ATMS') as a union (select clave_sap_concurso,clave_sap_zona,descorta as descripcion_corta,pu,cantidad,und,componente,fecha_ingreso from nuevocosto_estimadoobra where cr ='" & cr & "' and   componente like 'Otros') UNION (select a.CLAVE_SAP_CONCURSO,a.clave_sap_zona, b.DESCRIPCION_CORTA,a.pu,a.cantidad,b.UND, a.componente, concat(left(a.fecha_ingreso,4),'-',right(left(a.fecha_ingreso,7),2),'-',right(left(a.fecha_ingreso,10),2),' ',right(a.fecha_ingreso,8))  as fecha_ingreso from nuevoCosto_estimadoObra a LEFT JOIN cat_sap_atms_2017 b on a.CLAVE_SAP_CONCURSO=b.CLAVE_SAP_CONCURSO  where cr ='" & cr & "' AND  A.componente like 'ATMS');"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaClavesSapCargadas=response.write("")
else
	while not(rs2.eof)	
		regresar=regresar & "<tr><td>" & rs2("clave_sap_concurso") & "</td><td><font size='-3'>" & server.HTMLEncode(rs2("descripcion_corta").value) & "</font></td><td><font size='-3'>" & server.HTMLEncode(rs2("descripcion_larga").value) & "</font></td><td align='right'>$" & rs2("PU")  & "</td><td align='center'><input type='text' width='20' name='" & rs2("id") & "' id='" & rs2("id") & "' placeholder='Cantidad' onkeypress='return soloNumeros(event)' value='" & rs2("cantidad")  & "' style='display:none'> <p name='parrafo_" & rs2("id") & "' id='parrafo_" & rs2("id") & "'>" & rs2("cantidad")  & "</td></td><td align='center'>" & rs2("UND")  & "</td><td align='center'><font>" & formatoPesos(round(rs2("pu") * rs2("cantidad"),2))  & "</font></td><td align='center'><font size='-3'>" & server.HTMLEncode(rs2("componente").value)  & "</font></td><td align='center'><font size='-1'>" & rs2("fecha_ingreso")  & "</font></td><td align='right'><img src='images/logos/SAVE32.png' align='left' id='save_" & rs2("id") & "' name='save_" & rs2("id") & "' title='Guardar Cambios' style='cursor:pointer;display:none' onclick='guardarElemento(""" & rs2("id") & """)' /><img src='images/logos/editnote32.png' align='left' id='editar_" & rs2("id") & "' name='editar_" & rs2("id") & "' "
		if rs2("estatus")="0" then
			regresar=regresar & " onclick='editarElemento2(""" & rs2("id") & """)'"
		else
			regresar=regresar & " onclick='editarElemento(""" & rs2("id") & """)'"
		end if 
		regresar=regresar & "title='Editar Elemento' style='cursor:pointer' /><img src='images/logos/deletenote32.png' align='left' title='Eliminar Elemento' style='cursor:pointer' onclick='eliminarElemento(""" & rs2("id") & """)' /></td></tr>"
		 
	rs2.movenext
	wend  
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaClavesSapCargadas=response.write(regresar)
end function

Function buscaSucursal(cr)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "SELECT  nombre_sucursal from cat_sucursales where cr = '"& cr &"'" 
rs.open sql, conn2
if rs.eof then
buscaSucursal=""
else
buscaSucursal=server.HTMLEncode(rs("nombre_sucursal"))
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function buscaZonaTransformacion(cr)
set conn33=server.CreateObject("adodb.connection")
set rs22=server.CreateObject("adodb.recordset")
conn33.open connstr
sql33= "select zona from cat_sucursales where cr='" & cr & "'"
regresar=""
rs22.open sql33, conn33
if rs22.eof then
	buscaZonaTransformacion=""
else
	regresar=rs22("zona")
end if

rs22.close
conn33.close 
set rs22=nothing
set conn33=nothing
buscaZonaTransformacion=regresar
End Function

function cargaUsuarios()
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from prueba_sistema_login a LEFT JOIN cat_perfil b on a.login_privilegio =b.id_perfil where login_id<>1 order by login_nombre"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaUsuarios=response.write("")
else
	while not(rs2.eof)	
		regresar=regresar & "<tr><td>" & rs2("login_usuario") & "</td><td>" & rs2("login_pass") & "</td><td>" & rs2("perfil") & "</td><td>" & server.HTMLEncode(rs2("login_nombre").value) & "</td><td align='right'><img src='images/logos/editUser32.png' align='left' title='EDITAR USUARIO' style='cursor:pointer' onclick='editUser(" & rs2("login_id") & ", " &  rs2("login_privilegio") & " )'/><img src='images/logos/deleteUser32.png' align='left' title='ELIMINAR USUARIO' style='cursor:pointer' onclick='confirmar_deleteUser(" & rs2("login_id") & ", " &  rs2("login_privilegio") &")'/></td></tr>"
	rs2.movenext
	wend  
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaUsuarios=response.write(regresar)
end function

function cargaSucursales_edicionReprogramar(cr)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select a.cr,a.Sucursal,b.Territorial,c.estatusObra,c.id_estatusObra,a.comentarioEstatus from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr LEFT JOIN cat_estatusobras c on a.EstatusObra=c.id_estatusObra where a.cr ='" & cr &"'"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaSucursales_edicionReprogramar=response.write("")
else
	while not(rs2.eof)	
		regresar=regresar & "<tr><td>" & rs2("cr") & "</td><td>" & rs2("sucursal") & "</td><td>" & rs2("territorial") & "</td><td><p><input type=""text"" name=""corte3"" id=""corte3"" placeholder=""aaaa-mm-dd""  onkeypress=""return soloNumerosCalendario(event)""/></p></td><td><input type=""text"" id='txt_" & rs2("cr") & "' name='txt_" & rs2("cr") & "' value='" & rs2("comentarioEstatus") & "'></td><td align='right'><img src='images/logos/acceptUser.png' align='left' title='Aceptar' style='cursor:pointer' onclick='actualizar(""" & rs2("cr") & """)'/></td></tr>"
	rs2.movenext
	wend  
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaSucursales_edicionReprogramar=response.write(regresar)
end function
function cargaSucursales_edicionEstatus()
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select a.cr,a.Sucursal,b.Territorial,c.estatusObra,c.id_estatusObra,a.comentarioEstatus from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr LEFT JOIN cat_estatusobras c on a.EstatusObra=c.id_estatusObra"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaSucursales_edicionEstatus=response.write("")
else
	while not(rs2.eof)	
		regresar=regresar & "<tr><td>" & rs2("cr") & "</td><td>" & rs2("sucursal") & "</td><td>" & rs2("territorial") & "</td><td><p id='parrafo_" & rs2("cr") & "' style='background:transparent'>" & rs2("estatusObra") & "</p></td><td><input type='text' id='txt_" & rs2("cr") & "' name='txt_" & rs2("cr") & "' value='" & rs2("comentarioEstatus") & "'></td><td align='right'><img src='images/logos/refresh24.png' id='actualizar_" & rs2("cr") & "' align='left' title='ACTUALIZAR' style='cursor:pointer;display:none' onclick='actualizar(""" & rs2("cr") & """)'/><img src='images/logos/editUser32.png' id='edit_" & rs2("cr") & "' align='left' title='EDITAR ESTATUS' style='cursor:pointer' onclick='editUser(""" & rs2("cr") & """)'/><img src='images/logos/deleteUser32.png' align='left' title='ELIMINAR SUCURSAL' style='cursor:pointer' onclick='confirmar_deleteUser(""" & rs2("cr") & """)'/><img src='images/logos/calendar32.png' align='left' title='Reprogramar Fin' style='cursor:pointer' onclick='confirmar_reprogramarUser(""" & rs2("cr") & """)'/></td></tr>"
	rs2.movenext
	wend  
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaSucursales_edicionEstatus=response.write(regresar)
end function

function cargaGerentesSupervisores()
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select a.*,b.login_nombre as Gerente, c.login_nombre as Supervisor from cat_gerentes_supervisores a LEFT JOIN prueba_sistema_login b on a.id_gerente=b.login_id LEFT JOIN prueba_sistema_login c on a.id_supervisor=c.login_id where b.login_id is not null and c.login_id is not null"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaGerentesSupervisores=response.write("")
else
	while not(rs2.eof)	
		regresar=regresar & "<tr><td>" & rs2("gerente") & "</td><td>" & rs2("supervisor") & "</td><td align='right'><img src='images/logos/deleteUser32.png' align='left' title='ELIMINAR' style='cursor:pointer' onclick='confirmar_deleteUser(" & rs2("id") & ")'/></td></tr>"
	rs2.movenext
	wend  
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaGerentesSupervisores=response.write(regresar)
end function

Function cargaPerfiles(perfil)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from cat_perfil ORDER BY id_perfil desc"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaPerfiles=response.write("<select><option value='0'>-- NO SE ENCONTRO INF. --</option></select>")
else
	regresar="<select id='select_login_privilegio' name='select_login_privilegio' onchange='validaZona()'><option value ='0'>--SELECCION--</option>"
	while not(rs2.eof)
		if rs2("id_perfil")=cint(perfil) then
		regresar=regresar & "<option value=" & rs2("id_perfil")& " selected='selected'>" & ucase(rs2("perfil")) & "</option>"
		else
		regresar=regresar & "<option value=" & rs2("id_perfil")& " >" & ucase(rs2("perfil")) & "</option>"
		end if
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaPerfiles=response.write(regresar)
End Function

Function cargaZonas()
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select zona_territorial from cat_sucursales where zona_territorial is not null GROUP BY zona_territorial "
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaZonas=response.write("<select><option value='0'>-- NO SE ENCONTRO INF. --</option></select>")
else
	regresar="<select id='select_zona' name='select_zona'><option value ='0'>--SELECCION--</option>"
	while not(rs2.eof)
		regresar=regresar & "<option value=" & rs2("zona_territorial")& " >Zona " &  rs2("zona_territorial") & "</option>"
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaZonas=response.write(regresar)
End Function

function cargaSemaforos()
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from cat_semaforos"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaSemaforos=response.write("")
else
	while not(rs2.eof)	
		regresar=regresar & "<tr><td>"
		if rs2("color")="verde" then
			regresar=regresar & "<img src='img/3.png' align='left' width='32' />"
		else 
			if rs2("color")="amarillo" then
				regresar=regresar & "<img src='img/4.png' align='left' width='32' />"
			else
				regresar=regresar & "<img src='img/5.png' align='left' width='32' />"
			end if
		end if
		regresar=regresar & "</td><td>"
		if rs2("color")="rojo" then
		regresar=regresar & "<img src='img/back.png' align='left' width='32' />"
		else
		regresar=regresar & "<input type='text' id='txt_de" & rs2("id_semaforo") & "' name='txt_de" & rs2("id_semaforo") & "' value='" & rs2("de") &  "' onchange='igualar(" & rs2("id_semaforo") & ")' onkeypress='return soloNumeros(event)'/>"
		end if
		regresar=regresar & "</td>"
		regresar=regresar & "<td>"
		if rs2("color")="verde" then
		regresar=regresar & "<img src='img/forward.png' align='right' width='32' />"
		else
		regresar=regresar & "<input type='text' id='txt_a" & rs2("id_semaforo") & "'  name='txt_a" & rs2("id_semaforo") & "' value='" & ROUND(rs2("a")) &  "' onchange='igualar2(" & rs2("id_semaforo") & ")' onkeypress='return soloNumeros(event)'/>"
		end if
		regresar=regresar & "</td></tr>"
	rs2.movenext
	wend  
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaSemaforos=response.write(regresar)
end function

function cargaRango()
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from cat_rangos limit 1"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaRango=response.write("")
else
	while not(rs2.eof)	
		regresar=regresar & "<tr><td><input type='text' id='txt_rango' name='txt_rango' value='" & rs2("rango") &  "' onkeypress='return soloNumeros(event)'/>"
		regresar=regresar & "</td>"
		regresar=regresar & "<td>"
	rs2.movenext
	wend  
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaRango=response.write(regresar)
end function

Function cargaCRs()
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
sql= "select * from cat_sucursales a where a.cr not like '' and a.cr not in (select cr from tseguimiento)  order by cr"
rs.open sql,conn
if rs.eof then
regresa="<select>"
regresa=regresa & "  <option value='0'>-- NO SE ENCONTRO INF. --</option>"
regresa=regresa & "</select>"
cargaCRs=response.write(regresa)
else
regresa="<input type=""text"" list='catalogo_crs' id='select_cr' name='select_cr' onkeypress='return soloNumeros(event)' maxlength='4' placeholder='Selecciona un CR'/>"
regresa=regresa & "<datalist id='catalogo_crs'>"
if cr_seleccionado="" then
regresa=regresa & "<option><font color='#FFFFFF'><strong>--SELECCION--</strong></font></option>"
else
regresa=regresa & "<option><font color='#FFFFFF'><strong>" & cr_seleccionado & "</strong></font></option>"
regresa=regresa & "<option><font color='#FFFFFF'><strong>--SELECCION--</strong></font></option>"
end if
while not(rs.eof)
regresa=regresa & "<option value=" & rs("cr") & ">" & rs("cr") & ", " & rs("nombre_sucursal") & ", " & rs("territorial") & "</option>"
rs.movenext
wend  
regresa=regresa & "</datalist>"
rs.close
conn.close 
set rs=nothing
set conn=nothing
end if
cargaCRs=response.write(regresa)
End Function

Function cargaInfoCR(cr)
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
sql= "select * from cat_sucursales where cr ='" & cr &"'"
rs.open sql,conn
if rs.eof then
rs.close
conn.close 
set rs=nothing
set conn=nothing
cargaInfoCR=response.write("")
else
regresa=rs("cr") & ", " & rs("nombre_sucursal") & ", " & rs("territorial")
rs.close
conn.close 
set rs=nothing
set conn=nothing
end if
cargaInfoCR=response.write(regresa)
End Function

Function cargaTipoTransformacion()
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from cat_tipotransformacion"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaTipoTransformacion=response.write("<select><option value='0'>-- NO SE ENCONTRO INF. --</option></select>")
else
	regresar="<select id='select_transformacion' name='select_transformacion'><option value ='0'>--SELECCION--</option>"
	while not(rs2.eof)
		regresar=regresar & "<option value='" & rs2("id_tipoTransformacion")& "' >" & ucase(rs2("tipoTransformacion")) & "</option>"
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaTipoTransformacion=response.write(regresar)
End Function

Function cargaTipoTransformacionSelecionada(id)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from cat_tipotransformacion"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaTipoTransformacionSelecionada=response.write("<select><option value='0'>-- NO SE ENCONTRO INF. --</option></select>")
else
	regresar="<select id='select_transformacion' name='select_transformacion'><option value ='0'>--SELECCION--</option>"
	while not(rs2.eof)
		if id=rs2("id_tipoTransformacion") then
			regresar=regresar & "<option selected value=" & rs2("id_tipoTransformacion")& ">" & ucase(rs2("tipoTransformacion")) & "</option>"
		else
			regresar=regresar & "<option value=" & rs2("id_tipoTransformacion")& " >" & ucase(rs2("tipoTransformacion")) & "</option>"
		end if
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaTipoTransformacionSelecionada=response.write(regresar)
End Function

Function buscaTipoTransformacion(cr)
set conn33=server.CreateObject("adodb.connection")
set rs22=server.CreateObject("adodb.recordset")
conn33.open connstr
sql33= "select b.id_tipoTransformacion from tseguimiento a LEFT JOIN cat_tipotransformacion b on a.TipoTransformacion=b.tipoTransformacion where cr='" & cr & "'"
regresar=""
rs22.open sql33, conn33
if rs22.eof then
	buscaTipoTransformacion=""
else
	regresar=rs22("id_tipoTransformacion")
end if

rs22.close
conn33.close 
set rs22=nothing
set conn33=nothing
buscaTipoTransformacion=regresar
End Function

Function cargaContratistas()
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from cat_contratistas"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaContratistas=response.write("<select><option value='0'>-- NO SE ENCONTRO INF. --</option></select>")
else
	regresar="<select id='select_contratistas' name='select_contratistas'><option value ='0'>--SELECCION--</option>"
	while not(rs2.eof)
		regresar=regresar & "<option value='" & rs2("id_contratista")& "' >" & server.HTMLEncode(ucase(rs2("contratista"))) & "</option>"
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaContratistas=response.write(regresar)
End Function

Function cargaContratistasId(id)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from cat_contratistas"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaContratistasId=response.write("<select><option value='0'>-- NO SE ENCONTRO INF. --</option></select>")
else
	regresar="<select id='select_contratistas' name='select_contratistas'><option value ='0'>--SELECCION--</option>"
	while not(rs2.eof)
		if rs2("id_contratista")=cint(id) then
			regresar=regresar & "<option value=" & rs2("id_contratista")& " selected>" & server.HTMLEncode(ucase(rs2("contratista"))) & "</option>"
		else
			regresar=regresar & "<option value=" & rs2("id_contratista")& " >" & server.HTMLEncode(ucase(rs2("contratista"))) & "</option>"
		end if
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaContratistasId=response.write(regresar)
End Function


Function cargaGerentes()
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from prueba_sistema_login where login_privilegio=5"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaGerentes=response.write("<select><option value='0'>-- NO SE ENCONTRO INF. --</option></select>")
else
	regresar="<select id='select_gerentes' name='select_gerentes'><option value ='0'>--SELECCION--</option>"
	while not(rs2.eof)
		regresar=regresar & "<option value=" & rs2("login_id")& " >" & server.HTMLEncode(ucase(rs2("login_nombre"))) & "</option>"
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaGerentes=response.write(regresar)
End Function


Function cargaSupervisores()
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from prueba_sistema_login where login_privilegio=2"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaSupervisores=response.write("<select><option value='0'>-- NO SE ENCONTRO INF. --</option></select>")
else
	regresar="<select id='select_supervisores' name='select_supervisores'><option value ='0'>--SELECCION--</option>"
	while not(rs2.eof)
		regresar=regresar & "<option value='" & rs2("login_id")& "' >" & server.HTMLEncode(ucase(rs2("login_nombre"))) & "</option>"
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaSupervisores=response.write(regresar)
End Function

Function cargaSupervisoresId(id)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from prueba_sistema_login where login_privilegio=2"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaSupervisoresId=response.write("<select><option value='0'>-- NO SE ENCONTRO INF. --</option></select>")
else
	regresar="<select id='select_supervisores' name='select_supervisores'><option value ='0'>--SELECCION--</option>"
	while not(rs2.eof)
		if rs2("login_id")=cint(id) then
			regresar=regresar & "<option value=" & rs2("login_id")& " selected>" & server.HTMLEncode(ucase(rs2("login_nombre"))) & "</option>"
		else
			regresar=regresar & "<option value=" & rs2("login_id")& " >" & server.HTMLEncode(ucase(rs2("login_nombre"))) & "</option>"
		end if
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaSupervisoresId=response.write(regresar)
End Function

Function cargaCRsAsignar()
Set conn = Server.CreateObject("ADODB.Connection") 
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
sql= "select * from cat_sucursales a where a.cr not like '' and a.cr not in (select cr from tseguimiento)  order by cr"
rs.open sql,conn
if rs.eof then
regresa="<select>"
regresa=regresa & "  <option value='0'>-- NO SE ENCONTRO INF. --</option>"
regresa=regresa & "</select>"
cargaCRsAsignar=response.write(regresa)
else
regresa="<input type=""text"" list='catalogo_crs' id='select_cr' name='select_cr' onkeypress='return soloNumeros(event)' maxlength='4' placeholder='Selecciona un CR'/>"
regresa=regresa & "<datalist id='catalogo_crs'>"
if cr_seleccionado="" then
regresa=regresa & "<option><font color='#FFFFFF'><strong>--SELECCION--</strong></font></option>"
else
regresa=regresa & "<option><font color='#FFFFFF'><strong>" & cr_seleccionado & "</strong></font></option>"
regresa=regresa & "<option><font color='#FFFFFF'><strong>--SELECCION--</strong></font></option>"
end if
while not(rs.eof)
regresa=regresa & "<option value=" & rs("cr") & ">" & rs("cr") & ", " & rs("nombre_sucursal") & ", " & rs("territorial") & "</option>"
rs.movenext
wend  
regresa=regresa & "</datalist>"
rs.close
conn.close 
set rs=nothing
set conn=nothing
end if
cargaCRsAsignar=response.write(regresa)
End Function

Function cargaCRs()
Set conn = Server.CreateObject("ADODB.Connection") 
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
sql= "select * from cat_sucursales a where a.cr not like '' and a.cr  in (select cr from tseguimiento)  order by cr"
rs.open sql,conn
if rs.eof then
regresa="<select>"
regresa=regresa & "  <option value='0'>-- NO SE ENCONTRO INF. --</option>"
regresa=regresa & "</select>"
cargaCRs=response.write(regresa)
else
regresa="<input type=""text"" list='catalogo_crs' id='cr' name='cr' onkeypress='return soloNumeros(event)' maxlength='4' placeholder='Selecciona un CR'/>"
regresa=regresa & "<datalist id='catalogo_crs'>"
if cr_seleccionado="" then
regresa=regresa & "<option><font color='#FFFFFF'><strong>--SELECCION--</strong></font></option>"
else
regresa=regresa & "<option><font color='#FFFFFF'><strong>" & cr_seleccionado & "</strong></font></option>"
regresa=regresa & "<option><font color='#FFFFFF'><strong>--SELECCION--</strong></font></option>"
end if
while not(rs.eof)
regresa=regresa & "<option value=" & rs("cr") & ">" & rs("cr") & ", " & rs("nombre_sucursal") & ", " & rs("territorial") & "</option>"
rs.movenext
wend  
regresa=regresa & "</datalist>"
rs.close
conn.close 
set rs=nothing
set conn=nothing
end if
cargaCRs=response.write(regresa)
End Function

Function cargaMes(mes)
if mes="1" then
regresa="ENERO"
END IF
cargaMes=regresa
End Function

Function calculaTotalGral(cr)
set conn33=server.CreateObject("adodb.connection")
set rs22=server.CreateObject("adodb.recordset")
conn33.open connstr
sql33= "select round(SUM(monto),2) as total from costoestimado where cr='" & cr & "'"
regresar=""
rs22.open sql33, conn33
if rs22.eof then
	calculaTotalGral=""
else
	regresar=rs22("total")
end if

rs22.close
conn33.close 
set rs22=nothing
set conn33=nothing
calculaTotalGral=regresar
End Function

function cargaConceptos(cr,capitulo)
cr="0528"
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from (select a.*, truncate((a.CANT * a.PRECIOBRUTO),2) as subTotal,b.Partida,b.Descripcion_breve,b.Descripcion_completa,c.capitulo,c.id_capitulo from cat_conceptossucursales_sap a LEFT JOIN cat_conceptos b on a.CLAVESAP=b.Clave_SAP LEFT JOIN cat_capitulos c on b.capitulo=id_capitulo)a where cr =" & cr & " and id_capitulo=" & capitulo & ";"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaConceptos=response.write("")
else
	while not(rs2.eof)	
		regresar=regresar & "<tr><td>" & rs2("clavesap") & "</td><td style='cursor:pointer' title='Ver Descripcion Completa'>" & server.HTMLEncode(rs2("txtbrv")) & "</td><td>" & rs2("cant") & "</td><td>" & rs2("um") & "</td><td>$" & rs2("preciobruto") & "</td><td align='center'>" & formatoPesos(Round(rs2("cant") * rs2("preciobruto"),2)) & "</td></tr>"
	rs2.movenext
	wend  
end if
rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaConceptos=regresar
End Function

function cargaConceptosGral(cr)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select sum(a.subTotal) as total, a.capitulo,a.id_capitulo from (select a.*, truncate((a.CANT * a.PRECIOBRUTO),2) as subTotal,b.Partida,b.Descripcion_breve,b.Descripcion_completa,c.capitulo,c.id_capitulo from cat_conceptossucursales_sap a LEFT JOIN cat_conceptos b on a.CLAVESAP=b.Clave_SAP LEFT JOIN cat_capitulos c on b.capitulo=id_capitulo)a where cr=" & cr &" GROUP BY a.id_capitulo;"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaConceptosGral=response.write("")
else
	while not(rs2.eof)	
		regresar=regresar & "<tr><td style='cursor:pointer' title='Ver Detalle' onclick=""verDetalle('" & rs2("id_capitulo") &"')"">" & server.HTMLEncode(rs2("capitulo")) & "</td><td align='center'>" & formatoPesos(Round(rs2("total"))) & "</td></tr>"
	rs2.movenext
	wend  
end if
rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaConceptosGral=regresar
End Function

Function buscaCapitulo(capitulo)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "SELECT  * from cat_capitulos where id_capitulo = '"& capitulo &"'" 
rs.open sql, conn2
if rs.eof then
buscaCapitulo=1
else
buscaCapitulo=server.HTMLEncode(rs("capitulo"))
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function formatoPesos(numero)
cadena=Split(numero,".")
cont=1
regresa=""
for each x in cadena
if cont=1 then
   largo = len(x)
if largo <=3 then
    regresa=regresa & x
    cont=cont +1
else
 if largo >12 then
  regresa=left(x,largo -12) & "," & left(Right(x,12),3) & "," &  left(Right(x,9),3) & "," &  left(Right(x,6),3) & "," & Right(x,3)
  cont=cont +1
 else
  if largo >9 then
   regresa= left(x,largo -9) & "," & left(Right(x,9),3) & "," &  left(Right(x,6),3) & "," & Right(x,3)
   cont=cont +1
  else
   if largo >6 then
    regresa= left(x,largo-6) & "," &  left(Right(x,6),3) & "," & Right(x,3)
    cont=cont +1
   else
    if largo >3 then
     regresa= left(x,largo-3) & "," & Right(x,3)
     cont=cont +1  
    end if
   end if
  end if
 end if
end if
else 
regresa=regresa & "." & x
end if
next
formatoPesos="$" & regresa
End Function
%>