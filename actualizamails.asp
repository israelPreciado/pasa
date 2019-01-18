<!--#include file="funcion3/funcion.inc"-->
<%  
  
    id2=request("id2")
    para=request("para")
    copia=request("copia")
   




    regresar=""

    set conexion2 = Server.CreateObject("ADODB.Connection")
    conexion2.Open ConnStr
    Set rs = Server.CreateObject("ADODB.Recordset") 
      
        sql = "update ctrl_envioestimaciones"
        sql = sql & " set para = '" & para & "', cc = '" & copia & "', estado='1'"
        sql = sql & " where id = '" & id2 & "'" 
    
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
