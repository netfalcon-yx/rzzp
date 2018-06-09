<!--#include file="conn.asp"-->
<%chku 9
jid=request.QueryString("jid")
if jid="" then msg "参数错误！","-1"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>导入考场考号</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script src="comm.js" language="javascript"></script>
</head>

<body>
<form action="admin_kckh_upload.asp" method="post" enctype="multipart/form-data" name="form1" id="form1" onsubmit="return !(document.form1.file.value=='')">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:600px;">
    <tr>
      <th>准考证导入</th>
    </tr>
    <tr>
      <td>选择文件：
      <input name="file" type="file" id="file" size="50" />
      <input name="hd_jid" type="hidden" id="hd_jid" value="<%=jid%>" />
      <input name="button" type="submit" class="but2" id="button" value="导入" /></td>
    </tr>
    <tr>
      <td>说明：</td>
    </tr>
    <tr>
      <td>1、请按 <a href="doc/zkz_moban.xls" target="_blank">准考证模板</a> 格式导入数据，确保第一个表是：Sheet1，第一行是标题</td>
    </tr>
    <tr>
      <td>2、请注意Excel中身份证号为字符型</td>
    </tr>
    <tr>
      <td>3、如考生准考证已存在将覆盖原准考证号</td>
    </tr>
    <tr>
      <td align="center"><input name="button2" type="button" class="but1" id="button2" value="返回" onclick="history.back()" /></td>
    </tr>
  </table>
</form>
</body>
</html>
