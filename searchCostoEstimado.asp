<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
cr=request("cr")
'cr="0008"
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr

'seleccionamos la consulta segun el parametro de entrada
	sql="select *, (TotalAvanceSuc * 100) / TotalSuc as porTotalAvanceSuc,  (TotalExcesoSuc * 100) / TotalSuc  as porTotalExcesoSuc from (select cr, Round(Sum(subTotalSuc),2) as TotalSuc,Round(Sum(subTotalAvanceSuc),2) as TotalAvanceSuc,Round(Sum(subTotalExcesoSuc),2) as TotalExcesoSuc  from (select *, (cantidad * pu) as subTotalSuc,((avance-exceso)* pu) as subTotalAvanceSuc,exceso* pu as subTotalExcesoSuc from (select cr, cantidad, pu,round(case when avance is null then 0 else avance end,2) as avance,CASE WHEN avance IS NULL THEN 0 WHEN avance > cantidad THEN avance - cantidad WHEN avance <= cantidad THEN 0 END AS exceso from nuevocosto_estimadoobra where cr='" & cr &"')a)b)c"

'ejecutamos la consulta
rs.open sql,conn
'si la consula trajo registros
if rs.eof then
'escribimos los encabezados de la tabla
response.write("<font size='+2'><strong>Costo Estimado de la Sucursal $ 0 </strong></font>")
'mientras el RecorSet no llegue al final se recorre
else
response.write("<font size='+2'><strong>Importe Contrato: " & formatoPesos(rs("TotalSuc")) & "</strong></font>" )
end if
'cerramos el RecordSet y Cerramos la conexion
rs.close
conn.close 
set rs=nothing
set conn=nothing

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


