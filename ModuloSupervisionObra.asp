<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Modulo de Supervision de Obra</title>
    <link href="img/icono.ico" type="image/x-icon" rel="shortcut icon" />
  <link href="css/style.css" rel="stylesheet" type="text/css">


    <style type="text/css">
        .style1
        {
            height: 45px;
            width: 115px;
        }
        .style2
        {
            width: 115px;
        }
    #FRM_LOGIN #main div table tr td table tr td {
	color: #F00;
}
    </style>
    <%if isempty(session("nombre_usuario")) then
response.Redirect("default.asp?logout=true")
end if%>

<FRAMESET ROWS="*" cols="100%,*" FRAMEBORDER="no">

   <NOFRAMES>
	Tu navegador no soporta frames. Actual&iacute;zate.
   </NOFRAMES>
<%if session.Contents("privilegio")= 2 then%>

	<FRAME SRC="inicioSupervisor.asp" NAME="contenido">
<%else%>
    <%if session.Contents("privilegio")= 4 then%>

        <FRAME SRC="inicioDirector.asp" NAME="contenido">
    <%else%>

        <%if session.Contents("privilegio")= 5 then%>

            <FRAME SRC="inicioGerente.asp" NAME="contenido">
        <%else%>

            <FRAME SRC="inicioContratista.asp" NAME="contenido">
        <%end if%>

    <%end if%>
<%end if%>
</HEAD>

<body>

</body>
</html>
