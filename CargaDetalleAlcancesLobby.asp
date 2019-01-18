<!--#include file="funcion3/funcion.inc"-->
<% 
            cr = request("cr")
            id_zona=request("select_zona")
            id_territorio=request("select_territorial")
            nombre_lobby=request("nombre")
            num_atms=request("select_numeroAtms")
            fecha_autorizacion_voboCanales=request("corte")
            estatus_arrendamiento=request("arrendamiento")
            fecha_entrega_local_arrendamiento=request("corte2")
            fecha_entrega_anteproyecto=request("corte5")
            vobo_canales_anteproyecto=request("corte3")
            estatus_ingenieria=request("ingenieria")
            fecha_entrega_ingenieria=request("corte4")
            concurso_asignacion_proveedor=request("select_tipoProveedor")
            id_proveedor=request("select_contratistas")
            estatus_permisos=request("estatus_permiso")
            fecha_entrega_comercial=request("corte8")
            estatus_produccion=request("select_estatusProduccion")
            fecha_inicio_obra=request("corte6")
            fecha_termino_obra=request("corte7")
            id_lobby=request("id_lobby")
            inicio_reprogramado=request("inicio_reprogramado")
            fin_reprogramado=request("fin_reprogramado") 

Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr

'seleccionamos la consulta segun el parametro de entrada
    sql="SELECT * from  tseguimiento_lobby where id_lobby= " & id_lobby

'ejecutamos la consulta
rs.open sql,conn
'si la consula trajo registros
if rs.eof then
'escribimos los encabezados de la tabla
response.write("0")
'mientras el RecorSet no llegue al final se recorre
else
'dependiendo del parametro de entrada se le llama una funcion que te redirige a la pagina de detalle
    

            cr = rs("cr")
            id_zona= rs("id_zona")
            id_territorio=rs("id_territorio")
            nombre_lobby=rs("nombre_lobby")
            num_atms=rs("num_atms")
            fecha_autorizacion_voboCanales=rs("fecha_autorizacion_voboCanales")
            estatus_arrendamiento=rs("estatus_arrendamiento")
            fecha_entrega_local_arrendamiento=rs("fecha_entrega_local_arrendamiento")
            fecha_entrega_anteproyecto=rs("fecha_entrega_anteproyecto")
            vobo_canales_anteproyecto=rs("vobo_canales_anteproyecto")
            estatus_ingenieria=rs("estatus_ingenieria")
            fecha_entrega_ingenieria=rs("fecha_entrega_ingenieria")
            concurso_asignacion_proveedor=rs("concurso_asignacion_proveedor")
            id_proveedor=rs("id_proveedor")
            estatus_permisos=rs("estatus_permisos")
            fecha_entrega_comercial=rs("fecha_entrega_comercial")
            estatus_produccion=rs("estatus_produccion")
            fecha_inicio_obra=rs("fecha_inicio_obra")
            fecha_termino_obra=rs("fecha_termino_obra")
            id_lobby=rs("id_lobby")
            inicio_reprogramado=rs("inicio_reprogramado")
            fin_reprogramado=rs("fin_reprogramado")           
    
'seguimos al siguiente registro

'cerramos la tabla y damos un salto de linea    

end if
'cerramos el RecordSet y Cerramos la conexion
rs.close
conn.close 
set rs=nothing
set conn=nothing

response.redirect("editar_detalleAlcancesLobby.asp?cr="& cr & "&id_zona=" & id_zona  & "&id_territorio=" & id_territorio & "&lobby=" & nombre_lobby & "&num_atms=" & num_atms  & "&fecha_autorizacion_voboCanales=" & fecha_autorizacion_voboCanales & "&estatus_arrendamiento=" & estatus_arrendamiento & "&fecha_entrega_local_arrendamiento=" & fecha_entrega_local_arrendamiento & "&fecha_entrega_anteproyecto=" & fecha_entrega_anteproyecto & "&vobo_canales_anteproyecto=" & vobo_canales_anteproyecto & "&estatus_ingenieria=" & estatus_ingenieria & "&fecha_entrega_ingenieria=" & fecha_entrega_ingenieria & "&concurso_asignacion_proveedor=" & concurso_asignacion_proveedor & "&id_proveedor=" & id_proveedor & "&estatus_permisos=" & estatus_permisos & "&fecha_entrega_comercial=" & fecha_entrega_comercial & "&estatus_produccion=" & estatus_produccion & "&fecha_inicio_obra=" & fecha_inicio_obra & "&fecha_termino_obra=" & fecha_termino_obra & "&id_lobby=" & id_lobby & "&inicio_reprogramado=" & inicio_reprogramado & "&fin_reprogramado=" & fin_reprogramado)
%>
