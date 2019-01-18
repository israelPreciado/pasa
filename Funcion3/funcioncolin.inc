<%
'ConnStr= "DRIVER={MySQL ODBC 5.3 ANSI Driver};server=localhost;database=prueba_sistema; uid=root;pwd=; option=3"
ConnStr="DRIVER={MySQL ODBC 3.51 Driver};server=localhost;database=prueba_sistema; uid=root;pwd=; option=3"

Function cargaTerritoriales(id)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from cat_territoriales ORDER BY id_territorial desc"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaTerritoriales=response.write("<select><option value='0'>-- NO SE ENCONTRO INF. --</option></select>")
else
	regresar="<select id='selectterritorial' name='selectterritorial'><option value ='0'>--SELECCION--</option>"
	while not(rs2.eof)
		if rs2("id_territorial")=cint(id) then
		regresar=regresar & "<option value=" & rs2("territorial")& " selected='selected'>" & ucase(rs2("territorial")) & "</option>"
		else
		regresar=regresar & "<option value=" & rs2("territorial")& " >" & ucase(rs2("territorial")) & "</option>"
		end if
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaTerritoriales=response.write(regresar)
End Function



Function cargaZonaprecio(id)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from cat_zonaprecio ORDER BY id asc"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaZonaprecio=response.write("<select><option value='0'>-- NO SE ENCONTRO INF. --</option></select>")
else
	regresar="<select id='selectzonaprecio' name='selectzonaprecio'><option value ='0'>--SELECCION--</option>"
	while not(rs2.eof)
		if rs2("id")=cint(id) then
		regresar=regresar & "<option value=" & rs2("id")& " selected='selected'>" & ucase(rs2("zona")) & "</option>"
		else
		regresar=regresar & "<option value=" & rs2("id")& " >" & ucase(rs2("zona")) & "</option>"
		end if
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaZonaprecio=response.write(regresar)
End Function

Function cargaEstado(id)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from cat_estado ORDER BY id_estado desc"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaEstado=response.write("<select><option value='0'>-- NO SE ENCONTRO INF. --</option></select>")
else
	regresar="<select id='selectestado' name='selectestado'><option value ='0'>--SELECCION--</option>"
	while not(rs2.eof)
		if rs2("id_estado")=cint(id) then
		regresar=regresar & "<option value=" & rs2("estado")& " selected='selected'>" & ucase(rs2("estado")) & "</option>"
		else
		regresar=regresar & "<option value=" & rs2("estado")& " >" & ucase(rs2("estado")) & "</option>"
		end if
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaEstado=response.write(regresar)
End Function


Function cargaZonat(id)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from cat_zonat ORDER BY id desc"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaZonat=response.write("<select><option value='0'>-- NO SE ENCONTRO INF. --</option></select>")
else
	regresar="<select id='selectzonat' name='selectzonat'><option value ='0'>--SELECCION--</option>"
	while not(rs2.eof)
		if rs2("id")=cint(id) then
		regresar=regresar & "<option value=" & rs2("id")& " selected='selected'>" & ucase(rs2("zona_territorial")) & "</option>"
		else
		regresar=regresar & "<option value=" & rs2("id")& " >" & ucase(rs2("zona_territorial")) & "</option>"
		end if
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaZonat=response.write(regresar)
End Function


Function cargasucursales(id)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select a.cr, b.NOMBRE_SUCURSAL, b.Territorial, a.id from ctrl_envioestimaciones a LEFT JOIN cat_sucursales b on a.cr=b.cr grOUP BY a.cr;"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaZonat=response.write("<select><option value='0'>-- NO SE ENCONTRO INF. --</option></select>")
else
	regresar="<select id='selectsucursal' name='selectsucursal'><option value ='0'>--SELECCION--</option>"
	while not(rs2.eof)
		if rs2("id")=cint(id) then
		regresar=regresar & "<option value=" & rs2("cr")& " selected='selected'>" & ucase(rs2("cr")&" "&rs2("NOMBRE_SUCURSAL")&" "&rs2("Territorial")) & "</option>"
		else
		regresar=regresar & "<option value=" & rs2("cr")& " >" & ucase(rs2("cr")&" "&rs2("NOMBRE_SUCURSAL")&" "&rs2("Territorial")) & "</option>"
		end if
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaSucursal=response.write(regresar)
End Function

Function cargasucursalesedit(id)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select cr, NOMBRE_SUCURSAL, Territorial from cat_sucursales grOUP BY cr;"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaZonat=response.write("<select><option value='0'>-- NO SE ENCONTRO INF. --</option></select>")
else
	regresar="<select id='selectsucursal' name='selectsucursal'><option value ='0'>--SELECCION--</option>"
	while not(rs2.eof)
		
		regresar=regresar & "<option value=" & rs2("cr")& " >" & ucase(rs2("cr")&" "&rs2("NOMBRE_SUCURSAL")&" "&rs2("Territorial")) & "</option>"
		
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaSucursal=response.write(regresar)
End Function


Function cargazona(id)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select zona, file, id_zona from cat_zonafotografica;"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaZonat=response.write("<select><option value='0'>-- NO SE ENCONTRO INF. --</option></select>")
else
	regresar="<select id='seleczona' name='selectzona'><option value ='0'>--SELECCION--</option>"
	while not(rs2.eof)
		if rs2("id_zona")=cint(id_zona) then
		regresar=regresar & "<option value=" & rs2("file")& " selected='selected'>" & ucase(rs2("zona")) & "</option>"
		else
		regresar=regresar & "<option value=" & rs2("file")& " >" & ucase(rs2("zona")) & "</option>"
		end if
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaSucursal=response.write(regresar)
End Function


Function cargasfotosuc(id)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select a.cr, b.NOMBRE_SUCURSAL, b.Territorial, a.id_foto from ctrl_fotografias a  JOIN cat_sucursales b on a.cr=b.cr grOUP BY a.cr ORDER BY CR;"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaZonat=response.write("<select><option value='0'>-- NO SE ENCONTRO INF. --</option></select>")
else
	regresar="<select id='selectsucursalfot' name='selectsucursalfot'><option value ='0'>--SELECCION--</option>"
	while not(rs2.eof)
		if rs2("id_foto")=cint(id_foto) then
		regresar=regresar & "<option value=" & rs2("cr")& " selected='selected'>" & ucase(rs2("cr")&" "&rs2("NOMBRE_SUCURSAL")&" "&rs2("Territorial")) & "</option>"
		else
		regresar=regresar & "<option value=" & rs2("cr")& " >" & ucase(rs2("cr")&" "&rs2("NOMBRE_SUCURSAL")&" "&rs2("Territorial")) & "</option>"
		end if
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaSucursal=response.write(regresar)
End Function



%>