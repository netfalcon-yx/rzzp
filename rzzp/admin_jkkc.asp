<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>招聘岗位</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script src="comm.js" language="javascript"></script>
</head>
<%
set rs=server.CreateObject("adodb.recordset")
set rs2=server.CreateObject("adodb.recordset")
kc=request.QueryString("kc")
f=request.QueryString("f")
function strlen(str,n)
	if str<>"" then
		for i=1 to n-len(str)
			str="0"&str
		next
		strlen=str
	else
		strlen=""
	end if
end function
sql="select top 1 jid from tb_job order by jid desc"
rs.open sql,conn,1,1
if not rs.eof then
jid=rs(0)
end if
rs.close
%>
<body>
<div class="unav">当前位置：监考考场管理 选择考场：
  <select name="kc" size="1" id="kc" onchange="location.href='?kc='+this.value">
  <option value="">选择考场</option>
  <%
  sql="select kc from tb_zkz where jid="&jid&" group by kc"
  rs.open sql,conn,1,1
  while not rs.eof
  	if kc=rs(0) then
		rw "<option value='"&rs(0)&"' selected>"&rs(0)&"</option>"
	else
		rw "<option value='"&rs(0)&"'>"&rs(0)&"</option>"
	end if
	rs.movenext
  wend
  rs.close
  %>
</select> 【<a href="admin_kc_print.asp?jid=<%=jid%>&kc=<%=kc%>" target="_blank">监考考场打印</a>】 【<a href="?jid=<%=jid%>&f=0">照片未采集统计</a>】</div>

<table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" id="gwtable">
  <tr>
    <th width="5%">编号</th>
    <th width="10%">准考证号</th>
    <th width="10%">姓 名</th>
    <th width="10%">现场照片</th>
    <th>招聘单位、部门岗位名称</th>
    <th width="10%">报名时间</th>
    <th width="15%">考场教室</th>
    </tr>
  <%
'if gtype="" then
'  	sql="select * from tb_bm where jid="&jid&" and hg1=true and hg2=true order by gid,id"
'else
'	sql="select * from tb_bm where jid="&jid&" and hg1=true and hg2=true and gid in (select gid from tb_gw where jid="&jid&" and gtype='"&gtype&"') order by gid,id"
'end if
'rw sql
'response.End()
if kc<>"" then
	sql="select * from tb_zkz where jid="&jid&" and kc='"&kc&"' order by kh"
else
	if f<>"" then
		sql="select * from tb_zkz where jid="&jid&" and cardid in(select card from tb_user where uface='' or isnull(uface)) order by kh"
	else
		sql="select * from tb_zkz where jid="&jid&" order by kh"
	end if
end if
  rs.open sql,conn,1,1
  i=1
 
  while not rs.eof		
	sql2="select uid,uname,uface from tb_user where card='"&rs("cardid")&"'"
	'rw sql2&"<br>"
	uface=""
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		uid=rs2("uid")
		uname=rs2("uname")
		if rs2("uface")<>"" then uface="<a href='photo/"&rs2("uface")&"' target=_blank>√已采集</a>"
	end if
	rs2.close
	
	sql2="select * from tb_bm where jid="&jid&" and uid="&uid
	'rw sql2&"<br>"
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		gid=rs2("gid")
		bmdt=rs2("bmdt")
	end if
	rs2.close

	sql2="select * from tb_gw where jid="&jid&" and gid="&gid
	'rw sql2&"<br>"
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		zpdw=rs2("zpdw")
		bm=rs2("bm")
		gwmc=rs2("gwmc")
		gtype=rs2("gtype")
	end if
	rs2.close
  %>
  <tr>
    <td align="center"><%=i%></td>
    <td align="center"><a href="admin_zkz.asp?jid=<%=jid%>&uid=<%=uid%>" target="_blank"><%=rs("kh")%></a></td>
    <td align="center"><a href="admin_uview.asp?uid=<%=uid%>" target="_blank"><%=uname%></a></td>
    <td align="center"><%=uface%></td>
    <td><%=zpdw&":"&bm&":"&gwmc%></td>
    <td align="center"><%=bmdt%></td>
    <td align="center"><%=rs("kc")&rs("kcjs")%></td>
    </tr>
  <%
  		i=i+1
		rs.movenext
	wend
	rs.close
  %>
</table>
<script language="javascript">
showtable("gwtable");
</script>
</body>
</html>
