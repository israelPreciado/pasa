<%
ConnStr="DRIVER={MySQL ODBC 3.51 Driver};server=localhost;database=app_bnrt; uid=root;pwd=; option=3"
set conn2=server.CreateObject("adodb.connection")
set rs=server.CreateObject("adodb.recordset")
conn2.open connstr
sql= "SELECT  * from app_bnrt_login where login_usuario = 'xmd7550'"
rs.open sql, conn2
if rs.eof then
response.write("1")
else

'call insertarLog(usuario,"LOGIN","", Request.ServerVariables("REMOTE_ADDR"))
response.write(rs("login_nombre"))
end if
rs.close
conn2.close 
set rs=nothing
set conn2=nothing
%>