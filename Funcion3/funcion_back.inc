<%
'ConnStr="DRIVER={MySQL ODBC 3.51 Driver};server=162.242.164.14;database=prueba_sistema; uid=xmd7550;pwd=XMD7550; option=3"
'ConnStr2="DRIVER={MySQL ODBC 3.51 Driver};server=162.242.164.14;database=prueba_sistema; uid=xmd7550;pwd=XMD7550; option=3"
ConnStr="DRIVER={MySQL ODBC 3.51 Driver};server=localhost;database=prueba_sistema; uid=root;pwd=; option=3"
ConnStr2="DRIVER={MySQL ODBC 3.51 Driver};server=localhost;database=prueba_sistema; uid=root;pwd=; option=3"
Function numeroSucTerritorial()
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select COUNT(a.cr) as sucursales from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr ;"
rs.open sql, conn2
if rs.eof then
numeroSucTerritorial="0"
else
numeroSucTerritorial=rs("sucursales")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function numeroSucTerritorialZona(zona)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select COUNT(a.cr) as sucursales from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr where zona_territorial=" & zona &";"
rs.open sql, conn2
if rs.eof then
numeroSucTerritorialZona="0"
else
numeroSucTerritorialZona=rs("sucursales")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function numeroSupTerritorial()
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select COUNT(*) as supervisores from (select a.supervisorAsignado,b.Territorial,d.login_nombre from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr LEFT JOIN cat_gerentes_supervisores c on a.supervisorAsignado=c.id_supervisor LEFT JOIN prueba_sistema_login d on c.id_gerente=d.login_id GROUP BY a.supervisorAsignado)a;"
rs.open sql, conn2
if rs.eof then
numeroSupTerritorial="0"
else
numeroSupTerritorial=rs("supervisores")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function nuevoCostoEstimado(cr)
set conn22=server.CreateObject("adodb.connection")
set rs22=server.CreateObject("adodb.recordset")
conn22.open connstr
sql22= "SELECT cr, NOMBRE_SUCURSAL, Territorial, ZONA, CASE WHEN costo IS NULL THEN 0 ELSE costo END AS costo FROM( SELECT a.cr, b.NOMBRE_SUCURSAL, b.Territorial, b.ZONA, c.costo FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN( SELECT cr, CASE WHEN costo IS NULL THEN 0 ELSE costo END AS costo FROM( SELECT cr, sum(round(cantidad * pu, 2)) AS Costo FROM nuevocosto_estimadoobra GROUP BY cr) a) c ON a.cr = c.cr) a WHERE cr = '" & cr & "';"
rs22.open sql22, conn22
if rs22.eof then
nuevoCostoEstimado="0"
else
nuevoCostoEstimado=rs22("costo")
end if
rs22.close
conn22.close 
set rs22=nothing
set conn22=nothing
End Function

Function numeroSupTerritorialZona(zona)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select COUNT(*) as supervisores from (select a.supervisorAsignado,b.Territorial,d.login_nombre from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr LEFT JOIN cat_gerentes_supervisores c on a.supervisorAsignado=c.id_supervisor LEFT JOIN prueba_sistema_login d on c.id_gerente=d.login_id where b.zona_territorial=" & zona & " GROUP BY a.supervisorAsignado)a;"
rs.open sql, conn2
if rs.eof then
numeroSupTerritorialZona="0"
else
numeroSupTerritorialZona=rs("supervisores")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function


Function numeroConTerritorial()
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= " select count(*) contratistas from (SELECT c.contratista, a.ContratistaAsignado, b.Territorial, COUNT(*) AS contratistas FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_contratistas c ON a.ContratistaAsignado = c.id_contratista GROUP BY a.ContratistaAsignado,b.Territorial) a"
rs.open sql, conn2
if rs.eof then
numeroConTerritorial="0"
else
numeroConTerritorial=rs("contratistas")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function numeroConTerritorialZona(zona)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= " select count(*) contratistas from (SELECT c.contratista, a.ContratistaAsignado, b.Territorial, COUNT(*) AS contratistas FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_contratistas c ON a.ContratistaAsignado = c.id_contratista where b.zona_territorial=" & zona & " GROUP BY a.ContratistaAsignado,b.Territorial) a"
rs.open sql, conn2
if rs.eof then
numeroConTerritorialZona="0"
else
numeroConTerritorialZona=rs("contratistas")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

function numeroSupTerrMes(territorial, mes,query,estatusObra)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
if estatusObra="autorizadas" then
if query="1" then
sql= "SELECT  " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND c.Territorial = '" & territorial & "') AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND c.Territorial = '" & territorial & "') AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND c.Territorial = '" & territorial & "') AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND c.Territorial = '" & territorial & "') AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND c.Territorial = '" & territorial & "') AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND c.Territorial = '" & territorial & "') AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND c.Territorial = '" & territorial & "') AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND c.Territorial = '" & territorial & "') AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "') AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND c.Territorial = '" & territorial & "') AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND c.Territorial = '" & territorial & "') AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND c.Territorial = '" & territorial & "') AS diciembre ON enero.id = diciembre.id ;"
else
sql= "SELECT  " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31') AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28') AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31') AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30') AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31') AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30') AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31') AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31') AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "') AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31') AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30') AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31') AS diciembre ON enero.id = diciembre.id ;"
end if
end if
if estatusObra="terminadas" then
if query="1" then
sql= "SELECT " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS diciembre ON enero.id = diciembre.id;"
else
sql= "SELECT " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND a.EstatusObra = 3) AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND a.EstatusObra = 3) AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND a.EstatusObra = 3) AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND a.EstatusObra = 3) AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND a.EstatusObra = 3) AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND a.EstatusObra = 3) AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND a.EstatusObra = 3) AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND a.EstatusObra = 3) AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND a.EstatusObra = 3) AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND a.EstatusObra = 3) AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND a.EstatusObra = 3) AS diciembre ON enero.id = diciembre.id;"
end if
end if
if estatusObra="enProceso" then
if query="1" then
sql= "SELECT " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS diciembre ON enero.id = diciembre.id;"
else
sql= "SELECT " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS diciembre ON enero.id = diciembre.id;"
end if
end if
if estatusObra="porIniciar" then
if query="1" then
sql= "SELECT " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS diciembre ON enero.id = diciembre.id;"
else
sql= "SELECT " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND a.EstatusObra = 0) AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND a.EstatusObra = 0) AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND a.EstatusObra = 0) AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND a.EstatusObra = 0) AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND a.EstatusObra = 0) AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND a.EstatusObra = 0) AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND a.EstatusObra = 0) AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND a.EstatusObra = 0) AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND a.EstatusObra = 0) AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND a.EstatusObra = 0) AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN prueba_sistema_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND a.EstatusObra = 0) AS diciembre ON enero.id = diciembre.id;"
end if
end if
rs.open sql, conn2
if rs.eof then
numeroSupTerrMes="0"
else
numeroSupTerrMes=rs("SucMes")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
end function

function calculaSemaforoPorModulo(modulo,cr) 
Set conn999 = Server.CreateObject("ADODB.Connection")
set rs222= Server.CreateObject("adodb.recordset")
Conn999.Open connstr
sql222="select a.id_componente,a.nameBD,b.fecha, case when b.fecha >= CURDATE() then ""tiempo"" when b.fecha < CURDATE() then ""fuera""  when b.fecha is null then ""fuera"" end as estatusFecha from cat_componentes a left join (select * from cat_llegadamateriales where cr='" & cr & "') b on a.id_componente=b.id_componente where id_modulo='" & modulo & "'"
rs222.open sql222,conn999

if rs222.eof then
 calculaSemaforoPorModulo=response.write("NO")
else
semaforoElemento="verde"
semaforoModulo="verde"
semaforoTem="verde"

 while not (rs222.eof)
  set rs211= Server.CreateObject("adodb.recordset")
  sql211="select " & rs222("nameBD") & " as campo  from tseguimiento where cr='" & cr & "'"
  rs211.open sql211,conn999
  if isNumeric(rs211("campo")) then
	if rs211("campo")=1 then
		semaforoTem="verde"
	else 
	 if rs211("campo")<1 then
		if rs222("estatusFecha")="tiempo" then
		 semaforoTem="amarillo"
		else
		 semaforoTem="rojo"
		end if
	 end if
	end if
   else
    if rs211("campo") ="NA" then
	semaforoTem="verde"
	end if
   end if
	

	if semaforoModulo="verde" and semaforoTem="verde" then
		semaforoModulo="verde"
	else
		if (semaforoModulo="verde" or semaforoModulo="amarillo") and semaforoTem="amarillo" then
			semaforoModulo="amarillo"
		else
			if (semaforoModulo="verde" or semaforoModulo="amarillo" or semaforoModulo="rojo") and semaforoTem="rojo" then
				semaforoModulo="rojo"
			end if
		end if
	end if
	
  rs211.close
  set rs21=nothing
 rs222.movenext
 wend 
end if

rs222.close
conn999.close 
set rs222=nothing
set conn999=nothing
calculaSemaforoPorModulo=semaforoModulo
end function

Function cargaFechaLLegada(id_componente, cr)
set conn2=server.CreateObject("adodb.connection")
set rs5=server.CreateObject("adodb.recordset")
conn2.open connstr
regresa=""
sql= "select fecha from cat_llegadamateriales where id_componente='" & id_componente & "' and cr='" & cr & "'" 
rs5.open sql, conn2
if rs5.eof then
cargaFechaLLegada=response.write("-")
else
regresa=rs5("fecha")
cargaFechaLLegada=regresa
end if
rs5.close
conn2.close 
set rs5=nothing
set conn2=nothing
End Function

Function numeroSucTerrRegional_Estatus(territorial,estatus1,estatus2,query)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
if query="1" then 
sql= "SELECT COUNT(a.cr) AS Sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND( c.id_estatusObra = " & estatus1 & " OR c.id_estatusObra = " & estatus2 & ")"
else
sql= "SELECT COUNT(a.cr) AS Sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE ( c.id_estatusObra = " & estatus1 & " OR c.id_estatusObra = " & estatus2 & ")"
end if
rs.open sql, conn2
if rs.eof then
numeroSucTerrRegional_Estatus="0"
else
numeroSucTerrRegional_Estatus=rs("sucursales")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function numeroSucTerrRegional_EstatusZona(territorial,estatus1,estatus2,query,zona)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
if query="1" then 
sql= "SELECT COUNT(a.cr) AS Sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND( c.id_estatusObra = " & estatus1 & " OR c.id_estatusObra = " & estatus2 & ") and b.zona_territorial=" & zona & ""
else
sql= "SELECT COUNT(a.cr) AS Sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE ( c.id_estatusObra = " & estatus1 & " OR c.id_estatusObra = " & estatus2 & ") and b.zona_territorial=" & zona & ""
end if
rs.open sql, conn2
if rs.eof then
numeroSucTerrRegional_EstatusZona="0"
else
numeroSucTerrRegional_EstatusZona=rs("sucursales")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function


Function numeroSucTerrRegional(territorial,query,estatusObra)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
if estatusObra="autorizadas" then
if query="1" then
sql= "SELECT b.Regional, b.Territorial, COUNT(a.cr) AS sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '"& territorial &"'"
else
sql= "SELECT b.Regional, b.Territorial, COUNT(a.cr) AS sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra"
end if
end if
if estatusObra="terminadas" then
if query="1" then
sql= "SELECT b.Regional, b.Territorial, COUNT(a.cr) AS sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '"& territorial &"' and a.estatusObra=3"
else
sql= "SELECT b.Regional, b.Territorial, COUNT(a.cr) AS sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra where a.estatusObra=3"
end if
end if
if estatusObra="enProceso" then
if query="1" then
sql= "SELECT b.Regional, b.Territorial, COUNT(a.cr) AS sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '"& territorial &"' and (a.estatusObra=1 or a.estatusObra=2)"
else
sql= "SELECT b.Regional, b.Territorial, COUNT(a.cr) AS sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra where (a.estatusObra=1 or a.estatusObra=2)"
end if
end if
if estatusObra="porIniciar" then
if query="1" then
sql= "SELECT b.Regional, b.Territorial, COUNT(a.cr) AS sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '"& territorial &"' and a.estatusObra=0"
else
sql= "SELECT b.Regional, b.Territorial, COUNT(a.cr) AS sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra where a.estatusObra=0"
end if
end if
rs.open sql, conn2
if rs.eof then
numeroSucTerrRegional="0"
else
numeroSucTerrRegional=rs("sucursales")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function calculaAvanceProyectado7030(cr, fechaInicio)
diasTranscurridos=DateDiff("d",cDate(fechaInicio),now())
promedio=0
cont=0
sumatoria=0
regresar=""
if diasTranscurridos>56 then
regresar=100
else
set conn51=server.CreateObject("adodb.connection")
set rs51=server.CreateObject("adodb.recordset")
conn51.open connstr
sql51= "select * from cat_porcentajesobracivil where dias_transcurridos='"& diasTranscurridos &"'"
rs51.open sql51, conn51
if rs51.eof then
regresar=0
else
regresar=rs51("porcentaje_proyectado")*100
end if
rs51.close
conn51.close 
set rs51=nothing
set conn51=nothing
end if
calculaAvanceProyectado7030=regresar
End Function

Function buscaUsuario(usuario,pass)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "SELECT  * from prueba_sistema_login where login_usuario = '"& usuario &"' and login_pass = '"& pass &"'" 
rs.open sql, conn2
if rs.eof then
buscaUsuario=1
else
session("xmd")=usuario
session("nombre_usuario")=rs("login_nombre")
session("privilegio")=rs("login_privilegio")
'call insertarLog(usuario,"LOGIN","", Request.ServerVariables("REMOTE_ADDR"))
buscaUsuario=response.Redirect("inicioConFrame.asp")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function


Function buscaNombre(usuario)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "SELECT  * from prueba_sistema_login where login_usuario = '"& usuario &"'" 
rs.open sql, conn2
if rs.eof then
buscaNombre=1
else
buscaNombre=rs("login_nombre")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function buscaSupervisor(cr)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select b.login_nombre from tseguimiento a LEFT JOIN prueba_sistema_login b on a.supervisorAsignado=b.login_id where cr='"& cr &"'" 
rs.open sql, conn2
if rs.eof then
buscaSupervisor="."
else
buscaSupervisor=rs("login_nombre")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function buscaSupervisorId(cr)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select supervisorAsignado from tseguimiento  where cr='"& cr &"'" 
rs.open sql, conn2
if rs.eof then
buscaSupervisorId="."
else
buscaSupervisorId=rs("supervisorAsignado")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function buscaContratista2(cr)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select b.login_nombre from tseguimiento a LEFT JOIN prueba_sistema_login b on a.contratistaAsignado=b.login_contratista where cr='"& cr &"'" 
rs.open sql, conn2
if rs.eof then
buscaContratista2="."
else
buscaContratista2=rs("login_nombre")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function buscaContratista2Id(cr)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select contratistaAsignado from tseguimiento where cr='"& cr &"'" 
rs.open sql, conn2
if rs.eof then
buscaContratista2Id="."
else
buscaContratista2Id=rs("contratistaAsignado")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

function buscaFechaInicio(cr)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select FechaInicio from tseguimiento where cr='"& cr &"'" 
rs.open sql, conn2
if rs.eof then
buscaFechaInicio=""
else
buscaFechaInicio=rs("FechaInicio")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
end function

function buscaFechaFin(cr)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select FechaTermino from tseguimiento where cr='"& cr &"'" 
rs.open sql, conn2
if rs.eof then
buscaFechaFin=""
else
buscaFechaFin=rs("FechaTermino")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
end function

Function buscaModulo(modulo)
set conn8=server.CreateObject("adodb.connection")
set rs8=server.CreateObject("adodb.recordset")
conn8.open connstr
sql8= "select modulo from cat_modulos where id_modulo='" & modulo  & "';"
rs8.open sql8, conn8
if rs8.eof then
buscaModulo=""
else
buscaModulo=rs8("modulo")
end if
rs8.close
conn8.close 
set rs8=nothing
set conn8=nothing
End Function

Function buscaEstatus(estatus)
set conn4=server.CreateObject("adodb.connection")
set rs4=server.CreateObject("adodb.recordset")
conn4.open connstr
sql4= "select estatusObra from cat_estatusObras where id_estatusObra='" & estatus  & "';"
rs4.open sql4, conn4
if rs4.eof then
buscaEstatus=""
else
buscaEstatus=rs4("estatusObra")
end if
rs4.close
conn4.close 
set rs4=nothing
set conn4=nothing
End Function

Function cuentaPendientes(cr)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select count(*) as pendientes from pendientes where cr in ('" & cr  & "') and id_estatus =1 ;"
rs.open sql, conn2
if rs.eof then
cuentaPendientes="0"
else
cuentaPendientes=rs("pendientes")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function cuentaPendientesPorEstatus(estatus,contratista)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select count(*) as sucursales  from tseguimiento where EstatusObra in ('" & estatus  & "') and ContratistaAsignado in ('" & contratista & "') ;"
rs.open sql, conn2
if rs.eof then
cuentaPendientesPorEstatus="0"
else
cuentaPendientesPorEstatus=rs("sucursales")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function buscaContratista(contratista)
set conn4=server.CreateObject("adodb.connection")
set rs4=server.CreateObject("adodb.recordset")
conn4.open connstr
sql4= "select contratista from cat_contratistas where id_contratista='" & contratista  & "';"
rs4.open sql4, conn4
if rs4.eof then
buscaContratista=""
else
buscaContratista=rs4("contratista")
end if
rs4.close
conn4.close 
set rs4=nothing
set conn4=nothing
End Function



Function buscaModuloCarpeta(modulo)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select carpeta from cat_modulos where id_modulo='" & modulo  & "';"
rs.open sql, conn2
if rs.eof then
buscaModuloCarpeta=""
else
buscaModuloCarpeta=rs("carpeta")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function buscaZona(zona)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select file from cat_zonafotografica where id_zona='" & zona &"';"  
rs.open sql, conn2
if rs.eof then
buscaZona=""
else
buscaZona=rs("file")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

	Function LPad(s, l, c)
  Dim n : n = 0
  If l > Len(s) Then n = l - Len(s)
  LPad = String(n, c) & s
End Function

Function buscaPerfil(usuario)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select perfil from cat_perfil a LEFT JOIN prueba_sistema_login b on a.ID_PERFIL=b.login_privilegio where b.login_usuario='" & usuario & "'" 
rs.open sql, conn2
if rs.eof then
buscaPerfil=1
else
buscaPerfil=rs("perfil")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function cargaAvance(campo, cr)
set conn2=server.CreateObject("adodb.connection")
set rs5=server.CreateObject("adodb.recordset")
conn2.open connstr
regresa=""
sql= "select " & campo & " as campo from tseguimiento where CR='" & cr & "'" 
rs5.open sql, conn2
if rs5.eof then
cargaAvance=response.write("-")
else
if IsNumeric(rs5("campo")) then
regresa=rs5("campo")*100 & " %"
else
regresa=rs5("campo")
end if
cargaAvance=regresa
end if
rs5.close
conn2.close 
set rs5=nothing
set conn2=nothing
End Function


Function insertarLog(vusuario,vevento,vregistroAfectado,ip)
set conn2=server.CreateObject("adodb.connection")
conn2.open connstr2
sql= "insert into prueba_sistema_log(usuario,evento,registroAfectado,ip_address) values ('" & vusuario & "', ' " & vevento & " ', '" & vregistroAfectado & "' , '" & ip & "')" 
Set objRS=Conn2.Execute(sql)
if err=0 then
	conn2.close 
	set objRS=nothing
	set conn2=nothing
else
	conn2.close 
	set objRS=nothing
	set conn2=nothing
end if
End Function

Function nombreProducto(codigo)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "SELECT  * from cat_tarjetas where cod_producto = '"& codigo &"'" 
rs.open sql, conn2
if rs.eof then
nombreProducto=response.write("")
else
nombreProducto=response.write(rs("producto"))
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function



Function nombreInsumo(codigo)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "SELECT  * from cat_insumos where item_gemalto = '"& codigo &"'" 
rs.open sql, conn2
if rs.eof then
nombreInsumo=response.write("")
else
nombreInsumo=response.write(rs("descripcion"))
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function EliminarAcentos(texto)

    Dim i, s1, s2
    s1 = "ÁÀÉÈÍÏÓÒÚÜÑáàèéíïóòúüñç"
    s2 = "AAEEIIOOUUNaaeeiioouunc"
    If Len(texto) <> 0 Then
        For i = 1 To Len(s1)
            texto = Replace(texto, Mid(s1,i,1), Mid(s2,i,1))
        Next
    End If
    
    EliminarAcentos = texto

End Function

function cargaPendientes()
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from pendientes a where id_modulo=1 and cr=4567"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	rs2.close
	conn3.close 
	set rs2=nothing
	set conn3=nothing
	cargaPendientes="No hay Pendientes"
else
	while not(rs2.eof)	
		regresar=regresar & "<tr><td width='15%' valign='middle'>"
		regresar=regresar & "<img src='images/logos/plus.png' onclick='agregar(" & rs2("id_pendiente") & ")' id='agregar" & rs2("id_pendiente") & "'/>"
		regresar=regresar & "<img src='images/logos/edit.png' onclick='edit(" & rs2("id_pendiente") & ")' id='edit" & rs2("id_pendiente") & "' style='display:none'/>"
		regresar=regresar & "<img src='images/logos/update.png' onclick='update(" & rs2("id_pendiente") & ")' id='update" & rs2("id_pendiente") & "' style='display:none'/></td>"
		regresar=regresar & "<input id='input" & rs2("id_pendiente") & "' type='text'/>"
		regresar=regresar & "<p id='parrafo" & rs2("id_pendiente") & "' style='display:none'></p></td></tr>"
	rs2.movenext
	wend  
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaPendientes=response.write(regresar)
end function

function cargaInsumos(cod_est_insumo,sustituirPor)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "SELECT DISTINCT(a.codigo_producto), b.producto, c.CONSUMO_ACUMULADO_MES FROM estructura_tarjetas a LEFT JOIN cat_tarjetas b ON a.codigo_producto = b.cod_producto LEFT JOIN mts_tarjetas_actual c ON a.codigo_producto = c.CODIGO_PRODUCTO WHERE cod_est_insumo = '" & cod_est_insumo & "' AND b.estatus = 2"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	rs2.close
	conn3.close 
	set rs2=nothing
	set conn3=nothing
	cargaInsumos=response.redirect("sustitucion_masiva.asp?hdd_enviar=NoRecords")
else
	while not(rs2.eof)	
		regresar=regresar & "<tr><td>" & rs2("codigo_producto") & "</td><td>" & server.HTMLEncode(rs2("producto").value) & "</td><td>" & formatNumber(rs2("CONSUMO_ACUMULADO_MES")) & "</td><td><img src='images/logos/replace.png' align='left' title='REMPLAZAR ELEMENTO' style='cursor:pointer' width='40' onclick=""confirmar_replaceInsumo('" & rs2("codigo_producto") & "')""/></td></tr>"
	rs2.movenext
	wend  
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaInsumos=response.write(regresar)
end function

Function cargaPorcentajesAvance(id)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from cat_porcentajes"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaPorcentajesAvance=response.write("<select><option value='0'>--</option></select>")
else
	regresar="<select id='select"& id &"' name='select"& id &"' style='display:none'><option value ='0'>--</option>"
	while not(rs2.eof)
		regresar=regresar & "<option value=" & rs2("porcentaje")& " >" & rs2("porcentaje")* 100 & " %</option>"
		
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaPorcentajesAvance=response.write(regresar)
End Function

Function calculaObras1Estatus(estatus1,estatus2)
set conn4=server.CreateObject("adodb.connection")
set rs4=server.CreateObject("adodb.recordset")
conn4.open connstr
sql4= "select COUNT(*) as Sucursales from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr where (a.EstatusObra='" & estatus1  & "' or a.EstatusObra='" & estatus2  & "') and b.territorial is not null;"
rs4.open sql4, conn4
if rs4.eof then
calculaObras1Estatus="0"
else
calculaObras1Estatus=rs4("Sucursales")
end if
rs4.close
conn4.close 
set rs4=nothing
set conn4=nothing
End Function

Function calculaObras1EstatusZona(estatus1,estatus2,zona)
set conn4=server.CreateObject("adodb.connection")
set rs4=server.CreateObject("adodb.recordset")
conn4.open connstr
sql4= "select COUNT(*) as Sucursales from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr where (a.EstatusObra='" & estatus1  & "' or a.EstatusObra='" & estatus2  & "') and b.territorial is not null and b.zona_territorial=" & zona & ";"
rs4.open sql4, conn4
if rs4.eof then
calculaObras1EstatusZona="0"
else
calculaObras1EstatusZona=rs4("Sucursales")
end if
rs4.close
conn4.close 
set rs4=nothing
set conn4=nothing
End Function

Function calculaObrasEstatusTerritorial(estatus1,estatus2,territorial)
set conn4=server.CreateObject("adodb.connection")
set rs4=server.CreateObject("adodb.recordset")
conn4.open connstr
sql4= "select COUNT(*) as Sucursales from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr where (a.EstatusObra='" & estatus1  & "' or a.EstatusObra='" & estatus2  & "') and b.territorial = '" & territorial & "';"
rs4.open sql4, conn4
if rs4.eof then
calculaObrasEstatusTerritorial="0"
else
calculaObrasEstatusTerritorial=rs4("Sucursales")
end if
rs4.close
conn4.close 
set rs4=nothing
set conn4=nothing
End Function

Function calculaObrasEstatusTerritorialZona(estatus1,estatus2,territorial,zona)
set conn4=server.CreateObject("adodb.connection")
set rs4=server.CreateObject("adodb.recordset")
conn4.open connstr
sql4= "select COUNT(*) as Sucursales from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr where (a.EstatusObra='" & estatus1  & "' or a.EstatusObra='" & estatus2  & "') and b.territorial = '" & territorial & "' and b.zona_territorial=" & zona & ";"
rs4.open sql4, conn4
if rs4.eof then
calculaObrasEstatusTerritorialZona="0"
else
calculaObrasEstatusTerritorialZona=rs4("Sucursales")
end if
rs4.close
conn4.close 
set rs4=nothing
set conn4=nothing
End Function

Function calculaObrasConPendientes()
set conn4=server.CreateObject("adodb.connection")
set rs4=server.CreateObject("adodb.recordset")
conn4.open connstr
sql4= "select count(DISTINCT(cr)) as sucursales from (select a.cr from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr LEFT JOIN pendientes C on a.cr=c.cr where a.EstatusObra=3 and c.id_pendiente is not null and c.fecha_finalizacion is null)z"
rs4.open sql4, conn4
if rs4.eof then
calculaObrasConPendientes="0"
else
calculaObrasConPendientes=rs4("Sucursales")
end if
rs4.close
conn4.close 
set rs4=nothing
set conn4=nothing
End Function

Function calculaObrasConPendientesZona(zona)
set conn4=server.CreateObject("adodb.connection")
set rs4=server.CreateObject("adodb.recordset")
conn4.open connstr
'sql4= "select count(DISTINCT(cr)) as sucursales from (select a.cr from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr LEFT JOIN pendientes C on a.cr=c.cr where a.EstatusObra=3 and c.id_pendiente is not null and c.fecha_finalizacion is null)z"
sql4="SELECT count(DISTINCT(cr)) AS sucursales FROM( SELECT a.cr FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN pendientes C ON a.cr = c.cr WHERE a.EstatusObra = 3 AND c.id_pendiente IS NOT NULL AND c.fecha_finalizacion IS NULL AND b.zona_territorial = " & zona & ") z"
rs4.open sql4, conn4
if rs4.eof then
calculaObrasConPendientesZona="0"
else
calculaObrasConPendientesZona=rs4("Sucursales")
end if
rs4.close
conn4.close 
set rs4=nothing
set conn4=nothing
End Function

Function calculaObrasConPendientesTest()
set conn4=server.CreateObject("adodb.connection")
set rs4=server.CreateObject("adodb.recordset")
conn4.open connstr
sql4= "select count(*) as sucursales from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr LEFT JOIN pendientes C on a.cr=c.cr where a.EstatusObra=3 and c.id_pendiente is not null and  c.fecha_finalizacion is null GROUP BY A.CR"
rs4.open sql4, conn4
if rs4.eof then
calculaObrasConPendientesTest="0"
else
calculaObrasConPendientesTest=sql4
end if
rs4.close
conn4.close 
set rs4=nothing
set conn4=nothing
End Function

Function calculaTotalObras()
set conn4=server.CreateObject("adodb.connection")
set rs4=server.CreateObject("adodb.recordset")
conn4.open connstr
sql4= "select count(*) as sucursales from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr where b.cr is not null;"
rs4.open sql4, conn4
if rs4.eof then
calculaTotalObras="0"
else
calculaTotalObras=rs4("Sucursales")
end if
rs4.close
conn4.close 
set rs4=nothing
set conn4=nothing
End Function

Function calculaTotalObrasZona(zona)
set conn4=server.CreateObject("adodb.connection")
set rs4=server.CreateObject("adodb.recordset")
conn4.open connstr
sql4= "select count(*) as sucursales from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr where b.cr is not null and b.zona_territorial=" & zona & ";"
rs4.open sql4, conn4
if rs4.eof then
calculaTotalObrasZona="0"
else
calculaTotalObrasZona=rs4("Sucursales")
end if
rs4.close
conn4.close 
set rs4=nothing
set conn4=nothing
End Function

Function cuenta(campo,cr)
set conn4=server.CreateObject("adodb.connection")
set rs4=server.CreateObject("adodb.recordset")
conn4.open connstr
sql4= "select "& campo &" as cuenta from tseguimiento where cr ='"& cr &"';"
rs4.open sql4, conn4
if rs4.eof then
cuenta="0"
else
if isNumeric(rs4("cuenta")) then
cuenta=1
else
cuenta=0
end if
end if
rs4.close
conn4.close 
set rs4=nothing
set conn4=nothing
End Function

Function contenidoCampo(campo,cr)
set conn5=server.CreateObject("adodb.connection")
set rs5=server.CreateObject("adodb.recordset")
conn5.open connstr
sql5= "select "& campo &" as cuenta from tseguimiento where cr ='"& cr &"';"
rs5.open sql5, conn5
if rs5.eof then
contenidoCampo=0
else
contenidoCampo=rs5("cuenta")
end if
rs5.close
conn5.close 
set rs5=nothing
set conn5=nothing
End Function

Function calculaPromedio(suma,elementos)
if elementos=0 then
calculaPromedio=0
else
calculaPromedio=(suma/elementos)*100
end if
End Function

Function buscaTipoTransformacion(id)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "SELECT  * from cat_tipoTransformacion where id_tipoTransformacion = '"& id &"'" 
rs.open sql, conn2
if rs.eof then
buscaTipoTransformacion=1
else
buscaTipoTransformacion=rs("tipoTransformacion")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function buscaIdComponente(campo)
set conn8=server.CreateObject("adodb.connection")
set rs8=server.CreateObject("adodb.recordset")
conn8.open connstr
sql8= "SELECT id_componente from cat_componentes where namebd='" & campo & "'" 
rs8.open sql8, conn8
if rs8.eof then
buscaIdComponente=0
else
buscaIdComponente=rs8("id_componente")
end if
rs8.close
conn8.close 
set rs8=nothing
set conn8=nothing
End Function

Function buscaCantidad(campo, cr, campoBD)
set conn8=server.CreateObject("adodb.connection")
set rs8=server.CreateObject("adodb.recordset")
conn8.open connstr
sql8= "select  " & campo &" as campo from tseguimiento a LEFT JOIN costoestimado b on a.cr=b.cr LEFT JOIN cat_componentes c on b.id_componente=c.id_componente where a.cr='" & cr & "' and c.nameBD='" & campoBD & "';" 
rs8.open sql8, conn8
if rs8.eof then
buscaCantidad=""
else
buscaCantidad=rs8("campo")
end if
rs8.close
conn8.close 
set rs8=nothing
set conn8=nothing
End Function

Function buscaSucursal(cr)
set conn8=server.CreateObject("adodb.connection")
set rs8=server.CreateObject("adodb.recordset")
conn8.open connstr
sql8= "SELECT nombre_sucursal from cat_sucursales where cr='" & cr &"'" 
rs8.open sql8, conn8
if rs8.eof then
buscaSucursal=""
else
buscaSucursal=rs8("nombre_sucursal")
end if
rs8.close
conn8.close 
set rs8=nothing
set conn8=nothing
End Function

Function buscaSemaforo(cr)
set conn8=server.CreateObject("adodb.connection")
set rs8=server.CreateObject("adodb.recordset")
conn8.open connstr
sql8= "SELECT estatusObra from tseguimiento where cr='" & cr & "'" 
rs8.open sql8, conn8
if rs8.eof then
buscaSemaforo=""
else
if rs8("estatusObra")="2" then 
buscaSemaforo="<img class='semaforo' src='images/indicadores/rojo_1.png'/>"
else
buscaSemaforo="<img class='semaforo' src='images/indicadores/verde.png'/>"
end if
end if
rs8.close
conn8.close 
set rs8=nothing
set conn8=nothing
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