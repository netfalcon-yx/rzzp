<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>招聘岗位</title>
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
nowrid=request.QueryString("rid")
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
if nowrid<>"" then nowrid=intsql(nowrid)
%>
<body>
<form id="form1" name="form1" method="post" action="admin_kcsave.asp?jid=<%=jid%>">
<div class="unav Noprint">当前位置：<%=jname%> -> 考场考生浏览
  <label>
  <select name="room" size="1" id="room" onchange="javascript:goroom(this.value)">
  <option value="" <%if nowrid="" then rw "selected"%>>请选择考场</option>
  <%
  j=0
  sql="select * from tb_room order by rid"
  rs.open sql,conn,1,1
  while not rs.eof
  	rid=rs("rid")
	if rid=nowrid then
		tempr="selected"
	else
		tempr=""
	end if
	sql2="select count(kid) from tb_exam where jid="&jid&" and rid="&rid
	rs2.open sql2,conn,1,1
	roomrs=rs2(0)
	rs2.close
	rw "<option value='"&rid&"' "&tempr&">"&rs("rname")&"("&roomrs&"/"&rs("rmax")&")</option>"
	j=j+1
	rs.movenext
  wend
  rs.close
  %>
  </select>
  </label> 
  【<a href="admin_kc.asp?jid=<%=jid%>">返回考场分配</a>】&nbsp;【<a href="admin_kc_print.asp?jid=<%=jid%>&rid=<%=nowrid%>" target="_blank">考场打印</a>】&nbsp;【<a href='admin_zkz_all.asp?jid=<%=jid%>&rid=<%=nowrid%>'>准考证打印</a>】</div>
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
if nowrid<>"" then
 	sql="select * from tb_exam where jid="&jid&" and rid="&nowrid&" order by kh,rid" 
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
var win=null;
function goroom(rid)
{
location.href="?jid=<%=jid%>"+"&rid="+rid;
}
function openwprint()
{
win=window.open("about:blank");       //打开一个空页面 
//win.moveTo(100,100);                           //移动到指定位置 
win.location=document.location.href;       //指定页面的内容
window.setTimeout("CheckPrintData()",50);

win.print();  //打印页面 
}
function CheckPrintData()
{
	if(win.document.getElementById("div1") == null)
	{
		window.setTimeout("CheckPrintData()",50);
		return;
	}
	else
	{
		win.document.getElementById("div1").style.display="none";
		return;
	}
}
</script>
</body>
</html>
