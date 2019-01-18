<%
	' -- show.asp --
	' Muestra la lista de los ficheros Uploaded
	
	Response.Buffer = True
%>
<html>
<head>
	<title>List of uploaded Files</title>
	<style>
		body, input, td { font-family:verdana,arial; font-size:10pt; }
	</style>
</head>
<body>
	<p align="center">
		<b>List of uploaded Files</b><br>
		<a href="insertindex.asp">To upload files click here</a>
	</p>

<%
	' File System Object
	Dim fso
		Set fso = Server.CreateObject("Scripting.FileSystemObject")
		
	' "Uploaded" Folder
	Dim folder
		Set folder = fso.GetFolder(Server.MapPath("uploaded/"))
		
	If folder.Size > 0 Then
		Response.Write "<ul>"
		For Each file In folder.Files
				Response.Write "<li type=""circle"">"
				Response.Write "<a href=""uploaded/"
				Response.Write file.Name & """>"
				Response.Write "<b>" & file.Name
				Response.Write "</b></a>   "
				Response.Write "( Size: " & file.Size & " )   "
		Next
		Response.Write "</ul>"
	Else
		Response.Write "<ul><li type=""circle"">No Files Uploaded.</ul>"
	End If
%>
</body>
</html>