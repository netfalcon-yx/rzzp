<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>考生统计</title>
<link href="css.css" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<%
set rs=server.createobject("adodb.recordset")
set rs2=server.createobject("adodb.recordset")
sql="select top 1 jid from tb_job order by jid desc"
rs.open sql,conn,1,1
if not rs.eof then
	jid=rs("jid")
else
	rw "暂无招聘！"
	response.End()
end if
rs.close

sql="select count(jid) from tb_zkz where jid="&jid
rs.open sql,conn,1,1
alluser=rs(0)
rs.close

sql="select count(jid) from tb_zkz where jid="&jid&" and usta='1'"
rs.open sql,conn,1,1
duser=rs(0)
rs.close
%>
<body style="margin-top:5px">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="mytable" style="background:#FFF">
  <tr>
    <td colspan="6"><strong>应到考生人数：<%=alluser%> 实到考生人数：<%=duser%> 未到人数：<%=alluser-duser%></strong> (以下为未到考生)</td>
  </tr>
  <tr>
    <th width="8%">编号</th>
    <th width="18%">身份证</th>
    <th width="15%">姓名</th>
    <th width="20%">考场教室</th>
    <th>用户单位</th>
    <th>联系方式</th>
  </tr>
  <%
  sql="select * from tb_zkz where jid="&jid&" and (usta<>'1' or isnull(usta)) order by kh"
  rs.open sql,conn,1,1
  i=1
  while not rs.eof
  	cardid=rs("cardid")
	uname=""
	utel=""
	sql2="select * from tb_user where card='"&cardid&"'"
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		uname=rs2("uname")
		utel=rs2("mb")
	end if
	rs2.close
	
	dname=""
  	sql2="select dname from tb_duser where uid=(select did from tb_user where card='"&cardid&"')"
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		dname=rs2(0)
	end if
	rs2.close
	
  %>
  <tr align="center">
    <td><%=i%></td>
    <td><%=cardid%></td>
    <td><%=uname%></td>
    <td><%=rs("kc")&rs("kcjs")%></td>
    <td><%=dname%></td>
    <td><%=utel%></td>
  </tr>
  <%
  	i=i+1
	rs.movenext
wend
rs.close
set rs=nothing
set rs2=nothing
closeconn
  %>
</table>
</body>
</html>
