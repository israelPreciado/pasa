<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>ModuloAignacionObra</title>
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
<%
if isempty(session("xmd")) then
response.Redirect("default.asp?logout=true")
end if
%>
<FRAMESET ROWS="30%,*" cols="*" FRAMEBORDER="no" name="general">
   <FRAME SRC="controlAccionesContratista_lobby.asp" NORESIZE NAME="titulo">
   <FRAMESET rows="*" COLS="*" FRAMEBORDER="no" NORESIZE>
	<FRAME SRC="pagina2.asp" NAME="contenido">
</HEAD>

<body>

</body>
</html>
