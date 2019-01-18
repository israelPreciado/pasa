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
sql= "select * from (select * from (select a.id,a.CLAVE_SAP_CONCURSO,a.clave_sap_zona, b.DESCRIPCION_CORTA,b.descripcion_larga,a.pu,a.cantidad,b.UND, a.componente, concat(left(a.fecha_ingreso,4),'-',right(left(a.fecha_ingreso,7),2),'-',right(left(a.fecha_ingreso,10),2),' ',right(a.fecha_ingreso,8))  as fecha_ingreso from nuevoCosto_estimadoObra a LEFT JOIN cat_sap_2017 b on a.CLAVE_SAP_CONCURSO=b.CLAVE_SAP_CONCURSO  where cr ='" & session.contents("cr") &"') as a union (select id,clave_sap_concurso,clave_sap_zona,descorta as descripcion_corta,deslarga as descripcion_larga,pu,cantidad,und,componente,fecha_ingreso from nuevocosto_estimadoobra where cr ='" & session.contents("cr") & "' and   componente like 'Otros')  order by fecha_ingreso desc)a where id='" & id & "'"
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
		 regresa=regresa & "<p><strong>PRECIO UNITARIO: </strong>" & rs25("PU") & "</p>"
		 regresa=regresa & "<p><strong>CANTIDAD: </strong><input type='text' id='txt_" & id &"' value='" & rs25("CANTIDAD") & "' onkeypress='return soloNumeros(event)'><font color='red' size='34'><span class='icon-floppy-disk' style='cursor:pointer' onclick='updatecantidad(""" & id &""",""txt_" & id &""")'></span></font></p>"
		 regresa=regresa & "<p><strong>UND: </strong>" & rs25("UND") & "</p>"
		 regresa=regresa & "<p><strong>COSTO ESTIMADO: </strong>" & formatoPesos( rs25("PU") * rs25("CANTIDAD"))  & "</p>"
		 regresa=regresa & "<p><strong>PARTIDA: </strong>" &rs25("COMPONENTE")   & "</p>"
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

