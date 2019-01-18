
<%
Set Upload = Server.CreateObject("Persits.Upload")

' Prevent overwriting 
Upload.OverwriteFiles = False

' We use memory uploads, so limit file size 
Upload.SetMaxSize 6000000, true

' Save to memory 
Upload.Save

' Use session ID as the new file name 
NewName = "perro"

For Each File in Upload.Files 
   File.SaveAs server.mappath("adjuntos/" & NewName) &  File.ext 
   'Response.Write "New name: " & File.FileName & "<BR>" 
Next 
%>

<%If Err <> 0 Then 

response.write(Err.Description)

else

response.redirect("tomarFoto.asp")
end if
%>
