<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
plan=request("plan")

if plan="2" then 
response.write(plan)
 else
 response.write(plan)
end if
'call insertarLog(usuario,"LOGIN","", Request.ServerVariables("REMOTE_ADDR"))
'dependiendo del parametro de entrada se le llama una funcion que te redirige a la pagina de detalle
'response.write(rs("login_privilegio"))	
'seguimos al siguiente registro

'cerramos la tabla y damos un salto de linea	

%>


