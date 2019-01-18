<!--#include file="funcion3/funcion.inc"-->
<!--#include file="funcion3/funcion_edicion_usuarios.inc"-->
<%
	if isempty(session("cr")) then
		session.Abandon()
		response.Redirect("/bnrt/")
	end if
	
response.expires=-1
id=request("id")

regresa=""
 regresa=regresa & "<div class='w3-modal-content w3-card-4'>"
       regresa=regresa & "<header class='w3-container w3-red'> "
         regresa=regresa & "<span onclick='document.getElementById(""id01"").style.display=""none""'"
         regresa=regresa & "class='w3-button w3-display-topright'>&times;</span>"
		 
Set conn5 = Server.CreateObject("ADODB.Connection")
set rs25= Server.CreateObject("adodb.recordset")
Conn5.Open connstr
sql= "SELECT *, ROUND((CANTIDAD * PU) *(PORAVANCE / 100), 2) AS porAvancePesos FROM( SELECT * FROM( SELECT a.id, a.CLAVE_SAP_CONCURSO, a.clave_sap_zona, b.DESCRIPCION_CORTA, b.descripcion_larga, a.pu, a.cantidad, b.UND, a.componente, concat( LEFT(a.fecha_ingreso, 4), '-', RIGHT(LEFT(a.fecha_ingreso, 7), 2), '-', RIGHT(LEFT(a.fecha_ingreso, 10), 2), ' ', RIGHT(a.fecha_ingreso, 8)) AS fecha_ingreso, a.avance, a.avanceContratista, CASE WHEN a.avance >= 0 THEN round((a.avance * 100) / a.cantidad, 2) ELSE 0 END AS porAvance FROM nuevoCosto_estimadoObra_lobby a LEFT JOIN cat_sap_2017 b ON a.CLAVE_SAP_CONCURSO = b.CLAVE_SAP_CONCURSO WHERE cr = '" & session.contents("cr") & "' AND a.componente NOT LIKE 'Otros' AND a.componente NOT LIKE 'atms') AS a UNION SELECT * FROM( SELECT a.id, a.CLAVE_SAP_CONCURSO, a.clave_sap_zona, b.DESCRIPCION_CORTA, b.descripcion_larga, a.pu, a.cantidad, b.UND, a.componente, concat( LEFT(a.fecha_ingreso, 4), '-', RIGHT(LEFT(a.fecha_ingreso, 7), 2), '-', RIGHT(LEFT(a.fecha_ingreso, 10), 2), ' ', RIGHT(a.fecha_ingreso, 8)) AS fecha_ingreso, a.avance, a.avanceContratista, CASE WHEN a.avance >= 0 THEN round((a.avance * 100) / a.cantidad, 2) ELSE 0 END AS porAvance FROM nuevoCosto_estimadoObra_lobby a LEFT JOIN cat_sap_atms_2017 b ON a.CLAVE_SAP_CONCURSO = b.CLAVE_SAP_CONCURSO WHERE cr = '" & session.contents("cr") & "' AND a.componente NOT LIKE 'Otros' AND a.componente LIKE 'atms') AS b UNION( SELECT id, clave_sap_concurso, clave_sap_zona, descorta AS descripcion_corta, deslarga AS descripcion_larga, pu, cantidad, und, componente, fecha_ingreso, avance, avanceContratista, CASE WHEN avance >= 0 THEN(avance * 100) / cantidad ELSE 0 END AS porAvance FROM nuevocosto_estimadoobra_lobby WHERE cr = '" & session.contents("cr") & "' AND componente LIKE 'Otros') ORDER BY fecha_ingreso DESC) a WHERE id ='" & id & "'"
rs25.open sql,conn5
if rs25.eof then
regresa=regresa & "<h2 align='center'>CLAVE SAP</h2>"
		 regresa=regresa & "<h2 align='center'></h2>"
       regresa=regresa & "</header>"
       regresa=regresa & "<div class='w3-container'>"
         regresa=regresa & "<p>Aun no se cargan elementos para esta clave</p>"
       regresa=regresa & "</div>"
    regresa=regresa & " </div>"
else
while not(rs25.eof)

 regresa=regresa & "<h2 align='center'>CLAVE SAP " & rs25("clave_sap_concurso") & "</h2>"
       regresa=regresa & "</header>"
       regresa=regresa & "<div class='w3-container'>"
         regresa=regresa & "<p><strong>DESCRIPCION CORTA: </strong>" & rs25("descripcion_corta") & "</p>"
		 regresa=regresa & "<p><strong>DESCRIPCION LARGA: </strong>" & rs25("descripcion_larga") & "</p>"
		 regresa=regresa & "<p><strong>PRECIO UNITARIO: </strong>" & formatoPesos(rs25("PU")) & "</p>"
		 regresa=regresa & "<p><strong>CANTIDAD CONTRATADA: </strong> " &  rs25("CANTIDAD") &" " & rs25("UND") &"</p>"
		 regresa=regresa & "<p><strong>AVANCE SUPERVISOR: </strong> " &  rs25("AVANCE") &" " & rs25("UND") &"</p>"
		 regresa=regresa & "<p><strong>AVANCE CONTRATISTA: </strong> " &  rs25("avanceContratista") &" " & rs25("UND") &"</p>"
		 regresa=regresa & "<p><strong>CANTIDAD FALTANTE: </strong>" & rs25("CANTIDAD") - rs25("Avance")  &" " & rs25("UND") & "</p>"
		 regresa=regresa & "<p><strong>COSTO ESTIMADO: </strong>" & formatoPesos( rs25("PU") * rs25("CANTIDAD"))  & "</p>"
		 regresa=regresa & "<p><strong>AVANCE EN PESOS: </strong>" & formatoPesos(rs25("porAvancePesos"))  & "</p>"
		 regresa=regresa & "<p><strong>AVANCE CONCEPTO: </strong>" & rs25("porAvance")   & " %</p>"
		 regresa=regresa & "<p><strong>PARTIDA: </strong>" &rs25("COMPONENTE")   & "</p>"
		 regresa=regresa & "<p><font color='blue'>Introduce el avance en <strong>" & rs25("UND") & "</strong></font></p>"
		 if session.contents("privilegio")=2 then 
		 regresa=regresa & "<p><strong>AVANCE: </strong><input type='text' id='txt_" & id &"' value='" & rs25("avance") & "' onkeypress='return soloNumeros(event)'><font color='red' size='34'><span class='icon-floppy-disk' style='cursor:pointer' onclick='updatecantidad(""" & id &""",""txt_" & id &""",""" & rs25("CANTIDAD") & """)'></span></font></p>"
		 else
		 regresa=regresa & "<p><strong>AVANCE: </strong><input type='text' id='txt_" & id &"' value='" & rs25("avanceContratista") & "' onkeypress='return soloNumeros(event)'><font color='red' size='34'><span class='icon-floppy-disk' style='cursor:pointer' onclick='updatecantidadContratista(""" & id &""",""txt_" & id &""",""" & rs25("CANTIDAD") & """)'></span></font></p>"
		 end if
		 if session.contents("privilegio")=2 then
		 regresa=regresa & "<p><font color='red'><strong>¿Avance Completado?</strong></font></p>"
		 regresa=regresa & "<p><font color='red'>Elije esta opcion si se ha completado el avance en este concepto</font></p>"
		 regresa=regresa & "<p><font color='red'>No podras hacer modificaciones a este concepto posteriormente</font></p>"
		 regresa=regresa & "<p><font color='red' size='34'><span class='icon-lock' style='cursor:pointer' onclick='cerrarConcepto(""" & id &""")'></span></font></p>"
		 end if
	     regresa=regresa & "</div>"
    regresa=regresa & " </div>"
	
rs25.movenext 
wend
end if
rs25.close
conn5.close 
set rs25=nothing
set conn5=nothing
        
 
response.Write(regresa) 

Function formatoPesos(numero)
cadena=Split(numero,".")
cont=1
regresa=""
for each x in cadena
if cont=1 then
   largo = len(x)
if largo <=3 then
    regresa=regresa & x
    cont=cont +1
else
 if largo >12 then
  regresa=left(x,largo -12) & "," & left(Right(x,12),3) & "," &  left(Right(x,9),3) & "," &  left(Right(x,6),3) & "," & Right(x,3)
  cont=cont +1
 else
  if largo >9 then
   regresa= left(x,largo -9) & "," & left(Right(x,9),3) & "," &  left(Right(x,6),3) & "," & Right(x,3)
   cont=cont +1
  else
   if largo >6 then
    regresa= left(x,largo-6) & "," &  left(Right(x,6),3) & "," & Right(x,3)
    cont=cont +1
   else
    if largo >3 then
     regresa= left(x,largo-3) & "," & Right(x,3)
     cont=cont +1  
    end if
   end if
  end if
 end if
end if
else 
regresa=regresa & "." & x
end if
next
formatoPesos="$" & regresa
End Function
%>

