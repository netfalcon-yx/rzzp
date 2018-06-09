<!--#include file="conn.asp"-->
<%chku 2%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>报名审核</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<%
gid=request.QueryString("gid")
if gid<>"" then
	gid=intsql(gid)
else
	msg "岗位参数出错！","-1"
end if
%>
<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable">
  <tr>
    <th width="5%">编号</th>
    <th width="10%">姓名</th>
    <th width="20%">岗位名称</th>
    <th width="12%">报名时间</th>
    <th width="10%">单位审核</th>
    <th width="10%">本部审核</th>
    <th width="15%">笔试成绩</th>
    <th width="10%">面试成绩</th>
    <th width="8%">审核</th>
  </tr>
  <%
  set rs=server.CreateObject("adodb.recordset")
  set rs2=server.CreateObject("adodb.recordset")
  
  sql="select * from tb_bm where gid="&gid&" and gzdw="&session("duid")&" order by id"
  rs.open sql,conn,1,1
  i=1
  while not rs.eof
  	jid=rs("jid")
	gid=rs("gid")
	
	chk1=rs("hg1")
	chk2=rs("hg2")
	if chk1 then
		chk1="<span class='bluefont'>√</span>"
	else
		chk1="&nbsp;"
	end if
	
	if chk2 then
		chk2="<span class='bluefont'>√</span>"
	else
		chk2="&nbsp;"
	end if
	
	sql2="select uname from tb_user where uid="&rs("uid")
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		uname=rs2("uname")
	end if
	rs2.close
	
	sql2="select * from tb_job where jid="&jid
	rs2.open sql2,conn,1,1
	etime=rs2("etime")
	rs2.close
	
	sql2="select bm,gwmc from tb_gw where gid="&gid
	rs2.open sql2,conn,1,1
	bm=rs2("bm")
	gwmc=rs2("gwmc")
	rs2.close
	
	if  datediff("s",now,etime)>0 then
		dwchk="<a href='d_uinfo.asp?id="&rs("id")&"'>审核</a>"
	else
		dwchk="结束"
	end if
	
  %>
  <tr>
    <td align="center"><%=i%></td>
    <td align="center"><%=uname%></td>
    <td align="center"><%=bm%>:<%=gwmc%></td>
    <td align="center"><%=rs("bmdt")%></td>
    <td align="center"><%=chk1%></td>
    <td align="center"><%=chk2%></td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center"><%=dwchk%></td>
  </tr>
  <%
  	i=i+1
  	rs.movenext
	wend
	rs.close
  %>
</table>
</body>
</html>
