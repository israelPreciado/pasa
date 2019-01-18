<!--#include file="funcion3/funcion.inc"-->
<%'if isempty(session("cr")) then
'response.Redirect("default.asp?logout=true")
'end if%>
<%
response.expires=-1
On Error Resume Next
cr=request("select_cr")
id_tipoTransformacion=request("select_transformacion")
id_contratista=request("select_contratistas")
id_supervisor=request("select_supervisores")
id_tipoTransformacion=buscaTipoTransformacion(id_tipoTransformacion)
'cr="4567"
'pendiente="dedede"
'id_modulo="1"
'id_contratista="1"

fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr
	
sql="insert into tseguimiento (cr,tipoTransformacion,contratistaAsignado,estatusObra,avanceProyectado,avanceReal,supervisorAsignado) values ('" & cr & "','" & id_tipoTransformacion & "','" & id_contratista& "',0,'0','0','" & id_supervisor & "')"

'ejecutamos la consulta

conn.execute sql
sql="insert into tseguimientocontratista (cr,tipoTransformacion,contratistaAsignado,estatusObra,avanceProyectado,avanceReal,supervisorAsignado) values ('" & cr & "','" & id_tipoTransformacion & "','" & id_contratista& "',0,'0','0','" & id_supervisor & "')"

'ejecutamos la consulta

conn.execute sql
'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn.close 
	set conn=nothing
 	response.Redirect("asignarObra.asp?err=InsertError")
else
	sql="UPDATE tseguimiento a LEFT JOIN cat_sucursales b on a.cr=b.cr set a.Sucursal=b.NOMBRE_SUCURSAL,a.FechaInicio=b.INICIOPROYECTO,a.FechaTermino=b.FINPROYECTO where a.cr='" & cr & "';"
	conn.execute sql
	sql="UPDATE tseguimientocontratista a LEFT JOIN cat_sucursales b on a.cr=b.cr set a.Sucursal=b.NOMBRE_SUCURSAL,a.FechaInicio=b.INICIOPROYECTO,a.FechaTermino=b.FINPROYECTO where a.cr='" & cr & "';"
	conn.execute sql
if err<>0 then
	conn.close 
	set conn=nothing
 	response.Redirect("asignarObra.asp?err=InsertError")
else
	sql="select * from cat_componentes"
	rs.open sql,conn
		while not(rs.eof)
			if id_tipoTransformacion="A" then
				sql="update tseguimiento set " & rs("nameBD") & "='" & rs("valTransTipoA") & "' where cr='" & cr & "'"
				sql2="update tseguimientocontratista set " & rs("nameBD") & "='" & rs("valTransTipoA") & "' where cr='" & cr & "'"				
			else
				sql="update tseguimiento set " & rs("nameBD") & "='" & rs("valTransTipoB") & "' where cr='" & cr & "'"
				sql2="update tseguimientocontratista set " & rs("nameBD") & "='" & rs("valTransTipoB") & "' where cr='" & cr & "'"
			end if
			conn.execute sql
			conn.execute sql2
		rs.movenext
		wend 
	rs.close
	conn.close 
	set conn=nothing
	response.Redirect("detalleAlcances.asp?cr=" & cr)
end if	
end if
	
%>

