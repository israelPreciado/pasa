<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%> 
<!--#include file="xelupload.asp"-->
<!--#include file="funcion/funcion_lobby.inc"-->
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


set objFich = objUpload.Ficheros("fileFotografia")


 cr=objUpload.Form("hddnCR")
 modulo=objUpload.Form("hddnEnviar")
 zona=objUpload.Form("hddnZona")
 comentario=objUpload.Form("atxtComentario")
 nombreZona=buscaZona(zona)
 nombreArchivo= cr & objFich.Nombre
 tamano=objFich.Tamano
 tipo=objFich.TipoContenido
if session.Contents("privilegio")=3 then
 usuario=session.Contents("contratista")
else 
 usuario=session.Contents("id")
end if
 perfil=session.Contents("privilegio")
'Guardamos el fichero, con su nombre, en el directorio
'en el que se encuentra esta página
'objFich.Guardar Server.MapPath("adjuntos/")

if objFich.TipoContenido="image/jpeg" or  objFich.TipoContenido="image/png"  or objFich.TipoContenido="image/bmp" then 
if tamano >= 6000000 then

set objFich=nothing
set objUpload=nothing
response.redirect("tomarFoto_lobby.asp?res=tamano")
else

objFich.GuardarComo nombreArchivo, Server.MapPath("adjuntos/" & nombreZona  )
set objFich=nothing
set objUpload=nothing

Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr
	
sql="insert into ctrl_fotografias_lobby (cr,id_zona,name,path,comentario,usuario,perfil) values ('" & cr & "'," & zona & ",'" & nombreArchivo & "','adjuntos/" & nombreZona & "/','" & comentario & "','" & usuario & "'," & cint(perfil) & ")"

'ejecutamos la consulta
conn.execute sql

'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn.close 
	set conn=nothing
 	response.redirect("modulos_lobby.asp?res=err")
else
'sql2="delete from ctrl_fotografias where id_zona='" & zona & "' and cr ='" & cr & "' and fecha < (select max(a.fecha) as fechaMax from (SELECT a.id_foto, a.cr, a.id_zona,a.fecha FROM ctrl_fotografias a LEFT JOIN cat_zonafotografica b ON a.id_zona = b.id_zona WHERE a.CR = '" & cr & "' and b.id_zona ='" & zona & "') a);"
'conn.execute sql2
	conn.close 
	set conn=nothing
	response.redirect("modulos_lobby.asp?res=ok")
end if


end if
else

set objFich=nothing
set objUpload=nothing
response.redirect("modulos_lobby.asp?res=tipo")
end if
'


'objFich.Guardar(Server.MapPath("adjuntos\"))

%>