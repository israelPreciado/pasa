<!--#include file="funcion/funcion.inc"-->
<%if isempty(session("cr")) then
response.Redirect("default.asp?logout=true")
end if%>
<%
response.expires=-1
cr=session.contents("cr")
para=request("para")
cc=request("cc")
est=request("estimacion")
Set conn12 = Server.CreateObject("ADODB.Connection")
Conn12.Open connstr

if est="SE" then
est=0
end if 
'seleccionamos la consulta segun el parametro de entrada
	
regresar=""
sql="begin"
	conn12.execute sql
	
fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
sql12=" INSERT INTO estimacion"& cint(est)+1 &" SELECT a.clave_sap_concurso, a.descripcion_corta, a.und, a.cantidad, a.pu, a.total, a.avance, a.cantAcum, a.clave_sap_zona, a.cr, b.pedimento, NOW(), '' FROM( SELECT clave_sap_concurso, descripcion_corta, und, cantidad, pu, round(cantidad * pu, 2) AS total, avance, avance AS cantAcum, a.id, a.clave_sap_zona, cr FROM( SELECT * FROM( SELECT a.cr, a.id, a.CLAVE_SAP_CONCURSO, a.clave_sap_zona, b.DESCRIPCION_CORTA, b.descripcion_larga, a.pu, a.cantidad, b.UND, a.componente, concat( LEFT(a.fecha_ingreso, 4), '-', RIGHT(LEFT(a.fecha_ingreso, 7), 2), '-', RIGHT(LEFT(a.fecha_ingreso, 10), 2), ' ', RIGHT(a.fecha_ingreso, 8)) AS fecha_ingreso, a.avance, CASE WHEN a.avance >= 0 THEN round((a.avance * 100) / a.cantidad, 2) ELSE 0 END AS porAvance, a.avanceContratista FROM nuevoCosto_estimadoObra a LEFT JOIN cat_sap_2017 b ON a.CLAVE_SAP_CONCURSO = b.CLAVE_SAP_CONCURSO WHERE cr = '" & cr &"' AND a.componente NOT LIKE 'otros' AND a.componente NOT LIKE 'atms') AS a UNION SELECT * FROM( SELECT a.cr, a.id, a.CLAVE_SAP_CONCURSO, a.clave_sap_zona, b.DESCRIPCION_CORTA, b.descripcion_larga, a.pu, a.cantidad, b.UND, a.componente, concat( LEFT(a.fecha_ingreso, 4), '-', RIGHT(LEFT(a.fecha_ingreso, 7), 2), '-', RIGHT(LEFT(a.fecha_ingreso, 10), 2), ' ', RIGHT(a.fecha_ingreso, 8)) AS fecha_ingreso, a.avance, CASE WHEN a.avance >= 0 THEN round((a.avance * 100) / a.cantidad, 2) ELSE 0 END AS porAvance, a.avanceContratista FROM nuevoCosto_estimadoObra a LEFT JOIN cat_sap_atms_2017 b ON a.CLAVE_SAP_CONCURSO = b.CLAVE_SAP_CONCURSO WHERE cr = '" & cr & "' AND a.componente NOT LIKE 'otros' AND a.componente LIKE 'atms') AS b UNION( SELECT cr, id, clave_sap_concurso, clave_sap_zona, descorta AS descripcion_corta, deslarga AS descripcion_larga, pu, cantidad, und, componente, fecha_ingreso, avance, avanceContratista, CASE WHEN avance >= 0 THEN(avance * 100) / cantidad ELSE 0 END AS porAvance FROM nuevocosto_estimadoobra WHERE cr = '" & cr & "' AND componente LIKE 'Otros') ORDER BY fecha_ingreso DESC) a WHERE avance > 0) a LEFT JOIN cat_pedimentos b ON a.cr = b.cr"
'sql12="update tseguimiento set estatusObra='" & estatus & "', comentarioEstatus='" & comentario & "' where cr='"& cr &"';"

'ejecutamos la consulta
conn12.execute sql12

sql13="update ctrl_estimaciones set estatusEstimacion" & cint(est)+2 & "='1', fechaEstimacion" & cint(est)+1 & "='" &fecha &"' where cr='"& cr &"';"
conn12.execute sql13

sql13="insert into ctrl_envioEstimaciones (cr,para,cc,cco,estado,estimacion) values ('"& cr &"','" & para & "','" & cc & "','marcoantonionegreteflores@gmail.com',1,"& cint(est)+1 &")"
conn12.execute sql13

if cint(est)+1=2 then 
sql13="UPDATE estimacion2 a LEFT JOIN( SELECT cr, clave_sap_zona, avance_e2 - avance_e1 AS avance FROM( SELECT a.cr, a.clave_sap_zona, ifnull(b.avance,0) as avance_e1, a.avance AS avance_e2 FROM estimacion2 a LEFT JOIN estimacion1 B ON concat( a.cr, case when a.clave_sap_concurso is null then '00000000' else a.clave_sap_concurso end, case when a.clave_sap_zona is null then '00000000' else a.clave_sap_zona end, a.descripcion_corta, a.und) = concat( b.cr, case when b.clave_sap_concurso is null then '00000000' else b.clave_sap_concurso end, case when b.clave_sap_zona is null then '00000000' else b.clave_sap_zona end, b.descripcion_corta, b.und) WHERE A.cr = '" & cr & "') a) b ON a.clave_sap_zona = b.clave_sap_zona SET a.avance = b.avance WHERE a.cr = '" & cr & "';"
'sql13="UPDATE estimacion2 a LEFT JOIN( SELECT cr, clave_sap_zona, avance_e2 - avance_e1 AS avance FROM( SELECT a.cr, a.clave_sap_zona, CASE WHEN b.avance IS NULL THEN 0 ELSE b.avance END AS avance_e1, a.avance AS avance_e2 FROM estimacion2 a LEFT JOIN estimacion1 B ON a.clave_sap_zona = b.clave_sap_zona WHERE A.cr = '" & cr & "') a) b ON a.clave_sap_zona = b.clave_sap_zona SET a.avance = b.avance WHERE a.cr = '" & cr & "';"
conn12.execute sql13
sql13="UPDATE estimacion2 a LEFT JOIN( SELECT cr, clave_sap_zona, avance_e2 + avance_e1 AS cantAcum FROM( SELECT a.cr, a.clave_sap_zona, ifnull(b.avance,0) AS avance_e1, a.avance AS avance_e2 FROM estimacion2 a LEFT JOIN estimacion1 B ON concat( a.cr, case when a.clave_sap_concurso is null then '00000000' else a.clave_sap_concurso end, case when a.clave_sap_zona is null then '00000000' else a.clave_sap_zona end, a.descripcion_corta, a.und) = concat( b.cr, case when b.clave_sap_concurso is null then '00000000' else b.clave_sap_concurso end, case when b.clave_sap_zona is null then '00000000' else b.clave_sap_zona end, b.descripcion_corta, b.und) WHERE A.cr = '" & cr & "') a) b ON a.clave_sap_zona = b.clave_sap_zona SET a.cantAcum = b.cantAcum WHERE a.cr = '" & cr & "';"
'sql13="UPDATE estimacion2 a LEFT JOIN( SELECT cr, clave_sap_zona, avance_e2 + avance_e1 AS cantAcum FROM( SELECT a.cr, a.clave_sap_zona, CASE WHEN b.avance IS NULL THEN 0 ELSE b.avance END AS avance_e1, a.avance AS avance_e2 FROM estimacion2 a LEFT JOIN estimacion1 B ON a.clave_sap_zona = b.clave_sap_zona WHERE A.cr = '" & cr & "') a) b ON a.clave_sap_zona = b.clave_sap_zona SET a.cantAcum = b.cantAcum WHERE a.cr = '" & cr & "';"
conn12.execute sql13
sql13="DELETE FROM estimacion2 WHERE avance <= 0 or avance is null;"
conn12.execute sql13
end if
if cint(est)+1=3 then 
sql13="UPDATE estimacion3 a LEFT JOIN( SELECT cr, clave_sap_zona, avance_e3 - avance_e2 - avance_e1 AS avance FROM( SELECT a.cr, a.clave_sap_zona, a.avance AS avance_e3, ifnull(b.avance,0) AS avance_e2,ifnull(c.avance,0) AS avance_e1 FROM estimacion3 a LEFT JOIN estimacion2 b ON concat( a.cr, case when a.clave_sap_concurso is null then '00000000' else a.clave_sap_concurso end, case when a.clave_sap_zona is null then '00000000' else a.clave_sap_zona end, a.descripcion_corta, a.und) = concat( b.cr, case when b.clave_sap_concurso is null then '00000000' else b.clave_sap_concurso end, case when b.clave_sap_zona is null then '00000000' else b.clave_sap_zona end, b.descripcion_corta, b.und) LEFT JOIN estimacion1 c ON concat( a.cr, case when a.clave_sap_concurso is null then '00000000' else a.clave_sap_concurso end, case when a.clave_sap_zona is null then '00000000' else a.clave_sap_zona end, a.descripcion_corta, a.und) = concat( c.cr, case when c.clave_sap_concurso is null then '00000000' else c.clave_sap_concurso end, case when c.clave_sap_zona is null then '00000000' else c.clave_sap_zona end, c.descripcion_corta, c.und) WHERE a.cr = '" & cr & "') a) b ON a.clave_sap_zona = b.clave_sap_zona SET a.avance = b.avance WHERE a.cr = '" & cr & "';"
conn12.execute sql13
sql13="UPDATE estimacion3 a LEFT JOIN( SELECT cr, clave_sap_zona, avance_e3 + avance_e2 + avance_e1 AS cantAcum FROM( SELECT a.cr, a.clave_sap_zona, a.avance AS avance_e3, ifnull(b.avance,0) AS avance_e2,ifnull(c.avance,0) AS avance_e1 FROM estimacion3 a LEFT JOIN estimacion2 b ON concat( a.cr, case when a.clave_sap_concurso is null then '00000000' else a.clave_sap_concurso end, case when a.clave_sap_zona is null then '00000000' else a.clave_sap_zona end, a.descripcion_corta, a.und) = concat( b.cr, case when b.clave_sap_concurso is null then '00000000' else b.clave_sap_concurso end, case when b.clave_sap_zona is null then '00000000' else b.clave_sap_zona end, b.descripcion_corta, b.und) LEFT JOIN estimacion1 c ON concat( a.cr, case when a.clave_sap_concurso is null then '00000000' else a.clave_sap_concurso end, case when a.clave_sap_zona is null then '00000000' else a.clave_sap_zona end, a.descripcion_corta, a.und) = concat( c.cr, case when c.clave_sap_concurso is null then '00000000' else c.clave_sap_concurso end, case when c.clave_sap_zona is null then '00000000' else c.clave_sap_zona end, c.descripcion_corta, c.und) WHERE a.cr = '" & cr & "') a) b ON a.clave_sap_zona = b.clave_sap_zona SET a.cantAcum = b.cantAcum WHERE a.cr = '" & cr & "';"
'sql13="UPDATE estimacion3 a LEFT JOIN( SELECT cr, clave_sap_zona, avance_e3 + avance_e2 + avance_e1 AS cantAcum FROM( SELECT a.cr, a.clave_sap_zona, a.avance AS avance_e3, CASE WHEN b.avance IS NULL THEN 0 ELSE b.avance END AS avance_e2, CASE WHEN c.avance IS NULL THEN 0 ELSE c.avance END AS avance_e1 FROM estimacion3 a LEFT JOIN estimacion2 b ON a.clave_sap_concurso = b.clave_sap_concurso LEFT JOIN estimacion1 c ON a.clave_sap_concurso = c.clave_sap_concurso where a.cr='" & cr & "') a) b ON a.clave_sap_zona = b.clave_sap_zona SET a.cantAcum = b.cantAcum WHERE a.cr = '" & cr & "';"
conn12.execute sql13
sql13="DELETE FROM estimacion3 WHERE avance <= 0 or avance is null;"
conn12.execute sql13
end if
if cint(est)+1=4 then  
sql13="UPDATE estimacion4 a LEFT JOIN( SELECT cr, clave_sap_zona, avance_e4 - avance_e3 - avance_e2 - avance_e1 AS avance FROM( SELECT a.cr, a.clave_sap_zona, a.avance AS avance_e4, ifnull(d.avance, 0) AS avance_e3, ifnull(b.avance, 0) AS avance_e2, ifnull(c.avance, 0) AS avance_e1 FROM estimacion4 a LEFT JOIN estimacion3 d ON concat( a.cr, CASE WHEN a.clave_sap_concurso IS NULL THEN '00000000' ELSE a.clave_sap_concurso END, CASE WHEN a.clave_sap_zona IS NULL THEN '00000000' ELSE a.clave_sap_zona END, a.descripcion_corta, a.und) = concat( d.cr, CASE WHEN d.clave_sap_concurso IS NULL THEN '00000000' ELSE d.clave_sap_concurso END, CASE WHEN d.clave_sap_zona IS NULL THEN '00000000' ELSE d.clave_sap_zona END, d.descripcion_corta, d.und) LEFT JOIN estimacion2 b ON concat( a.cr, CASE WHEN a.clave_sap_concurso IS NULL THEN '00000000' ELSE a.clave_sap_concurso END, CASE WHEN a.clave_sap_zona IS NULL THEN '00000000' ELSE a.clave_sap_zona END, a.descripcion_corta, a.und) = concat( b.cr, CASE WHEN b.clave_sap_concurso IS NULL THEN '00000000' ELSE b.clave_sap_concurso END, CASE WHEN b.clave_sap_zona IS NULL THEN '00000000' ELSE b.clave_sap_zona END, b.descripcion_corta, b.und) LEFT JOIN estimacion1 c ON concat( a.cr, CASE WHEN a.clave_sap_concurso IS NULL THEN '00000000' ELSE a.clave_sap_concurso END, CASE WHEN a.clave_sap_zona IS NULL THEN '00000000' ELSE a.clave_sap_zona END, a.descripcion_corta, a.und) = concat( c.cr, CASE WHEN c.clave_sap_concurso IS NULL THEN '00000000' ELSE c.clave_sap_concurso END, CASE WHEN c.clave_sap_zona IS NULL THEN '00000000' ELSE c.clave_sap_zona END, c.descripcion_corta, c.und) WHERE a.cr = '" & cr & "') a) b ON a.clave_sap_zona = b.clave_sap_zona SET a.avance = b.avance WHERE a.cr = '" & cr & "';"
conn12.execute sql13
sql13="UPDATE estimacion4 a LEFT JOIN( SELECT cr, clave_sap_zona, avance_e4 + avance_e3 + avance_e2 + avance_e1 AS cantAcum FROM(SELECT a.cr, a.clave_sap_zona, a.avance AS avance_e4, ifnull(d.avance, 0) AS avance_e3, ifnull(b.avance, 0) AS avance_e2, ifnull(c.avance, 0) AS avance_e1 FROM estimacion4 a LEFT JOIN estimacion3 d ON concat( a.cr, CASE WHEN a.clave_sap_concurso IS NULL THEN '00000000' ELSE a.clave_sap_concurso END, CASE WHEN a.clave_sap_zona IS NULL THEN '00000000' ELSE a.clave_sap_zona END, a.descripcion_corta, a.und) = concat( d.cr, CASE WHEN d.clave_sap_concurso IS NULL THEN '00000000' ELSE d.clave_sap_concurso END, CASE WHEN d.clave_sap_zona IS NULL THEN '00000000' ELSE d.clave_sap_zona END, d.descripcion_corta, d.und) LEFT JOIN estimacion2 b ON concat( a.cr, CASE WHEN a.clave_sap_concurso IS NULL THEN '00000000' ELSE a.clave_sap_concurso END, CASE WHEN a.clave_sap_zona IS NULL THEN '00000000' ELSE a.clave_sap_zona END, a.descripcion_corta, a.und) = concat( b.cr, CASE WHEN b.clave_sap_concurso IS NULL THEN '00000000' ELSE b.clave_sap_concurso END, CASE WHEN b.clave_sap_zona IS NULL THEN '00000000' ELSE b.clave_sap_zona END, b.descripcion_corta, b.und) LEFT JOIN estimacion1 c ON concat( a.cr, CASE WHEN a.clave_sap_concurso IS NULL THEN '00000000' ELSE a.clave_sap_concurso END, CASE WHEN a.clave_sap_zona IS NULL THEN '00000000' ELSE a.clave_sap_zona END, a.descripcion_corta, a.und) = concat( c.cr, CASE WHEN c.clave_sap_concurso IS NULL THEN '00000000' ELSE c.clave_sap_concurso END, CASE WHEN c.clave_sap_zona IS NULL THEN '00000000' ELSE c.clave_sap_zona END, c.descripcion_corta, c.und) WHERE a.cr = '" & cr & "') a) b ON a.clave_sap_zona = b.clave_sap_zona SET a.cantAcum = b.cantAcum WHERE a.cr = '" & cr & "';"
'sql13="UPDATE estimacion3 a LEFT JOIN( SELECT cr, clave_sap_zona, avance_e3 + avance_e2 + avance_e1 AS cantAcum FROM( SELECT a.cr, a.clave_sap_zona, a.avance AS avance_e3, CASE WHEN b.avance IS NULL THEN 0 ELSE b.avance END AS avance_e2, CASE WHEN c.avance IS NULL THEN 0 ELSE c.avance END AS avance_e1 FROM estimacion3 a LEFT JOIN estimacion2 b ON a.clave_sap_concurso = b.clave_sap_concurso LEFT JOIN estimacion1 c ON a.clave_sap_concurso = c.clave_sap_concurso where a.cr='" & cr & "') a) b ON a.clave_sap_zona = b.clave_sap_zona SET a.cantAcum = b.cantAcum WHERE a.cr = '" & cr & "';"
conn12.execute sql13
sql13="DELETE FROM estimacion4 WHERE avance <= 0 or avance is null;"
conn12.execute sql13
end if

'sql13="insert into estimaciones_log (estimacion,cr) values (" & cint(est) & ",'"& cr &"')"
conn12.execute sql13
'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	sql="rollback"
	conn.execute sql
	conn12.close 
	set conn12=nothing
	response.write("err")

	
else 
	sql="commit"
	conn12.execute sql
	conn12.close 	
	set conn12=nothing
	response.write("ok")
end if

%>

