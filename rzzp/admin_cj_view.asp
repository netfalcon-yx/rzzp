<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>招聘信息</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<%
set rs=server.CreateObject("adodb.recordset")
set rs1=server.CreateObject("adodb.recordset")
set rs2=server.CreateObject("adodb.recordset")
f=request.QueryString("f")
if f="d" then
	jid=request.QueryString("jid")
	sql="delete from tb_cj where jid="&jid
	conn.execute sql
end if

sql="select top 1 * from tb_job order by jid desc"
rs.open sql,conn,1,1
if not rs.eof then
	jname=rs("jname")
	jid=rs("jid")
	bsbl=rs("bsbl")
	msbl=rs("msbl")
else
	msg "暂时没有招聘信息！","-1"
end if
rs.close

%>
<body>
<div class="unav">当前位置：<%=jname%>--考试成绩浏览 【<a href="admin_cj_in.asp?jid=<%=jid%>">导入考试成绩</a>】【<a href="?jid=<%=jid%>&f=d" onclick="return confirm('确定要清除成绩吗？清除后可重新导入成绩！');">×清除成绩</a>】【<a href="admin_cj_print.asp?jid=<%=jid%>">导出笔试成绩表</a>】【<a href="admin_cj_print2.asp?jid=<%=jid%>">导出成绩汇总表</a>】</div>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable">
  <tr>
    <th width="5%">编号</th>
    <th width="12%">身份证号</th>
    <th width="8%">姓名</th>
    <th width="5%">性别</th>
    <th width="18%">工作单位</th>
    <th>报名单位部门岗位</th>
    <th width="9%">笔试成绩</th>
    <th width="9%">面试成绩</th>
    <th width="9%">总成绩</th>
  </tr>
  <%
  i=1
  sql_1="select * from tb_gw where jid="&jid&" order by gid"
  rs1.open sql_1,conn,1,1
  while not rs1.eof
  	gid=rs1("gid")
	zpdw=rs1("zpdw")
	gwbm=rs1("bm")
	gwmc=rs1("gwmc")
	gwtype=rs1("gtype")
	zpdwgw=rs1("zpdw")&"："&rs1("bm")&"："&rs1("gwmc")
  	'sql="select * from tb_cj order by id"
	sql="select * from tb_cj where jid="&jid&" and sfz in(select card from tb_user where uid in(select uid from tb_bm where jid="&jid&" and gid="&gid&" and hg2)) order by (cj1+cj2) desc"
  	rs.open sql,conn,1,1
  while not rs.eof
  	sfz=rs("sfz")
	cj1=rs("cj1")
	cj2=rs("cj2")
	zcj=""
	if cj1<>"" and cj2<>"" then	zcj=FormatNumber(cj1*bsbl/100+cj2*msbl/100,2)
	
	uid=""
	uname=""
	sex=""
	dname=""
	sql2="select uid,uname,sex,(select dname from tb_duser where uid=a.did)as dname  from tb_user a where card='"&sfz&"'"
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		uid=rs2("uid")
		uname=rs2("uname")
		sex=rs2("sex")
		dname=rs2("dname")
	end if
	rs2.close

  %>
  <tr>
    <td align="center"><%=i%></td>
    <td align="center"><%=sfz%></td>
    <td align="center"><%=uname%></td>
    <td align="center"><%=sex%></td>
    <td align="center"><%=dname%></td>
    <td align="center"><%=zpdwgw%></td>
    <td align="center"><%=cj1%></td>
    <td align="center"><%=cj2%></td>
    <td align="center"><%=zcj%></td>
  </tr>
  <%
  		i=i+1
		rs.movenext
	wend
	rs.close
	rs1.movenext
wend
rs1.close
  %>
</table>
</body>
</html>
