<!--#include file="funcion3/funcion.inc"-->
<%'if isempty(session("cr")) then
'response.Redirect("default.asp?logout=true")
'end if%>
<%
response.expires=-1
cr=request("cr")
'pendiente=request("pendiente")
id_modulo=request("modulo")
fechaInicio=request("corte")
fechaFin=request("corte2")
select_transformacion=request("select_transformacion")
if select_transformacion="1" then 
	select_transformacion="A"
else
	if select_transformacion="2" then 
		select_transformacion="B"
	end if
end if	
'id_contratista=request("id_contratista")
'cr="4567"
'pendiente="dedede"
'id_modulo="1"
'id_contratista="1"


'fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
Set conn = Server.CreateObject("ADODB.Connection")
Conn.Open connstr
sql4="update tseguimiento set FechaInicio='" & fechaInicio & "' where cr='" & cr & "'"
sql5="update tseguimiento set Fechatermino='" & fechaFin & "' where cr='" & cr & "'"
sql6="update tseguimiento set TipoTransformacion='" & select_transformacion & "' where cr='" & cr & "'"
sql7="update cat_sucursales set inicioProyecto='" & fechaInicio & "' where cr='" & cr & "'"
sql8="update cat_sucursales set finproyecto='" & fechaFin & "' where cr='" & cr & "'"
sql9="update cat_sucursales set alcance_tipo='" & select_transformacion & "' where cr='" & cr & "'"
sql3="delete from costoestimado where cr='" & cr & "' and id_modulo='" & id_modulo & "'"
		conn.execute sql4
		conn.execute sql5
		conn.execute sql6
		conn.execute sql7
		conn.execute sql8
		conn.execute sql9
		conn.execute sql3
set rs1=server.CreateObject("adodb.recordset")
sql="SELECT * from cat_componentes where id_modulo='" & id_modulo & "'"
rs1.open sql, conn

while not(rs1.eof)
		txt_costo1=request("txt_costo" & rs1("nameBD"))
		txt_cantidad1=request("txt_cantidad" & rs1("nameBD"))
		id_componente=buscaIdComponente(rs1("nameBD"))
		if txt_costo1<> "" then
		sql2="insert into costoestimado (cr,id_modulo,id_componente,monto,cantidad) values ('" & cr & "'," & id_modulo & "," & id_componente & ",'" & txt_costo1 & "','" & txt_cantidad1 &"')"
		conn.execute sql2
		end if
		'response.write(txt_costo1)
		'response.write("<br/>")
rs1.movenext
wend
		
rs1.close


conn.close 
set conn=nothing	
'sql="insert into pendientes (cr,pendiente,id_modulo,id_contratista,id_estatus,fecha_reporte) values ('" & cr & "','" & pendiente & "'," & id_modulo & "," & id_contratista & ",1,'" & fecha &"')"

'ejecutamos la consulta
'conn.execute sql

'validamos si la insercion fue satisfactoria y damos respuesta
'if err<>0 then
'	conn.close 
'	set conn=nothing
 	'response.Redirect("pendientesObra2.asp?err=InsertError")
'else
'	conn.close 
'	set conn=nothing
	response.Redirect("detalleAlcances.asp?cr="& cr & "&err=ok")
'end if
	
%>

