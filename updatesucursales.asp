<!--#include file="funcion3/funcion.inc"-->
<% 
            cr = request("cr")
            zonap = request("zonap")
            bloque = request("bloque")
            territorial = request("territorial")
            sucursal = request("sucursal")
            alcancet = request("alcancet")
            domicilio = request("domicilio")
            colonia = request("colonia")
            m2 = request("m2")
            regional = request("regional")
            ciudad = request("ciudad")
            estado = request("estado")
            zonat = request("zonat")

    regresar=""

    set conexion2 = Server.CreateObject("ADODB.Connection")
    conexion2.Open ConnStr
    Set rs = Server.CreateObject("ADODB.Recordset") 
      
        sql = "update cat_sucursales"
        sql = sql & " set zona = '" & zonap & "', bloque = '" & bloque & "', territorial='" & territorial & "', nombre_sucursal='" & sucursal & "',"
        sql = sql & " alcance_tipo = '" & alcancet & "', domicilio='" & domicilio & "', colonia='" & colonia & "', m2_construccion='" & m2 & "',"
        sql = sql & " regional = '" & regional & "', ciudad='" & ciudad & "', estado='" & estado & "', zona_territorial='" & zonat & "' "
        sql = sql & " where cr = '" & cr & "'" 
    
        conexion2.Execute sql
   
        if err<>0 then 
            conexion2.Close
            set conexion2=nothing  
            regresar="errI"
        else
            conexion2.Close
            set conexion2=nothing  
            regresar="ok"
        end if
    
    response.write(regresar)
%>
