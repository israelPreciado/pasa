<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
cr = request("cr")
zonap = request("zonap")
bloque = request("bloque")
territorial = request("territorial")
sucursal = request("sucursal")
alcancet = request("alcancet")
inicio = request("inicio")
fin = request("fin")
domicilio = request("domicilio")
colonia = request("colonia")
m2 = request("m2")
regional = request("regional")
ciudad = request("ciudad")
estado = request("estado")
zonat = request("zonat")

Set conn = Server.CreateObject("ADODB.Connection")
 Conn.Open ConnStr

'seleccionamos la consulta segun el parametro de entrada


	sql="insert into cat_sucursales_lobby (ZONA,Territorial,CR,NOMBRE_SUCURSAL,ALCANCE_TIPO,INICIOPROYECTO,FINPROYECTO,domicilio,colonia,m2_construccion,Regional,ciudad,estado,zona_territorial) values ('" & zonap & "','" & Territorial & "','" & CR & "','" & sucursal & "','" & alcancet & "','" & inicio & "','" & fin &"','" & domicilio &"','" & colonia &"','" & m2 &"','" & regional &"','" & ciudad &"','" & estado &"','" & zonat &"')"
'ejecutamos la consulta
	response.write sql
	conn.execute sql

'validamos si la insercion fue satisfactoria y damos respuesta
	if err<>0 then
		conn.close 
		set conn=nothing
 		response.write("ErrorU")
	else
		conn.close 
		set conn=nothing
		response.write("OK")
	'CALL insertarLog(session.Contents("xmd"),"INSERT USUARIO",  login_usuario & "_" & login_nombre, Request.ServerVariables("REMOTE_ADDR") )
	end if

%>

