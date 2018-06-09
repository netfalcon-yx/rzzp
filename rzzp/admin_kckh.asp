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
jid=request.QueryString("jid")
gtype=request.QueryString("gtype")
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
%>
<body>
<div class="unav">当前位置：<%=jname%> -> 考场考号分配管理（为审核合格的考生分配准考证号及考场） <span style="background:#FF0;">【<a href="admin_kckh_in.asp?jid=<%=jid%>">准考证Excel导入</a>】</span></div>

<table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" id="gwtable">
  <tr>
    <th width="5%">编号</th>
    <th width="10%">准考证号</th>
    <th width="10%">姓 名</th>
    <th width="15%">工作单位</th>
    <th>招聘单位、部门岗位名称</th>
    <th width="10%">报名时间</th>
    <th width="12%">考场教室</th>
    </tr>
  <%
'if gtype="" then
'  	sql="select * from tb_bm where jid="&jid&" and hg1=true and hg2=true order by gid,id"
'else
'	sql="select * from tb_bm where jid="&jid&" and hg1=true and hg2=true and gid in (select gid from tb_gw where jid="&jid&" and gtype='"&gtype&"') order by gid,id"
'end if
'rw sql
'response.End()
sql="select * from tb_zkz where jid="&jid&" order by kh"
  rs.open sql,conn,1,1
  i=1
 
  while not rs.eof		
	sql2="select uid,uname,did from tb_user where card='"&rs("cardid")&"'"
	'rw sql2&"<br>"
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		uid=rs2("uid")
		dwid=rs2("did")
		uname=rs2("uname")
	end if
	rs2.close
	
	sql2="select dname from tb_duser where uid="&dwid
	'rw sql2&"<br>"
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		gzdw=rs2(0)
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
    <td align="center"><a href="admin_zkz.asp?jid=<%=jid%>&uid=<%=uid%>"><%=rs("kh")%></a></td>
    <td align="center"><a href="admin_zkz.asp?jid=<%=jid%>&uid=<%=uid%>"><%=uname%></a></td>
    <td align="center"><%=gzdw%></td>
    <td align="center"><%=zpdw&":"&bm&":"&gwmc%></td>
    <td align="center"><%=bmdt%></td>
    <td align="center"><%=rs("kc")&rs("kcjs")%>&nbsp;</td>
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
function chkuser()
{
	var tempuid;
	tempuid=$("alluid").value;
	if(tempuid=="")
	{
		alert("没有用户不能生成准考证号！");
		return false;
	}
	return true;
}
function gogtype(gtype)
{
location.href="?jid=<%=jid%>"+"&gtype="+gtype;
}
</script>
</body>
</html>
