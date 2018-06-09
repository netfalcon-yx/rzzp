<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>用户注册须知</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="maintop" id="maintop">
	<div id="logotxt"></div>
</div>

<div class="umain">
<%
sql="select * from tb_news where ntype=3 and ishow=true"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
if not rs.eof then
	tit=rs("title")
	content=rs("content")
end if
rs.close
%>
<h4><%=tit%></h4>
<div align="center"><%=content%></div>
<P align="center">
  <label></label>
  <label>
  <input name="okbut" type="button" class="but1" id="okbut" value="我同意" onclick="location.href='u_reg2.asp'" />
  </label>
  &nbsp;
  <input name="cancelbut" type="button" class="but2" id="cancelbut" value="不同意" onclick="window.history.back()" />
</P>
</div>
</body>
</html>
