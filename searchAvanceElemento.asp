<!--#include file="funcion3/funcion.inc"-->
<%
response.expires=-1
cr=request("cr")
componente=request("id")
'cr="0008"
Set conn = Server.CreateObject("ADODB.Connection")
set rs= Server.CreateObject("adodb.recordset")
Conn.Open connstr

'seleccionamos la consulta segun el parametro de entrada
	sql="select avance from nuevoCosto_estimadoObra where id='" & componente & "'"

'ejecutamos la consulta
rs.open sql,conn
'si la consula trajo registros
if rs.eof then
'escribimos los encabezados de la tabla
response.write("0")
'mientras el RecorSet no llegue al final se recorre
else
response.write(rs("avance"))
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


