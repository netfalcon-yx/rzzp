<!--#include file="conn.asp"-->
<%chku 1%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>单位联系方式管理</title>
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
<div class="unav">当前位置：联系方式查看</div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:500px">
    <tr>
      <th colspan="2">单位招聘联系人</th>
    </tr>
    <tr>
      <td width="20%" align="right">姓 名：</td>
      <td><%=duname%></td>
    </tr>
    <tr>
      <td align="right">岗 位：</td>
      <td><%=gw%></td>
    </tr>
    <tr>
      <td align="right">办公电话：</td>
      <td><%=tel%></td>
    </tr>
    
    <tr>
      <td align="right">电子邮箱：</td>
      <td><%=email%></td>
    </tr>
    <tr>
      <td align="right" class="redfont">备注：</td>
      <td>如果在招聘过程中遇到问题，可随时与单位招聘负责人联系!</td>
    </tr>
  </table>
</body>
</html>
