<!--#include file="conn.asp"-->
<%chku 9
jid=request.QueryString("jid")
if jid="" then msg "��������","-1"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���뿼������</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script src="comm.js" language="javascript"></script>
</head>

<body>
<form action="admin_kckh_upload.asp" method="post" enctype="multipart/form-data" name="form1" id="form1" onsubmit="return !(document.form1.file.value=='')">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:600px;">
    <tr>
      <th>׼��֤����</th>
    </tr>
    <tr>
      <td>ѡ���ļ���
      <input name="file" type="file" id="file" size="50" />
      <input name="hd_jid" type="hidden" id="hd_jid" value="<%=jid%>" />
      <input name="button" type="submit" class="but2" id="button" value="����" /></td>
    </tr>
    <tr>
      <td>˵����</td>
    </tr>
    <tr>
      <td>1���밴 <a href="doc/zkz_moban.xls" target="_blank">׼��֤ģ��</a> ��ʽ�������ݣ�ȷ����һ�����ǣ�Sheet1����һ���Ǳ���</td>
    </tr>
    <tr>
      <td>2����ע��Excel�����֤��Ϊ�ַ���</td>
    </tr>
    <tr>
      <td>3���翼��׼��֤�Ѵ��ڽ�����ԭ׼��֤��</td>
    </tr>
    <tr>
      <td align="center"><input name="button2" type="button" class="but1" id="button2" value="����" onclick="history.back()" /></td>
    </tr>
  </table>
</form>
</body>
</html>
