<!--#include file="funcion/funcion.inc"-->

<%
	if isempty(session("cr")) then
		session.Abandon()
		response.Redirect("/bnrt/")
	end if
response.expires=-1

sap=request("id")
cr=session.contents("cr")
'id_modulo="1"
'id_contratista="1"
porcentajeDeExceso=0
fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time

Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr

set rs2=server.CreateObject("adodb.recordset")
sql5="SELECT CASE WHEN estatusEstimacion1 IS NULL THEN 0 ELSE estatusEstimacion1 END + CASE WHEN estatusEstimacion2 IS NULL THEN 0 ELSE estatusEstimacion2 END + CASE WHEN estatusEstimacion3 IS NULL THEN 0 ELSE estatusEstimacion3 END + CASE WHEN estatusEstimacion4 IS NULL THEN 0 ELSE estatusEstimacion4 END AS estimacion FROM ctrl_estimaciones WHERE CR ='" & cr & "'"
rs2.open sql5, conn
if rs2.eof then
	sql="INSERT INTO ctrl_estimaciones (cr,estatusEstimacion1) VALUES ('" & CR & "',1)"
	conn.execute sql
end if
rs2.close
set rs2=nothing
set rs2=server.CreateObject("adodb.recordset")
sql5="SELECT min, max FROM( SELECT CASE WHEN estatusEstimacion1 IS NULL THEN 0 ELSE estatusEstimacion1 END + CASE WHEN estatusEstimacion2 IS NULL THEN 0 ELSE estatusEstimacion2 END + CASE WHEN estatusEstimacion3 IS NULL THEN 0 ELSE estatusEstimacion3 END + CASE WHEN estatusEstimacion4 IS NULL THEN 0 ELSE estatusEstimacion4 END AS estimacion FROM ctrl_estimaciones WHERE CR ='" & cr & "') a LEFT JOIN cat_toleranciaestimacionobra b ON a.estimacion = b.estimacion"
rs2.open sql5, conn
min=rs2("min")
max=rs2("max")
rs2.close
set rs2=nothing
	

set rs2=server.CreateObject("adodb.recordset")
sql5="select * from nuevoCosto_estimadoObra where id='" & sap & "' and cr='" & cr & "'"
rs2.open sql5, conn
cantidadMax=rs2("cantidad")
avanceMax=rs2("avance")
rs2.close
set rs2=nothing

if cantidadMax<= avanceMax then 
	
	response.write("noClose")
else

'********** hacemos un BEGIN para poder realizar posteriormente un commit o un rollback
	sql="begin"
	conn.execute sql
	
sql="update nuevoCosto_estimadoObra set avanceCompletado='1' where id='" & sap & "' and cr='" & session("cr") & "'"
'ejecutamos la consulta
conn.execute sql

'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn.close 
	set conn=nothing
 	response.write("err1")
else
	sql2="insert into nuevoCosto_estimadoObra_log (cr,componente,clave_sap_concurso) values ('" & cr & "','UPDATE/Cierra Concepto','" & sap & "')"
'ejecutamos la consulta
	conn.execute sql2

	set rs=server.CreateObject("adodb.recordset")
'sql5="SELECT *, sum(a.precio) AS totalPartida, sum(a.porAvancePesos) AS totalAvancePartidaPesos, Round(((sum(a.porAvancePesos) * 100) / sum(a.precio)), 2) AS porTotalAvancePartidaPesos FROM( SELECT *, CANTIDAD * PU AS PRECIO, ROUND((CANTIDAD * PU) *(PORAVANCE / 100), 2) AS porAvancePesos FROM( SELECT * FROM( SELECT a.id, a.CLAVE_SAP_CONCURSO, a.clave_sap_zona, b.DESCRIPCION_CORTA, b.descripcion_larga, a.pu, a.cantidad, b.UND, a.componente, concat( LEFT(a.fecha_ingreso, 4), '-', RIGHT(LEFT(a.fecha_ingreso, 7), 2), '-', RIGHT(LEFT(a.fecha_ingreso, 10), 2), ' ', RIGHT(a.fecha_ingreso, 8)) AS fecha_ingreso, CASE WHEN a.avance IS NULL THEN 0 ELSE a.avance END AS avance, CASE WHEN a.avance >= 0 THEN round((a.avance * 100) / a.cantidad, 2) ELSE 0 END AS porAvance FROM nuevoCosto_estimadoObra a LEFT JOIN cat_sap_2017 b ON a.CLAVE_SAP_CONCURSO = b.CLAVE_SAP_CONCURSO WHERE cr = '" & cr & "' AND a.componente NOT LIKE 'otros') AS a UNION( SELECT id, clave_sap_concurso, clave_sap_zona, descorta AS descripcion_corta, deslarga AS descripcion_larga, pu, cantidad, und, componente, fecha_ingreso, CASE WHEN avance IS NULL THEN 0 ELSE avance END AS avance, CASE WHEN avance >= 0 THEN(avance * 100) / cantidad ELSE 0 END AS porAvance FROM nuevocosto_estimadoobra WHERE cr = '" & cr & "' AND componente LIKE 'Otros') ORDER BY fecha_ingreso DESC) a GROUP BY id) a"
	'sql5="select case when porTotalAvanceSuc is null then 0 else porTotalAvanceSuc end as porTotalAvanceSuc, case when porTotalExcesoSuc is null then 0 else porTotalExcesoSuc end as porTotalExcesoSuc from  (select *, Round((TotalAvanceSuc * 100) / TotalSuc,3) as porTotalAvanceSuc,  (TotalExcesoSuc * 100) / TotalSuc  as porTotalExcesoSuc from (select cr, Round(Sum(subTotalSuc),2) as TotalSuc,Round(Sum(subTotalAvanceSuc),2) as TotalAvanceSuc,Round(Sum(subTotalExcesoSuc),2) as TotalExcesoSuc  from (select *, (cantidad * pu) as subTotalSuc,((avance-exceso)* pu) as subTotalAvanceSuc,exceso* pu as subTotalExcesoSuc from (select cr, case when avanceCompletado=1 then round(CASE WHEN avance IS NULL THEN	0	ELSE avance	END,2) else round(cantidad,2) end as cantidad, pu,round(case when avance is null then 0 else avance end,2) as avance,CASE WHEN avance IS NULL THEN 0 WHEN avance > cantidad THEN avance - cantidad WHEN avance <= cantidad THEN 0 END AS exceso from nuevocosto_estimadoobra where cr='" & cr &"')a)b)c)d"
	'sql5="SELECT CASE WHEN porTotalAvanceSuc IS NULL THEN 0 ELSE porTotalAvanceSuc END AS porTotalAvanceSuc, CASE WHEN porTotalExcesoSuc IS NULL THEN 0 ELSE porTotalExcesoSuc END AS porTotalExcesoSuc FROM( SELECT *, Round((TotalAvanceSuc * 100) / TotalSuc2, 3) AS porTotalAvanceSuc,(TotalExcesoSuc * 100) / TotalSuc AS porTotalExcesoSuc FROM( SELECT cr, Round(Sum(subTotalSuc), 2) AS TotalSuc, Round(Sum(subTotalSuc2), 2) AS TotalSuc2, Round(Sum(subTotalAvanceSuc), 2) AS TotalAvanceSuc, Round(Sum(subTotalExcesoSuc), 2) AS TotalExcesoSuc FROM( SELECT *,(cantidad * pu) AS subTotalSuc,(cantidad2 * pu) AS subTotalSuc2,((avance - exceso) * pu) AS subTotalAvanceSuc, exceso * pu AS subTotalExcesoSuc FROM( SELECT cr, cantidad, CASE WHEN avanceCompletado = 1 THEN round( CASE WHEN avance IS NULL THEN 0 ELSE avance END, 2) ELSE round(cantidad, 2) END AS cantidad2, pu, round( CASE WHEN avance IS NULL THEN 0 ELSE avance END, 2) AS avance, CASE WHEN avance IS NULL THEN 0 WHEN avance > cantidad THEN avance - cantidad WHEN avance <= cantidad THEN 0 END AS exceso FROM nuevocosto_estimadoobra WHERE cr = '" & cr &"') a) b) c) d;"
	'sql5="select case when porTotalExcesoSuc is null then 0 else porTotalExcesoSuc end as porTotalExcesoSuc from (select *, (TotalAvanceSuc * 100) / TotalSuc as porTotalAvanceSuc,  Round((TotalExcesoSuc * 100) / TotalSuc,3)  as porTotalExcesoSuc from (select cr, Round(Sum(subTotalSuc),2) as TotalSuc,Round(Sum(subTotalAvanceSuc),2) as TotalAvanceSuc,Round(Sum(subTotalExcesoSuc),2) as TotalExcesoSuc  from (select *, (cantidad * pu) as subTotalSuc,((avance-exceso)* pu) as subTotalAvanceSuc,exceso* pu as subTotalExcesoSuc from (select cr, cantidad, pu,round(case when avance is null then 0 else avance end,2) as avance,CASE WHEN avance IS NULL THEN 0 WHEN avance > cantidad THEN avance - cantidad WHEN avance <= cantidad THEN 0 END AS exceso from nuevocosto_estimadoobra where cr='" & cr &"')a)b)c)d"
	sql5="SELECT CASE WHEN porTotalAvanceSuc IS NULL THEN 0 ELSE porTotalAvanceSuc END AS porTotalAvanceSuc, CASE WHEN porTotalExcesoSuc IS NULL THEN 0 ELSE porTotalExcesoSuc END AS porTotalExcesoSuc, porTotalExcesoPermitido FROM( SELECT *, Round((TotalAvanceSuc * 100) / TotalSuc2, 3) AS porTotalAvanceSuc,(TotalExcesoSuc * 100) / TotalSuc AS porTotalExcesoSuc,(TotalSucParaExceso * 100) / TotalSuc AS porTotalExcesoPermitido FROM( SELECT cr, Round(( Sum(subTotalSuc) - Sum(subTotalSuc2) + (Sum(subTotalSuc)*.1)), 2) AS TotalSucParaExceso, Round(Sum(subTotalSuc), 2) AS TotalSuc, Round(Sum(subTotalSuc2), 2) AS TotalSuc2, Round(Sum(subTotalAvanceSuc), 2) AS TotalAvanceSuc, Round(Sum(subTotalExcesoSuc), 2) AS TotalExcesoSuc FROM( SELECT *,(cantidad * pu) AS subTotalSuc,(cantidad2 * pu) AS subTotalSuc2,((avance - exceso) * pu) AS subTotalAvanceSuc, exceso * pu AS subTotalExcesoSuc FROM( SELECT cr, cantidad, CASE WHEN avanceCompletado = 1 THEN round( CASE WHEN avance IS NULL THEN 0 ELSE avance END, 2) ELSE round(cantidad, 2) END AS cantidad2, pu, round( CASE WHEN avance IS NULL THEN 0 ELSE avance END, 2) AS avance, CASE WHEN avance IS NULL THEN 0 WHEN avance > cantidad THEN avance - cantidad WHEN avance <= cantidad THEN 0 END AS exceso FROM nuevocosto_estimadoobra WHERE cr = '" & cr & "') a) b) c) d;"
	rs.open sql5, conn
	if rs.eof then
		porcentaje=0
	else
		porcentaje=rs("porTotalAvanceSuc")
		porcentajeDeExceso=rs("porTotalExcesoSuc")
		porcentajeDeExcesoPermitido=rs("porTotalExcesoPermitido")
	end if
	rs.close
	set rs=nothing
end if

if porcentaje>max then
	sql="rollback;"
	conn.execute sql
	conn.close 
	set conn=nothing
	response.write("max")
	
else
	'if porcentajeDeExceso<=9.999 then
	if porcentajeDeExceso<=porcentajeDeExcesoPermitido then	
		if porcentaje <min then
			sql="commit;"
			conn.execute sql
	
			set rs12= Server.CreateObject("adodb.recordset")
			sql12= "select * from tseguimiento where cr='" & cr & "'"
			rs12.open sql12,conn
			if not(rs12.eof) then
				while not(rs12.eof)
					if (cDbl(calculaAvanceProyectado7030(rs12("cr"),rs12("fechaInicio")))>cDbl(calculaAvanceGeneral(rs12("cr"),"G"))) then
						sql13="update tseguimiento set EstatusObra=2 , fUltimoReporte ='"  &  Year(Now) & "-" & LPad(Month(Now),2,"0")  & "-" & LPad(Day(Now),2,"0") & "' where cr='" & rs12("cr") & "'"
						conn.execute sql13
						sql13="update tseguimiento set avanceProyectado=" & cDbl(calculaAvanceProyectado7030(rs12("cr"),rs12("fechaInicio"))) & " where cr='" & rs12("cr") & "'"
						conn.execute sql13
					else
						if (cDbl(calculaAvanceProyectado7030(rs12("cr"),rs12("fechaInicio")))<cDbl(calculaAvanceGeneral(rs12("cr"),"G"))) then
							sql13="update tseguimiento set EstatusObra=1 , fUltimoReporte ='" & LPad(Day(Now),2,"0") & "/" & LPad(Month(Now),2,"0") & "/" &   Year(Now) & "' where cr='" & rs12("cr") & "'"
							conn.execute sql13
							sql13="update tseguimiento set avanceProyectado=" & cDbl(calculaAvanceProyectado7030(rs12("cr"),rs12("fechaInicio"))) & " where cr='" & rs12("cr") & "'"
							conn.execute sql13
						else	
							sql13="update tseguimiento set EstatusObra=3 , fUltimoReporte ='" & LPad(Day(Now),2,"0") & "/" & LPad(Month(Now),2,"0") & "/" &   Year(Now) & "',fecha_finReal ='" & LPad(Day(Now),2,"0") & "/" & LPad(Month(Now),2,"0") & "/" &   Year(Now) & "' where cr='" & rs12("cr") & "'"
							conn.execute sql13
							sql13="update tseguimiento set avanceProyectado=" & cDbl(calculaAvanceProyectado7030(rs12("cr"),rs12("fechaInicio"))) & " where cr='" & rs12("cr") & "'"
							conn.execute sql13
						end if			
					end if
					rs12.movenext
				wend  		
			end if
			rs12.close
	
	'set rs12= Server.CreateObject("adodb.recordset")
	'sql12= "select * from tseguimiento "
	'rs12.open sql12,conn
	'if rs12.eof then
	'else
	'while not(rs12.eof)
		
	'		sql13="update tseguimiento set avanceProyectado=" & cDbl(calculaAvanceProyectado7030(rs12("cr"),rs12("fechaInicio"))) & " where cr='" & rs12("cr") & "'"
	'		conn.execute sql13
		
	'rs12.movenext
	'wend  
		
	'end if
	'rs12.close
	
			conn.close 
			set conn=nothing
			response.write("ok")
		else
			sql="commit;"
			conn.execute sql
	
			set rs12= Server.CreateObject("adodb.recordset")
			sql12= "select * from tseguimiento where cr='" & cr & "'"
			rs12.open sql12,conn
			if not(rs12.eof) then
				if (cDbl(calculaAvanceProyectado7030(cr,rs12("fechaInicio")))>cDbl(calculaAvanceGeneral(cr,"G"))) then
					sql13="update tseguimiento set EstatusObra=2 , fUltimoReporte ='"  &  Year(Now) & "-" & LPad(Month(Now),2,"0")  & "-" & LPad(Day(Now),2,"0") & "' where cr='" & cr & "'"
					conn.execute sql13
				else
					if (cDbl(calculaAvanceProyectado7030(cr,rs12("fechaInicio")))<cDbl(calculaAvanceGeneral(cr,"G"))) then
						sql13="update tseguimiento set EstatusObra=1 , fUltimoReporte ='" & LPad(Day(Now),2,"0") & "/" & LPad(Month(Now),2,"0") & "/" &   Year(Now) & "' where cr='" & cr & "'"
						conn.execute sql13
					else
						sql13="update tseguimiento set EstatusObra=3 , fUltimoReporte ='" & LPad(Day(Now),2,"0") & "/" & LPad(Month(Now),2,"0") & "/" &   Year(Now) & "',fecha_finReal='" & LPad(Day(Now),2,"0") & "/" & LPad(Month(Now),2,"0") & "/" &   Year(Now) & "' where cr='" & cr & "'"
						conn.execute sql13
					end if			
				end if
			end if
			rs12.close	
			conn.close 
			set conn=nothing
			response.write("okE") 
		end if
	else
		sql="rollback;"
		conn.execute sql
		conn.close 
		set conn=nothing
		response.write("maxEx")
	end if
end if

end if
'+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
'sap=request("id")
'pendiente="dedede"
'id_modulo="1"
'id_contratista="1"

'Set conn = Server.CreateObject("ADODB.Connection")
'Conn.Open connstr
	
'sql="update nuevoCosto_estimadoObra set avanceCompletado='1' where id='" & sap & "' and cr='" & session("cr") & "'"

'ejecutamos la consulta
'conn.execute sql

'validamos si la insercion fue satisfactoria y damos respuesta
'if err<>0 then
'	conn.close 
'	set conn=nothing
' 	response.write("err1")
'else
'sql2="insert into nuevoCosto_estimadoObra_log (cr,componente,clave_sap_concurso) values ('" & session("cr") & "','UPDATE/Cierra Concepto','" & sap & "')"
'ejecutamos la consulta

'conn.execute sql2
'	conn.close 
'	set conn=nothing
'	response.write("ok")
'end if
	
%>

