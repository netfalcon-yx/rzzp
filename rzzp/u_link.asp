<!--#include file="conn.asp"-->
<%chku 1%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��λ��ϵ��ʽ����</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="comm.js"></script>
</head>
<%
sql="select * from tb_duser where uid=(select did from tb_user where uid="&session("uid")&")"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
duname=rs("duname")
gw=rs("gw")
tel=rs("tel")
mb=rs("mb")
email=rs("email")
rs.close
set rs=nothing
%>
<body>
<div class="unav">��ǰλ�ã���ϵ��ʽ�鿴</div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:500px">
    <tr>
      <th colspan="2">��λ��Ƹ��ϵ��</th>
    </tr>
    <tr>
      <td width="20%" align="right">�� ����</td>
      <td><%=duname%></td>
    </tr>
    <tr>
      <td align="right">�� λ��</td>
      <td><%=gw%></td>
    </tr>
    <tr>
      <td align="right">�칫�绰��</td>
      <td><%=tel%></td>
    </tr>
    
    <tr>
      <td align="right">�������䣺</td>
      <td><%=email%></td>
    </tr>
    <tr>
      <td align="right" class="redfont">��ע��</td>
      <td>�������Ƹ�������������⣬����ʱ�뵥λ��Ƹ��������ϵ!</td>
    </tr>
  </table>
</body>
</html>
