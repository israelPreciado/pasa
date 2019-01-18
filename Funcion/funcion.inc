<%
ConnStr="DRIVER={MySQL ODBC 3.51 Driver};server=localhost;database=prueba_sistema; uid=root;pwd=; option=3"
ConnStr2="DRIVER={MySQL ODBC 3.51 Driver};server=localhost;database=prueba_sistema; uid=root;pwd=; option=3"

function buscarEstimacionCorrespondiente(cr)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql="SELECT a.estimacion FROM( SELECT CASE WHEN estatusEstimacion1 IS NULL THEN 0 ELSE estatusEstimacion1 END + CASE WHEN estatusEstimacion2 IS NULL THEN 0 ELSE estatusEstimacion2 END + CASE WHEN estatusEstimacion3 IS NULL THEN 0 ELSE estatusEstimacion3 END + CASE WHEN estatusEstimacion4 IS NULL THEN 0 ELSE estatusEstimacion4 END AS estimacion FROM ctrl_estimaciones WHERE CR ='" & cr & "') a LEFT JOIN cat_toleranciaestimacionobra b ON a.estimacion = b.estimacion"
rs.open sql, conn2
if rs.eof then
buscarEstimacionCorrespondiente="SE"
else
buscarEstimacionCorrespondiente=cint(rs("estimacion"))-1
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
end function

function estimacion(cr,est)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql="select round(ifnull(sum(a.pu*a.avance),2),0) as estimacion from (select * from " & est & "  where cr ='" & cr & "' GROUP BY clave_sap_concurso,descripcion_corta,und,cantidad,pu)a"

'sql="select ifnull(estimacion,0) as estimacion from (select sum(ifnull(estimacion,0)) as estimacion from (select round(sum(pu*avance),2) as estimacion from " & est & " where cr ='" & cr & "' GROUP BY clave_sap_concurso,descripcion_corta,und,cantidad,pu)a)a"
rs.open sql, conn2
if rs.eof then
estimacion="Pendiente"
else
if rs("estimacion")=0 then 
estimacion="Pendiente"
else
estimacion=formatoPesos(rs("estimacion"))
end if


end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
end function

function buscaPedido(cr)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql="select concat(prefijo,pedimento) as pedido from cat_pedimentos where cr='" & cr & "'"
rs.open sql, conn2
if rs.eof then
buscaPedido="O-TR18-001-OC/"
else
buscaPedido=rs("pedido")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
end function

function estimacionConPedimento(cr)
set conn2=server.CreateObject("adodb.connection")
set rs22=server.CreateObject("adodb.recordset")
conn2.open connstr
sql5="select * from cat_pedimentos where cr in (" & cr & ")"
rs22.open sql5, conn2
if rs22.eof then
	estimacionConPedimento=0
else
	estimacionConPedimento=1
end if

rs22.close
set rs22=nothing
conn2.close 
set conn2=nothing
end function

function estimacionOK(cr)
set conn2=server.CreateObject("adodb.connection")
set rs22=server.CreateObject("adodb.recordset")
conn2.open connstr

sql5="SELECT min, max FROM( SELECT CASE WHEN estatusEstimacion1 IS NULL THEN 0 ELSE estatusEstimacion1 END + CASE WHEN estatusEstimacion2 IS NULL THEN 0 ELSE estatusEstimacion2 END + CASE WHEN estatusEstimacion3 IS NULL THEN 0 ELSE estatusEstimacion3 END + CASE WHEN estatusEstimacion4 IS NULL THEN 0 ELSE estatusEstimacion4 END AS estimacion FROM ctrl_estimaciones WHERE CR ='" & cr & "') a LEFT JOIN cat_toleranciaestimacionobra b ON a.estimacion = b.estimacion"
rs22.open sql5, conn2
if rs22.eof then
min=24
max=26
else
min=rs22("min")
max=rs22("max")
end if

rs22.close
set rs22=nothing

 if porcentajeAvanceSucursal(CR) > min and porcentajeAvanceSucursal(CR) <max then
	estimacionOK=1
 else
	estimacionOK=porcentajeAvanceSucursal(CR)
 end if
conn2.close 
set conn2=nothing
end function


function porcentajeAvancePartida(cr,partida)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql="select *, case when Round((TotalAvanceSuc * 100) / TotalSuc,2) is null then 0 else Round((TotalAvanceSuc * 100) / TotalSuc,2) end  as porTotalAvanceSuc, case when   (TotalExcesoSuc * 100) / TotalSuc is null then 0 else (TotalExcesoSuc * 100) / TotalSuc end  as porTotalExcesoSuc from (select cr, Round(Sum(subTotalSuc),2) as TotalSuc,Round(Sum(subTotalAvanceSuc),2) as TotalAvanceSuc,Round(Sum(subTotalExcesoSuc),2) as TotalExcesoSuc  from (select *, (cantidad * pu) as subTotalSuc,((avance-exceso)* pu) as subTotalAvanceSuc,exceso* pu as subTotalExcesoSuc from (select cr, case when avanceCompletado=1 then round(CASE WHEN avance IS NULL THEN	0	ELSE avance	END,2) else round(cantidad,2) end as cantidad, pu,round(case when avance is null then 0 else avance end,2) as avance,CASE WHEN avance IS NULL THEN 0 WHEN avance > cantidad THEN avance - cantidad WHEN avance <= cantidad THEN 0 END AS exceso from nuevocosto_estimadoobra where cr='" & cr &"' and componente like '" & partida & "')a)b)c"
rs.open sql, conn2
if rs.eof then
porcentajeAvancePartida="0"
else
porcentajeAvancePartida=rs("porTotalAvanceSuc")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
end function

function porcentajeExcesoPartida(cr,partida)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql="select case when porTotalExcesoSuc is null then 0 else porTotalExcesoSuc end as porTotalExcesoSuc from (select *, Round((TotalAvanceSuc * 100) / TotalSuc,3) as porTotalAvanceSuc,  round((TotalExcesoSuc * 100) / TotalSuc ,3) as porTotalExcesoSuc from (select cr, Round(Sum(subTotalSuc),2) as TotalSuc,Round(Sum(subTotalAvanceSuc),2) as TotalAvanceSuc,Round(Sum(subTotalExcesoSuc),2) as TotalExcesoSuc  from (select *, (cantidad * pu) as subTotalSuc,((avance-exceso)* pu) as subTotalAvanceSuc,exceso* pu as subTotalExcesoSuc from (select cr, cantidad, pu,round(case when avance is null then 0 else avance end,2) as avance,CASE WHEN avance IS NULL THEN 0 WHEN avance > cantidad THEN avance - cantidad WHEN avance <= cantidad THEN 0 END AS exceso from nuevocosto_estimadoobra where cr='" & cr &"' and componente like '" & partida & "')a)b)c)d"
rs.open sql, conn2
if rs.eof then
porcentajeExcesoPartida="0"
else
porcentajeExcesoPartida=rs("porTotalExcesoSuc")
end if
rs.close
conn2.close 
set rs=nothing
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

function porcentajeAvanceSucursalPesos(cr)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
'sql="SELECT *, sum(a.precio) AS totalPartida, sum(a.porAvancePesos) AS totalAvancePartidaPesos, Round(((sum(a.porAvancePesos) * 100) / sum(a.precio)), 2) AS porTotalAvancePartidaPesos FROM( SELECT *, CANTIDAD * PU AS PRECIO, ROUND((CANTIDAD * PU) *(PORAVANCE / 100), 2) AS porAvancePesos FROM( SELECT * FROM( SELECT a.id, a.CLAVE_SAP_CONCURSO, a.clave_sap_zona, b.DESCRIPCION_CORTA, b.descripcion_larga, a.pu, a.cantidad, b.UND, a.componente, concat( LEFT(a.fecha_ingreso, 4), '-', RIGHT(LEFT(a.fecha_ingreso, 7), 2), '-', RIGHT(LEFT(a.fecha_ingreso, 10), 2), ' ', RIGHT(a.fecha_ingreso, 8)) AS fecha_ingreso, a.avance, CASE WHEN a.avance >= 0 THEN round((a.avance * 100) / a.cantidad, 2) ELSE 0 END AS porAvance FROM nuevoCosto_estimadoObra a LEFT JOIN cat_sap_2017 b ON a.CLAVE_SAP_CONCURSO = b.CLAVE_SAP_CONCURSO WHERE cr = '" & cr & "' and a.componente not like 'otros') AS a UNION( SELECT id, clave_sap_concurso, clave_sap_zona, descorta AS descripcion_corta, deslarga AS descripcion_larga, pu, cantidad, und, componente, fecha_ingreso, avance, CASE WHEN avance >= 0 THEN(avance * 100) / cantidad ELSE 0 END AS porAvance FROM nuevocosto_estimadoobra WHERE cr = '" & cr & "' AND componente LIKE 'Otros') ORDER BY fecha_ingreso DESC) a GROUP BY id) a"
sql="select case when TotalAvanceSuc is null then 0 else TotalAvanceSuc end as TotalAvanceSuc from (select *, (TotalAvanceSuc * 100) / TotalSuc as porTotalAvanceSuc,  (TotalExcesoSuc * 100) / TotalSuc  as porTotalExcesoSuc from (select cr, Round(Sum(subTotalSuc),2) as TotalSuc,Round(Sum(subTotalAvanceSuc),2) as TotalAvanceSuc,Round(Sum(subTotalExcesoSuc),2) as TotalExcesoSuc  from (select *, (cantidad * pu) as subTotalSuc,((avance-exceso)* pu) as subTotalAvanceSuc,exceso* pu as subTotalExcesoSuc from (select cr, cantidad, pu,round(case when avance is null then 0 else avance end,2) as avance,CASE WHEN avance IS NULL THEN 0 WHEN avance > cantidad THEN avance - cantidad WHEN avance <= cantidad THEN 0 END AS exceso from nuevocosto_estimadoobra where cr='" & cr &"')a)b)c)d"
rs.open sql, conn2
if rs.eof then
porcentajeAvanceSucursalPesos="0"
else
porcentajeAvanceSucursalPesos=formatoPesos(rs("TotalAvanceSuc"))
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
end function



Function porcentajeExceso(cr)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
'sql="select case when costo is null then 0 else costo end as costo from (select sum(round(cantidad * pu,2)) as Costo  from nuevocosto_estimadoobra where cr = '"& cr &"') a "
sql="select case when porTotalExcesoSuc is null then 0 else porTotalExcesoSuc end as porTotalExcesoSuc from (select *, (TotalAvanceSuc * 100) / TotalSuc as porTotalAvanceSuc,  Round((TotalExcesoSuc * 100) / TotalSuc,3)  as porTotalExcesoSuc from (select cr, Round(Sum(subTotalSuc),2) as TotalSuc,Round(Sum(subTotalAvanceSuc),2) as TotalAvanceSuc,Round(Sum(subTotalExcesoSuc),2) as TotalExcesoSuc  from (select *, (cantidad * pu) as subTotalSuc,((avance-exceso)* pu) as subTotalAvanceSuc,exceso* pu as subTotalExcesoSuc from (select cr, cantidad, pu,round(case when avance is null then 0 else avance end,2) as avance,CASE WHEN avance IS NULL THEN 0 WHEN avance > cantidad THEN avance - cantidad WHEN avance <= cantidad THEN 0 END AS exceso from nuevocosto_estimadoobra where cr='" & cr &"')a)b)c)d"
'sql="select case when porTotalAvanceSuc is null then 0 else porTotalAvanceSuc end as porTotalAvanceSuc, case when porTotalExcesoSuc is null then 0 else porTotalExcesoSuc end as porTotalExcesoSuc from  (select *, Round((TotalAvanceSuc * 100) / TotalSuc,3) / TotalSuc  as porTotalAvanceSuc,  (TotalExcesoSuc * 100) / TotalSuc  as porTotalExcesoSuc from (select cr, Round(Sum(subTotalSuc),2) as TotalSuc,Round(Sum(subTotalAvanceSuc),2) as TotalAvanceSuc,Round(Sum(subTotalExcesoSuc),2) as TotalExcesoSuc  from (select *, (cantidad * pu) as subTotalSuc,((avance-exceso)* pu) as subTotalAvanceSuc,exceso* pu as subTotalExcesoSuc from (select cr, case when avanceCompletado=1 then round(CASE WHEN avance IS NULL THEN	0	ELSE avance	END,2) else round(cantidad,2) end as cantidad, pu,round(case when avance is null then 0 else avance end,2) as avance,CASE WHEN avance IS NULL THEN 0 WHEN avance > cantidad THEN avance - cantidad WHEN avance <= cantidad THEN 0 END AS exceso from nuevocosto_estimadoobra where cr='" & cr &"')a)b)c)d;"
rs.open sql, conn2
if rs.eof then
porcentajeExceso=" 0 %"
else

porcentajeExceso=round(rs("porTotalExcesoSuc"),2)
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
end function

Function costoExceso(cr)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
'sql="select case when costo is null then 0 else costo end as costo from (select sum(round(cantidad * pu,2)) as Costo  from nuevocosto_estimadoobra where cr = '"& cr &"') a "
sql="select case when TotalExcesoSuc is null then 0 else TotalExcesoSuc end as TotalExcesoSuc from (select *, (TotalAvanceSuc * 100) / TotalSuc as porTotalAvanceSuc,  Round((TotalExcesoSuc * 100) / TotalSuc,3)  as porTotalExcesoSuc from (select cr, Round(Sum(subTotalSuc),2) as TotalSuc,Round(Sum(subTotalAvanceSuc),2) as TotalAvanceSuc,Round(Sum(subTotalExcesoSuc),2) as TotalExcesoSuc  from (select *, (cantidad * pu) as subTotalSuc,((avance-exceso)* pu) as subTotalAvanceSuc,exceso* pu as subTotalExcesoSuc from (select cr, cantidad, pu,round(case when avance is null then 0 else avance end,2) as avance,CASE WHEN avance IS NULL THEN 0 WHEN avance > cantidad THEN avance - cantidad WHEN avance <= cantidad THEN 0 END AS exceso from nuevocosto_estimadoobra where cr='" & cr &"')a)b)c)d"
rs.open sql, conn2
if rs.eof then
costoExceso=" $ 0"
else
costoExceso=formatoPesos(rs("TotalExcesoSuc"))
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
end function

Function costoEstimado(cr)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
'sql="select case when costo is null then 0 else costo end as costo from (select sum(round(cantidad * pu,2)) as Costo  from nuevocosto_estimadoobra where cr = '"& cr &"') a "
sql="select case when TotalSuc is null then 0 else TotalSuc end as TotalSuc from (select *, (TotalAvanceSuc * 100) / TotalSuc as porTotalAvanceSuc,  (TotalExcesoSuc * 100) / TotalSuc  as porTotalExcesoSuc from (select cr, Round(Sum(subTotalSuc),2) as TotalSuc,Round(Sum(subTotalAvanceSuc),2) as TotalAvanceSuc,Round(Sum(subTotalExcesoSuc),2) as TotalExcesoSuc  from (select *, (cantidad * pu) as subTotalSuc,((avance-exceso)* pu) as subTotalAvanceSuc,exceso* pu as subTotalExcesoSuc from (select cr, cantidad, pu,round(case when avance is null then 0 else avance end,2) as avance,CASE WHEN avance IS NULL THEN 0 WHEN avance > cantidad THEN avance - cantidad WHEN avance <= cantidad THEN 0 END AS exceso from nuevocosto_estimadoobra where cr='" & cr &"')a)b)c)d"
rs.open sql, conn2
if rs.eof then
costoEstimado=" $ 0"
else

costoEstimado=formatoPesos(rs("TotalSuc"))
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
end function

Function costoEstimadoPartida(cr,componente)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql="select case when costo is null then 0 else costo end as costo from (select sum(round(cantidad * pu,2)) as Costo  from nuevocosto_estimadoobra where cr = '"& cr &"'  and componente ='" & componente &"' ) a "
rs.open sql, conn2
if rs.eof then
costoEstimadoPartida=" $ 0"
else

costoEstimadoPartida=formatoPesos(rs("costo"))
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
end function

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

Function buscaUsuario(usuario,pass)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "SELECT  * from app_bnrt_login where login_usuario = '"& usuario &"' and login_pass = '"& pass &"'" 
rs.open sql, conn2
if rs.eof then
buscaUsuario=1
else
session("id")=rs("login_id")
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

Function buscaModulo(modulo)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select modulo from cat_modulos where id_modulo='" & modulo  & "';"
rs.open sql, conn2
if rs.eof then
buscaModulo=""
else
buscaModulo=rs("modulo")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

function buscaReasignacion(cr)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select case when Reasignacion is null then 0 when trim(Reasignacion)='' then 0 else Reasignacion end as Reasignacion from tseguimiento where cr='"& cr &"'" 
rs.open sql, conn2
if rs.eof then
buscaReasignacion=""
else
buscaReasignacion=rs("Reasignacion")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
end function 


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

Function cuentaPendientesPorEstatusSupervisor(estatus,supervisor)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select count(*) as sucursales  from tseguimiento where EstatusObra in ('"& estatus & "') and supervisorAsignado in ('" & supervisor &"') ;"
rs.open sql, conn2
if rs.eof then
cuentaPendientesPorEstatusSupervisor="0"
else
cuentaPendientesPorEstatusSupervisor=rs("sucursales")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function cuentaPendientesPorEstatusConPendientesGerente(estatus,estatus2,supervisor)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
if not(supervisor="") then
sql= "select COUNT(*) as sucursales from (SELECT a.CR,c.territorial,c.nombre_sucursal, a.FechaTermino, CASE WHEN b.pendientes IS NULL THEN 0 ELSE b.pendientes END AS pendientes, a.supervisorAsignado, f.id_gerente FROM tseguimiento a LEFT JOIN app_bnrt_login d on a.supervisorAsignado =d.login_id LEFT JOIN cat_sucursales c on a.CR=c.CR LEFT JOIN( SELECT cr, COUNT(cr) AS pendientes FROM pendientes where id_estatus=1 GROUP BY cr) b ON a.cr = b.cr  LEFT JOIN cat_gerentes_supervisores f on f.id_supervisor=a.supervisorAsignado WHERE (a.EstatusObra = '" & estatus2 & "' or a.EstatusObra='" & estatus & "') and f.id_gerente='" & session.contents("id") & "' and d.login_nombre='" & supervisor & "' ORDER BY FechaTermino asc)z where pendientes >1;"
else
sql= "select COUNT(*) as sucursales from (SELECT a.CR,c.territorial,c.nombre_sucursal, a.FechaTermino, CASE WHEN b.pendientes IS NULL THEN 0 ELSE b.pendientes END AS pendientes, a.supervisorAsignado, f.id_gerente FROM tseguimiento a LEFT JOIN app_bnrt_login d on a.supervisorAsignado =d.login_id LEFT JOIN cat_sucursales c on a.CR=c.CR LEFT JOIN( SELECT cr, COUNT(cr) AS pendientes FROM pendientes where id_estatus=1 GROUP BY cr) b ON a.cr = b.cr  LEFT JOIN cat_gerentes_supervisores f on f.id_supervisor=a.supervisorAsignado WHERE (a.EstatusObra = '" & estatus2 & "' or a.EstatusObra='" & estatus & "') and f.id_gerente='" & session.contents("id") & "' ORDER BY FechaTermino asc)z where pendientes >1;"
end if 
rs.open sql, conn2
if rs.eof then
cuentaPendientesPorEstatusConPendientesGerente="0"
else
cuentaPendientesPorEstatusConPendientesGerente=rs("sucursales")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function cuentaPendientesPorEstatusDirector(estatus,division,supervisor)
zona=session.contents("zonaDirector")
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
if supervisor="" and not(division="") then
sql= "select count(*) as sucursales  from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr where EstatusObra in ('" & estatus  & "') and b.Territorial='" & division & "'  and b.zona='" & zona &"'  ;"
end if

if not(supervisor="") and division="" then
sql= "select count(*) as sucursales  from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr LEFT JOIN app_bnrt_login c on a.supervisorAsignado=c.login_id where EstatusObra in ('" & estatus  & "') and c.login_nombre='" & supervisor & "'  and b.zona='" & zona &"'"
end if

if not(supervisor="") and not(division="") then
sql= "select count(*) as sucursales  from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr LEFT JOIN app_bnrt_login c on a.supervisorAsignado=c.login_id where EstatusObra in ('" & estatus  & "') and c.login_id='" & supervisor & "' and b.Territorial='" & division & "'  and b.zona='" & zona &"' ;"
end if

if supervisor="" and division="" then
sql= "select count(*) as sucursales  from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr  where EstatusObra in ('" & estatus  & "') and b.zona='" & zona &"' ;"
end if

rs.open sql, conn2
if rs.eof then
cuentaPendientesPorEstatusDirector="0"
else
cuentaPendientesPorEstatusDirector=rs("sucursales")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function cuentaPendientesPorEstatusGerente(estatus,supervisor,gerente)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr

if not(supervisor="") then
sql= "select count(*) as sucursales  from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr LEFT JOIN app_bnrt_login c on a.supervisorAsignado=c.login_id LEFT JOIN cat_gerentes_supervisores d on a.supervisorAsignado = d.id_supervisor where EstatusObra in ('" & estatus & "') and c.login_nombre='" & supervisor & "' and d.id_gerente='" &gerente &"';"
end if

if supervisor=""  then
sql= "select count(*) as sucursales  from tseguimiento a LEFT JOIN cat_gerentes_supervisores b on a.supervisorAsignado=b.id_supervisor where EstatusObra in ('" & estatus &"') and b.id_gerente='" & gerente &"';"
end if

rs.open sql, conn2
if rs.eof then
cuentaPendientesPorEstatusGerente="0"
else
cuentaPendientesPorEstatusGerente=rs("sucursales")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function cargaDivisionesDirector()
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
zona=session.contents("zonaDirector")
sql3= "select b.Territorial from tseguimiento a LEFT JOIN cat_sucursales b on a.CR=b.cr where b.zona='" & zona &"' GROUP BY b.Territorial"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaDivisionesDirector=response.write("<select><option value='0'>--</option></select>")
else
	regresar="<select id='select_division' name='select_division' onchange='showSelect()'><option></option>"
	while not(rs2.eof)
		regresar=regresar & "<option>" & rs2("Territorial") &"</option>"
		
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaDivisionesDirector=response.write(regresar)
End Function

Function cargaSupervisoresDirector()
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select b.login_nombre from tseguimiento a LEFT JOIN app_bnrt_login b on a.supervisorAsignado=b.login_id GROUP BY b.login_nombre"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaSupervisoresDirector=response.write("<select><option value='0'>--</option></select>")
else
	regresar="<select id='select_supervisor' name='select_supervisor' ><option></option>"
	while not(rs2.eof)
		regresar=regresar & "<option>" & rs2("login_nombre") &"</option>"
		
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaSupervisoresDirector=response.write(regresar)
End Function

Function cargaSupervisoresGerente(id_gerente)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from app_bnrt_login where login_id in (select id_supervisor from cat_gerentes_supervisores where id_gerente='" & id_gerente & "')"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaSupervisoresGerente=response.write("<select><option value='0'>--</option></select>")
else
	regresar="<select id='select_gerentes' name='select_gerentes' ><option></option>"
	while not(rs2.eof)
		regresar=regresar & "<option>" & rs2("login_nombre") &"</option>"	
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaSupervisoresGerente=response.write(regresar)
End Function

Function cuentaPendientesPorEstatusConPendientes(estatus,estatus2,contratista)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select count(*) as sucursales from (SELECT a.cr FROM tseguimiento a LEFT JOIN pendientes b ON a.cr = b.cr WHERE (EstatusObra IN ('" & estatus & "') or EstatusObra IN  ('" & estatus2 & "')) AND ContratistaAsignado IN ('" & contratista & "') AND b.cr IS NOT NULL and b.id_estatus=1 GROUP BY b.cr)a"
rs.open sql, conn2
if rs.eof then
cuentaPendientesPorEstatusConPendientes="0"
else
cuentaPendientesPorEstatusConPendientes=rs("sucursales")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function

Function cuentaPendientesPorEstatusConPendientesSupervisor(estatus,estatus2,supervisor)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "select count(*) as sucursales from (SELECT a.cr FROM tseguimiento a LEFT JOIN pendientes b ON a.cr = b.cr WHERE (EstatusObra IN ('" & estatus & "') or EstatusObra IN  ('" & estatus2 & "')) AND supervisorAsignado IN ('" & supervisor & "') AND b.cr IS NOT NULL and b.id_estatus=1 GROUP BY b.cr)a"
rs.open sql, conn2
if rs.eof then
cuentaPendientesPorEstatusConPendientesSupervisor="0"
else
cuentaPendientesPorEstatusConPendientesSupervisor=rs("sucursales")
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
End Function


Function cuentaPendientesPorEstatusConPendientesDirector(estatus,estatus2,division,supervisor)
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
zona=session.contents("zonaDirector")
if supervisor="" and not(division="") then
sql= "select count(*) as sucursales from (SELECT a.cr FROM tseguimiento a LEFT JOIN pendientes b ON a.cr = b.cr LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE (EstatusObra IN ('" & estatus & "') or EstatusObra IN  ('" & estatus2 & "')) and c.territorial in ('" & division &"') AND b.cr IS NOT NULL and b.id_estatus=1 and c.zona='" & zona &"' GROUP BY b.cr)a;"
end if

if not(supervisor="") and division="" then
sql= "select count(*) as sucursales from (SELECT a.cr FROM tseguimiento a LEFT JOIN pendientes b ON a.cr = b.cr LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE (EstatusObra IN ('" & estatus & "') or EstatusObra IN  ('" & estatus2 & "') and a.supervisorAsignado in ('" & supervisor &"')) AND b.cr IS NOT NULL and b.id_estatus=1 and c.zona='" & zona &"' GROUP BY b.cr)a;"
end if

if not(supervisor="") and not(division="") then
sql= "select count(*) as sucursales from (SELECT a.cr FROM tseguimiento a LEFT JOIN pendientes b ON a.cr = b.cr LEFT JOIN cat_sucursales c ON a.cr = c.cr WHERE (EstatusObra IN ('" & estatus & "') or EstatusObra IN  ('" & estatus2 & "')) and a.supervisorAsignado in ('" & supervisor &"') and c.territorial in ('" & division &"')  AND b.cr IS NOT NULL and b.id_estatus=1 and c.zona='" & zona &"' GROUP BY b.cr)a;"
end if

if supervisor="" and division="" then
sql="select count(*) as sucursales from (SELECT a.cr FROM tseguimiento a LEFT JOIN pendientes b ON a.cr = b.cr LEFT JOIN cat_sucursales c ON a.cr = c.cr  WHERE (EstatusObra IN ('" & estatus & "') or EstatusObra IN  ('" & estatus2 & "')) AND b.cr IS NOT NULL and b.id_estatus=1 and c.zona='" & zona &"' GROUP BY b.cr)a"
end if

'sql= "select count(*) as sucursales from (SELECT a.cr FROM tseguimiento a LEFT JOIN pendientes b ON a.cr = b.cr LEFT JOIN cat_sucursales c ON a.cr = c.cr  WHERE (EstatusObra IN ('" & estatus & "') or EstatusObra IN  ('" & estatus2 & "')) AND b.cr IS NOT NULL and b.id_estatus=1  and c.zona='" & zona &"'GROUP BY b.cr)a"
rs.open sql, conn2
if rs.eof then
cuentaPendientesPorEstatusConPendientesDirector="0"
else
cuentaPendientesPorEstatusConPendientesDirector=rs("sucursales")
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

Function buscaSupervisor(supervisor)
set conn4=server.CreateObject("adodb.connection")
set rs4=server.CreateObject("adodb.recordset")
conn4.open connstr
sql4= "SELECT login_nombre from app_bnrt_login where login_id = '"& supervisor &"'"
rs4.open sql4, conn4
if rs4.eof then
buscaSupervisor=""
else
buscaSupervisor=rs4("login_nombre")
end if
rs4.close
conn4.close 
set rs4=nothing
set conn4=nothing
End Function

Function buscaContratistaAsignado(cr)
set conn4=server.CreateObject("adodb.connection")
set rs4=server.CreateObject("adodb.recordset")
conn4.open connstr
sql4= "select contratistaAsignado from tseguimiento where cr='" & cr  & "';"
rs4.open sql4, conn4
if rs4.eof then
buscaContratistaAsignado=""
else
buscaContratistaAsignado=rs4("contratistaAsignado")
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

Function cargaAvanceContratista(campo, cr)
set conn2=server.CreateObject("adodb.connection")
set rs5=server.CreateObject("adodb.recordset")
conn2.open connstr
regresa=""
sql= "select " & campo & " as campo from tseguimientoContratista where CR='" & cr & "'" 
rs5.open sql, conn2
if rs5.eof then
cargaAvanceContratista=response.write("-")
else
if IsNumeric(rs5("campo")) then
regresa=rs5("campo")*100 & " %"
else
regresa=rs5("campo")
end if
cargaAvanceContratista=regresa
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
	if session.contents("privilegio")="2" then
	regresar=regresar & "<option value ='NA'>NA</option>"
	end if
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

Function cargaPorcentajesAvanceAtms(id)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from cat_porcentajesConLeyenda"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaPorcentajesAvanceAtms=response.write("<select><option value='0'>--</option></select>")
else
	regresar="<select id='select"& id &"' name='select"& id &"' style='display:none'><option value ='0'>--</option>"
	if session.contents("privilegio")="2" then
	 regresar=regresar & "<option value ='NA'>NA</option>"
	end if
	while not(rs2.eof)
		regresar=regresar & "<option value=" & rs2("porcentaje")& " >" & rs2("leyenda") & "</option>"
		
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaPorcentajesAvanceAtms=response.write(regresar)
End Function

Function cargaPorcentajesAvanceModulos(id)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from cat_porcentajesConLeyenda_2"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaPorcentajesAvanceModulos=response.write("<select><option value='0'>--</option></select>")
else
	regresar="<select id='select"& id &"' name='select"& id &"' style='display:none'><option value ='0'>--</option>"
	if session.contents("privilegio")="2" then
	 regresar=regresar & "<option value ='NA'>NA</option>"
	end if
	while not(rs2.eof)
		regresar=regresar & "<option value=" & rs2("porcentaje")& " >" & rs2("leyenda") & "</option>"
		
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaPorcentajesAvanceModulos=response.write(regresar)
End Function

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

Function cuenta(campo,cr)
set conn4=server.CreateObject("adodb.connection")
set rs4=server.CreateObject("adodb.recordset")
set rs41=server.CreateObject("adodb.recordset")
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

Function calculaPromedio(suma,elementos)
if elementos=0 then
calculaPromedio=0
else
calculaPromedio=(suma/elementos)*100
end if
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

Function calculaAvanceProyectado(cr, fechaInicio)
diasTranscurridos=DateDiff("d",cDate(fechaInicio),now())
promedio=0
cont=0
sumatoria=0
regresar=""
set conn51=server.CreateObject("adodb.connection")
set rs51=server.CreateObject("adodb.recordset")
conn51.open connstr
sql51= "select * from semaforodias where id_modulo=1"
rs51.open sql51, conn51
if rs51.eof then
calculaAvanceProyectado=0
else
	 while not (rs51.eof)
	 	if diasTranscurridos / cint(rs51("diasEsperados")) >1 then
			sumatoria=sumatoria + 1
		else
	 	sumatoria=sumatoria + (diasTranscurridos / cint(rs51("diasEsperados")))
		end if
		cont=cont+1
	 rs51.movenext
  	 wend 
regresar=round((sumatoria/cont)*100)
end if
rs51.close
conn51.close 
set rs51=nothing
set conn51=nothing
calculaAvanceProyectado=regresar
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

Function cargaCRAsignado(id)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select a.cr,b.NOMBRE_SUCURSAL,b.Territorial from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr where supervisorAsignado ='" & id & "';"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaCRAsignado=response.write("<select><option value='0'>--</option></select>")
else
	regresar="<select id='txt_buscar' name='txt_buscar'><option value ='0'>-Seleciona un CR-</option>"
	while not(rs2.eof)
		regresar=regresar & "<option value=" & rs2("cr")& " >" & rs2("cr") & ", " & rs2("NOMBRE_SUCURSAL") & ", " & rs2("Territorial") & "</option>"	
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaCRAsignado=response.write(regresar)
End Function

Function cargaCRAsignadoSupervisor(id,estatus1,estatus2,pendientes)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select a.cr,b.NOMBRE_SUCURSAL,b.Territorial from tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr where supervisorAsignado ='" & id & "';"
sql31="select a.cr,b.NOMBRE_SUCURSAL,b.Territorial,EstatusObra,c.pendientes from tseguimiento a LEFT JOIN (select cr,COUNT(*) as pendientes from pendientes where id_estatus=1 GROUP BY cr)c on a.CR=c.cr LEFT JOIN cat_sucursales b on a.cr=b.cr where supervisorAsignado ='" & id & "' and (EstatusObra=" & estatus1 &" or EstatusObra= " & estatus2 &");"
sql32="select a.cr,b.NOMBRE_SUCURSAL,b.Territorial,EstatusObra,c.pendientes from tseguimiento a LEFT JOIN (select cr,COUNT(*) as pendientes from pendientes where id_estatus=1 GROUP BY cr)c on a.CR=c.cr LEFT JOIN cat_sucursales b on a.cr=b.cr where supervisorAsignado ='" & id & "' and (EstatusObra=" & estatus1 &" or EstatusObra= " & estatus2 &") and pendientes>0;"
regresar=""
if pendientes="1" then
rs2.open sql31, conn3
else
rs2.open sql32, conn3
end if	

if rs2.eof then
	cargaCRAsignadoSupervisor=response.write("<select><option value='0'>--</option></select>")
else
	regresar="<select id='txt_buscar' name='txt_buscar'><option value ='0'>--</option>"
	while not(rs2.eof)
		regresar=regresar & "<option value=" & rs2("cr")& " >" & rs2("cr") & ", " & rs2("NOMBRE_SUCURSAL") & ", " & rs2("Territorial") & "</option>"	
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaCRAsignadoSupervisor=response.write(regresar)
End Function

function cargaAlbum(cr)
regresar=""
regresar=regresar & "<div id='years' align='center' style='display:block'>"

set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "select * from (select *, YEAR(fecha) as anio, MONTH(fecha) as mes,day(fecha) as dia from ctrl_fotografias)z where cr='" & cr & "' GROUP BY anio;"
rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close


regresar=regresar & "<div style='display:block'><table width='50%'><tr><td align='center'><p>No se han cargado imagenes</p></td></tr></table></div>"



else
while not (rs1.eof)

regresar=regresar & "  <div style='display:block'><table width='50%'><tr><td align='center'><p><img src='images/logos/album.png' onclick=""document.getElementById('years').style.display='none';document.getElementById('months" 
regresar=regresar &  rs1("anio") & "').style.display='block'""></p></td></tr><tr><td align='center'><p>" & rs1("anio") & "</p></td></tr></table></div>"

rs1.movenext
wend 
rs1.close
conn3.close 
set rs1=nothing
set conn3=nothing
end if 

regresar=regresar & "</div>"
regresar=regresar & "<!--meses-->"

set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "select * from (select *, YEAR(fecha) as anio,MONTH(fecha) as mes,day(fecha) as dia from ctrl_fotografias)z where cr='" & cr & "' GROUP BY anio;"
rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close

regresar=regresar & "  <div style='display:block'><table width='50%'><tr><td align='center'><p>No se han cargado imagenes (anios)</p></td></tr></table></div>"


else
while not (rs1.eof)
	set rs2=server.CreateObject("adodb.recordset")
	sql2= "select *,case when mes=1 then 'ENERO' when mes=2 then 'FEBRERO' when mes=3 then 'MARZO' when mes=4 then 'ABRIL'when mes=5 then 'MAYO' when mes=6 then 'JUNIO' when mes=7 then 'JULIO' when mes=8 then 'AGOSTO' when mes=9 then 'SEPTIMBRE' when mes=10 then 'OCTUBRE' when mes=11 then 'NOVIEMBRE' when mes=12 then 'DICIEMBRE' end as mesName from (select *, YEAR(fecha) as anio,MONTH(fecha) as mes,day(fecha) as dia from ctrl_fotografias)z where anio='" & rs1("anio") & "'  AND  cr='" & cr & "' GROUP BY mes;"
	rs2.open sql2, conn3
	if rs2.eof then
		rs2.close
		conn3.close
		

regresar=regresar & " <table width='50%'><tr><td align='center'><p>No se han cargado imagenes (meses)</p></td></tr></table></div></td></tr>"
regresar=regresar & " </table>"
 
	else
regresar=regresar & " <div id='months" & rs1("anio") &"' style='display:none'>"
		while not (rs2.eof)
 


regresar=regresar & "  <div style='display:block'><table width='50%'><tr><td align='center'><p><img src='images/logos/album.png' onclick=""document.getElementById('months" 
regresar=regresar   & rs1("anio") & "').style.display='none';document.getElementById('days" 
regresar=regresar & rs1("anio")& rs2("mes") & "').style.display='block'""></p></td></tr><tr><td align='center'><p>" & rs2("mesName") & "</p></td></tr></table></div>"


		rs2.movenext
		wend
		rs2.close
	end if
rs1.movenext
regresar=regresar & "</div>"
wend 
rs1.close
conn3.close 
set rs1=nothing
set conn3=nothing
end if 


regresar=regresar & "<!--dias-->"

set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
set rs2=server.CreateObject("adodb.recordset")
set rs3=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "select * from (select *, YEAR(fecha) as anio,MONTH(fecha) as mes,day(fecha) as dia from ctrl_fotografias)z where cr='" & cr & "' GROUP BY anio;"
rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close

regresar=regresar & " <table>"
regresar=regresar & "  <tr><td><div style='display:block'><table width='50%'><tr><td align='center'><p>No se han cargado imagenes (anios)</p></td></tr></table></div></td></tr>"
regresar=regresar & " </table>"
 
else
while not (rs1.eof)
	sql2= "select * from (select *, YEAR(fecha) as anio,MONTH(fecha) as mes,day(fecha) as dia from ctrl_fotografias)z where anio='" & rs1("anio") & "' AND cr='" & cr & "'GROUP BY mes;"
	rs2.open sql2, conn3
	if rs2.eof then
		rs2.close
		conn3.close

regresar=regresar & " <table>"
regresar=regresar & "  <tr><td><div style='display:block'><table width='50%'><tr><td align='center'><p>No se han cargado imagenes (meses)</p></td></tr></table></div></td></tr>"
regresar=regresar & " </table>"

	else
		while not (rs2.eof)
			
			sql3= "select *, case when mes=1 then 'ENERO' when mes=2 then 'FEBRERO' when mes=3 then 'MARZO' when mes=4 then 'ABRIL'when mes=5 then 'MAYO' when mes=6 then 'JUNIO' when mes=7 then 'JULIO' when mes=8 then 'AGOSTO' when mes=9 then 'SEPTIMBRE' when mes=10 then 'OCTUBRE' when mes=11 then 'NOVIEMBRE' when mes=12 then 'DICIEMBRE' end as mesName from (select *, YEAR(fecha) as anio,MONTH(fecha) as mes,day(fecha) as dia from ctrl_fotografias)z where anio='" & rs1("anio") & "' and mes='" & rs2("mes") & "' AND cr='" & cr &"'GROUP BY dia;"
			rs3.open sql3, conn3
			if rs3.eof then
				rs3.close
				conn3.close
 
regresar=regresar & "  <table>"
regresar=regresar & "  <tr><td><div style='display:block'><table width='50%'><tr><td align='center'><p>No se han cargado imagenes (dias)</p></td></tr></table></div></td></tr>"
regresar=regresar & " </table>"
 
			else

regresar=regresar & "<div id='days" & rs1("anio") & rs2("mes") & "' style='display:none'>"
regresar=regresar & " <table>"

			while not (rs3.eof)		

regresar=regresar & " <tr height='20px'><td><div style='display:block'><table width='100%'><tr><td align='center' style='cursor:pointer' onclick=""document.getElementById('days"
regresar=regresar & rs1("anio") & rs2("mes") & "').style.display='none';document.getElementById('years').style.display='block';showModalFotos('" & session.contents("cr") & "','"
regresar=regresar & rs3("dia") & "','" & rs2("mes") & "','" & rs1("anio") & "')""><em><u><p>" & rs3("dia") & " " & rs3("mesName") & "</p></u></em></td></tr></table></div></td></tr>"


			rs3.movenext
			wend
			rs3.close

regresar=regresar & " </table>"
regresar=regresar & "</div>"
			
		end if
		rs2.movenext
		wend
		rs2.close
	end if
rs1.movenext
wend 
rs1.close
conn3.close 
set rs1=nothing
set conn3=nothing
end if 
cargaAlbum=regresar
end function

function buscaCtrlCapitulosContestado(capitulo, concepto, cr)
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "	select * from ctrl_capitulos_contestados where id_capitulo='" & capitulo & "' and id_concepto='" & concepto & "' and cr='" & cr & "';"
rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close
buscaCtrlCapitulosContestado="no"
else
rs1.close
conn3.close
buscaCtrlCapitulosContestado="existe"	
end if
end function

function buscaCtrlCapitulosRaizContestado(capitulo,cr)
set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
bandera2="existe"
sql1= "select a.id_capitulo,a.id_concepto,b.id_capitulo as validacion from (select * from cat_preguntas a  where a.id_capitulo='" & capitulo & "' GROUP BY a.id_concepto)a LEFT JOIN (select * from ctrl_capitulos_contestados where cr='" & cr & "') b on a.id_concepto=b.id_concepto and a.id_capitulo=b.id_capitulo"
rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close
buscaCtrlCapitulosRaizContestado="no"
else
while not (rs1.eof)
 if isnull(rs1("validacion")) then
	if bandera2="existe" then
		bandera2="no"
	end if 
 end if
rs1.movenext
wend 
rs1.close
conn3.close 
set rs1=nothing
set conn3=nothing
buscaCtrlCapitulosRaizContestado=bandera2
end if
end function
%>