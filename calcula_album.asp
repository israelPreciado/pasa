<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1

cr=request("cr")
regresar=""

regresar=regresar & "<div class='modal-dialog'>"
regresar=regresar & "<div class='modal-content'>"
regresar=regresar & "<div class='modal-header' style='padding:10px 10px;'>"
regresar=regresar & "<button type='button' class='close' data-dismiss='modal' id='albumClose'>&times;</button>"
regresar=regresar & "<h4>Selecciona un Album</h4>"
regresar=regresar & "</div>"
regresar=regresar & "<div class='modal-body' style='padding:40px 50px;'>"
regresar=regresar & "<div id='years' align='center' style='display:block'>"

set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "select * from (select *, YEAR(fecha) as anio, MONTH(fecha) as mes,day(fecha) as dia from ctrl_fotografias)z where cr='" & cr & "' GROUP BY anio;"
rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close

regresar=regresar & " <table>"
regresar=regresar & "  <tr><td><div style='display:block'><table width='50%'><tr><td align='center'><p>No se han cargado imagenes</p></td></tr></table></div></td></tr>"
regresar=regresar & " </table>"

else
while not (rs1.eof)

regresar=regresar & " <table>"
regresar=regresar & "  <tr><td><div style='display:block'><table width='50%'><tr><td align='center'><p><img src='images/logos/album.png' onclick=""document.getElementById('years').style.display='none';document.getElementById('months" 
regresar=regresar &  rs1("anio") & "').style.display='block'""></p></td></tr><tr><td align='center'><p>" & rs1("anio") & "</p></td></tr></table></div></td></tr>"
regresar=regresar & " </table>"

rs1.movenext
wend 
rs1.close
conn3.close 
set rs1=nothing
set conn3=nothing
end if 

regresar=regresar & "</div>"
regresar=regresar & "<!--meses-->"

set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "select * from (select *, YEAR(fecha) as anio,MONTH(fecha) as mes,day(fecha) as dia from ctrl_fotografias)z where cr='" & cr & "' GROUP BY anio;"
rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close

regresar=regresar & " <table>"
regresar=regresar & "  <tr><td><div style='display:block'><table width='50%'><tr><td align='center'><p>No se han cargado imagenes (anios)</p></td></tr></table></div></td></tr>"
regresar=regresar & " </table>"

else
while not (rs1.eof)
	set rs2=server.CreateObject("adodb.recordset")
	sql2= "select *,case when mes=1 then 'ENERO' when mes=2 then 'FEBRERO' when mes=3 then 'MARZO' when mes=4 then 'ABRIL'when mes=5 then 'MAYO' when mes=6 then 'JUNIO' when mes=7 then 'JULIO' when mes=8 then 'AGOSTO' when mes=9 then 'SEPTIMBRE' when mes=10 then 'OCTUBRE' when mes=11 then 'NOVIEMBRE' when mes=12 then 'DICIEMBRE' end as mesName from (select *, YEAR(fecha) as anio,MONTH(fecha) as mes,day(fecha) as dia from ctrl_fotografias)z where anio='" & rs1("anio") & "'  AND  cr='" & cr & "' GROUP BY mes;"
	rs2.open sql2, conn3
	if rs2.eof then
		rs2.close
		conn3.close
		
regresar=regresar & " <table>"
regresar=regresar & "  <tr><td><div style='display:block'><table width='50%'><tr><td align='center'><p>No se han cargado imagenes (meses)</p></td></tr></table></div></td></tr>"
regresar=regresar & " </table>"
 
	else
	regresar=regresar & " <div id='months" & rs1("anio") &"' style='display:none'>"
	
		while not (rs2.eof)
 


regresar=regresar & "  <div style='display:block'><table width='50%'><tr><td align='center'><p><img src='images/logos/album.png' onclick=""document.getElementById('months" 
regresar=regresar   & rs1("anio") & "').style.display='none';document.getElementById('days" 
regresar=regresar & rs1("anio")& rs2("mes") & "').style.display='block'""></p></td></tr><tr><td align='center'><p>" & rs2("mesName") & "</p></td></tr></table></div>"



		rs2.movenext

		wend
			regresar=regresar & "</div>"	
		rs2.close
	end if
rs1.movenext
wend 
rs1.close
conn3.close 
set rs1=nothing
set conn3=nothing
end if 


regresar=regresar & "<!--dias-->"

set conn3=server.CreateObject("adodb.connection")
set rs1=server.CreateObject("adodb.recordset")
set rs2=server.CreateObject("adodb.recordset")
set rs3=server.CreateObject("adodb.recordset")
conn3.open connstr
sql1= "select * from (select *, YEAR(fecha) as anio,MONTH(fecha) as mes,day(fecha) as dia from ctrl_fotografias)z where cr='" & cr & "' GROUP BY anio;"
rs1.open sql1, conn3
if rs1.eof then
	rs1.close
	conn3.close

regresar=regresar & " <table>"
regresar=regresar & "  <tr><td><div style='display:block'><table width='50%'><tr><td align='center'><p>No se han cargado imagenes (anios)</p></td></tr></table></div></td></tr>"
regresar=regresar & " </table>"
 
else
while not (rs1.eof)
	sql2= "select * from (select *, YEAR(fecha) as anio,MONTH(fecha) as mes,day(fecha) as dia from ctrl_fotografias)z where anio='" & rs1("anio") & "' AND cr='" & cr & "'GROUP BY mes;"
	rs2.open sql2, conn3
	if rs2.eof then
		rs2.close
		conn3.close

regresar=regresar & " <table>"
regresar=regresar & "  <tr><td><div style='display:block'><table width='50%'><tr><td align='center'><p>No se han cargado imagenes (meses)</p></td></tr></table></div></td></tr>"
regresar=regresar & " </table>"

	else
		while not (rs2.eof)
			
			sql3= "select *, case when mes=1 then 'ENERO' when mes=2 then 'FEBRERO' when mes=3 then 'MARZO' when mes=4 then 'ABRIL'when mes=5 then 'MAYO' when mes=6 then 'JUNIO' when mes=7 then 'JULIO' when mes=8 then 'AGOSTO' when mes=9 then 'SEPTIMBRE' when mes=10 then 'OCTUBRE' when mes=11 then 'NOVIEMBRE' when mes=12 then 'DICIEMBRE' end as mesName from (select *, YEAR(fecha) as anio,MONTH(fecha) as mes,day(fecha) as dia from ctrl_fotografias)z where anio='" & rs1("anio") & "' and mes='" & rs2("mes") & "' AND cr='" & cr &"'GROUP BY dia;"
			rs3.open sql3, conn3
			if rs3.eof then
				rs3.close
				conn3.close
 
regresar=regresar & "  <table>"
regresar=regresar & "  <tr><td><div style='display:block'><table width='50%'><tr><td align='center'><p>No se han cargado imagenes (dias)</p></td></tr></table></div></td></tr>"
regresar=regresar & " </table>"
 
			else

regresar=regresar & "<div id='days" & rs1("anio") & rs2("mes") & "' style='display:none'>"
regresar=regresar & " <table>"

			while not (rs3.eof)		

regresar=regresar & " <tr height='20px'><td><div style='display:block'><table width='100%'><tr><td align='center' style='cursor:pointer' onclick=""document.getElementById('days"
regresar=regresar & rs1("anio") & rs2("mes") & "').style.display='none';document.getElementById('years').style.display='block';showModalFotos(document.getElementById('cr').value,'"
regresar=regresar & rs3("dia") & "','" & rs2("mes") & "','" & rs1("anio") & "')""><em><u><p>" & rs3("dia") & " " & rs3("mesName") & "</p></u></em></td></tr></table></div></td></tr>"


			rs3.movenext
			wend
			rs3.close

regresar=regresar & " </table>"
regresar=regresar & "</div>"
			
		end if
		rs2.movenext
		wend
		rs2.close
	end if
rs1.movenext
wend 
rs1.close
conn3.close 
set rs1=nothing
set conn3=nothing
end if 

regresar=regresar & " </div>"
regresar=regresar & "<div class='modal-footer'>"
regresar=regresar & "&nbsp;"
regresar=regresar & "</div>"
regresar=regresar & "</div>"
regresar=regresar & "</div>"
regresar=regresar & "</div> "


response.Write(regresar)
%>
