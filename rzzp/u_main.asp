<!--#include file="conn.asp"-->
<%chku 1%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>用户中心</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript">
function SetWinHeight(obj) 
{ 
 var win=obj; 
 if (document.getElementById) 
 { 
  if (win && !window.opera) 
  { 
   if (win.contentDocument && win.contentDocument.body.offsetHeight)  

    win.height = win.contentDocument.body.offsetHeight;  
   else if(win.Document && win.Document.body.scrollHeight) 
    win.height = win.Document.body.scrollHeight; 
  } 
 } 
} 
</script>
</head>

<body>
<%
sql="select uphoto from tb_user where uid="&session("uid")
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if not rs.eof then
	if rs(0)="" or isnull(rs(0)) then	rw "<div class='unav'>准考证照片还没有上传 >> <b><a href='u_photo.asp'><font color=#FF0000>现在上传</font></a></b></div>"	
end if
rs.close
%>
<iframe id="fmubm" name="fmubm" src="u_gw.asp" scrolling=no width="100%" height="100%" frameborder="no" onload="Javascript:SetWinHeight(this)"></iframe>
</body>
</html>
