<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>考场教室管理</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="lhgdialog/lhgcore.min.js"></script> 
<script type="text/javascript" src="lhgdialog/lhgdialog.min.js"></script>
</head>

<body>
<div class="unav">当前位置：考场教室管理 【<a href="javascript:opentwin('')">新增考场教室</a>】 </div>
<table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:700px;">
  <tr>
    <th width="10%">编号</th>
    <th width="20%">名称</th>
    <th width="35%">详细地址</th>
    <th width="20%">容纳人数</th>
    <th width="15%">编辑</th>
  </tr>
  <%
  set rs=server.CreateObject("adodb.recordset")
  sql="select * from tb_room"
  rs.open sql,conn,1,1
  i=1
  while not rs.eof
  %>
  <tr>
    <td align="center"><%=i%></td>
    <td><%=rs("rname")%></td>
    <td><%=rs("raddr")%></td>
    <td align="center"><%=rs("rmax")%></td>
    <td align="center"><a href="javascript:opentwin('<%=rs("rid")%>')">编辑</a> <a href="admin_room_del.asp?rid=<%=rs("rid")%>" onClick="{if(confirm('警告：确定删除该条内容吗?')){return true;}return false;}">删除</a></td>
  </tr>
  <%
  		i=i+1
		rs.movenext
	wend
	rs.close
  %>
</table>
<script language="javascript">
function opentwin(rid)
{
	temppage="admin_room_add.asp?rid="+rid;
	temptit="考场教室编辑";
	var dlg = new J.dialog({ title:temptit,rang:true,page:temppage,cover:true,btns: false, autoSize:true,maxBtn:false,btnBar:false,bgcolor:'#000',iconTitle:false}); 
	dlg.ShowDialog();
}
</script>
</body>
</html>
