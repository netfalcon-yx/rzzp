<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>招聘信息</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="lhgdialog/lhgcore.min.js"></script> 
<script type="text/javascript" src="lhgdialog/lhgdialog.min.js"></script>
</head>

<body>
<div class="unav">当前位置：招聘信息发布 【<a href="javascript:openwin('')">新增发布</a>】 </div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable">
  <tr>
    <th width="5%">编号</th>
    <th width="25%">名称</th>
    <th width="10%">开始时间</th>
    <th width="10%">结束时间</th>
    <th width="20%">文档说明</th>
    <th width="10%">岗位数量</th>
    <th width="20%">岗位编辑</th>
  </tr>
  <%
  sql="select * from tb_job order by jid desc"
  set rs=server.CreateObject("adodb.recordset")
  set rs2=server.CreateObject("adodb.recordset")
  rs.open sql,conn,1,1
  i=1
  while not rs.eof
  	jfile=rs("jfile")
	if jfile="" or isnull(jfile) then
		jfile="暂无"
	else
		jfile="<a href='doc/"&jfile&"' target='_blank'>"&rs("jfname")&"</a>"
	end if
	jsta=rs("jobtype")
	
	sql2="select count(gid) from tb_gw where jid="&rs("jid")
	rs2.open sql2,conn,1,1
	jobs=rs2(0)
	rs2.close
  %>
  <tr>
    <td align="center"><%=i%></td>
    <td><a href="admin_gw.asp?jid=<%=rs("jid")%>"><%=rs("jname")%></a><%if jsta=8 then rw "(未开放)"%></td>
    <td align="center"><%=rs("btime")%></td>
    <td align="center"><%=rs("etime")%></td>
    <td align="center"><%=jfile%></td>
    <td align="center"><%=jobs%></td>
    <td align="center"><a href="admin_job_del.asp?jid=<%=rs("jid")%>" onClick="{if(confirm('警告：删除此招聘信息同时将删除此招聘下所有岗位及报名、考试，确定要删除吗?')){return true;}return false;}">删除</a> <a href="javascript:openwin('<%=rs("jid")%>')">编辑</a> <a href="admin_gw.asp?jid=<%=rs("jid")%>">岗位管理</a></td>
  </tr>
  <%
  	i=i+1
  	rs.movenext
	wend
	rs.close
  %>
 
</table>
<script language="javascript">
function openwin(jid)
{
	temppage="admin_jobadd.asp?jid="+jid;
	temptit="招聘信息编辑";
	var dlg = new J.dialog({ title:temptit,rang:true,page:temppage,cover:true,btns: false, autoSize:true,maxBtn:false,btnBar:false,bgcolor:'#000',iconTitle:false}); 
	dlg.ShowDialog();
}
</script>
</body>
</html>
