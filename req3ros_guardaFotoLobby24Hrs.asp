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

 cr=objUpload.Form("hddnCR")
para=objUpload.Form("para")
cc=objUpload.Form("cc")

if objUpload.Ficheros.Count=1 then
set objFich = objUpload.Ficheros("fileFotografia1")
 nombreArchivo= cr & objFich.Nombre
 tamano=objFich.Tamano
 tipo=objFich.TipoContenido
end if
if objUpload.Ficheros.Count=2 then
set objFich = objUpload.Ficheros("fileFotografia1")
set objFich2 = objUpload.Ficheros("fileFotografia2")
 nombreArchivo= cr & objFich.Nombre
 nombreArchivo2= cr & objFich2.Nombre
 tamano=objFich.Tamano
 tamano2=objFich2.Tamano
 tipo=objFich.TipoContenido
 tipo2=objFich2.TipoContenido
end if
if objUpload.Ficheros.Count=3 then
set objFich = objUpload.Ficheros("fileFotografia1")
set objFich2 = objUpload.Ficheros("fileFotografia2")
set objFich3 = objUpload.Ficheros("fileFotografia3")
 nombreArchivo= cr & objFich.Nombre
 nombreArchivo2= cr & objFich2.Nombre
 nombreArchivo3= cr & objFich3.Nombre
 tamano=objFich.Tamano
 tamano2=objFich2.Tamano
 tamano3=objFich3.Tamano
 tipo=objFich.TipoContenido
 tipo2=objFich2.TipoContenido
 tipo3=objFich3.TipoContenido
end if
 
if session.Contents("privilegio")=3 then
 usuario=session.Contents("contratista")
else 
 usuario=session.Contents("id")
end if
 perfil=session.Contents("privilegio")
'Guardamos el fichero, con su nombre, en el directorio
'en el que se encuentra esta página
'objFich.Guardar Server.MapPath("adjuntos/")

'inicio 1 elemento+++++++++++++++++++++++++++++++++++++
if objUpload.Ficheros.Count=1 then

if objFich.TipoContenido="image/jpeg" or  objFich.TipoContenido="image/png"  or objFich.TipoContenido="image/bmp" then 
if tamano >= 6000000 then

set objFich=nothing
set objUpload=nothing
response.redirect("tomarFoto.asp?res=tamano")
else

objFich.GuardarComo nombreArchivo, Server.MapPath("adjuntos/Req3ros_Lobby_24")
set objFich=nothing
set objUpload=nothing

Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr
fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
'sql="insert into ctrl_envioLobby24hrs (cr,para,cc,estado,path,archivo,usuario,perfil,last) values ('" & cr & "','" & para & "','" & cc & "',1,'adjuntos/Req3ros_Lobby_24/','" & usuario & "'," & cint(perfil) & ",'" & fecha & "')"
sql="INSERT INTO `ctrl_envioLobby24hrs` (`cr`, `para`, `cc`, `estado`,`path`,`archivo`,`usuario`,`perfil`) VALUES ('" & cr & "', '" & para &"', '" & cc & "', 1, 'adjuntos/Req3ros_Lobby_24','" & nombreArchivo & "','" & usuario & "'," & cint(perfil) & ")"
'ejecutamos la consulta
conn.execute sql

'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn.close 
	set conn=nothing
 	response.redirect("modulos.asp?res=lobby24err")
else
'sql2="delete from ctrl_fotografias where id_zona='" & zona & "' and cr ='" & cr & "' and fecha < (select max(a.fecha) as fechaMax from (SELECT a.id_foto, a.cr, a.id_zona,a.fecha FROM ctrl_fotografias a LEFT JOIN cat_zonafotografica b ON a.id_zona = b.id_zona WHERE a.CR = '" & cr & "' and b.id_zona ='" & zona & "') a);"
'conn.execute sql2
	conn.close 
	set conn=nothing
	response.redirect("modulos.asp?res=lobby24ok")
end if


end if
else

set objFich=nothing
set objUpload=nothing
response.redirect("modulos.asp?res=tipo")
end if
end if
'fin 1 elemento++++++++++++++++++++++++++++++++++++++++++++++++

'inicio 2 elemento+++++++++++++++++++++++++++++++++++++++++++++
if objUpload.Ficheros.Count=2 then

if (objFich.TipoContenido="image/jpeg" or  objFich.TipoContenido="image/png"  or objFich.TipoContenido="image/bmp") and (objFich2.TipoContenido="image/jpeg" or  objFich2.TipoContenido="image/png"  or objFich2.TipoContenido="image/bmp") then 
if tamano >= 6000000  or tamano2 >= 6000000 then

set objFich=nothing
set objUpload=nothing
response.redirect("tomarFoto.asp?res=tamano")
else

objFich.GuardarComo nombreArchivo, Server.MapPath("adjuntos/Req3ros_Lobby_24")
objFich2.GuardarComo nombreArchivo2, Server.MapPath("adjuntos/Req3ros_Lobby_24")
set objFich=nothing
set objFich2=nothing
set objUpload=nothing

Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr
fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
'sql="insert into ctrl_envioLobby24hrs (cr,para,cc,estado,path,archivo,usuario,perfil,last) values ('" & cr & "','" & para & "','" & cc & "',1,'adjuntos/Req3ros_Lobby_24/','" & usuario & "'," & cint(perfil) & ",'" & fecha & "')"
sql="INSERT INTO `ctrl_envioLobby24hrs` (`cr`, `para`, `cc`, `estado`,`path`,`archivo`,`archivo2`,`usuario`,`perfil`) VALUES ('" & cr & "', '" & para &"', '" & cc & "', 1, 'adjuntos/Req3ros_Lobby_24','" & nombreArchivo & "','" & nombreArchivo2 & "','" & usuario & "'," & cint(perfil) & ")"
'ejecutamos la consulta
conn.execute sql

'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn.close 
	set conn=nothing
 	response.redirect("modulos.asp?res=lobby24err")
else
'sql2="delete from ctrl_fotografias where id_zona='" & zona & "' and cr ='" & cr & "' and fecha < (select max(a.fecha) as fechaMax from (SELECT a.id_foto, a.cr, a.id_zona,a.fecha FROM ctrl_fotografias a LEFT JOIN cat_zonafotografica b ON a.id_zona = b.id_zona WHERE a.CR = '" & cr & "' and b.id_zona ='" & zona & "') a);"
'conn.execute sql2
	conn.close 
	set conn=nothing
	response.redirect("modulos.asp?res=lobby24ok")
end if


end if
else

set objFich=nothing
set objFich2=nothing
set objUpload=nothing
response.redirect("modulos.asp?res=tipo")
end if
end if
'fin 2 elemento+++++++++++++++++++++++++++++++++++++++++++++++++++

'inicio 3 elemento+++++++++++++++++++++++++++++++++++++++++++++
if objUpload.Ficheros.Count=3 then

if (objFich.TipoContenido="image/jpeg" or  objFich.TipoContenido="image/png"  or objFich.TipoContenido="image/bmp") and (objFich2.TipoContenido="image/jpeg" or  objFich2.TipoContenido="image/png"  or objFich2.TipoContenido="image/bmp") and (objFich3.TipoContenido="image/jpeg" or  objFich3.TipoContenido="image/png"  or objFich3.TipoContenido="image/bmp") then 
if tamano >= 6000000  or tamano2 >= 6000000 then

set objFich=nothing
set objFich2=nothing
set objFich3=nothing
set objUpload=nothing
response.redirect("tomarFoto.asp?res=tamano")
else

objFich.GuardarComo nombreArchivo, Server.MapPath("adjuntos/Req3ros_Lobby_24")
objFich2.GuardarComo nombreArchivo2, Server.MapPath("adjuntos/Req3ros_Lobby_24")
objFich3.GuardarComo nombreArchivo3, Server.MapPath("adjuntos/Req3ros_Lobby_24")
set objFich=nothing
set objFich2=nothing
set objFich3=nothing
set objUpload=nothing

Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr
fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
'sql="insert into ctrl_envioLobby24hrs (cr,para,cc,estado,path,archivo,usuario,perfil,last) values ('" & cr & "','" & para & "','" & cc & "',1,'adjuntos/Req3ros_Lobby_24/','" & usuario & "'," & cint(perfil) & ",'" & fecha & "')"
sql="INSERT INTO `ctrl_envioLobby24hrs` (`cr`, `para`, `cc`, `estado`,`path`,`archivo`,`archivo2`,`archivo3`,`usuario`,`perfil`) VALUES ('" & cr & "', '" & para &"', '" & cc & "', 1, 'adjuntos/Req3ros_Lobby_24','" & nombreArchivo & "','" & nombreArchivo2 & "','" & nombreArchivo3 & "','" & usuario & "'," & cint(perfil) & ")"
'ejecutamos la consulta
conn.execute sql

'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn.close 
	set conn=nothing
 	response.redirect("modulos.asp?res=lobby24err")
else
'sql2="delete from ctrl_fotografias where id_zona='" & zona & "' and cr ='" & cr & "' and fecha < (select max(a.fecha) as fechaMax from (SELECT a.id_foto, a.cr, a.id_zona,a.fecha FROM ctrl_fotografias a LEFT JOIN cat_zonafotografica b ON a.id_zona = b.id_zona WHERE a.CR = '" & cr & "' and b.id_zona ='" & zona & "') a);"
'conn.execute sql2
	conn.close 
	set conn=nothing
	response.redirect("modulos.asp?res=lobby24ok")
end if


end if
else

set objFich=nothing
set objFich2=nothing
set objFich3=nothing
set objUpload=nothing
response.redirect("modulos.asp?res=tipo")
end if
end if
'fin 3 elemento+++++++++++++++++++++++++++++++++++++++++++++++++++
'objFich.Guardar(Server.MapPath("adjuntos\"))

%>