<!--#Include File="conn.Asp"-->
<%chku 2%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�û������������</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
var dg =  frameElement.lhgDG;
</script>
</head>

<body>
<%
uid=request.querystring("uid")
if uid<>"" then
	uid=intsql(uid)
else
	rw "<script>alert('�û���������!');dg.cancel()</script>"
end if
sql="select a.*,(select dname from tb_duser where uid=a.did)as dname from tb_user a where uid="&uid&" and did="&session("duid")
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if not rs.eof then
%>
  <table width="500" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#F2F2F2" style="line-height:30px;">
    
    <tr>
      <td width="20%" align="right" bgcolor="#F7F7F7">��ʵ������</td>
      <td bgcolor="#FFFFFF"><%=rs("uname")%></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7F7">������λ��</td>
      <td bgcolor="#FFFFFF"><%=rs("dname")%></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7F7">���֤���룺</td>
      <td bgcolor="#FFFFFF"><%=rs("card")%></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7F7">�������£�</td>
      <td bgcolor="#FFFFFF"><%=rs("birthday")%></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7F7">�� ��</td>
      <td bgcolor="#FFFFFF"><%=rs("sex")%></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7F7">�� �壺</td>
      <td bgcolor="#FFFFFF"><%=rs("mz")%></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7F7">����״����</td>
      <td bgcolor="#FFFFFF"><%=rs("hy")%></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7F7">���᣺</td>
      <td bgcolor="#FFFFFF"><%=rs("jg")%></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7F7">�����أ�</td>
      <td bgcolor="#FFFFFF"><%=rs("hj")%></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7F7">�̶��绰��</td>
      <td bgcolor="#FFFFFF"><%=rs("tel")%></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7F7">�ֻ����룺</td>
      <td bgcolor="#FFFFFF"><%=rs("mb")%></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7F7">E-Mail��</td>
      <td bgcolor="#FFFFFF"><%=rs("email")%></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7F7">����״����</td>
      <td bgcolor="#FFFFFF"><%=rs("st")%></td>
    </tr>
</table>
</form>
<%
end if
rs.close
set rs=nothing
%>
</body>
</html>
