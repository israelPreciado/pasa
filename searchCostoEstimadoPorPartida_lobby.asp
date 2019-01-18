<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
cr=request("cr")
partida=request("componente")
'cr="0008"
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr

'seleccionamos la consulta segun el parametro de entrada
	'sql="SELECT *, sum(a.precio) AS totalPartida, sum(a.porAvancePesos) AS totalAvancePartidaPesos, Round(((sum(a.porAvancePesos) * 100) / sum(a.precio)), 2) AS porTotalAvancePartidaPesos FROM( SELECT *, CANTIDAD * PU AS PRECIO, ROUND((CANTIDAD * PU) *(PORAVANCE / 100), 2) AS porAvancePesos FROM( SELECT * FROM( SELECT a.id, a.CLAVE_SAP_CONCURSO, a.clave_sap_zona, b.DESCRIPCION_CORTA, b.descripcion_larga, a.pu, a.cantidad, b.UND, a.componente, concat( LEFT(a.fecha_ingreso, 4), '-', RIGHT(LEFT(a.fecha_ingreso, 7), 2), '-', RIGHT(LEFT(a.fecha_ingreso, 10), 2), ' ', RIGHT(a.fecha_ingreso, 8)) AS fecha_ingreso, a.avance, CASE WHEN a.avance >= 0 THEN round((a.avance * 100) / a.cantidad, 2) ELSE 0 END AS porAvance FROM nuevoCosto_estimadoObra a LEFT JOIN cat_sap_2017 b ON a.CLAVE_SAP_CONCURSO = b.CLAVE_SAP_CONCURSO WHERE cr = '" & cr & "') AS a UNION( SELECT id, clave_sap_concurso, clave_sap_zona, descorta AS descripcion_corta, deslarga AS descripcion_larga, pu, cantidad, und, componente, fecha_ingreso, avance, CASE WHEN avance >= 0 THEN(avance * 100) / cantidad ELSE 0 END AS porAvance FROM nuevocosto_estimadoobra WHERE cr = '" & cr & "' AND componente LIKE 'Otros') ORDER BY fecha_ingreso DESC) a WHERE componente = '" & partida & "' GROUP BY id) a"
'sql="select *, round((TotalAvanceSuc * 100) / TotalSuc,3) as porTotalAvanceSuc,  (TotalExcesoSuc * 100) / TotalSuc  as porTotalExcesoSuc from (select cr, Round(Sum(subTotalSuc),2) as TotalSuc,Round(Sum(subTotalAvanceSuc),2)  as TotalAvanceSuc,Round(Sum(subTotalExcesoSuc),2) as TotalExcesoSuc  from (select *, (cantidad * pu) as subTotalSuc,((avance-exceso)* pu) as subTotalAvanceSuc,exceso* pu as subTotalExcesoSuc from (select cr, case when avanceCompletado=1 then round(CASE WHEN avance IS NULL THEN	0	ELSE avance	END,2) else round(cantidad,2) end as cantidad, pu,round(case when avance is null then 0 else avance end,2) as avance,CASE WHEN avance IS NULL THEN 0 WHEN avance > cantidad THEN avance - cantidad WHEN avance <= cantidad THEN 0 END AS exceso from nuevocosto_estimadoobra where cr='" & cr &"' and componente like '" & partida & "')a)b)c"
sql="SELECT *,case when TotalAvanceSuc = 0 and TotalSuc=0 then 100 else  (TotalAvanceSuc * 100) / TotalSuc end  AS porTotalAvanceSuc,(TotalExcesoSuc * 100) / TotalSuc AS porTotalExcesoSuc FROM( SELECT cr, Sum(subTotalSuc) AS TotalSuc, Sum(subTotalAvanceSuc) AS TotalAvanceSuc, Sum(subTotalExcesoSuc) AS TotalExcesoSuc FROM( SELECT *,(cantidad * pu) AS subTotalSuc,((avance - exceso) * pu) AS subTotalAvanceSuc, exceso * pu AS subTotalExcesoSuc FROM( SELECT cr, CASE WHEN avanceCompletado = 1 THEN IFNULL(avance, 0) ELSE cantidad END AS cantidad, pu, CASE WHEN avance IS NULL THEN 0 ELSE avance END AS avance, CASE WHEN avance IS NULL THEN 0 WHEN avance > cantidad THEN avance - cantidad WHEN avance <= cantidad THEN 0 END AS exceso FROM nuevocosto_estimadoobra_lobby WHERE cr = '" & cr &"' AND componente LIKE '" & partida & "') a) b) c"
'ejecutamos la consulta
rs.open sql,conn
'si la consula trajo registros
if rs.eof then
'escribimos los encabezados de la tabla
response.write("<font size='+2'><strong>Porcentaje de Avance de la Partida  0 % </strong></font>")
'mientras el RecorSet no llegue al final se recorre
else
response.write("<font size='+2'><strong>Porcentaje de Avance de la Partida " & round(rs("porTotalAvanceSuc"),2) & " %</strong></font>" )
end if
'cerramos el RecordSet y Cerramos la conexion
rs.close
conn.close 
set rs=nothing
set conn=nothing

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


