<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%> 
<!--#include file="xelupload.asp"-->
<!--#include file="funcion/funcion.inc"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin título</title>
<%if isempty(session("cr")) then
response.Redirect("default.asp?logout=true")
end if%>
<%
Dim objUpload, objFich
'Creamos el objeto 
set objUpload = new xelUpload

'Recibimos el formulario
objUpload.Upload()

 sinFoto=objUpload.Form("sinFoto")
 if sinfoto<>"sinFoto" then
set objFich = objUpload.Ficheros("fileFotografia")
 tamano=objFich.Tamano
 tipo=objFich.TipoContenido
  nombreArchivo= fecha & "cr" & cr & "mod" & modulo & objFich.Nombre
 end if
fecha=Year(Now) & LPad(Month(Now),2,"0") & LPad(Day(Now),2,"0") & LPad(hour(time),2,"0") & LPad(minute(time),2,"0")  & LPad(second(time),2,"0")
 'cr=session.Contents("cr")
 cr=objUpload.Form("atmPendiente")
 id_pendiente=objUpload.Form("id_pendiente")
 accion=objUpload.Form("accion")
 cerrar=objUpload.Form("cierraPendiente")
 sinFoto=objUpload.Form("sinFoto")


'Guardamos el fichero, con su nombre, en el directorio
'en el que se encuentra esta página
'objFich.Guardar Server.MapPath("adjuntos/")
Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr

if sinfoto<>"sinFoto" then		
if cerrar="cerrar" and isempty(objFich) then
	fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
	sql="update pendientes_aSupervisor set id_estatus='0', fecha_finalizacion='" & fecha  &"' where id_pendiente='" & id_pendiente & "';"
	'ejecutamos la consulta
	conn.execute sql
	set objFich=nothing
	set objUpload=nothing
	conn.close 
	set conn=nothing
	response.redirect("totalPendientes.asp?res=tipo&hddnEnviar=" & modulo)
else
	if sinFoto="sinFoto" and isempty(objFich) then
		if cerrar="cerrar" then
			fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
			sql="update pendientes_aSupervisor set id_estatus='0', fecha_finalizacion='" & fecha  &"' where id_pendiente='" & id_pendiente & "';"
			'ejecutamos la consulta
			conn.execute sql
			set objFich=nothing
			set objUpload=nothing
			conn.close 
			set conn=nothing
			response.redirect("modalTest.asp?res=tipo&hddnEnviar=" & modulo)
		else
			if accion="1" then
				response.redirect("insertPendiente2Supervisor.asp?cr=" + cr + "&pendiente=" + pendiente )
			else
				response.redirect("updatePendiente2Supervisor.asp?pendiente=" + pendiente + "&id_pendiente=" + id_pendiente)
			end if
		end if
	else
		if objFich.TipoContenido="image/jpeg" or  objFich.TipoContenido="image/png"  or objFich.TipoContenido="image/bmp" then 
			if tamano >= 6000000 then
				set objFich=nothing
				set objUpload=nothing
				response.redirect("modalTest.asp?res=tamano&hddnEnviar=" & modulo)
			else
				objFich.GuardarComo nombreArchivo, Server.MapPath("adjuntos/PendientesASupervisor/" & modulo  )
				set objFich=nothing
				set objUpload=nothing

				if cerrar="cerrar" then
					sql="insert into ctrl_fotografiasPendientes_asupervisor (cr,name,path,id_pendiente) values ('" & cr & "','" & nombreArchivo & "','adjuntos/PendientesASupervisor/'," & id_pendiente & ")"
				else
					sql="insert into ctrl_fotografiasPendientes_asupervisor (cr,name,path) values ('" & cr & "','" & nombreArchivo & "','adjuntos/PendientesASupervisor/')"
				end if
				'ejecutamos la consulta
				conn.execute sql
				'validamos si la insercion fue satisfactoria y damos respuesta
				if err<>0 then
					conn.close 
					set conn=nothing
					response.redirect("pendientesObra2.asp?res=err&hddnEnviar=" & modulo)
				else
					if cerrar="cerrar" then
						fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
						sql="update pendientes_asupervisor set id_estatus='0', fecha_finalizacion='" & fecha  &"', id_fotografia='" & nombreArchivo & "' where id_pendiente='" & id_pendiente & "';"
						'ejecutamos la consulta
						conn.execute sql
						set objFich=nothing
						set objUpload=nothing
						conn.close 
						set conn=nothing
						response.redirect("modaltest.asp?res=tipo&hddnEnviar=" & modulo)
					else
						fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
						if accion="1" then
							response.redirect("insertPendienteSupervisor.asp?cr=" + cr + "&pendiente=" + pendiente + "&id_fotografia=" + nombreArchivo)
						else
							response.redirect("updatePendienteSupervisor.asp?pendiente=" + pendiente + "&id_pendiente=" + id_pendiente + "&id_fotografia='" + nombreArchivo + "'")
						end if
					end if
				end if
			end if
		else
			set objFich=nothing
			set objUpload=nothing
			conn.close 
			set conn=nothing
			if cerrar="cerrar" then
				response.redirect("totalPendientes.asp?res=tipo&hddnEnviar=" & modulo)
			else
				response.redirect("pendientesObra2.asp?res=tipo&hddnEnviar=" & modulo)
			end if
		end if
	end if	
end if
else
fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
						sql="update pendientes_asupervisor set id_estatus='0', fecha_finalizacion='" & fecha  &"' where id_pendiente='" & id_pendiente & "';"
						'ejecutamos la consulta
						conn.execute sql
						set objFich=nothing
						set objUpload=nothing
						conn.close 
						set conn=nothing
						response.redirect("totalPendientesaSupervisor.asp")
end if

%>