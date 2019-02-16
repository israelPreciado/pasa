<%
'ConnStr="DRIVER={MySQL ODBC 3.51 Driver};server=162.242.164.14;database=pasa; uid=xmd7550;pwd=XMD7550; option=3"
'ConnStr2="DRIVER={MySQL ODBC 3.51 Driver};server=162.242.164.14;database=pasa; uid=xmd7550;pwd=XMD7550; option=3"
ConnStr="DRIVER={MySQL ODBC 3.51 Driver};server=localhost;database=pasa; uid=root;pwd=; option=3"
ConnStr2="DRIVER={MySQL ODBC 3.51 Driver};server=localhost;database=pasa; uid=root;pwd=; option=3"

Function calculaAvanceGeneral(cr,tipoRespuesta)
modulo1=0
modulo2=0
modulo3=0
modulo4=0
modulo5=0
modulo6=0
modulo7=0
modulo8=0
promedio1=0
promedio2=0
promedio3=0
promedio4=0
promedio5=0
promedio6=0
promedio7=0
promedio8=0
elementos1=0
elementos2=0
elementos3=0
elementos4=0
elementos5=0
elementos6=0
elementos7=0
elementos8=0

NA_elementos1=0
NA_elementos2=0
NA_elementos3=0
NA_elementos4=0
NA_elementos5=0
NA_elementos6=0
NA_elementos7=0
NA_elementos8=0

No_elementos1=0
No_elementos2=0
No_elementos3=0
No_elementos4=0
No_elementos5=0
No_elementos6=0
No_elementos7=0
No_elementos8=0


Set conn9 = Server.CreateObject("ADODB.Connection")
set rs9= Server.CreateObject("adodb.recordset")
Conn9.Open connstr
sql9="select * from cat_modulos;"
rs9.open sql9,conn9
if rs9.eof then
 response.write("NO")
else
  while not (rs9.eof)
 set rs2= Server.CreateObject("adodb.recordset")
 set rs21= Server.CreateObject("adodb.recordset")
 sql2="select * from cat_componentes a LEFT JOIN cat_modulos b on a.id_modulo=b.id_modulo where a.id_modulo='" & rs9("id_modulo") & "';"
 sql21="select count(*) as elementos from cat_componentes where id_modulo='" & rs9("id_modulo") & "';"
 rs2.open sql2,conn9
 rs21.open sql21,conn9
 


 if rs2.eof then
  response.write("NO")
 else
  Select case cint(rs9("id_modulo"))
   case 1
    No_elementos1=rs21("elementos")
   case 2
    No_elementos2=rs21("elementos")
   case 3
    No_elementos3=rs21("elementos")
	case 4
    No_elementos4=rs21("elementos")
   case 5
    No_elementos5=rs21("elementos")
   case 6
    No_elementos6=rs21("elementos")
	case 7
    No_elementos7=rs21("elementos")
   case 9
    No_elementos8=rs21("elementos")
End select
  rs21.close
  set rs21=nothing
  
  while not (rs2.eof)
  if cint(cuenta(rs2("nameBD"),cr))=1 then
  Select case cint(rs9("id_modulo"))
   case 1
	modulo1= modulo1 + cdbl(contenidoCampo(rs2("nameBD"),cr))
    elementos1=elementos1 +1
   case 2
	 modulo2= modulo2 + cdbl(contenidoCampo(rs2("nameBD"),cr))
    elementos2=elementos2 +1
   case 3
	 modulo3= modulo3 + cdbl(contenidoCampo(rs2("nameBD"),cr))
    elementos3=elementos3 +1
	case 4
	modulo4= modulo4 + cdbl(contenidoCampo(rs2("nameBD"),cr))
    elementos4=elementos4 +1
   case 5
	 modulo5= modulo5 + cdbl(contenidoCampo(rs2("nameBD"),cr))
    elementos5=elementos5 +1
   case 6
	 modulo6= modulo6 + cdbl(contenidoCampo(rs2("nameBD"),cr))
    elementos6=elementos6 +1
	case 7
	 modulo7= modulo7 + cdbl(contenidoCampo(rs2("nameBD"),cr))
    elementos7=elementos7 +1
   case 9
	 modulo8= modulo8 + cdbl(contenidoCampo(rs2("nameBD"),cr))
    elementos8=elementos8 +1
End select
else

Select case cint(rs9("id_modulo"))
   case 1
    NA_elementos1=NA_elementos1 +1
   case 2
    NA_elementos2=NA_elementos2 +1
   case 3
    NA_elementos3=NA_elementos3 +1
	case 4
    NA_elementos4=NA_elementos4 +1
   case 5
    NA_elementos5=NA_elementos5 +1
   case 6
    NA_elementos6=NA_elementos6 +1
	case 7
    NA_elementos7=NA_elementos7 +1
   case 9
    NA_elementos8=NA_elementos8 +1
End select

  end if

  rs2.movenext
  wend 
 end if
 rs2.close
 set rs2=nothing
 rs9.movenext
  wend 
end if

rs9.close
conn9.close 
set rs9=nothing
set conn9=nothing

if cint(No_elementos1)=cint(NA_elementos1) then
 promedio1=100
else
 promedio1=round(calculaPromedio(modulo1,elementos1),2)
end if

if cint(No_elementos2)=cint(NA_elementos2) then
 promedio2=100
else
 promedio2=round(calculaPromedio(modulo2,elementos2),2)
end if

if cint(No_elementos3)=cint(NA_elementos3) then
 promedio3=100
else
 promedio3=round(calculaPromedio(modulo3,elementos3),2)
end if

if cint(No_elementos4)=cint(NA_elementos4) then
 promedio4=100
else
 promedio4=round(calculaPromedio(modulo4,elementos4),2)
end if

if cint(No_elementos5)=cint(NA_elementos5) then
 promedio5=100
else
 promedio5=round(calculaPromedio(modulo5,elementos5),2)
end if

if cint(No_elementos6)=cint(NA_elementos6) then
 promedio6=100
else
 promedio6=round(calculaPromedio(modulo6,elementos6),2)
end if

if cint(No_elementos7)=cint(NA_elementos7) then
 promedio7=100
else
 promedio7=round(calculaPromedio(modulo7,elementos7),2)
end if

if cint(No_elementos8)=cint(NA_elementos8) then
 promedio8=100
else
 promedio8=round(calculaPromedio(modulo8,elementos8),2)
end if

promedio1=porcentajeAvanceSucursal(cr)

promedioGeneral=round(((promedio1*70)/100)+((promedio2*(30/7))/100)+((promedio3*(30/7))/100)+((promedio4*(30/7))/100)+((promedio5*(30/7))/100) +((promedio6*(30/7))/100) +((promedio7*(30/7))/100),2)+((promedio8*(30/7))/100)
'promedioGeneral=round((round((calculaPromedio(modulo1,elementos1)*70)/100,2)+round((calculaPromedio(modulo2,elementos2)*5)/100,2)+round((calculaPromedio(modulo3,elementos3)*5)/100,2)+round((calculaPromedio(modulo4,elementos4)*5)/100,2)+round((calculaPromedio(modulo5,elementos5)*5)/100,2)+round((calculaPromedio(modulo6,elementos6)*5)/100,2)+round((calculaPromedio(modulo7,elementos7)*5)/100,2)),2)

if tipoRespuesta="G" then
regresar= round(promedioGeneral,2)
else
 Select case cint(tipoRespuesta)
   case 1
	regresar= promedio1
   case 2
	 regresar= promedio2
   case 3
	 regresar= promedio3
   case 4
	 regresar= promedio4
   case 5
	 regresar= promedio5
   case 6
	 regresar= promedio6
	case 7
	 regresar= promedio7
   case 9
	 regresar= promedio8
End select
end if
calculaAvanceGeneral=regresar
End Function

function cargaEstimacionesRealizadas
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "SELECT a.cr, b.NOMBRE_SUCURSAL, b.Territorial, b.Regional, d.login_nombre AS supervisor, e.contratista, a.fechaEstimacion1 AS estimacion1, a.fechaEstimacion2 AS estimacion2, a.fechaEstimacion3 AS estimacion3, a.fechaEstimacion4 AS estimacion4, c.FechaInicio, c.FechaTermino, c.AvanceReal, c.AvanceProyectado FROM ctrl_estimaciones a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN tseguimiento c ON a.cr = c.cr LEFT JOIN app_bnrt_login d ON c.supervisorAsignado = d.login_id LEFT JOIN cat_contratistas e ON c.ContratistaAsignado = e.id_contratista WHERE NOT( fechaEstimacion1 IS NULL AND fechaEstimacion2 IS NULL AND fechaEstimacion3 IS NULL AND fechaEstimacion4 IS NULL)"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaEstimacionesRealizadas=response.write("")
else 
	while not(rs2.eof)	
		regresar=regresar & "<tr>"
		regresar=regresar & "<td align='center'>" & rs2("cr") & "</td>"
		regresar=regresar & "<td align='center'>" & rs2("NOMBRE_SUCURSAL") & "</td>"
		regresar=regresar & "<td align='center'>" & rs2("Territorial") & "</td>"
		regresar=regresar & "<td align='center'>" & rs2("Regional") & "</td>"
		regresar=regresar & "<td align='center'>" & rs2("supervisor") & "</td>"
		regresar=regresar & "<td align='center'>" & rs2("contratista") & "</td>"
		regresar=regresar & "<td align='center'>" & rs2("estimacion1") & "</td>"
		regresar=regresar & "<td align='center'>" & rs2("estimacion2") & "</td>"
		regresar=regresar & "<td align='center'>" & rs2("estimacion3") & "</td>"
		regresar=regresar & "<td align='center'>" & rs2("estimacion4") & "</td>"
		regresar=regresar & "<td align='center'>" & rs2("FechaInicio") & "</td>"
		regresar=regresar & "<td align='center'>" & rs2("FechaTermino") & "</td>"
		regresar=regresar & "<td align='center'>" & round(rs2("AvanceReal"),2) & "</td>"
		regresar=regresar & "<td align='center'>" & rs2("AvanceProyectado") & "</td>"
		regresar=regresar & "</tr>"
	rs2.movenext
	wend  
	
end if
rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaEstimacionesRealizadas=response.write(regresar)
End Function



function cuentaPendientes(cr)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select count(*) as pendientes from pendientes where cr ='" & cr &"' and id_estatus=1"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cuentaPendientes=response.write("0")
else
	regresar=regresar  & rs2("pendientes") & " %"
end if
rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cuentaPendientes=response.write(regresar)
End Function

function costoEstimadoPorPartida(cr,partida)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "SELECT *,case when TotalAvanceSuc = 0 and TotalSuc=0 then 100 else  (TotalAvanceSuc * 100) / TotalSuc end  AS porTotalAvanceSuc,(TotalExcesoSuc * 100) / TotalSuc AS porTotalExcesoSuc FROM( SELECT cr, Sum(subTotalSuc) AS TotalSuc, Sum(subTotalAvanceSuc) AS TotalAvanceSuc, Sum(subTotalExcesoSuc) AS TotalExcesoSuc FROM( SELECT *,(cantidad * pu) AS subTotalSuc,((avance - exceso) * pu) AS subTotalAvanceSuc, exceso * pu AS subTotalExcesoSuc FROM( SELECT cr, CASE WHEN avanceCompletado = 1 THEN IFNULL(avance, 0) ELSE cantidad END AS cantidad, pu, CASE WHEN avance IS NULL THEN 0 ELSE avance END AS avance, CASE WHEN avance IS NULL THEN 0 WHEN avance > cantidad THEN avance - cantidad WHEN avance <= cantidad THEN 0 END AS exceso FROM nuevocosto_estimadoobra WHERE cr = '" & cr &"' AND componente LIKE '" & partida & "') a) b) c"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	costoEstimadoPorPartida=response.write("0 %")
else
	regresar=regresar  & round(rs2("porTotalAvanceSuc"),2) & " %"
end if
rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
costoEstimadoPorPartida=response.write(regresar)
End Function

function cargaPorcentajeEjecutado(zona_territorial)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "SELECT round((sum(total) * 100) / (select sum(total) from  (select cantidad * pu as total from (select a.*, concat(ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu, case when componente ='otros' then descorta else '' end) as nid from nuevocosto_estimadoobra a left join cat_sucursales b on a.cr=b.cr where b.zona_territorial=" & zona_territorial & ")a GROUP BY nid,cr)a) ,3)as total FROM( SELECT sum(avance * pu) total FROM( SELECT a.*, concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu, CASE WHEN componente = 'otros' THEN descorta ELSE '' END) AS nid FROM nuevocosto_estimadoobra a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & zona_territorial & ") a GROUP BY nid DESC) a"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaPorcentajeEjecutado=response.write("0")
else
	regresar=regresar  & rs2("total")
end if
rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaPorcentajeEjecutado=response.write(regresar)
End Function

function cargaPorcentajePagado(zona_territorial)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
'sql3= "SELECT round((sum(cantidad * pu)*100) /  FROM( SELECT * FROM( SELECT concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS id, a.cr, clave_sap_concurso, clave_sap_zona, cantidad, pu, avance, avance * pu AS total FROM estimacion1 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE zona_territorial = 1 GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a WHERE id NOT IN( SELECT * FROM( SELECT concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS id FROM estimacion2 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE zona_territorial = 1 GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a) UNION SELECT * FROM( SELECT concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS id, a.cr, clave_sap_concurso, clave_sap_zona, cantidad, pu, avance, avance * pu AS total FROM estimacion2 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE zona_territorial = 1 GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a WHERE id NOT IN( SELECT * FROM( SELECT concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS id FROM estimacion2 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE zona_territorial = 3 GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a) UNION SELECT * FROM( SELECT concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS id, a.cr, clave_sap_concurso, clave_sap_zona, cantidad, pu, avance, avance * pu AS total FROM estimacion3 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE zona_territorial = 1 GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a WHERE id NOT IN( SELECT * FROM( SELECT concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS id FROM estimacion2 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE zona_territorial = 4 GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a)) a;"
'sql3= "SELECT round((sum(cantidad * pu)*100) /  AS total FROM( SELECT * FROM( SELECT concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS id, a.cr, clave_sap_concurso, clave_sap_zona, cantidad, pu, avance, avance * pu AS total FROM estimacion1 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE zona_territorial = 1 GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a WHERE id NOT IN( SELECT * FROM( SELECT concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS id FROM estimacion2 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE zona_territorial = 1 GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a) UNION SELECT * FROM( SELECT concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS id, a.cr, clave_sap_concurso, clave_sap_zona, cantidad, pu, avance, avance * pu AS total FROM estimacion2 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE zona_territorial = 1 GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a WHERE id NOT IN( SELECT * FROM( SELECT concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS id FROM estimacion2 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE zona_territorial = 3 GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a) UNION SELECT * FROM( SELECT concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS id, a.cr, clave_sap_concurso, clave_sap_zona, cantidad, pu, avance, avance * pu AS total FROM estimacion3 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE zona_territorial = 1 GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a WHERE id NOT IN( SELECT * FROM( SELECT concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS id FROM estimacion2 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE zona_territorial = 4 GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a)) a;"
sql3="select ((SELECT round(sum(costoreal), 2) totalPagado FROM( SELECT a.regional, CASE WHEN b.total IS NULL THEN 0 ELSE b.total END AS estimacion1, CASE WHEN c.total IS NULL THEN 0 ELSE c.total END AS estimacion2, CASE WHEN d.total IS NULL THEN 0 ELSE d.total END AS estimacion3, CASE WHEN b.total IS NULL THEN 0 ELSE b.total END + CASE WHEN c.total IS NULL THEN 0 ELSE c.total END + CASE WHEN d.total IS NULL THEN 0 ELSE d.total END AS costoReal FROM( SELECT regional FROM cat_sucursales WHERE zona_territorial =" & zona_territorial & " GROUP BY regional) a LEFT JOIN( SELECT sum(totalestimacion) AS total, regional FROM( SELECT a.*, pu * avance AS totalEstimacion, b.regional, concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS nid FROM estimacion1 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial =" & zona_territorial & " GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a GROUP BY regional) b ON a.regional = b.regional LEFT JOIN( SELECT sum(totalestimacion) AS total, regional FROM( SELECT a.*, pu * avance AS totalEstimacion, b.regional, concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS nid FROM estimacion2 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial =" & zona_territorial & " GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a GROUP BY regional) c ON a.regional = c.regional LEFT JOIN( SELECT sum(totalestimacion) AS total, regional FROM( SELECT a.*, pu * avance AS totalEstimacion, b.regional, concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS nid FROM estimacion3 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial =" & zona_territorial & " GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a GROUP BY regional) d ON a.regional = d.regional)a) *100)/ (SELECT round(sum(total),3) as total FROM( SELECT sum(cantidad * pu) total FROM( SELECT a.*, concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu, CASE WHEN componente = 'otros' THEN descorta ELSE '' END) AS nid FROM nuevocosto_estimadoobra a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial =" & zona_territorial & ") a GROUP BY nid DESC) a) as total;;"
'sql3="SELECT round((sum(costoreal)*100) / (), 2) totalPagado FROM( SELECT a.regional, CASE WHEN b.total IS NULL THEN 0 ELSE b.total END AS estimacion1, CASE WHEN c.total IS NULL THEN 0 ELSE c.total END AS estimacion2, CASE WHEN d.total IS NULL THEN 0 ELSE d.total END AS estimacion3, CASE WHEN b.total IS NULL THEN 0 ELSE b.total END + CASE WHEN c.total IS NULL THEN 0 ELSE c.total END + CASE WHEN d.total IS NULL THEN 0 ELSE d.total END AS costoReal FROM( SELECT regional FROM cat_sucursales WHERE zona_territorial = " & zona_territorial & " GROUP BY regional) a LEFT JOIN( SELECT sum(totalestimacion) AS total, regional FROM( SELECT a.*, pu * avance AS totalEstimacion, b.regional, concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS nid FROM estimacion1 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & zona_territorial & " GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a GROUP BY regional) b ON a.regional = b.regional LEFT JOIN( SELECT sum(totalestimacion) AS total, regional FROM( SELECT a.*, pu * avance AS totalEstimacion, b.regional, concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS nid FROM estimacion2 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & zona_territorial & " GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a GROUP BY regional) c ON a.regional = c.regional LEFT JOIN( SELECT sum(totalestimacion) AS total, regional FROM( SELECT a.*, pu * avance AS totalEstimacion, b.regional, concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS nid FROM estimacion3 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & zona_territorial & " GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a GROUP BY regional) d ON a.regional = d.regional)a"
'(select sum(total) from  (select cantidad * pu as total from (select a.*, concat(ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu, case when componente ='otros' then descorta else '' end) as nid from nuevocosto_estimadoobra a left join cat_sucursales b on a.cr=b.cr where b.zona_territorial=1)a GROUP BY nid,cr)a)

regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaPorcentajePagado=response.write("0")
else
	regresar=regresar  & rs2("total")
end if
rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaPorcentajePagado=response.write(regresar)
End Function

function cargaPresupuestoEjecutado(zona_territorial,tipo)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "SELECT round(sum(ifnull(total,0)),3) as total FROM( SELECT sum(avance * pu) total FROM( SELECT a.*, concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu, CASE WHEN componente = 'otros' THEN descorta ELSE '' END) AS nid FROM nuevocosto_estimadoobra a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & zona_territorial &") a GROUP BY nid DESC) a"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaPresupuestoEjecutado=response.write("")
else
	if tipo="1" then 
		regresar=regresar  & formatoPesos(rs2("total")) 
	else
		regresar=rs2("total")
	end if
end if
rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaPresupuestoEjecutado=response.write(regresar)
End Function

function cargaPresupuestoTotal(zona_territorial,tipo)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "SELECT round(sum(total),3) as total FROM( SELECT sum(cantidad * pu) total FROM( SELECT a.*, concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu, CASE WHEN componente = 'otros' THEN descorta ELSE '' END) AS nid FROM nuevocosto_estimadoobra a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & zona_territorial & ") a GROUP BY nid DESC) a"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaPresupuestoTotal=response.write("")
else
	if tipo="1" then 
		regresar=regresar  & formatoPesos(rs2("total")) 
	else
		regresar=rs2("total")
	end if
end if
rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaPresupuestoTotal=response.write(regresar)
End Function

function cargaPresupuestoPagado(zona_territorial,tipo)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
'sql3= "SELECT round(sum(cantidad * pu)) AS total FROM( SELECT * FROM( SELECT concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS id, a.cr, clave_sap_concurso, clave_sap_zona, cantidad, pu, avance, avance * pu AS total FROM estimacion1 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE zona_territorial = " & zona_territorial & " GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a WHERE id NOT IN( SELECT * FROM( SELECT concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS id FROM estimacion2 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE zona_territorial = " & zona_territorial & " GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a) UNION SELECT * FROM( SELECT concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS id, a.cr, clave_sap_concurso, clave_sap_zona, cantidad, pu, avance, avance * pu AS total FROM estimacion2 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE zona_territorial = " & zona_territorial & " GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a WHERE id NOT IN( SELECT * FROM( SELECT concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS id FROM estimacion2 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE zona_territorial = " & zona_territorial & " GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a) UNION SELECT * FROM( SELECT concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS id, a.cr, clave_sap_concurso, clave_sap_zona, cantidad, pu, avance, avance * pu AS total FROM estimacion3 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE zona_territorial =" & zona_territorial & " GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a WHERE id NOT IN( SELECT * FROM( SELECT concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS id FROM estimacion2 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE zona_territorial = " & zona_territorial & " GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a)) a"
sql3="SELECT round(sum(costoreal), 2) totalPagado FROM( SELECT a.regional, CASE WHEN b.total IS NULL THEN 0 ELSE b.total END AS estimacion1, CASE WHEN c.total IS NULL THEN 0 ELSE c.total END AS estimacion2, CASE WHEN d.total IS NULL THEN 0 ELSE d.total END AS estimacion3, CASE WHEN b.total IS NULL THEN 0 ELSE b.total END + CASE WHEN c.total IS NULL THEN 0 ELSE c.total END + CASE WHEN d.total IS NULL THEN 0 ELSE d.total END AS costoReal FROM( SELECT regional FROM cat_sucursales WHERE zona_territorial = " & zona_territorial & " GROUP BY regional) a LEFT JOIN( SELECT sum(totalestimacion) AS total, regional FROM( SELECT a.*, pu * avance AS totalEstimacion, b.regional, concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS nid FROM estimacion1 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & zona_territorial & " GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a GROUP BY regional) b ON a.regional = b.regional LEFT JOIN( SELECT sum(totalestimacion) AS total, regional FROM( SELECT a.*, pu * avance AS totalEstimacion, b.regional, concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS nid FROM estimacion2 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & zona_territorial & " GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a GROUP BY regional) c ON a.regional = c.regional LEFT JOIN( SELECT sum(totalestimacion) AS total, regional FROM( SELECT a.*, pu * avance AS totalEstimacion, b.regional, concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu) AS nid FROM estimacion3 a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE b.zona_territorial = " & zona_territorial & " GROUP BY concat( ifnull(a.cr, '0000'), ifnull( clave_sap_concurso, '000000000'), ifnull(clave_sap_zona, '00000000'), cantidad, pu)) a GROUP BY regional) d ON a.regional = d.regional)a"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaPresupuestoPagado=response.write("")
else
	if tipo="1" then 
		regresar=regresar  & formatoPesos(rs2("totalPagado")) 
	else
		regresar= rs2("totalPagado")
	end if
end if
rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaPresupuestoPagado=response.write(regresar)
End Function

function cargaProgramadas()
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "SELECT 'Programado Acumulado' AS Terminos_obra, enero.total AS enero, enero.total + febrero.total AS febrero, enero.total + febrero.total + marzo.total AS marzo, enero.total + febrero.total + marzo.total + abril.total AS abril, enero.total + febrero.total + marzo.total + abril.total + mayo.total AS mayo, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total AS junio, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total AS julio, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total AS agosto, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total AS septiembre, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total + octubre.total AS octubre, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total + octubre.total + noviembre.total AS noviembre, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total + octubre.total + noviembre.total + diciembre.total AS diciembre, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total + octubre.total + noviembre.total + diciembre.total AS Total FROM( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-01-01' AND '2019-01-31' AND b.zona_territorial = 1) AS enero LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-02-01' AND '2019-02-28' AND b.zona_territorial = 1) AS febrero ON enero.tem = febrero.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-03-01' AND '2019-03-31' AND b.zona_territorial = 1) AS marzo ON enero.tem = marzo.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-04-01' AND '2019-04-30' AND b.zona_territorial = 1) AS abril ON enero.tem = abril.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-05-01' AND '2019-05-31' AND b.zona_territorial = 1) AS mayo ON enero.tem = mayo.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-06-01' AND '2019-06-30' AND b.zona_territorial = 1) AS junio ON enero.tem = junio.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-07-01' AND '2019-07-31' AND b.zona_territorial = 1) AS julio ON enero.tem = julio.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-08-01' AND '2019-08-31' AND b.zona_territorial = 1) AS agosto ON enero.tem = agosto.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-09-01' AND '2019-09-30' AND b.zona_territorial = 1) AS septiembre ON enero.tem = septiembre.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-10-01' AND '2019-10-31' AND b.zona_territorial = 1) AS octubre ON enero.tem = octubre.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-11-01' AND '2019-12-30' AND b.zona_territorial = 1) AS noviembre ON enero.tem = noviembre.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE FechaTermino BETWEEN '2019-12-01' AND '2019-12-31' AND b.zona_territorial = 1) AS diciembre ON enero.tem = diciembre.tem"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaProgramadas=response.write("")
else
		regresar=regresar  & rs2("enero") &  "," & rs2("febrero") & "," & rs2("marzo") & "," & rs2("abril") & "," & rs2("mayo") & "," & rs2("junio") & "," & rs2("julio") & "," & rs2("agosto") & "," & rs2("septiembre") & "," & rs2("octubre") & "," & rs2("noviembre") & "," & rs2("diciembre")  
end if
rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaProgramadas=response.write(regresar)
End Function

function cargaReales()
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "SELECT 'Real Acumulado' AS Terminos_obra, enero.total AS enero, enero.total + febrero.total AS febrero, enero.total + febrero.total + marzo.total AS marzo, enero.total + febrero.total + marzo.total + abril.total AS abril, enero.total + febrero.total + marzo.total + abril.total + mayo.total AS mayo, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total AS junio, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total AS julio, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total AS agosto, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total AS septiembre, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total + octubre.total AS octubre, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total + octubre.total + noviembre.total AS noviembre, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total + octubre.total + noviembre.total + diciembre.total AS diciembre, enero.total + febrero.total + marzo.total + abril.total + mayo.total + junio.total + julio.total + agosto.total + septiembre.total + octubre.total + noviembre.total + diciembre.total AS Total FROM( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-01-01' AND '2019-01-31' AND b.zona_territorial = 1 ) AS enero LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-02-01' AND '2019-02-28' AND b.zona_territorial = 1 ) AS febrero ON enero.tem = febrero.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-03-01' AND '2019-03-31' AND b.zona_territorial = 1 ) AS marzo ON enero.tem = marzo.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-04-01' AND '2019-04-30' AND b.zona_territorial = 1 ) AS abril ON enero.tem = abril.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-05-01' AND '2019-05-31' AND b.zona_territorial = 1 ) AS mayo ON enero.tem = mayo.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-06-01' AND '2019-06-30' AND b.zona_territorial = 1 ) AS junio ON enero.tem = junio.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-07-01' AND '2019-07-31' AND b.zona_territorial = 1 ) AS julio ON enero.tem = julio.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-08-01' AND '2019-08-31' AND b.zona_territorial = 1 ) AS agosto ON enero.tem = agosto.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-09-01' AND '2019-09-30' AND b.zona_territorial = 1 ) AS septiembre ON enero.tem = septiembre.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-10-01' AND '2019-10-31' AND b.zona_territorial = 1 ) AS octubre ON enero.tem = octubre.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-11-01' AND '2019-12-30' AND b.zona_territorial = 1 ) AS noviembre ON enero.tem = noviembre.tem LEFT JOIN( SELECT 1 AS tem, count(*) AS total FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr WHERE fecha_finReal BETWEEN '2019-12-01' AND '2019-12-31' AND b.zona_territorial = 1 ) AS diciembre ON enero.tem = diciembre.tem"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaReales=response.write("")
else
		regresar=regresar  & rs2("enero") &  "," & rs2("febrero") & "," & rs2("marzo") & "," & rs2("abril") & "," & rs2("mayo") & "," & rs2("junio") & "," & rs2("julio") & "," & rs2("agosto") & "," & rs2("septiembre") & "," & rs2("octubre") & "," & rs2("noviembre") & "," & rs2("diciembre")  
end if
rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaReales=response.write(regresar)
End Function

function porcentajeAvancePartida(cr,partida)
set conn25=server.CreateObject("adodb.connection")
set rs5=server.CreateObject("adodb.recordset")
conn25.open connstr
sql5="select *, Round((TotalAvanceSuc * 100) / TotalSuc,3) as porTotalAvanceSuc,  (TotalExcesoSuc * 100) / TotalSuc  as porTotalExcesoSuc from (select cr, Round(Sum(subTotalSuc),2) as TotalSuc,Round(Sum(subTotalAvanceSuc),2) as TotalAvanceSuc,Round(Sum(subTotalExcesoSuc),2) as TotalExcesoSuc  from (select *, (cantidad * pu) as subTotalSuc,((avance-exceso)* pu) as subTotalAvanceSuc,exceso* pu as subTotalExcesoSuc from (select cr, cantidad, pu,round(case when avance is null then 0 else avance end,2) as avance,CASE WHEN avance IS NULL THEN 0 WHEN avance > cantidad THEN avance - cantidad WHEN avance <= cantidad THEN 0 END AS exceso from nuevocosto_estimadoobra where cr='" & cr &"' and componente like '" & partida & "')a)b)c"
rs5.open sql5, conn25
if rs5.eof then
porcentajeAvancePartida="0"
else
porcentajeAvancePartida=rs5("porTotalAvanceSuc")
end if
rs5.close
conn25.close 
set rs5=nothing
set conn2=nothing
end function


function porcentajeAvanceSucursal(cr)
set conn25=server.CreateObject("adodb.connection")
set rs25=server.CreateObject("adodb.recordset")
conn25.open connstr
'sql25="select case when porTotalAvancePartidaPesos is null then 0 else porTotalAvancePartidaPesos end as porTotalAvancePartidaPesos from (SELECT *, sum(a.precio) AS totalPartida, sum(a.porAvancePesos) AS totalAvancePartidaPesos, Round(((sum(a.porAvancePesos) * 100) / sum(a.precio)), 2) AS porTotalAvancePartidaPesos FROM( SELECT *, CANTIDAD * PU AS PRECIO, ROUND((CANTIDAD * PU) *(PORAVANCE / 100), 2) AS porAvancePesos FROM( SELECT * FROM( SELECT a.id, a.CLAVE_SAP_CONCURSO, a.clave_sap_zona, b.DESCRIPCION_CORTA, b.descripcion_larga, a.pu, a.cantidad, b.UND, a.componente, concat( LEFT(a.fecha_ingreso, 4), '-', RIGHT(LEFT(a.fecha_ingreso, 7), 2), '-', RIGHT(LEFT(a.fecha_ingreso, 10), 2), ' ', RIGHT(a.fecha_ingreso, 8)) AS fecha_ingreso, a.avance, CASE WHEN a.avance >= 0 THEN round((a.avance * 100) / a.cantidad, 2) ELSE 0 END AS porAvance FROM nuevoCosto_estimadoObra a LEFT JOIN cat_sap_2017 b ON a.CLAVE_SAP_CONCURSO = b.CLAVE_SAP_CONCURSO WHERE cr = '" & cr & "' and a.componente not like 'otros') AS a UNION( SELECT id, clave_sap_concurso, clave_sap_zona, descorta AS descripcion_corta, deslarga AS descripcion_larga, pu, cantidad, und, componente, fecha_ingreso, avance, CASE WHEN avance >= 0 THEN(avance * 100) / cantidad ELSE 0 END AS porAvance FROM nuevocosto_estimadoobra WHERE cr = '" & cr & "' AND componente LIKE 'Otros') ORDER BY fecha_ingreso DESC) a GROUP BY id) a)a"
sql25="select case when porTotalAvanceSuc is null then 0 else round(porTotalAvanceSuc,2) end as porTotalAvanceSuc from (select *, Round((TotalAvanceSuc * 100) / TotalSuc,3) as porTotalAvanceSuc,  (TotalExcesoSuc * 100) / TotalSuc  as porTotalExcesoSuc from (select cr, Round(Sum(subTotalSuc),2) as TotalSuc,Round(Sum(subTotalAvanceSuc),2) as TotalAvanceSuc,Round(Sum(subTotalExcesoSuc),2) as TotalExcesoSuc  from (select *, (cantidad * pu) as subTotalSuc,((avance-exceso)* pu) as subTotalAvanceSuc,exceso* pu as subTotalExcesoSuc from (select cr, case when avanceCompletado=1 then round(CASE WHEN avance IS NULL THEN	0	ELSE avance	END,2) else round(cantidad,2) end as cantidad, pu,round(case when avance is null then 0 else avance end,2) as avance,CASE WHEN avance IS NULL THEN 0 WHEN avance > cantidad THEN avance - cantidad WHEN avance <= cantidad THEN 0 END AS exceso from nuevocosto_estimadoobra where cr='" & cr &"')a)b)c)d"
rs25.open sql25, conn25
if rs25.eof then
porcentajeAvanceSucursal="0"
else
porcentajeAvanceSucursal=rs25("porTotalAvanceSuc")
end if
rs25.close
conn25.close 
set rs25=nothing
set conn25=nothing
end function



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
sql= "select COUNT(*) as supervisores from (select a.supervisorAsignado,b.Territorial,d.login_nombre from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr LEFT JOIN cat_gerentes_supervisores c on a.supervisorAsignado=c.id_supervisor LEFT JOIN app_bnrt_login d on c.id_gerente=d.login_id GROUP BY a.supervisorAsignado)a;"
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
sql= "select COUNT(*) as supervisores from (select a.supervisorAsignado,b.Territorial,d.login_nombre from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr LEFT JOIN cat_gerentes_supervisores c on a.supervisorAsignado=c.id_supervisor LEFT JOIN app_bnrt_login d on c.id_gerente=d.login_id where b.zona_territorial=" & zona & " GROUP BY a.supervisorAsignado)a;"
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
sql= "SELECT  " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND c.Territorial = '" & territorial & "') AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND c.Territorial = '" & territorial & "') AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND c.Territorial = '" & territorial & "') AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND c.Territorial = '" & territorial & "') AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND c.Territorial = '" & territorial & "') AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND c.Territorial = '" & territorial & "') AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND c.Territorial = '" & territorial & "') AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND c.Territorial = '" & territorial & "') AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "') AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND c.Territorial = '" & territorial & "') AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND c.Territorial = '" & territorial & "') AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND c.Territorial = '" & territorial & "') AS diciembre ON enero.id = diciembre.id ;"
else
sql= "SELECT  " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31') AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28') AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31') AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30') AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31') AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30') AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31') AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31') AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "') AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31') AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30') AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31') AS diciembre ON enero.id = diciembre.id ;"
end if
end if
if estatusObra="terminadas" then
if query="1" then
sql= "SELECT " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS diciembre ON enero.id = diciembre.id;"
else
sql= "SELECT " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND a.EstatusObra = 3) AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND a.EstatusObra = 3) AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND a.EstatusObra = 3) AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND a.EstatusObra = 3) AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND a.EstatusObra = 3) AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND a.EstatusObra = 3) AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND a.EstatusObra = 3) AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND a.EstatusObra = 3) AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND a.EstatusObra = 3) AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND a.EstatusObra = 3) AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND a.EstatusObra = 3) AS diciembre ON enero.id = diciembre.id;"
end if
end if
if estatusObra="enProceso" then
if query="1" then
sql= "SELECT " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS diciembre ON enero.id = diciembre.id;"
else
sql= "SELECT " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS diciembre ON enero.id = diciembre.id;"
end if
end if
if estatusObra="porIniciar" then
if query="1" then
sql= "SELECT " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS diciembre ON enero.id = diciembre.id;"
else
sql= "SELECT " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND a.EstatusObra = 0) AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND a.EstatusObra = 0) AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND a.EstatusObra = 0) AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND a.EstatusObra = 0) AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND a.EstatusObra = 0) AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND a.EstatusObra = 0) AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND a.EstatusObra = 0) AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND a.EstatusObra = 0) AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND a.EstatusObra = 0) AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND a.EstatusObra = 0) AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND a.EstatusObra = 0) AS diciembre ON enero.id = diciembre.id;"
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

function numeroSupTerrMesZona(territorial, mes,query,estatusObra,zona)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
if estatusObra="autorizadas" then
if query="1" then
sql= "SELECT  " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND c.Territorial = '" & territorial & "') AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND c.Territorial = '" & territorial & "') AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND c.Territorial = '" & territorial & "') AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND c.Territorial = '" & territorial & "') AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND c.Territorial = '" & territorial & "') AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND c.Territorial = '" & territorial & "') AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND c.Territorial = '" & territorial & "') AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND c.Territorial = '" & territorial & "') AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "') AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND c.Territorial = '" & territorial & "') AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND c.Territorial = '" & territorial & "') AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND c.Territorial = '" & territorial & "') AS diciembre ON enero.id = diciembre.id ;"
else
sql= "SELECT " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND c.zona_territorial = '" & zona & "') AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND c.zona_territorial = '" & zona & "') AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND c.zona_territorial = '" & zona & "') AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND c.zona_territorial = '" & zona & "') AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND c.zona_territorial = '" & zona & "') AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND c.zona_territorial = '" & zona & "') AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND c.zona_territorial = '" & zona & "') AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND c.zona_territorial = '" & zona & "') AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.zona_territorial = '" & zona & "') AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND c.zona_territorial = '" & zona & "') AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND c.zona_territorial = '" & zona & "') AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND c.zona_territorial = '" & zona & "') AS diciembre ON enero.id = diciembre.id;"
end if
end if
if estatusObra="terminadas" then
if query="1" then
sql= "SELECT " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS diciembre ON enero.id = diciembre.id;"
else
sql= "SELECT " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND a.EstatusObra = 3) AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND a.EstatusObra = 3) AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND a.EstatusObra = 3) AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND a.EstatusObra = 3) AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND a.EstatusObra = 3) AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND a.EstatusObra = 3) AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND a.EstatusObra = 3) AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND a.EstatusObra = 3) AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 3) AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND a.EstatusObra = 3) AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND a.EstatusObra = 3) AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND a.EstatusObra = 3) AS diciembre ON enero.id = diciembre.id;"
end if
end if
if estatusObra="enProceso" then
if query="1" then
sql= "SELECT " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS diciembre ON enero.id = diciembre.id;"
else
sql= "SELECT " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND( a.EstatusObra = 1 OR a.EstatusObra = 2)) AS diciembre ON enero.id = diciembre.id;"
end if
end if
if estatusObra="porIniciar" then
if query="1" then
sql= "SELECT " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS diciembre ON enero.id = diciembre.id;"
else
sql= "SELECT " & mes & ".total AS SucMes FROM( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-01-01' AND '" & anio & "-01-31' AND a.EstatusObra = 0) AS enero LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-02-01' AND '" & anio & "-02-28' AND a.EstatusObra = 0) AS febrero ON enero.id = febrero.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-03-01' AND '" & anio & "-03-31' AND a.EstatusObra = 0) AS marzo ON enero.id = marzo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-04-01' AND '" & anio & "-04-30' AND a.EstatusObra = 0) AS abril ON enero.id = abril.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-05-01' AND '" & anio & "-05-31' AND a.EstatusObra = 0) AS mayo ON enero.id = mayo.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-06-01' AND '" & anio & "-06-30' AND a.EstatusObra = 0) AS junio ON enero.id = junio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-07-01' AND '" & anio & "-07-31' AND a.EstatusObra = 0) AS julio ON enero.id = julio.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-08-01' AND '" & anio & "-08-31' AND a.EstatusObra = 0) AS agosto ON enero.id = agosto.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-09-01' AND '" & anio & "-09-30' AND c.Territorial = '" & territorial & "' AND a.EstatusObra = 0) AS septiembre ON enero.id = septiembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-10-01' AND '" & anio & "-10-31' AND a.EstatusObra = 0) AS octubre ON enero.id = octubre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-11-01' AND '" & anio & "-11-30' AND a.EstatusObra = 0) AS noviembre ON enero.id = noviembre.id LEFT JOIN( SELECT '1' AS id, COUNT(*) AS total, c.Territorial FROM tseguimiento a LEFT JOIN app_bnrt_login b ON a.supervisorAsignado = b.login_id LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE FechaInicio BETWEEN '" & anio & "-12-01' AND '" & anio & "-12-31' AND a.EstatusObra = 0) AS diciembre ON enero.id = diciembre.id;"
end if
end if
rs.open sql, conn2
if rs.eof then
numeroSupTerrMesZona="0"
else
numeroSupTerrMesZona=rs("SucMes")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
end function

function calculaSemaforoPorModulo(modulo,cr) 
Set conn999 = Server.CreateObject("ADODB.Connection")
set rs222= Server.CreateObject("adodb.recordset")
set rs2223= Server.CreateObject("adodb.recordset")
Conn999.Open connstr
sql222="select a.id_componente,a.nameBD,b.fecha, case when b.fecha >= CURDATE() then ""tiempo"" when b.fecha < CURDATE() then ""fuera""  when b.fecha is null then ""tiempo"" end as estatusFecha from cat_componentes a left join (select * from cat_llegadamateriales where cr='" & cr & "') b on a.id_componente=b.id_componente where id_modulo='" & modulo & "'"
sql2223="select FechaInicio > CURDATE() as EstatusObra from tseguimiento where cr ='" & cr & "'"
rs222.open sql222,conn999
rs2223.open sql2223,conn999
semaforoEstatus=rs2223("EstatusObra")
rs2223.close

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
		 semaforoTem="verde"
		else
		if rs211("campo")>.5 then
		semaforoTem="verde"
		else
			semaforoTem="rojo"
		end if
		 
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
sql= "select concat(left(fecha,4),'-',riGHT(left(fecha,7),2),'-',RIGHT(FECHA,2)) As fecha from cat_llegadamateriales where id_componente='" & id_componente & "' and cr='" & cr & "'" 
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


Function numeroSucTerrRegional_EstatusZonaEntregadas(territorial,estatus1,estatus2,query,zona)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
if query="1" then 
sql= "SELECT COUNT(a.cr) AS Sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '" & territorial & "' AND( c.id_estatusObra = " & estatus1 & " OR c.id_estatusObra = " & estatus2 & ") and b.zona_territorial=" & zona & " and entregada=1"
else
sql= "SELECT COUNT(a.cr) AS Sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE ( c.id_estatusObra = " & estatus1 & " OR c.id_estatusObra = " & estatus2 & ") and b.zona_territorial=" & zona & " and entregada=1"
end if
rs.open sql, conn2
if rs.eof then
numeroSucTerrRegional_EstatusZonaEntregadas="0"
else
numeroSucTerrRegional_EstatusZonaEntregadas=rs("sucursales")
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

Function numeroSucTerrRegionalZona(territorial,query,estatusObra,zona)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
if estatusObra="autorizadas" then
if query="1" then
sql= "SELECT b.Regional, b.Territorial, COUNT(a.cr) AS sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '"& territorial &"' and b.zona_territorial='" & zona &"' AND a.estatusobra in (0,1,2,3)"
else
sql= "SELECT b.Regional, b.Territorial, COUNT(a.cr) AS sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra where  b.zona_territorial='" & zona &"' AND a.estatusobra in (0,1,2,3)"
end if
end if
if estatusObra="terminadas" then
if query="1" then
sql= "SELECT b.Regional, b.Territorial, COUNT(a.cr) AS sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '"& territorial &"' and a.estatusObra=3 and b.zona_territorial='" & zona &"'"
else
sql= "SELECT b.Regional, b.Territorial, COUNT(a.cr) AS sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra where a.estatusObra=3 and b.zona_territorial='" & zona &"'"
end if
end if
if estatusObra="entregadas" then
if query="1" then
sql= "SELECT b.Regional, b.Territorial, COUNT(a.cr) AS sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '"& territorial &"' and a.estatusObra=3 and b.zona_territorial='" & zona &"' and a.entregada=1"
else
sql= "SELECT b.Regional, b.Territorial, COUNT(a.cr) AS sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra where a.estatusObra=3 and b.zona_territorial='" & zona &"' and a.entregada=1"
end if
end if
if estatusObra="enProceso" then
if query="1" then
sql= "SELECT b.Regional, b.Territorial, COUNT(a.cr) AS sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '"& territorial &"' and (a.estatusObra=1 or a.estatusObra=2) and b.zona_territorial='" & zona &"'"
else
sql= "SELECT b.Regional, b.Territorial, COUNT(a.cr) AS sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra where (a.estatusObra=1 or a.estatusObra=2) and b.zona_territorial='" & zona &"'"
end if
end if
if estatusObra="porIniciar" then
if query="1" then
sql= "SELECT b.Regional, b.Territorial, COUNT(a.cr) AS sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra WHERE b.Territorial = '"& territorial &"' and a.estatusObra=0 and b.zona_territorial='" & zona &"'"
else
sql= "SELECT b.Regional, b.Territorial, COUNT(a.cr) AS sucursales FROM tseguimiento a LEFT JOIN cat_sucursales b ON a.cr = b.cr LEFT JOIN cat_estatusobras c ON a.EstatusObra = c.id_estatusObra where a.estatusObra=0 and b.zona_territorial='" & zona &"'"
end if
end if
rs.open sql, conn2
if rs.eof then
numeroSucTerrRegionalZona="0"
else
'numeroSucTerrRegionalZona=rs("sucursales")
numeroSucTerrRegionalZona=rs("sucursales")
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
if diasTranscurridos>70 then
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
sql= "SELECT  * from app_bnrt_login where login_usuario = '"& usuario &"' and login_pass = '"& pass &"'" 
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
sql= "SELECT  * from app_bnrt_login where login_usuario = '"& usuario &"'" 
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
sql= "select b.login_nombre from tseguimiento a LEFT JOIN app_bnrt_login b on a.supervisorAsignado=b.login_id where cr='"& cr &"'" 
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

function cargaLobbysRAO()
  set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "SELECT a.id_lobby, a.cr, concat('zona ', a.id_zona) AS zona, b.territorial, a.nombre_lobby, CASE WHEN c.login_nombre IS NULL THEN 'no asignado' ELSE c.login_nombre END AS supervisor, CASE WHEN d.contratista IS NULL THEN 'no asignado' ELSE d.contratista END AS contratista, a.fecha_inicio_obra, a.fecha_termino_obra, a.fin_Reprogramado, A.avance_obra, '' AS avance_programado, '' AS desviacion, '' AS obraCivil_avance, '' AS obraCivil_Programado, '' AS obraCivil_desviacion, '' AS obraCivil_estatus, '' AS sistemas_estatus, '' AS seguridad_estatus, '' AS general_estatus, a.hito2_fechaProgramada, a.hito3_fechaProgramada, a.hito4_fechaProgramada, a.hito5_fechaProgramada, a.hito6_fechaProgramada, a.hito7_fechaProgramada, a.hito8_fechaProgramada, a.hito9_fechaProgramada, a.hito10_fechaProgramada, a.hito11_fechaProgramada, a.hito12_fechaProgramada, a.hito13_fechaProgramada, a.hito14_fechaProgramada, a.hito15_fechaProgramada, a.hito16_fechaProgramada, a.hito17_fechaProgramada, a.hito18_fechaProgramada, a.hito19_fechaProgramada, a.hito20_fechaProgramada, a.hito21_fechaProgramada FROM tseguimiento_lobby a LEFT JOIN cat_territoriales b ON a.id_territorio = b.id_territorial LEFT JOIN app_bnrt_login c ON a.id_supervisor = c.login_id LEFT JOIN cat_contratistas d ON a.id_proveedor = d.id_contratista"

regresar=""
rs2.open sql3, conn3
if rs2.eof then
  rs2.close
  conn3.close 
  set rs2=nothing
  set conn3=nothing
  regresar="<tr><td colspan='39'></td></tr>"
else
  while not(rs2.eof)  
    regresar=regresar & "<tr><td><font size='+2'><span class='icon-search'></span></font></td>"
    regresar=regresar & "<td>" & rs2("cr") &"</td>"
    regresar=regresar & "<td>" & rs2("zona") &"</td>"
    regresar=regresar & "<td>" & rs2("territorial") &"</td>"
    regresar=regresar & "<td>" & rs2("supervisor") &"</td>"
    regresar=regresar & "<td>" & rs2("nombre_lobby") &"</td>"
    regresar=regresar & "<td>" & rs2("contratista") &"</td>"
    regresar=regresar & "<td>" & rs2("fecha_inicio_obra") &"</td>"
    regresar=regresar & "<td>" & rs2("fecha_termino_obra") &"</td>"
    regresar=regresar & "<td>" & rs2("fin_Reprogramado") &"</td>"
    regresar=regresar & "<td>" & rs2("avance_obra") &"</td>"
    regresar=regresar & "<td>" & rs2("avance_programado") &"</td>"
    regresar=regresar & "<td>" & rs2("desviacion") &"</td>"
    regresar=regresar & "<td>" & rs2("obraCivil_avance") &"</td>"
    regresar=regresar & "<td>" & rs2("obraCivil_Programado") &"</td>"
    regresar=regresar & "<td>" & rs2("obraCivil_desviacion") &"</td>"
    regresar=regresar & "<td>" & rs2("obraCivil_estatus") &"</td>"
    regresar=regresar & "<td>" & rs2("sistemas_estatus") &"</td>"
    regresar=regresar & "<td>" & rs2("seguridad_estatus") &"</td>"
    regresar=regresar & "<td>" & rs2("general_estatus") &"</td>"
    regresar=regresar & "<td " & valida(rs2("hito2_fechaProgramada")) & ">" & rs2("hito2_fechaProgramada") &"</td>"
    regresar=regresar & "<td " & valida(rs2("hito3_fechaProgramada")) & ">" & rs2("hito3_fechaProgramada") &"</td>"
    regresar=regresar & "<td " & valida(rs2("hito6_fechaProgramada")) & ">" & rs2("hito6_fechaProgramada") &"</td>"
    regresar=regresar & "<td " & valida(rs2("hito7_fechaProgramada")) & ">" & rs2("hito7_fechaProgramada") &"</td>"
    regresar=regresar & "<td " & valida(rs2("hito8_fechaProgramada")) & ">" & rs2("hito8_fechaProgramada") &"</td>"
    regresar=regresar & "<td " & valida(rs2("hito9_fechaProgramada")) & ">" & rs2("hito9_fechaProgramada") &"</td>"
    regresar=regresar & "<td " & valida(rs2("hito13_fechaProgramada")) & ">" & rs2("hito13_fechaProgramada") &"</td>"
    regresar=regresar & "<td " & valida(rs2("hito4_fechaProgramada")) & ">" & rs2("hito4_fechaProgramada") &"</td>"
    regresar=regresar & "<td " & valida(rs2("hito17_fechaProgramada")) & ">" & rs2("hito17_fechaProgramada") &"</td>"
    regresar=regresar & "<td " & valida(rs2("hito18_fechaProgramada")) & ">" & rs2("hito18_fechaProgramada") &"</td>"
    regresar=regresar & "<td " & valida(rs2("hito19_fechaProgramada")) & ">" & rs2("hito19_fechaProgramada") &"</td>"
    regresar=regresar & "<td " & valida(rs2("hito5_fechaProgramada")) & ">" & rs2("hito5_fechaProgramada") &"</td>"
    regresar=regresar & "<td " & valida(rs2("hito11_fechaProgramada")) & ">" & rs2("hito11_fechaProgramada") &"</td>"
    regresar=regresar & "<td " & valida(rs2("hito10_fechaProgramada")) & ">" & rs2("hito10_fechaProgramada") &"</td>"
    regresar=regresar & "<td " & valida(rs2("hito14_fechaProgramada")) & ">" & rs2("hito14_fechaProgramada") &"</td>"
    regresar=regresar & "<td " & valida(rs2("hito15_fechaProgramada")) & ">" & rs2("hito15_fechaProgramada") &"</td>"
    regresar=regresar & "<td " & valida(rs2("hito16_fechaProgramada")) & ">" & rs2("hito16_fechaProgramada") &"</td>"

    regresar=regresar & "<td " & valida(rs2("hito21_fechaProgramada")) & ">" & rs2("hito21_fechaProgramada") &"</td></tr>"
  rs2.movenext
  wend  
  rs2.close
  conn3.close 
  set rs2=nothing
  set conn3=nothing
  end if
  cargaLobbysRAO=regresar
end function

Function valida(fecha)
if IsNull(fecha) then
  valida=""
else
  if now > cdate(fecha) then
    valida="id='celdaVencido'"
  end if
  if now < cdate(fecha) then
    valida="id='celdaEnTiempo'"
  end if
end if

end function

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

Function buscaSupervisorId_lobby(cr)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select id_supervisor from tseguimiento_lobby  where cr='"& cr &"'" 
rs.open sql, conn2
if rs.eof then
buscaSupervisorId_lobby="."
else
buscaSupervisorId_lobby=rs("id_supervisor")
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
sql= "select b.login_nombre from tseguimiento a LEFT JOIN app_bnrt_login b on a.contratistaAsignado=b.login_contratista where cr='"& cr &"'" 
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
sql= "select perfil from cat_perfil a LEFT JOIN app_bnrt_login b on a.ID_PERFIL=b.login_privilegio where b.login_usuario='" & usuario & "'" 
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
sql= "insert into app_bnrt_log(usuario,evento,registroAfectado,ip_address) values ('" & vusuario & "', ' " & vevento & " ', '" & vregistroAfectado & "' , '" & ip & "')" 
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