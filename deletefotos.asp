<!--#include file="funcion3/funcion.inc"-->
<%  
  
    id=request("id")

    regresar=""

    set conexion2 = Server.CreateObject("ADODB.Connection")
    conexion2.Open ConnStr
    Set rs = Server.CreateObject("ADODB.Recordset") 
      
        sql = "DELETE from ctrl_fotografias where id_foto = '" & id & "' " 
    
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
