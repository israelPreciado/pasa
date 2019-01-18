<!--#include file="funcion/funcion.inc"-->
<%if isempty(session("cr")) then
response.Redirect("default.asp?logout=true")
end if%>
<%
response.expires=-1
campo=request("campo")
cr=request("cr")
valor=request("valor")
tabla=request("tabla")
fecha=Year(Now) & "-" & LPad(Month(Now),2,"0") & "-" &  LPad(Day(Now),2,"0") & " " & Time
Set conn12 = Server.CreateObject("ADODB.Connection")
Conn12.Open connstr

'seleccionamos la consulta segun el parametro de entrada
	
if tabla="1" then
sql12="update tseguimiento set " & campo &"='" & valor & "' where cr='"& cr &"';"
else
sql12="update tseguimientoContratista set " & campo &"='" & valor & "' where cr='"& cr &"';"
end if
'ejecutamos la consulta
conn12.execute sql12
if valor="NA" then
sql13="update tseguimientoContratista set " & campo &"='" & valor & "' where cr='"& cr &"';"
conn12.execute sql13
end if
'validamos si la insercion fue satisfactoria y damos respuesta
if err<>0 then
	conn12.close 
	set conn12=nothing
 	response.write("err")
else 
if tabla="1" then
set rs12= Server.CreateObject("adodb.recordset")
sql12= "select * from tseguimiento where cr='" & session.Contents("cr") & "'"
rs12.open sql12,conn12
	if rs12.eof then
	else
		if (cDbl(calculaAvanceProyectado7030(cr,rs12("fechaInicio")))>cDbl(calculaAvanceGeneral(cr,"G"))) then
			sql13="update tseguimiento set EstatusObra=2 , fUltimoReporte ='"  &  Year(Now) & "-" & LPad(Month(Now),2,"0")  & "-" & LPad(Day(Now),2,"0") & "' where cr='" & cr & "'"
			conn12.execute sql13
		else
			if (cDbl(calculaAvanceProyectado7030(cr,rs12("fechaInicio")))<cDbl(calculaAvanceGeneral(cr,"G"))) then
			sql13="update tseguimiento set EstatusObra=1 , fUltimoReporte ='" & LPad(Day(Now),2,"0") & "/" & LPad(Month(Now),2,"0") & "/" &   Year(Now) & "' where cr='" & cr & "'"
			conn12.execute sql13
			else
			sql13="update tseguimiento set EstatusObra=3 , fUltimoReporte ='" & LPad(Day(Now),2,"0") & "/" & LPad(Month(Now),2,"0") & "/" &   Year(Now) & "',fecha_finReal ='" & LPad(Day(Now),2,"0") & "/" & LPad(Month(Now),2,"0") & "/" &   Year(Now) & "' where cr='" & cr & "'"
			conn12.execute sql13
			end if			
		end if
	end if
	rs12.close
	conn12.close 	
	set conn12=nothing
	response.write("ok")
	end if
end if
	
%>

