<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>准考证打印</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script src="comm.js" language="javascript"></script>
<style media="print" type="text/css">　　
.Noprint{display:none;}  
</style>
</head>
<%
set rs=server.CreateObject("adodb.recordset")
set rs2=server.CreateObject("adodb.recordset")
jid=request.QueryString("jid")
dwid=request.QueryString("dwid")
if jid<>"" then
	jid=intsql(jid)
	sql="select jname from tb_job where jid="&jid
	rs.open sql,conn,1,1
	if not rs.eof then
		jname=rs("jname")
	end if
	rs.close
else
	msg "请选择招聘信息！","-1"
end if
if dwid<>"" then dwid=intsql(dwid)
%>
<body>
<form id="form1" name="form1" method="post" action="admin_kcsave.asp?jid=<%=jid%>">
<div class="unav Noprint">当前位置：<%=jname%> -> 准考证打印
  <label>
  <select name="room" size="1" id="room" onchange="javascript:godw(this.value)">
  <option value="" <%if dwid="" then rw "selected"%>>请选择单位</option>
  <%
  sql="select * from tb_duser"
  rs.open sql,conn,1,1
  while not rs.eof
  	tmpdwid=rs("uid")
	if dwid=tmpdwid then
		tempr="selected"
	else
		tempr=""
	end if

	rw "<option value='"&tmpdwid&"' "&tempr&">"&rs("dname")&"</option>"
	rs.movenext
  wend
  rs.close
  %>
  </select>
  </label> 
  【<a href="admin_kc.asp?jid=<%=jid%>">返回考场分配</a>】【<a href='admin_zkz_dwall.asp?jid=<%=jid%>&dwid=<%=dwid%>'>准考证打印</a>】</div>
<table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" id="gwtable">
  <tr>
    <th width="5%">编号</th>
    <th width="15%">准考证号</th>
    <th width="10%">姓 名</th>
    <th width="20%">工作单位</th>
    <th width="25%">报考部门岗位名称</th>
    <th width="12%">报名时间</th>
    <th width="13%">考场</th>
    </tr>
  <%
if dwid<>"" then
 	sql="select * from tb_exam where jid="&jid&" and uid in(select uid from tb_user where did="&dwid&") order by kh,rid" 
else
	sql="select * from tb_exam where jid="&jid&" order by kh,rid"
end if

  rs.open sql,conn,1,1
  i=1
  while not rs.eof	
	uid=rs("uid")
	kh=rs("kh")
	rid=rs("rid")
	
	sql2="select gid,gzdw,bmdt from tb_bm where jid="&jid&" and uid="&uid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		dwid=rs2("gzdw")
		gid=rs2("gid")
		bmdt=rs2("bmdt")
	end if
	rs2.close
	
	sql2="select uname from tb_user where uid="&uid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		uname=rs2(0)
	end if
	rs2.close
	
	sql2="select dname from tb_duser where uid="&dwid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		gzdw=rs2(0)
	end if
	rs2.close
	
	sql2="select bm,gwmc,gtype,jhrs from tb_gw where gid="&gid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		bm=rs2("bm")
		gwmc=rs2("gwmc")
		gtype=rs2("gtype")
	end if
	rs2.close
	
	sql2="select rname from tb_room where rid="&rid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		uroom=rs2(0)
	end if
	rs2.close
	
  %>
  <tr>
    <td align="center"><%=i%></td>
    <td align="center"><a href="admin_zkz.asp?jid=<%=jid%>&uid=<%=uid%>"><%=kh%></a></td>
    <td align="center"><a href="admin_zkz.asp?jid=<%=jid%>&uid=<%=uid%>"><%=uname%></a></td>
    <td align="center"><%=gzdw%></td>
    <td align="center"><%=bm&":"&gwmc%></td>
    <td align="center"><%=bmdt%></td>
    <td align="center"><%=uroom%>&nbsp;</td>
    </tr>
  <%
  		i=i+1
		rs.movenext
	wend
	rs.close
  %>
</table>
</form>
<script language="javascript">
showtable("gwtable");
function godw(dwid)
{
location.href="?jid=<%=jid%>"+"&dwid="+dwid;
}
</script>
</body>
</html>
