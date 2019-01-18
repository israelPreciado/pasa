<% ' Insert.asp %>
<!--#include file="Loader.asp"-->
<!--#include file="funcion3/funcion.inc"-->
<%
   Response.Buffer = True

   ' load object
   Dim load
      Set load = new Loader
      
      ' calling initialize method
      load.initialize
      
   ' File binary data
   Dim fileData
      fileData = load.getFileData("file")
   ' File name
   Dim fileName
      fileName = LCase(load.getFileName("file"))
   ' File path
   Dim filePath
      filePath = load.getFilePath("file")
   ' File path complete
   Dim filePathComplete
      filePathComplete = load.getFilePathComplete("file")
   ' File size
   Dim fileSize
      fileSize = load.getFileSize("file")
   ' File size translated
   Dim fileSizeTranslated
      fileSizeTranslated = load.getFileSizeTranslated("file")
   ' Content Type
   Dim contentType
      contentType = load.getContentType("file")
   ' No. of Form elements
   Dim countElements
      countElements = load.Count
   ' Value of text input field "name"
   Dim nameInput
      nameInput = load.getValue("name")
   ' Path where file will be uploaded
   Dim pathToFile
      pathToFile = Server.mapPath("uploaded/") & "\" & fileName
   ' Uploading file data
   Dim fileUploaded
      fileUploaded = load.saveToFile ("file", pathToFile)
        
   ' destroying load object
   Set load = Nothing

     regresar=""

    set conexion2 = Server.CreateObject("ADODB.Connection")
    conexion2.Open ConnStr

        sql = " truncate TABLE cat_llegadamateriales_temp;" 
    
        conexion2.Execute sql
      
        sql = " LOAD DATA LOCAL INFILE 'C:/inetpub/wwwroot/bnrt_qa/uploaded/" & fileName & "' INTO TABLE cat_llegadamateriales_temp FIELDS TERMINATED BY ','  LINES TERMINATED BY '\n' ignore 1 lines;" 
    
        conexion2.Execute sql

          sql = " insert into cat_llegadamateriales(pos,cve_sap, material, cantidad, comentario, tiempo, fecha, cr, id_componente)"
          sql = sql & " select "
          sql = sql & " pos,cve_sap, material, cantidad, comentario, tiempo, STR_TO_DATE(fecha, '%d/%m/%Y') as fecha, cr, id_componente"
          sql = sql & " from cat_llegadamateriales_temp "
          sql = sql & " where concat(pos,cve_sap, material, cantidad, comentario, tiempo, STR_TO_DATE(fecha, '%d/%m/%Y'), cr, id_componente)"
          sql = sql & " not in (select concat(pos,cve_sap, material, cantidad, comentario, tiempo, fecha, cr, id_componente) from cat_llegadamateriales)"
          sql = sql & " and id_pedido"
          sql = sql & " not in ("
          sql = sql & " select id_pedido "
          sql = sql & " from cat_llegadamateriales_temp "
          sql = sql & " where LENGTH(pos) <= 2 or LENGTH(cve_sap) <= 2 or LENGTH(fecha) <= 2 or cr in (''))"

        conexion2.Execute sql
         
            conexion2.Close
            set conexion2=nothing  
            regresar="ok"
        
    response.write(regresar)

    Response.Redirect ("regnovalidos.asp")
     


%>
