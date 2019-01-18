<!--#include file="funcion3/funcion.inc"-->
<%

response.expires=-1
'On Error Resume Next


Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr
'ruta=	Server.MapPath("archivos/plantillaCargaConceptos.csv")
'ruta = Replace(ruta,"\","/")
sql="LOAD DATA LOCAL INFILE 'C:/inetpub/wwwroot/bnrt/archivos/plantillaCargaConceptos.csv' INTO TABLE cat_conceptosSucursales_sap FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n'"
'sql2="delete from cat_conceptosSucursales_sap where clavesap='clave sap' and txtbrv='txt brv'"
'ejecutamos la consulta
conn.execute sql
conn.close
response.write(sql)
'response.redirect("subirArchivo.asp?res=ok")
%>
