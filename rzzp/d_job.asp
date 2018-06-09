<!--#include file="conn.asp"-->
<%chku 2%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>招聘信息</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="unav">当前位置：招聘信息浏览</div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable">
  <tr>
    <th width="5%">编号</th>
    <th width="35%">名称</th>
    <th width="15%">报名开始时间</th>
    <th width="15%">结束时间</th>
    <th width="10%">岗位数量</th>
    <th>单位报名人数</th>
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
	
	sql2="select count(gid) from tb_gw where jid="&rs("jid")
	rs2.open sql2,conn,1,1
	jobs=rs2(0)
	rs2.close
	
	sql2="select count(id) from tb_bm where jid="&rs("jid")&" and gzdw="&session("duid")
	rs2.open sql2,conn,1,1
	dwbmrs=rs2(0)
	rs2.close
	if dwbmrs>0 then
		bmview="<b><span class='redfont'>"&dwbmrs&"</span></b>&nbsp;&nbsp;<a href='d_gw.asp?jid="&rs("jid")&"'>【浏览】</a>"
	else
		bmview="无"
	end if
  %>
  <tr>
    <td align="center"><%=i%></td>
    <td><a href="d_gwbm.asp?jid=<%=rs("jid")%>"><%=rs("jname")%></a></td>
    <td align="center"><%=rs("btime")%></td>
    <td align="center"><%=rs("etime")&job_bmend_dt%></td>
    <td align="center"><a href="d_gwbm.asp?jid=<%=rs("jid")%>"><%=jobs%></a></td>
    <td align="center"><%=bmview%></td>
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
