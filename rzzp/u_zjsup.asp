<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<!--#include file="conn.asp"-->
<%
chku 0
jid=request.QueryString("jid")
id=request.QueryString("id")
'uid=request.QueryString("uid")
ftypename=getuftype(id)
if session("utype")<>1 then
	uid=request.QueryString("uid")
	if uid<>"" then
		uid=intsql(uid)
	else
		rw "用户参数错误！"
		response.End()
	end if
end if
%>
<body>
<form action="u_zjsup_save.asp" method="post" enctype="multipart/form-data" name="form1" id="form1" onsubmit="return !(document.form1.file.value=='')">
  <table width="500" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:500px;margin-top:10px;">
    <tr>
      <td colspan="2" align="center" bgcolor="#E6E6E6"><strong><%=ftypename%>上传</strong></td>
    </tr>
    <tr>
      <td width="94" align="right">选择文件：</td>
      <td width="405"><label>
        <input name="file" type="file" size="40"  />
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input name="Submit" type="submit" class="but2" value="提交" />
        <input name="hdjid" type="hidden" id="hdjid" value="<%=jid%>" />
        <input name="hdid" type="hidden" id="hdid" value="<%=id%>" />
        <input name="hduid" type="hidden" id="hduid" value="<%=uid%>" />
      </label></td>
    </tr>
  </table>
</form>
</body>
</html>
