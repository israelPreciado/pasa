<%
ConnStr="DRIVER={MySQL ODBC 5.3 ANSI Driver};server=scanda500;database=plasticos; uid=xmd7310;pwd=XMD7310; option=3"
'

function cargaProductos(id_proveedor, elemento,familia)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
if elemento="total" then
sql3= "SELECT * FROM( SELECT z.codigo_producto, z.producto, ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) AS min, b.familia, c.movimiento, IFNULL(d.STOCK_TOTAL, 0) AS STOCK_TOTAL, IFNULL(d.CONSUMO_ACUMULADO_MES, 0) AS CONSUMO_ACUMULADO_MES, IFNULL(d.CONSUMO_COBERTURA, 0) AS consumo_cobertura, IFNULL(d.SEMANAS_STOCK, 0) AS SEMANAS_STOCK FROM(( SELECT b.id_familia, b.id_movimiento, b.codigo_producto, c.producto, IFNULL(d.STOCK, 0) AS STOCK_total, d.MES AS consumo_acumulado_mes, '' AS consumo_cobertura, IFNULL(d.SEMANAS_EN_STOCK, 0) AS SEMANAS_EN_STOCK FROM cat_insumos a LEFT JOIN estructura_tarjetas b ON a.Item_Gemalto = b.cod_est_insumo LEFT JOIN cat_tarjetas c ON b.codigo_producto = c.cod_producto LEFT JOIN mts_insumos_actual d ON a.Item_Gemalto = d.Item WHERE a.estatus = 2 AND b.estatus = 2 AND c.id_proveedor = " & id_proveedor &") UNION( SELECT a.id_familia, a.id_movimiento, a.codigo_producto, b.producto, c.STOCK_TOTAL, c.CONSUMO_ACUMULADO_MES, c.CONSUMO_COBERTURA, ROUND(c.SEMANAS_STOCK) AS SEMANAS_STOCK FROM estructura_tarjetas a LEFT JOIN cat_tarjetas b ON a.codigo_producto = b.cod_producto LEFT JOIN mts_tarjetas_actual c ON a.codigo_producto = c.CODIGO_PRODUCTO WHERE a.estatus = 2 AND b.estatus = 2 AND b.id_proveedor = " & id_proveedor & " GROUP BY a.id_familia, a.id_movimiento, a.codigo_producto ORDER BY a.codigo_producto, a.id_familia, a.id_movimiento)) z LEFT JOIN cat_familia b ON z.id_familia = b.id_familia LEFT JOIN cat_movimientos c ON z.id_movimiento = c.id_movimiento LEFT JOIN mts_tarjetas_actual d ON z.codigo_producto = d.CODIGO_PRODUCTO GROUP BY z.id_familia, z.id_movimiento, z.codigo_producto ORDER BY z.codigo_producto, z.id_familia, z.id_movimiento) r LEFT JOIN cat_semaforos b ON r.semanas_stock BETWEEN b.de AND b.a  where r.familia='" & familia & "'"
else
sql3= "SELECT * FROM( SELECT z.codigo_producto, z.producto, ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) AS min, b.familia, c.movimiento, IFNULL(d.STOCK_TOTAL, 0) AS STOCK_TOTAL, IFNULL(d.CONSUMO_ACUMULADO_MES, 0) AS CONSUMO_ACUMULADO_MES, IFNULL(d.CONSUMO_COBERTURA, 0) AS consumo_cobertura, IFNULL(d.SEMANAS_STOCK, 0) AS SEMANAS_STOCK FROM(( SELECT b.id_familia, b.id_movimiento, b.codigo_producto, c.producto, IFNULL(d.STOCK, 0) AS STOCK_total, d.MES AS consumo_acumulado_mes, '' AS consumo_cobertura, IFNULL(d.SEMANAS_EN_STOCK, 0) AS SEMANAS_EN_STOCK FROM cat_insumos a LEFT JOIN estructura_tarjetas b ON a.Item_Gemalto = b.cod_est_insumo LEFT JOIN cat_tarjetas c ON b.codigo_producto = c.cod_producto LEFT JOIN mts_insumos_actual d ON a.Item_Gemalto = d.Item WHERE a.estatus = 2 AND b.estatus = 2 AND c.id_proveedor = " & id_proveedor &") UNION( SELECT a.id_familia, a.id_movimiento, a.codigo_producto, b.producto, c.STOCK_TOTAL, c.CONSUMO_ACUMULADO_MES, c.CONSUMO_COBERTURA, ROUND(c.SEMANAS_STOCK) AS SEMANAS_STOCK FROM estructura_tarjetas a LEFT JOIN cat_tarjetas b ON a.codigo_producto = b.cod_producto LEFT JOIN mts_tarjetas_actual c ON a.codigo_producto = c.CODIGO_PRODUCTO WHERE a.estatus = 2 AND b.estatus = 2 AND b.id_proveedor = " & id_proveedor & " GROUP BY a.id_familia, a.id_movimiento, a.codigo_producto ORDER BY a.codigo_producto, a.id_familia, a.id_movimiento)) z LEFT JOIN cat_familia b ON z.id_familia = b.id_familia LEFT JOIN cat_movimientos c ON z.id_movimiento = c.id_movimiento LEFT JOIN mts_tarjetas_actual d ON z.codigo_producto = d.CODIGO_PRODUCTO GROUP BY z.id_familia, z.id_movimiento, z.codigo_producto ORDER BY z.codigo_producto, z.id_familia, z.id_movimiento) r LEFT JOIN cat_semaforos b ON r.semanas_stock BETWEEN b.de AND b.a  where b.color='" & elemento & "' and r.familia='" & familia & "'"

end if
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaProductos=response.write("")
else
	while not(rs2.eof)	
		regresar=regresar & "<tr><td>"   
		if rs2("color")="verde" then
			regresar=regresar & " <div class=""opacity"" style=""font-size:xx-small""> 1</div><img src=""IMG/3.png"" width=""25"" title=""MOSTRAR PRODUCTOS QUE AFECTAN ESTE PRODUCTO"" onclick=""showAfectaInsumos('" & rs2("codigo_producto") & "','" & rs2("familia") & "','" & rs2("movimiento") & "','" & rs2("color") & "')""/>"
		else 
			if rs2("color")="amarillo" then
			 	regresar=regresar & "<div class=""opacity"" style=""font-size:xx-small""> 2</div><img src=""IMG/4.png"" width=""25"" title=""MOSTRAR PRODUCTOS QUE AFECTAN ESTE PRODUCTO"" onclick=""showAfectaInsumos('" & rs2("codigo_producto") & "','" & rs2("familia") & "','" & rs2("movimiento") & "','" & rs2("color") & "')""/>"
			else
				regresar=regresar &	"<div class=""opacity"" style=""font-size:xx-small""> 3</div><img src=""IMG/5.png"" width=""25"" title=""MOSTRAR PRODUCTOS QUE AFECTAN ESTE PRODUCTO"" onclick=""showAfectaInsumos('" & rs2("codigo_producto") & "','" & rs2("familia") & "','" & rs2("movimiento") & "','" & rs2("color") & "')""/>"
			end if	
		end if	
		regresar=regresar & "</td><td><font size=""-2"">" & rs2("familia") & "</font></td><td title=""MOSTRAR GRAFICA DEL COMPORTAMIENTO DEL PRODUCTO"" onclick=""showGrafica('" & rs2("codigo_producto") & "','plasticos')""><font size=""1"">" & rs2("codigo_producto") & "</font></td><td><font size=""-2"">" & server.HTMLEncode(rs2("producto").value) & "</font></td><td><font size=""-2"">" & rs2("movimiento") & "</font></td>"
		regresar=regresar & "<td><font size=""-2"">" & formatnumber(rs2("stock_total")) & "</font></td><td><font size=""-2"">" & formatnumber(rs2("CONSUMO_ACUMULADO_MES")) & "</font></td><td><font size=""-2"">" & formatnumber(rs2("consumo_cobertura")) & "</font></td><td><font size=""3"">" & round(rs2("SEMANAS_STOCK")) & "</font></td></tr>"
	rs2.movenext
	wend  
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaProductos=response.write(regresar)
end function

function cargaInsumos(id_proveedor, elemento,insumo)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
if elemento="total" then
sql3= "SELECT * FROM( SELECT a.Item_Gemalto, a.Descripcion, a.proveedor, a.estatus, b.STOCK, b.SEMANAS_EN_STOCK, b.CONSUMO_MENSUAL_PROYECTADO, b.MES, c.insumo FROM cat_insumos a LEFT JOIN mts_insumos_actual b ON a.Item_Gemalto = b.Item LEFT JOIN insumos_id c ON a.id_insumo = c.id_insumo WHERE a.estatus = 2 AND a.proveedor = " & proveedor &" GROUP BY Item_Gemalto) r LEFT JOIN cat_semaforos b ON r.SEMANAS_EN_STOCK BETWEEN b.de AND b.a  where r.insumo='" & insumo & "'"
else
sql3= "SELECT * FROM( SELECT a.Item_Gemalto, a.Descripcion, a.proveedor, a.estatus, b.STOCK, b.SEMANAS_EN_STOCK, b.CONSUMO_MENSUAL_PROYECTADO, b.MES, c.insumo FROM cat_insumos a LEFT JOIN mts_insumos_actual b ON a.Item_Gemalto = b.Item LEFT JOIN insumos_id c ON a.id_insumo = c.id_insumo WHERE a.estatus = 2 AND a.proveedor = " & proveedor &" GROUP BY Item_Gemalto)r LEFT JOIN cat_semaforos b ON r.SEMANAS_EN_STOCK BETWEEN b.de AND b.a  where r.insumo='" & insumo & "' and color='" & elemento & "'"

end if
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaInsumos=response.write("")
else
	while not(rs2.eof)	
		regresar=regresar & "<tr><td>"   
		if rs2("color")="verde" then
			regresar=regresar & " <div class=""opacity"" style=""font-size:xx-small""> 1</div><img src=""IMG/3.png"" width=""25"" title=""MOSTRAR PRODUCTOS QUE COMPARTEN ESTE INSUMO"" onclick=""showComparteCon('" & rs2("item_gemalto") & "')""/>"
		else 
			if rs2("color")="amarillo" then
			 	regresar=regresar & "<div class=""opacity"" style=""font-size:xx-small""> 2</div><img src=""IMG/4.png"" width=""25"" title=""MOSTRAR PRODUCTOS QUE COMPARTEN ESTE INSUMO"" onclick=""showComparteCon('" & rs2("item_gemalto") & "')""/>"
			else
				regresar=regresar &	"<div class=""opacity"" style=""font-size:xx-small""> 3</div><img src=""IMG/5.png"" width=""25"" title=""MOSTRAR PRODUCTOS QUE COMPARTEN ESTE INSUMO"" onclick=""showComparteCon('" & rs2("item_gemalto") & "')""/>"
			end if	
		end if	
		regresar=regresar & "</td><td title=""MOSTRAR GRAFICA DEL COMPORTAMIENTO DEL INSUMO"" onclick=""showGrafica('" & rs2("item_gemalto") & "','INSUMOS')""><font size=""-2"">" & rs2("item_gemalto") & "</font></td><td><font size=""-2"">" & server.HTMLEncode(rs2("descripcion").value) & "</font></td>"
		regresar=regresar & "<td><font size=""-2"">" 
		if isnull(rs2("stock")) then
		regresar=regresar & "0"
		else
		regresar=regresar & formatnumber(rs2("stock"))
		end if
		regresar=regresar & "</font></td><td><font size=""-2"">"
		if isnull(rs2("mes")) then
		regresar=regresar & "0"
		else
		regresar=regresar & formatnumber(rs2("mes"))
		end if
		regresar=regresar & "</font></td><td><font size=""-2"">"
		if isnull(rs2("consumo_mensual_proyectado")) then
		regresar=regresar & "0"
		else
		regresar=regresar & formatnumber(rs2("consumo_mensual_proyectado"))
		end if
		regresar=regresar & "</font></td><td><font size=""-2"">"
		if isnull(rs2("SEMANAS_en_STOCK")) then
		regresar=regresar & "0"
		else
		regresar=regresar & round(rs2("SEMANAS_en_STOCK"))
		end if
		regresar=regresar & "</font></td></tr>"
		
		
	rs2.movenext
	wend  
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaInsumos=response.write(regresar)
end function

Function cargaProveedores(div)
if div="" then
div=0
end if
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "select * from  cat_proveedores"
regresar=""
rs2.open sql3, conn3
if rs2.eof then
	cargaProveedores=response.write("<select><option value='0'>-- NO SE ENCONTRO INF. --</option></select>")
else
	regresar="<select id='select_proveedor' name='select_proveedor' onchange='submit()'><option value ='0'>--SELECCION--</option>"
	while not(rs2.eof)
		if rs2("id_proveedor")=cint(div) then
		regresar=regresar & "<option value=" & rs2("id_proveedor")& " selected='selected'>" & ucase(rs2("proveedor")) & "</option>"
		else
		regresar=regresar & "<option value=" & rs2("id_proveedor")& " >" & ucase(rs2("proveedor")) & "</option>"
		end if
	rs2.movenext
	wend  
	regresar=regresar & "</select>"
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaProveedores=response.write(regresar)
End Function

function lastUpdate()
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3= "SELECT max(a.LAST_UPDATE) AS last_update FROM( SELECT max(last_update) AS LAST_UPDATE FROM mts_insumos_actual UNION SELECT max(last_update) AS LAST_UPDATE FROM mts_tarjetas_actual) a"
regresar=""
rs2.open sql3, conn3

if rs2.eof then
	lastUpdate=response.write("")
else
	regresar=regresar & rs2("last_update")   
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
lastUpdate=response.write(regresar)
end function

function cargaElementosPlasticos(elemento)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
if elemento="verde" then
sql3= "SELECT count(*) numElementos FROM( SELECT z.codigo_producto, z.producto, ifnull( MIN(truncate(z.SEMANAS_EN_STOCK,0)), 0) AS min, b.familia, c.movimiento, IFNULL(d.STOCK_TOTAL, 0) AS STOCK_TOTAL, IFNULL(d.CONSUMO_ACUMULADO_MES, 0) AS CONSUMO_ACUMULADO_MES, IFNULL(d.CONSUMO_COBERTURA, 0) AS consumo_cobertura, IFNULL(d.SEMANAS_STOCK, 0) AS SEMANAS_STOCK FROM(( SELECT b.id_familia, b.id_movimiento, b.codigo_producto, c.producto, IFNULL(d.STOCK, 0) AS STOCK_total, d.MES AS consumo_acumulado_mes, '' AS consumo_cobertura, IFNULL(d.SEMANAS_EN_STOCK, 0) AS SEMANAS_EN_STOCK FROM cat_insumos a LEFT JOIN estructura_tarjetas b ON a.Item_Gemalto = b.cod_est_insumo LEFT JOIN cat_tarjetas c ON b.codigo_producto = c.cod_producto LEFT JOIN mts_insumos_actual d ON a.Item_Gemalto = d.Item WHERE a.estatus = 2 AND b.estatus = 2) UNION( SELECT a.id_familia, a.id_movimiento, a.codigo_producto, b.producto, c.STOCK_TOTAL, c.CONSUMO_ACUMULADO_MES, c.CONSUMO_COBERTURA, truncate(c.SEMANAS_STOCK,0) AS SEMANAS_STOCK FROM estructura_tarjetas a LEFT JOIN cat_tarjetas b ON a.codigo_producto = b.cod_producto LEFT JOIN mts_tarjetas_actual c ON a.codigo_producto = c.CODIGO_PRODUCTO WHERE a.estatus = 2 AND b.estatus = 2 GROUP BY a.id_familia, a.id_movimiento, a.codigo_producto ORDER BY a.codigo_producto, a.id_familia, a.id_movimiento)) z LEFT JOIN cat_familia b ON z.id_familia = b.id_familia LEFT JOIN cat_movimientos c ON z.id_movimiento = c.id_movimiento LEFT JOIN mts_tarjetas_actual d ON z.codigo_producto = d.CODIGO_PRODUCTO GROUP BY z.id_familia, z.id_movimiento, z.codigo_producto ORDER BY z.codigo_producto, z.id_familia, z.id_movimiento) r LEFT JOIN cat_semaforos b ON r.min BETWEEN b.de AND b.a WHERE b.color = 'verde'"
else
if elemento="amarillo" then
sql3= "SELECT count(*) numElementos FROM( SELECT z.codigo_producto, z.producto, ifnull( MIN(truncate(z.SEMANAS_EN_STOCK,0)), 0) AS min, b.familia, c.movimiento, IFNULL(d.STOCK_TOTAL, 0) AS STOCK_TOTAL, IFNULL(d.CONSUMO_ACUMULADO_MES, 0) AS CONSUMO_ACUMULADO_MES, IFNULL(d.CONSUMO_COBERTURA, 0) AS consumo_cobertura, IFNULL(d.SEMANAS_STOCK, 0) AS SEMANAS_STOCK FROM(( SELECT b.id_familia, b.id_movimiento, b.codigo_producto, c.producto, IFNULL(d.STOCK, 0) AS STOCK_total, d.MES AS consumo_acumulado_mes, '' AS consumo_cobertura, IFNULL(d.SEMANAS_EN_STOCK, 0) AS SEMANAS_EN_STOCK FROM cat_insumos a LEFT JOIN estructura_tarjetas b ON a.Item_Gemalto = b.cod_est_insumo LEFT JOIN cat_tarjetas c ON b.codigo_producto = c.cod_producto LEFT JOIN mts_insumos_actual d ON a.Item_Gemalto = d.Item WHERE a.estatus = 2 AND b.estatus = 2) UNION( SELECT a.id_familia, a.id_movimiento, a.codigo_producto, b.producto, c.STOCK_TOTAL, c.CONSUMO_ACUMULADO_MES, c.CONSUMO_COBERTURA, truncate(c.SEMANAS_STOCK,0) AS SEMANAS_STOCK FROM estructura_tarjetas a LEFT JOIN cat_tarjetas b ON a.codigo_producto = b.cod_producto LEFT JOIN mts_tarjetas_actual c ON a.codigo_producto = c.CODIGO_PRODUCTO WHERE a.estatus = 2 AND b.estatus = 2 GROUP BY a.id_familia, a.id_movimiento, a.codigo_producto ORDER BY a.codigo_producto, a.id_familia, a.id_movimiento)) z LEFT JOIN cat_familia b ON z.id_familia = b.id_familia LEFT JOIN cat_movimientos c ON z.id_movimiento = c.id_movimiento LEFT JOIN mts_tarjetas_actual d ON z.codigo_producto = d.CODIGO_PRODUCTO GROUP BY z.id_familia, z.id_movimiento, z.codigo_producto ORDER BY z.codigo_producto, z.id_familia, z.id_movimiento) r LEFT JOIN cat_semaforos b ON r.min BETWEEN b.de AND b.a WHERE b.color = 'amarillo'"
else
if elemento="rojo" then
sql3= "SELECT count(*) numElementos FROM( SELECT z.codigo_producto, z.producto, ifnull( MIN(truncate(z.SEMANAS_EN_STOCK,0)), 0) AS min, b.familia, c.movimiento, IFNULL(d.STOCK_TOTAL, 0) AS STOCK_TOTAL, IFNULL(d.CONSUMO_ACUMULADO_MES, 0) AS CONSUMO_ACUMULADO_MES, IFNULL(d.CONSUMO_COBERTURA, 0) AS consumo_cobertura, IFNULL(d.SEMANAS_STOCK, 0) AS SEMANAS_STOCK FROM(( SELECT b.id_familia, b.id_movimiento, b.codigo_producto, c.producto, IFNULL(d.STOCK, 0) AS STOCK_total, d.MES AS consumo_acumulado_mes, '' AS consumo_cobertura, IFNULL(d.SEMANAS_EN_STOCK, 0) AS SEMANAS_EN_STOCK FROM cat_insumos a LEFT JOIN estructura_tarjetas b ON a.Item_Gemalto = b.cod_est_insumo LEFT JOIN cat_tarjetas c ON b.codigo_producto = c.cod_producto LEFT JOIN mts_insumos_actual d ON a.Item_Gemalto = d.Item WHERE a.estatus = 2 AND b.estatus = 2) UNION( SELECT a.id_familia, a.id_movimiento, a.codigo_producto, b.producto, c.STOCK_TOTAL, c.CONSUMO_ACUMULADO_MES, c.CONSUMO_COBERTURA, truncate(c.SEMANAS_STOCK,0) AS SEMANAS_STOCK FROM estructura_tarjetas a LEFT JOIN cat_tarjetas b ON a.codigo_producto = b.cod_producto LEFT JOIN mts_tarjetas_actual c ON a.codigo_producto = c.CODIGO_PRODUCTO WHERE a.estatus = 2 AND b.estatus = 2 GROUP BY a.id_familia, a.id_movimiento, a.codigo_producto ORDER BY a.codigo_producto, a.id_familia, a.id_movimiento)) z LEFT JOIN cat_familia b ON z.id_familia = b.id_familia LEFT JOIN cat_movimientos c ON z.id_movimiento = c.id_movimiento LEFT JOIN mts_tarjetas_actual d ON z.codigo_producto = d.CODIGO_PRODUCTO GROUP BY z.id_familia, z.id_movimiento, z.codigo_producto ORDER BY z.codigo_producto, z.id_familia, z.id_movimiento) r LEFT JOIN cat_semaforos b ON r.min BETWEEN b.de AND b.a WHERE b.color = 'rojo'"
else
sql3= "SELECT count(*) numElementos FROM( SELECT z.codigo_producto, z.producto, ifnull( MIN(truncate(z.SEMANAS_EN_STOCK,0)), 0) AS min, b.familia, c.movimiento, IFNULL(d.STOCK_TOTAL, 0) AS STOCK_TOTAL, IFNULL(d.CONSUMO_ACUMULADO_MES, 0) AS CONSUMO_ACUMULADO_MES, IFNULL(d.CONSUMO_COBERTURA, 0) AS consumo_cobertura, IFNULL(d.SEMANAS_STOCK, 0) AS SEMANAS_STOCK FROM(( SELECT b.id_familia, b.id_movimiento, b.codigo_producto, c.producto, IFNULL(d.STOCK, 0) AS STOCK_total, d.MES AS consumo_acumulado_mes, '' AS consumo_cobertura, IFNULL(d.SEMANAS_EN_STOCK, 0) AS SEMANAS_EN_STOCK FROM cat_insumos a LEFT JOIN estructura_tarjetas b ON a.Item_Gemalto = b.cod_est_insumo LEFT JOIN cat_tarjetas c ON b.codigo_producto = c.cod_producto LEFT JOIN mts_insumos_actual d ON a.Item_Gemalto = d.Item WHERE a.estatus = 2 AND b.estatus = 2) UNION( SELECT a.id_familia, a.id_movimiento, a.codigo_producto, b.producto, c.STOCK_TOTAL, c.CONSUMO_ACUMULADO_MES, c.CONSUMO_COBERTURA, truncate(c.SEMANAS_STOCK,0) AS SEMANAS_STOCK FROM estructura_tarjetas a LEFT JOIN cat_tarjetas b ON a.codigo_producto = b.cod_producto LEFT JOIN mts_tarjetas_actual c ON a.codigo_producto = c.CODIGO_PRODUCTO WHERE a.estatus = 2 AND b.estatus = 2 GROUP BY a.id_familia, a.id_movimiento, a.codigo_producto ORDER BY a.codigo_producto, a.id_familia, a.id_movimiento)) z LEFT JOIN cat_familia b ON z.id_familia = b.id_familia LEFT JOIN cat_movimientos c ON z.id_movimiento = c.id_movimiento LEFT JOIN mts_tarjetas_actual d ON z.codigo_producto = d.CODIGO_PRODUCTO GROUP BY z.id_familia, z.id_movimiento, z.codigo_producto ORDER BY z.codigo_producto, z.id_familia, z.id_movimiento) r "
end if
end if
end if

regresar=""
rs2.open sql3, conn3

if rs2.eof then
	cargaElementosPlasticos=response.write("<td align=""center"" onclick=""alert('NO EXISTE DETALLE')"">0</td>")
else
	regresar=regresar & "<td align=""center"""
	if rs2("numElementos")="0" then
	regresar=regresar & "onclick=""alert('NO EXISTE DETALLE')"">" & rs2("numElementos") & "</td>"
	else
	regresar=regresar & "onclick=""show_detalle('" & elemento & "',"& rs2("numElementos") &", 'plasticos')"">" & rs2("numElementos") & "</td>" 
	end if
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaElementosPlasticos=response.write(regresar)
end function

function cargaElementosInsumos(elemento)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
if elemento="verde" then
sql3= "SELECT COUNT(*) as numElementos FROM( SELECT * FROM cat_insumos a LEFT JOIN mts_insumos_actual b ON a.Item_Gemalto = b.Item WHERE a.estatus = 2 GROUP BY Item_Gemalto) r LEFT JOIN cat_semaforos b ON r.semanas_en_stock BETWEEN b.de AND b.a WHERE b.color = 'verde'"
else
if elemento="amarillo" then
sql3= "SELECT COUNT(*) as numElementos FROM( SELECT * FROM cat_insumos a LEFT JOIN mts_insumos_actual b ON a.Item_Gemalto = b.Item WHERE a.estatus = 2 GROUP BY Item_Gemalto) r LEFT JOIN cat_semaforos b ON r.semanas_en_stock BETWEEN b.de AND b.a WHERE b.color = 'amarillo'"
else
if elemento="rojo" then
sql3= "SELECT COUNT(*) as numElementos FROM( SELECT * FROM cat_insumos a LEFT JOIN mts_insumos_actual b ON a.Item_Gemalto = b.Item WHERE a.estatus = 2 GROUP BY Item_Gemalto) r LEFT JOIN cat_semaforos b ON r.semanas_en_stock BETWEEN b.de AND b.a WHERE b.color = 'rojo'"
else
sql3= "SELECT COUNT(*) as numElementos FROM( SELECT * FROM cat_insumos a LEFT JOIN mts_insumos_actual b ON a.Item_Gemalto = b.Item WHERE a.estatus = 2 GROUP BY Item_Gemalto) r LEFT JOIN cat_semaforos b ON r.semanas_en_stock BETWEEN b.de AND b.a where not (b.color is null)"
end if
end if
end if

regresar=""
rs2.open sql3, conn3

if rs2.eof then
	cargaElementosPlasticos=response.write("<td align=""center"" onclick=""alert('NO EXISTE DETALLE')"">0</td>")
else
	regresar=regresar & "<td align=""center"""
	if rs2("numElementos")="0" then
	regresar=regresar & "onclick=""alert('NO EXISTE DETALLE')"">" & rs2("numElementos") & "</td>"
	else
	regresar=regresar & "onclick=""show_detalle('" & elemento & "',"& rs2("numElementos") &", 'insumos')"">" & rs2("numElementos") & "</td>" 
	end if
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaElementosInsumos=response.write(regresar)
end function

Function cargaProveedores2()

set conn4=server.CreateObject("adodb.connection")
set rs4=server.CreateObject("adodb.recordset")
conn4.open connstr
sql4= "select * from  cat_proveedores"
regresar=""
rs4.open sql4, conn4
if rs4.eof then
	cargaProveedores2=response.write("<tr><td>&nbsp;</td><td>&nbsp;</td><td bgcolor=""#95b3d7"" align=""center"" colspan=""6""><font color=""#FFFFFF"">NO HAY PROVEEDORES CARGADOS</font></td></tr>")
else
	while not(rs4.eof)
		  regresar=regresar & "<tr>"
    regresar=regresar & "<td>&nbsp;</td>"
    regresar=regresar & "<td>&nbsp;</td>"
    regresar=regresar & "<td bgcolor=""#95b3d7"" ><font color=""#FFFFFF"">" & rs4("proveedor") & "</font></td>"
	'******
	elemento="total"
	set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
if elemento="verde" then
sql3= "SELECT count(*) numElementos FROM( SELECT z.codigo_producto, z.producto, ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) AS min, CASE WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) > 9 THEN 'verde' WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) BETWEEN 3 AND 9 THEN 'amarillo' WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) < 3 THEN 'rojo' END AS semaforo, b.familia, c.movimiento, IFNULL(d.STOCK_TOTAL, 0) AS STOCK_TOTAL, IFNULL(d.CONSUMO_ACUMULADO_MES, 0) AS CONSUMO_ACUMULADO_MES, IFNULL(d.CONSUMO_COBERTURA, 0) AS consumo_cobertura, IFNULL(d.SEMANAS_STOCK, 0) AS SEMANAS_STOCK FROM(( SELECT b.id_familia, b.id_movimiento, b.codigo_producto, c.producto, IFNULL(d.STOCK, 0) AS STOCK_total, d.MES AS consumo_acumulado_mes, '' AS consumo_cobertura, IFNULL(d.SEMANAS_EN_STOCK, 0) AS SEMANAS_EN_STOCK FROM cat_insumos a LEFT JOIN estructura_tarjetas b ON a.Item_Gemalto = b.cod_est_insumo LEFT JOIN cat_tarjetas c ON b.codigo_producto = c.cod_producto LEFT JOIN mts_insumos_actual d ON a.Item_Gemalto = d.Item WHERE a.estatus = 2 AND b.estatus = 2 AND a.proveedor = "& cint(proveedor) &") UNION( SELECT a.id_familia, a.id_movimiento, a.codigo_producto, b.producto, c.STOCK_TOTAL, c.CONSUMO_ACUMULADO_MES, c.CONSUMO_COBERTURA, ROUND(c.SEMANAS_STOCK) AS SEMANAS_STOCK FROM estructura_tarjetas a LEFT JOIN cat_tarjetas b ON a.codigo_producto = b.cod_producto LEFT JOIN mts_tarjetas_actual c ON a.codigo_producto = c.CODIGO_PRODUCTO WHERE a.estatus = 2 AND b.estatus = 2 AND b.id_proveedor = "& cint(proveedor) &" GROUP BY a.id_familia, a.id_movimiento, a.codigo_producto ORDER BY a.codigo_producto, a.id_familia, a.id_movimiento)) z LEFT JOIN cat_familia b ON z.id_familia = b.id_familia LEFT JOIN cat_movimientos c ON z.id_movimiento = c.id_movimiento LEFT JOIN mts_tarjetas_actual d ON z.codigo_producto = d.CODIGO_PRODUCTO GROUP BY z.id_familia, z.id_movimiento, z.codigo_producto ORDER BY z.codigo_producto, z.id_familia, z.id_movimiento) x WHERE x.semaforo = 'verde'"
else
if elemento="amarillo" then
sql3= "SELECT count(*) numElementos FROM( SELECT z.codigo_producto, z.producto, ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) AS min, CASE WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) > 9 THEN 'verde' WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) BETWEEN 3 AND 9 THEN 'amarillo' WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) < 3 THEN 'rojo' END AS semaforo, b.familia, c.movimiento, IFNULL(d.STOCK_TOTAL, 0) AS STOCK_TOTAL, IFNULL(d.CONSUMO_ACUMULADO_MES, 0) AS CONSUMO_ACUMULADO_MES, IFNULL(d.CONSUMO_COBERTURA, 0) AS consumo_cobertura, IFNULL(d.SEMANAS_STOCK, 0) AS SEMANAS_STOCK FROM(( SELECT b.id_familia, b.id_movimiento, b.codigo_producto, c.producto, IFNULL(d.STOCK, 0) AS STOCK_total, d.MES AS consumo_acumulado_mes, '' AS consumo_cobertura, IFNULL(d.SEMANAS_EN_STOCK, 0) AS SEMANAS_EN_STOCK FROM cat_insumos a LEFT JOIN estructura_tarjetas b ON a.Item_Gemalto = b.cod_est_insumo LEFT JOIN cat_tarjetas c ON b.codigo_producto = c.cod_producto LEFT JOIN mts_insumos_actual d ON a.Item_Gemalto = d.Item WHERE a.estatus = 2 AND b.estatus = 2 AND a.proveedor = "& cint(proveedor) &") UNION( SELECT a.id_familia, a.id_movimiento, a.codigo_producto, b.producto, c.STOCK_TOTAL, c.CONSUMO_ACUMULADO_MES, c.CONSUMO_COBERTURA, ROUND(c.SEMANAS_STOCK) AS SEMANAS_STOCK FROM estructura_tarjetas a LEFT JOIN cat_tarjetas b ON a.codigo_producto = b.cod_producto LEFT JOIN mts_tarjetas_actual c ON a.codigo_producto = c.CODIGO_PRODUCTO WHERE a.estatus = 2 AND b.estatus = 2 AND b.id_proveedor = "& cint(proveedor) &" GROUP BY a.id_familia, a.id_movimiento, a.codigo_producto ORDER BY a.codigo_producto, a.id_familia, a.id_movimiento)) z LEFT JOIN cat_familia b ON z.id_familia = b.id_familia LEFT JOIN cat_movimientos c ON z.id_movimiento = c.id_movimiento LEFT JOIN mts_tarjetas_actual d ON z.codigo_producto = d.CODIGO_PRODUCTO GROUP BY z.id_familia, z.id_movimiento, z.codigo_producto ORDER BY z.codigo_producto, z.id_familia, z.id_movimiento) x WHERE x.semaforo = 'amarillo'"
else
if elemento="rojo" then
sql3= "SELECT count(*) numElementos FROM( SELECT z.codigo_producto, z.producto, ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) AS min, CASE WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) > 9 THEN 'verde' WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) BETWEEN 3 AND 9 THEN 'amarillo' WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) < 3 THEN 'rojo' END AS semaforo, b.familia, c.movimiento, IFNULL(d.STOCK_TOTAL, 0) AS STOCK_TOTAL, IFNULL(d.CONSUMO_ACUMULADO_MES, 0) AS CONSUMO_ACUMULADO_MES, IFNULL(d.CONSUMO_COBERTURA, 0) AS consumo_cobertura, IFNULL(d.SEMANAS_STOCK, 0) AS SEMANAS_STOCK FROM(( SELECT b.id_familia, b.id_movimiento, b.codigo_producto, c.producto, IFNULL(d.STOCK, 0) AS STOCK_total, d.MES AS consumo_acumulado_mes, '' AS consumo_cobertura, IFNULL(d.SEMANAS_EN_STOCK, 0) AS SEMANAS_EN_STOCK FROM cat_insumos a LEFT JOIN estructura_tarjetas b ON a.Item_Gemalto = b.cod_est_insumo LEFT JOIN cat_tarjetas c ON b.codigo_producto = c.cod_producto LEFT JOIN mts_insumos_actual d ON a.Item_Gemalto = d.Item WHERE a.estatus = 2 AND b.estatus = 2 AND a.proveedor = "& cint(proveedor) &") UNION( SELECT a.id_familia, a.id_movimiento, a.codigo_producto, b.producto, c.STOCK_TOTAL, c.CONSUMO_ACUMULADO_MES, c.CONSUMO_COBERTURA, ROUND(c.SEMANAS_STOCK) AS SEMANAS_STOCK FROM estructura_tarjetas a LEFT JOIN cat_tarjetas b ON a.codigo_producto = b.cod_producto LEFT JOIN mts_tarjetas_actual c ON a.codigo_producto = c.CODIGO_PRODUCTO WHERE a.estatus = 2 AND b.estatus = 2 AND b.id_proveedor = "& cint(proveedor) &" GROUP BY a.id_familia, a.id_movimiento, a.codigo_producto ORDER BY a.codigo_producto, a.id_familia, a.id_movimiento)) z LEFT JOIN cat_familia b ON z.id_familia = b.id_familia LEFT JOIN cat_movimientos c ON z.id_movimiento = c.id_movimiento LEFT JOIN mts_tarjetas_actual d ON z.codigo_producto = d.CODIGO_PRODUCTO GROUP BY z.id_familia, z.id_movimiento, z.codigo_producto ORDER BY z.codigo_producto, z.id_familia, z.id_movimiento) x WHERE x.semaforo = 'rojo'"
else
sql3= "SELECT count(*) numElementos FROM( SELECT z.codigo_producto, z.producto, ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) AS min, CASE WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) > 9 THEN 'verde' WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) BETWEEN 3 AND 9 THEN 'amarillo' WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) < 3 THEN 'rojo' END AS semaforo, b.familia, c.movimiento, IFNULL(d.STOCK_TOTAL, 0) AS STOCK_TOTAL, IFNULL(d.CONSUMO_ACUMULADO_MES, 0) AS CONSUMO_ACUMULADO_MES, IFNULL(d.CONSUMO_COBERTURA, 0) AS consumo_cobertura, IFNULL(d.SEMANAS_STOCK, 0) AS SEMANAS_STOCK FROM(( SELECT b.id_familia, b.id_movimiento, b.codigo_producto, c.producto, IFNULL(d.STOCK, 0) AS STOCK_total, d.MES AS consumo_acumulado_mes, '' AS consumo_cobertura, IFNULL(d.SEMANAS_EN_STOCK, 0) AS SEMANAS_EN_STOCK FROM cat_insumos a LEFT JOIN estructura_tarjetas b ON a.Item_Gemalto = b.cod_est_insumo LEFT JOIN cat_tarjetas c ON b.codigo_producto = c.cod_producto LEFT JOIN mts_insumos_actual d ON a.Item_Gemalto = d.Item WHERE a.estatus = 2 AND b.estatus = 2 AND a.proveedor = "& cint(proveedor) &") UNION( SELECT a.id_familia, a.id_movimiento, a.codigo_producto, b.producto, c.STOCK_TOTAL, c.CONSUMO_ACUMULADO_MES, c.CONSUMO_COBERTURA, ROUND(c.SEMANAS_STOCK) AS SEMANAS_STOCK FROM estructura_tarjetas a LEFT JOIN cat_tarjetas b ON a.codigo_producto = b.cod_producto LEFT JOIN mts_tarjetas_actual c ON a.codigo_producto = c.CODIGO_PRODUCTO WHERE a.estatus = 2 AND b.estatus = 2 AND b.id_proveedor = "& cint(proveedor) &" GROUP BY a.id_familia, a.id_movimiento, a.codigo_producto ORDER BY a.codigo_producto, a.id_familia, a.id_movimiento)) z LEFT JOIN cat_familia b ON z.id_familia = b.id_familia LEFT JOIN cat_movimientos c ON z.id_movimiento = c.id_movimiento LEFT JOIN mts_tarjetas_actual d ON z.codigo_producto = d.CODIGO_PRODUCTO GROUP BY z.id_familia, z.id_movimiento, z.codigo_producto ORDER BY z.codigo_producto, z.id_familia, z.id_movimiento) x "
end if
end if
end if
rs2.open sql3, conn3

if rs2.eof then
	cargaElementosPlasticos_paso2=response.write("<td bgcolor=""#95b3d7"" align=""center"" onclick=""alert('NO EXISTE DETALLE')""><font color=""#FFFFFF"">0</font></td>")
else
	response.write("<td bgcolor=""#95b3d7"" align=""center"" onclick=""show_detalle('" & elemento & "'," & rs2("numElementos") &",'plasticos')""><font color=""#FFFFFF"">" & rs2("numElementos") & "</font></td>" )  
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
	'******
	regresar=regresar & "</tr>"
	rs4.movenext
	wend  
end if

rs4.close
conn4.close 
set rs4=nothing
set conn4=nothing
cargaProveedores2=response.write(regresar)
End Function


function cargaElementosPlasticos_paso2(elemento, proveedor)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
if elemento="verde" then
sql3= "SELECT count(*) numElementos FROM( SELECT z.codigo_producto, z.producto, ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) AS min, CASE WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) > 9 THEN 'verde' WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) BETWEEN 3 AND 9 THEN 'amarillo' WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) < 3 THEN 'rojo' END AS semaforo, b.familia, c.movimiento, IFNULL(d.STOCK_TOTAL, 0) AS STOCK_TOTAL, IFNULL(d.CONSUMO_ACUMULADO_MES, 0) AS CONSUMO_ACUMULADO_MES, IFNULL(d.CONSUMO_COBERTURA, 0) AS consumo_cobertura, IFNULL(d.SEMANAS_STOCK, 0) AS SEMANAS_STOCK FROM(( SELECT b.id_familia, b.id_movimiento, b.codigo_producto, c.producto, IFNULL(d.STOCK, 0) AS STOCK_total, d.MES AS consumo_acumulado_mes, '' AS consumo_cobertura, IFNULL(d.SEMANAS_EN_STOCK, 0) AS SEMANAS_EN_STOCK FROM cat_insumos a LEFT JOIN estructura_tarjetas b ON a.Item_Gemalto = b.cod_est_insumo LEFT JOIN cat_tarjetas c ON b.codigo_producto = c.cod_producto LEFT JOIN mts_insumos_actual d ON a.Item_Gemalto = d.Item WHERE a.estatus = 2 AND b.estatus = 2 AND a.proveedor = "& cint(proveedor) &") UNION( SELECT a.id_familia, a.id_movimiento, a.codigo_producto, b.producto, c.STOCK_TOTAL, c.CONSUMO_ACUMULADO_MES, c.CONSUMO_COBERTURA, ROUND(c.SEMANAS_STOCK) AS SEMANAS_STOCK FROM estructura_tarjetas a LEFT JOIN cat_tarjetas b ON a.codigo_producto = b.cod_producto LEFT JOIN mts_tarjetas_actual c ON a.codigo_producto = c.CODIGO_PRODUCTO WHERE a.estatus = 2 AND b.estatus = 2 AND b.id_proveedor = "& cint(proveedor) &" GROUP BY a.id_familia, a.id_movimiento, a.codigo_producto ORDER BY a.codigo_producto, a.id_familia, a.id_movimiento)) z LEFT JOIN cat_familia b ON z.id_familia = b.id_familia LEFT JOIN cat_movimientos c ON z.id_movimiento = c.id_movimiento LEFT JOIN mts_tarjetas_actual d ON z.codigo_producto = d.CODIGO_PRODUCTO GROUP BY z.id_familia, z.id_movimiento, z.codigo_producto ORDER BY z.codigo_producto, z.id_familia, z.id_movimiento) x WHERE x.semaforo = 'verde'"
else
if elemento="amarillo" then
sql3= "SELECT count(*) numElementos FROM( SELECT z.codigo_producto, z.producto, ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) AS min, CASE WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) > 9 THEN 'verde' WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) BETWEEN 3 AND 9 THEN 'amarillo' WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) < 3 THEN 'rojo' END AS semaforo, b.familia, c.movimiento, IFNULL(d.STOCK_TOTAL, 0) AS STOCK_TOTAL, IFNULL(d.CONSUMO_ACUMULADO_MES, 0) AS CONSUMO_ACUMULADO_MES, IFNULL(d.CONSUMO_COBERTURA, 0) AS consumo_cobertura, IFNULL(d.SEMANAS_STOCK, 0) AS SEMANAS_STOCK FROM(( SELECT b.id_familia, b.id_movimiento, b.codigo_producto, c.producto, IFNULL(d.STOCK, 0) AS STOCK_total, d.MES AS consumo_acumulado_mes, '' AS consumo_cobertura, IFNULL(d.SEMANAS_EN_STOCK, 0) AS SEMANAS_EN_STOCK FROM cat_insumos a LEFT JOIN estructura_tarjetas b ON a.Item_Gemalto = b.cod_est_insumo LEFT JOIN cat_tarjetas c ON b.codigo_producto = c.cod_producto LEFT JOIN mts_insumos_actual d ON a.Item_Gemalto = d.Item WHERE a.estatus = 2 AND b.estatus = 2 AND a.proveedor = "& cint(proveedor) &") UNION( SELECT a.id_familia, a.id_movimiento, a.codigo_producto, b.producto, c.STOCK_TOTAL, c.CONSUMO_ACUMULADO_MES, c.CONSUMO_COBERTURA, ROUND(c.SEMANAS_STOCK) AS SEMANAS_STOCK FROM estructura_tarjetas a LEFT JOIN cat_tarjetas b ON a.codigo_producto = b.cod_producto LEFT JOIN mts_tarjetas_actual c ON a.codigo_producto = c.CODIGO_PRODUCTO WHERE a.estatus = 2 AND b.estatus = 2 AND b.id_proveedor = "& cint(proveedor) &" GROUP BY a.id_familia, a.id_movimiento, a.codigo_producto ORDER BY a.codigo_producto, a.id_familia, a.id_movimiento)) z LEFT JOIN cat_familia b ON z.id_familia = b.id_familia LEFT JOIN cat_movimientos c ON z.id_movimiento = c.id_movimiento LEFT JOIN mts_tarjetas_actual d ON z.codigo_producto = d.CODIGO_PRODUCTO GROUP BY z.id_familia, z.id_movimiento, z.codigo_producto ORDER BY z.codigo_producto, z.id_familia, z.id_movimiento) x WHERE x.semaforo = 'amarillo'"
else
if elemento="rojo" then
sql3= "SELECT count(*) numElementos FROM( SELECT z.codigo_producto, z.producto, ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) AS min, CASE WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) > 9 THEN 'verde' WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) BETWEEN 3 AND 9 THEN 'amarillo' WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) < 3 THEN 'rojo' END AS semaforo, b.familia, c.movimiento, IFNULL(d.STOCK_TOTAL, 0) AS STOCK_TOTAL, IFNULL(d.CONSUMO_ACUMULADO_MES, 0) AS CONSUMO_ACUMULADO_MES, IFNULL(d.CONSUMO_COBERTURA, 0) AS consumo_cobertura, IFNULL(d.SEMANAS_STOCK, 0) AS SEMANAS_STOCK FROM(( SELECT b.id_familia, b.id_movimiento, b.codigo_producto, c.producto, IFNULL(d.STOCK, 0) AS STOCK_total, d.MES AS consumo_acumulado_mes, '' AS consumo_cobertura, IFNULL(d.SEMANAS_EN_STOCK, 0) AS SEMANAS_EN_STOCK FROM cat_insumos a LEFT JOIN estructura_tarjetas b ON a.Item_Gemalto = b.cod_est_insumo LEFT JOIN cat_tarjetas c ON b.codigo_producto = c.cod_producto LEFT JOIN mts_insumos_actual d ON a.Item_Gemalto = d.Item WHERE a.estatus = 2 AND b.estatus = 2 AND a.proveedor = "& cint(proveedor) &") UNION( SELECT a.id_familia, a.id_movimiento, a.codigo_producto, b.producto, c.STOCK_TOTAL, c.CONSUMO_ACUMULADO_MES, c.CONSUMO_COBERTURA, ROUND(c.SEMANAS_STOCK) AS SEMANAS_STOCK FROM estructura_tarjetas a LEFT JOIN cat_tarjetas b ON a.codigo_producto = b.cod_producto LEFT JOIN mts_tarjetas_actual c ON a.codigo_producto = c.CODIGO_PRODUCTO WHERE a.estatus = 2 AND b.estatus = 2 AND b.id_proveedor = "& cint(proveedor) &" GROUP BY a.id_familia, a.id_movimiento, a.codigo_producto ORDER BY a.codigo_producto, a.id_familia, a.id_movimiento)) z LEFT JOIN cat_familia b ON z.id_familia = b.id_familia LEFT JOIN cat_movimientos c ON z.id_movimiento = c.id_movimiento LEFT JOIN mts_tarjetas_actual d ON z.codigo_producto = d.CODIGO_PRODUCTO GROUP BY z.id_familia, z.id_movimiento, z.codigo_producto ORDER BY z.codigo_producto, z.id_familia, z.id_movimiento) x WHERE x.semaforo = 'rojo'"
else
sql3= "SELECT count(*) numElementos FROM( SELECT z.codigo_producto, z.producto, ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) AS min, CASE WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) > 9 THEN 'verde' WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) BETWEEN 3 AND 9 THEN 'amarillo' WHEN ifnull( MIN(ROUND(z.SEMANAS_EN_STOCK)), 0) < 3 THEN 'rojo' END AS semaforo, b.familia, c.movimiento, IFNULL(d.STOCK_TOTAL, 0) AS STOCK_TOTAL, IFNULL(d.CONSUMO_ACUMULADO_MES, 0) AS CONSUMO_ACUMULADO_MES, IFNULL(d.CONSUMO_COBERTURA, 0) AS consumo_cobertura, IFNULL(d.SEMANAS_STOCK, 0) AS SEMANAS_STOCK FROM(( SELECT b.id_familia, b.id_movimiento, b.codigo_producto, c.producto, IFNULL(d.STOCK, 0) AS STOCK_total, d.MES AS consumo_acumulado_mes, '' AS consumo_cobertura, IFNULL(d.SEMANAS_EN_STOCK, 0) AS SEMANAS_EN_STOCK FROM cat_insumos a LEFT JOIN estructura_tarjetas b ON a.Item_Gemalto = b.cod_est_insumo LEFT JOIN cat_tarjetas c ON b.codigo_producto = c.cod_producto LEFT JOIN mts_insumos_actual d ON a.Item_Gemalto = d.Item WHERE a.estatus = 2 AND b.estatus = 2 AND a.proveedor = "& cint(proveedor) &") UNION( SELECT a.id_familia, a.id_movimiento, a.codigo_producto, b.producto, c.STOCK_TOTAL, c.CONSUMO_ACUMULADO_MES, c.CONSUMO_COBERTURA, ROUND(c.SEMANAS_STOCK) AS SEMANAS_STOCK FROM estructura_tarjetas a LEFT JOIN cat_tarjetas b ON a.codigo_producto = b.cod_producto LEFT JOIN mts_tarjetas_actual c ON a.codigo_producto = c.CODIGO_PRODUCTO WHERE a.estatus = 2 AND b.estatus = 2 AND b.id_proveedor = "& cint(proveedor) &" GROUP BY a.id_familia, a.id_movimiento, a.codigo_producto ORDER BY a.codigo_producto, a.id_familia, a.id_movimiento)) z LEFT JOIN cat_familia b ON z.id_familia = b.id_familia LEFT JOIN cat_movimientos c ON z.id_movimiento = c.id_movimiento LEFT JOIN mts_tarjetas_actual d ON z.codigo_producto = d.CODIGO_PRODUCTO GROUP BY z.id_familia, z.id_movimiento, z.codigo_producto ORDER BY z.codigo_producto, z.id_familia, z.id_movimiento) x "
end if
end if
end if

regresar=""
rs2.open sql3, conn3

if rs2.eof then
	cargaElementosPlasticos_paso2=response.write("<td bgcolor=""#95b3d7"" align=""center"" onclick=""alert('NO EXISTE DETALLE')""><font color=""#FFFFFF"">0</font></td>")
else
	regresar=regresar & "<td bgcolor=""#95b3d7"" align=""center"" onclick=""show_detalle('" & elemento & "'," & rs2("numElementos") &",'plasticos')""><font color=""#FFFFFF"">" & rs2("numElementos") & "</font></td>"   
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaElementosPlasticos_paso2=response.write(regresar)
end function

function comparteCon (item_gemalto)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3="SELECT d.familia, a.codigo_producto, b.producto, e.movimiento, IFNULL(c.STOCK_TOTAL, 0) as stock_total, IFNULL(c.CONSUMO_ACUMULADO_MES, 0) as CONSUMO_ACUMULADO_MES, IFNULL(c.CONSUMO_COBERTURA, 0) as CONSUMO_COBERTURA, IFNULL(c.SEMANAS_STOCK, 0) as SEMANAS_STOCK FROM estructura_tarjetas a LEFT JOIN cat_tarjetas b ON a.codigo_producto = b.cod_producto LEFT JOIN mts_tarjetas_actual c ON a.codigo_producto = c.CODIGO_PRODUCTO LEFT JOIN cat_familia d ON a.id_familia = d.id_familia LEFT JOIN cat_movimientos e ON a.id_movimiento = e.id_movimiento WHERE cod_est_insumo = '" & item_gemalto & "' AND b.estatus = 2 GROUP BY a.id_familia, a.codigo_producto, a.id_movimiento"

regresar=""
rs2.open sql3, conn3

if rs2.eof then
	comparteCon=regresar
else
while not(rs2.eof)
	regresar=regresar & "<tr><td align=""center""><font size=""-2"">" & rs2("familia") & "</font></td>"
	regresar=regresar & "<td align=""center""><font size=""-2"">" & rs2("codigo_producto") & "</font></td>"      
	regresar=regresar & "<td align=""center""><font size=""-2"">" & server.HTMLEncode(rs2("producto").value) & "</font></td>"      
	regresar=regresar & "<td align=""center""><font size=""-2"">" & rs2("movimiento") & "</font></td>"      
	regresar=regresar & "<td align=""center""><font size=""-2"">" & formatnumber(rs2("stock_total")) & "</font></td>"      
	regresar=regresar & "<td align=""center""><font size=""-2"">" & formatnumber(rs2("CONSUMO_ACUMULADO_MES")) & "</font></td>"
	regresar=regresar & "<td align=""center""><font size=""-2"">" & formatnumber(rs2("CONSUMO_COBERTURA")) & "</font></td>"
	regresar=regresar & "<td align=""center""><font size=""-2"">" & fix(rs2("SEMANAS_STOCK")) & "</font></td></tr>"      
rs2.movenext
wend	
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
comparteCon=response.write(regresar)


end function

function productos_afectados(codigo_producto,familia,movimiento,semaforo)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3="SELECT d.familia, a.codigo_producto, b.producto, e.movimiento, IFNULL(c.STOCK_TOTAL, 0) as stock_total, IFNULL(c.CONSUMO_ACUMULADO_MES, 0) as CONSUMO_ACUMULADO_MES, IFNULL(c.CONSUMO_COBERTURA, 0) as CONSUMO_COBERTURA, IFNULL(c.SEMANAS_STOCK, 0) as SEMANAS_STOCK FROM estructura_tarjetas a LEFT JOIN cat_tarjetas b ON a.codigo_producto = b.cod_producto LEFT JOIN mts_tarjetas_actual c ON a.codigo_producto = c.CODIGO_PRODUCTO LEFT JOIN cat_familia d ON a.id_familia = d.id_familia LEFT JOIN cat_movimientos e ON a.id_movimiento = e.id_movimiento WHERE cod_est_insumo = '" & item_gemalto & "' AND b.estatus = 2 GROUP BY a.id_familia, a.codigo_producto, a.id_movimiento"

regresar=""
rs2.open sql3, conn3

if rs2.eof then
	productos_afectados=regresar
else
while not(rs2.eof)
	regresar=regresar & "<tr><td align=""center""><font size=""-2"">" & rs2("familia") & "</font></td>"
	regresar=regresar & "<td align=""center""><font size=""-2"">" & rs2("codigo_producto") & "</font></td>"      
	regresar=regresar & "<td align=""center""><font size=""-2"">" & server.HTMLEncode(rs2("producto").value) & "</font></td>"      
	regresar=regresar & "<td align=""center""><font size=""-2"">" & rs2("movimiento") & "</font></td>"      
	regresar=regresar & "<td align=""center""><font size=""-2"">" & formatnumber(rs2("stock_total")) & "</font></td>"      
	regresar=regresar & "<td align=""center""><font size=""-2"">" & formatnumber(rs2("CONSUMO_ACUMULADO_MES")) & "</font></td>"
	regresar=regresar & "<td align=""center""><font size=""-2"">" & formatnumber(rs2("CONSUMO_COBERTURA")) & "</font></td>"
	regresar=regresar & "<td align=""center""><font size=""-2"">" & round(rs2("SEMANAS_STOCK")) & "</font></td></tr>"      
rs2.movenext
wend	
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
productos_afectados=response.write(regresar)


end function

function cargaHistoricoProductos(codigo_producto, mes)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3="SELECT b.cod_producto, b.producto, a.stock, c.mes, a.ano, d.proveedor FROM tarjetas_historico a LEFT JOIN cat_tarjetas b ON a.codigo_producto = b.cod_producto LEFT JOIN cat_meses c ON a.mes = c.id LEFT JOIN cat_proveedores d ON b.id_proveedor = d.id_proveedor WHERE NOT(b.cod_producto IS NULL) AND b.cod_producto = '" & codigo_producto &"' and ano in (Year(CURDATE())-2,Year(CURDATE())-1,Year(CURDATE())) and a.mes BETWEEN " & mes & " and " & mes +5 & " group by a.mes,ano order by ano desc,a.mes"

regresar=""
rs2.open sql3, conn3

if rs2.eof then
	cargaHistoricoProductos=regresar
else
while not(rs2.eof)
	regresar=regresar & "<td align=""center""><font size=""-2"">" & rs2("cod_producto") & "</font></td>"      
	regresar=regresar & "<td align=""center""><font size=""-2"">" & server.HTMLEncode(rs2("producto").value) & "</font></td>"      
	regresar=regresar & "<td align=""center""><font size=""-2"">" & formatnumber(rs2("stock")) & "</font></td>"      
	regresar=regresar & "<td align=""center""><font size=""-2"">" & rs2("MES") & "</font></td>"
	regresar=regresar & "<td align=""center""><font size=""-2"">" & rs2("ano") & "</font></td>"
	regresar=regresar & "<td align=""center""><font size=""-2"">" & rs2("proveedor") & "</font></td></tr>"      
rs2.movenext
wend	
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaHistoricoProductos=response.write(regresar)


end function

function cargaHistoricoProductosGrafica(codigo_producto, mes, ano)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3="SELECT b.cod_producto, b.producto, a.stock, c.mes, a.ano, d.proveedor FROM tarjetas_historico a LEFT JOIN cat_tarjetas b ON a.codigo_producto = b.cod_producto LEFT JOIN cat_meses c ON a.mes = c.id LEFT JOIN cat_proveedores d ON b.id_proveedor = d.id_proveedor WHERE NOT(b.cod_producto IS NULL) AND b.cod_producto = '" & codigo_producto &"' and ano ="& ano &" and a.mes BETWEEN " & mes & " and " & mes +5 & " GROUP BY a.mes  ORDER BY a.mes"

regresar=""
rs2.open sql3, conn3
cont=1
if rs2.eof then
	cargaHistoricoProductosGrafica=regresar
else
while not(rs2.eof)
	regresar=regresar & "<input type=""hidden"" name=""mes2014_" & cont & """ id=""mes2014_" & cont & """ value="  & rs2("stock") & "/>"     
	cont=cont+1
rs2.movenext
wend	
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaHistoricoProductosGrafica=response.write(regresar)


end function

function cargaHistoricoInsumos(codigo_insumos,mes)
set conn3=server.CreateObject("adodb.connection")
set rs2=server.CreateObject("adodb.recordset")
conn3.open connstr
sql3="SELECT b.Item_Gemalto, b.Descripcion, a.stock, c.mes, a.ano, d.proveedor FROM insumos_historico a LEFT JOIN cat_insumos b ON a.codigo_producto = b.Item_Gemalto LEFT JOIN cat_meses c ON a.mes = c.id LEFT JOIN cat_proveedores d ON b.proveedor = d.id_proveedor WHERE NOT(b.Item_Gemalto IS NULL) AND b.Item_Gemalto = '" & codigo_insumos & "'and ano in (Year(CURDATE())-2,Year(CURDATE())-1,Year(CURDATE())) and a.mes BETWEEN " & mes & " and " & mes +5 & " group by a.mes,ano order by ano desc,a.mes"

regresar=""
rs2.open sql3, conn3

if rs2.eof then
	cargaHistoricoInsumos=regresar
else
while not(rs2.eof)
	regresar=regresar & "<td align=""center""><font size=""-2"">" & rs2("Item_Gemalto") & "</font></td>"      
	regresar=regresar & "<td align=""center""><font size=""-2"">" & server.HTMLEncode(rs2("Descripcion").value) & "</font></td>"           
	regresar=regresar & "<td align=""center""><font size=""-2"">" & formatnumber(rs2("stock")) & "</font></td>"      
	regresar=regresar & "<td align=""center""><font size=""-2"">" & rs2("MES") & "</font></td>"
	regresar=regresar & "<td align=""center""><font size=""-2"">" & rs2("ano") & "</font></td>"
	regresar=regresar & "<td align=""center""><font size=""-2"">" & rs2("proveedor") & "</font></td></tr>"      
rs2.movenext
wend	
end if

rs2.close
conn3.close 
set rs2=nothing
set conn3=nothing
cargaHistoricoInsumos=response.write(regresar)


end function

%>