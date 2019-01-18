<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%> 
<!--#include file="xelupload.asp"-->
<!--#include file="funcion/funcion.inc"-->
<%
'On Error Resume Next
Dim objUpload, objFich
'Creamos el objeto 
set objUpload = new xelUpload

'Recibimos el formulario
objUpload.Upload()


set objFich = objUpload.Ficheros("fileFotografia")
fecha=Year(Now) & LPad(Month(Now),2,"0") & LPad(Day(Now),2,"0") & LPad(hour(time),2,"0") & LPad(minute(time),2,"0")  & LPad(second(time),2,"0")
 nombreArchivo= fecha & "_" & objFich.Nombre
 tamano=objFich.Tamano
 tipo=objFich.TipoContenido
'Guardamos el fichero, con su nombre, en el directorio
'en el que se encuentra esta página
'objFich.Guardar Server.MapPath("adjuntos/")

'if nombreArchivo="plantillaCargaConceptos.csv" then
'if objFich.TipoContenido="application/vnd.ms-excel" or objFich.TipoContenido="application/octet-stream" then 
	if tamano >= 6000000 then

		set objFich=nothing
		set objUpload=nothing
		response.redirect("subirArchivo.asp?res=tamano")
	else

		objFich.GuardarComo nombreArchivo, Server.MapPath("archivos/" )
		set objFich=nothing
		set objUpload=nothing

		Set conn = Server.CreateObject("ADODB.Connection")
		Conn.Open connstr
	
		sql="insert into ctrl_archivos (name,path,bandera) values ('" & nombreArchivo & "','archivos/',1)"

'ejecutamos la consulta
		conn.execute sql

'validamos si la insercion fue satisfactoria y damos respuesta
		if err<>0 then
			conn.close 
			set conn=nothing
			response.redirect("subirArchivo.asp?res=err")
		else
			conn.close 
			set conn=nothing
			response.redirect("subirArchivo.asp?res=ok")
		end if

	
	end if
'else

'set objFich=nothing
'set objUpload=nothing
'response.redirect("subirArchivo.asp?res=tipo")
'end if



'objFich.Guardar(Server.MapPath("adjuntos\"))

%>