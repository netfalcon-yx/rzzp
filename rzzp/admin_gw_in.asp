<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��λ��Ϣ����</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<%chku 9
jid=request.QueryString("jid")
if jid="" then msg "��������!","-1"
jid=intsql(jid)
%>
<body>
<table width="750"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000">
  <tr>
    <td bgcolor="#FFFFFF"><form action="admin_gw_upload.asp" method="post" enctype="multipart/form-data" name="form1">
      <table width="100%" height="137"  border="0">
        <tr>
          <td height="25" bgcolor="#99CCFF"><div align="center" style="font-weight: bold">��λ��ϢExcel�ĵ��ϴ�</div></td>
        </tr>
        
        <tr>
          <td bgcolor="#FBFBF9">&nbsp;Excel·����
            <input name="file" type="file" id="file" size="45" maxlength="50">
            <input name="hd_jid" type="hidden" id="hd_jid" value="<%=jid%>" /></td>
        </tr>
        
        <tr>
          <td bgcolor="#FBFBF9"><a href="doc/moban.xls" target="_blank">��λģ�����</a>(<span class="redfont">ע�⣺1��ģ���һ��������������Ϊ��Sheet1��2��ģ���2��ʾ��������ɾ��</span>)</td>
        </tr>
        <tr>
          <td align="center" bgcolor="#FBFBF9">
              <input name="fsubmit" type="submit" class="but2" id="fsubmit" value="�� ��" />
          </td>
        </tr>
      </table>
    </form></td>
  </tr>
</table>
</body>
</html>
