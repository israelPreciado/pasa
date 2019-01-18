<!--#include file="xelupload.asp"-->
<!--#include file="funcion/funcion.inc"-->
<%
Dim objUpload, objFich, strNombreFichero
Dim strNombre, strEdad

'Creamos el objeto 
set objUpload = new xelUpload

'Recibimos el formulario
objUpload.Upload()

'Mostramos total de ficheros recibidos
Response.Write ( objUpload.Ficheros.Count & " ficheros recibidos.")
corte=objUpload.Form("corte")
ano=left(corte,4)
mes=right(corte,2)
'Mostramos los campos del formulario de texto:
Response.Write ("<p>Tu descripcion es " & objUpload.Form("txt_descripcion") & "<br>")
Response.Write ("<p>Tu no_servicios es " & objUpload.Form("txt_no_servicios") & "<br>")
Response.Write ("<p>Tu precio_unitario es " & objUpload.Form("txt_precio_unitario") & "<br>")
Response.Write ("<p>Tu precio_unitario es " & objUpload.Form("corte") & "<br>")
Response.Write ("<p>Tu precio_unitario es " & corte & "<br>")
'Y 

'ahora mostramos los datos del fichero enviado:
'Lo sacamos a una variable por comodidad
set objFich = objUpload.Ficheros("txt_adjunto")

Response.Write ("<p>" & objFich.Nombre & "<br>")
Response.Write("Tamaño: " & objFich.Tamano & "<br>")
Response.Write("Tipo de contenido: " & objFich.TipoContenido & "</p>")


	dia =""
	mes1=""
	if LEN(day(now())) =1 then
		dia="0" & day(now())
	else
		dia=day(now())
	end if
	if LEN(day(now())) =1 then
		mes1="0" & day(now())
	else
		mes1=day(now())
	end if		

max=100
min=1
Randomize
numRan=Int((max-min+1)*Rnd+min)
Response.Write("hoy: "&  numRan   &"</p>")
'Guardamos el fichero, con su nombre, en el directorio
'en el que se encuentra esta página
nombreArchivo=ano & mes & "-" & year(now()) & "-"&  mes1  & "-"&  dia & "-" & numRan & "-" & objFich.Nombre
'objFich.Guardar(Server.MapPath("adjuntos\"))
objFich.GuardarComo nombreArchivo, Server.MapPath("adjuntos\")


%>
