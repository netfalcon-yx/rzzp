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
gid=request.QueryString("gid")
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
<form id="form1" name="form1" method="post" action="admin_kcsave.asp?jid=<%=jid%>">
<div class="unav">当前位置：<%=jname%> -> 考场分配（为审核合格的考生分配考场及准考证号）
  <label>
  <select name="gtype" size="1" id="gtype" onchange="javascript:gogtype(this.value)">
    <option value="">全部类型</option>
    <option value="a" <%if gtype="a" then rw "selected"%>>A类岗位</option>
    <option value="b" <%if gtype="b" then rw "selected"%>>B类岗位</option>
  </select>
  </label>
   <label>
  <select name="gwid" size="1" id="gwid" onchange="javascript:gogw(this.value)">
    <option value="">--全部岗位--</option>
	<%
	sql="select * from tb_gw where jid="&jid
	rs.open sql,conn,1,1
	while not rs.eof
		rw "<option value='"&rs("gid")&"' "&tempgwbm&">"&rs("bm")&":"&rs("gwmc")&"</option>"&chr(13)
		rs.movenext
	wend
	rs.close
	%>
  </select>
  </label>
  <label>
  <select name="kcroom" size="1" id="kcroom" onchange="javascript:goroom(this.value)">
  <option value="">请选择考场</option>
  <%
  sql="select * from tb_room order by rid"
  rs.open sql,conn,1,1
  while not rs.eof
	rw "<option value='"&rs("rid")&"'>"&rs("rname")&"</option>"
	rs.movenext
  wend
  rs.close
  %>
  </select></label>
</div>
<div class="unav"><a href="admin_kckh.asp?jid=<%=jid%>">第一步：生成准考证号</a>&nbsp;&nbsp;&nbsp;&nbsp;<b style="background:#FFFF66" class="redfont">第二步：分配考场</a></b> &nbsp;【★<a href="admin_zkz_dwview.asp?jid=<%=jid%>">准考证打印</a>&nbsp;&nbsp;<a href="admin_kc_print.asp?jid=<%=jid%>&rid=<%=nowrid%>" target="_blank" title="为监考老师打印带照片的考生信息表">⊙监考考场打印</a>&nbsp;&nbsp;<a href="admin_kcfb_print.asp?jid=<%=jid%>&rid=<%=nowrid%>" target="_blank" title="打印考生考场分布统计表">∷考场分布打印</a>&nbsp;&nbsp;<a href="admin_kcbz_print.asp?jid=<%=jid%>&rid=<%=nowrid%>" target="_blank" title="打印考场布置考生信息表">☆考场布置打印</a>】</div>
<table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" id="gwtable">
  <tr>
    <th width="5%">编号</th>
    <th width="15%">准考证号</th>
    <th width="10%">姓 名</th>
    <th width="20%">工作单位</th>
    <th width="20%">报考部门岗位名称</th>
    <th width="10%">报名时间</th>
    <th width="12%">考场</th>
    <th width="8%">分配
      <label>
      <input name="checkbox" type="checkbox" class="radio" value="checkbox" onclick="checkAll('kcuid',this.checked)" />
      </label></th>
  </tr>
  <%
if gtype="" and gid="" and nowrid="" then
  	sql="select * from tb_exam where jid="&jid&" order by kh,kid"
elseif gtype<>"" then
	sql="SELECT * from tb_exam where jid="&jid&" and uid in(select uid from tb_bm where jid="&jid&" and hg1=true and hg2=true and gid in(select gid from tb_gw where gtype='"&gtype&"')) order by kh,kid"
elseif gid<>"" then
	sql="SELECT * from tb_exam where jid="&jid&" and uid in(select uid from tb_bm where jid="&jid&" and gid="&gid&") order by kh,kid"
elseif nowrid<>"" then
	sql="SELECT * from tb_exam where jid="&jid&" and rid="&nowrid&" order by kh,kid"
end if


'rw sql
'response.End()
  rs.open sql,conn,1,1
  i=1
  while not rs.eof	
	uid=rs("uid")
	ukh=rs("kh")
	rid=rs("rid")
	
	sql2="select uname from tb_user where uid="&uid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		uname=rs2(0)
	end if
	rs2.close
	
	sql2="select dname from tb_duser where uid=(select gzdw from tb_bm where jid="&jid&" and  uid="&uid&")"
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		gzdw=rs2(0)
	end if
	rs2.close
	
	sql2="select bm,gwmc,gtype,jhrs from tb_gw where gid=(select gid from tb_bm where jid="&jid&" and uid="&uid&")"
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		bm=rs2("bm")
		gwmc=rs2("gwmc")
		gtype=rs2("gtype")
	end if
	rs2.close
	
	uroom=""
	sql2="select rname from tb_room where rid="&rid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		uroom=rs2(0)
	end if
	rs2.close
	
	sql2="select bmdt from tb_bm where jid="&jid&" and  uid="&uid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		bmdt=rs2(0)
	end if
	rs2.close
  %>
  <tr>
    <td align="center"><%=i%></td>
    <td align="center"><a href="admin_zkz.asp?jid=<%=jid%>&uid=<%=uid%>"><%=ukh%></a></td>
    <td align="center"><a href="admin_zkz.asp?jid=<%=jid%>&uid=<%=uid%>"><%=uname%></a></td>
    <td align="center"><%=gzdw%></td>
    <td align="center"><%=bm&":"&gwmc%></td>
    <td align="center"><%=bmdt%></td>
    <td align="center"><%=uroom%>&nbsp;</td>
    <td align="center"><input name="kcuid" type="checkbox" class="radio" value="<%=uid%>" /></td>
  </tr>
  <%
  		i=i+1
		rs.movenext
	wend
	rs.close
  %>
</table>
<div class="unav" style="text-align:center">选中用户分配到：
  <label>
  <select name="room" size="1" id="room">
  <%
  roomcur=""
  j=0
  sql="select * from tb_room order by rid"
  rs.open sql,conn,1,1
  while not rs.eof
  	rid=rs("rid")
	sql2="select count(kid) from tb_exam where jid="&jid&" and rid="&rid
	rs2.open sql2,conn,1,1
	roomrs=rs2(0)
	rs2.close
	if roomcur="" then
		roomcur=rs("rmax")-roomrs
	else
  		roomcur=roomcur&","&(rs("rmax")-roomrs)
	end if
	rw "<option value='"&rid&"'>"&rs("rname")&"("&roomrs&"/"&rs("rmax")&")</option>"
	j=j+1
	rs.movenext
  wend
  'if roomcur<>"" then roomcur="["&roomcur&"]"
  rs.close
  %>
  </select>
  </label>
  <label>
  &nbsp;
  <input name="kcfp" type="button" class="but2" id="kcfp" value="分 配" onclick="setroom()" />
  </label>
</div>
</form>
<script language="javascript">
showtable("gwtable");
$("gwid").value="<%=gid%>";
$("kcroom").value="<%=nowrid%>";
function setroom()
{
	var tempuid;
	tempuid=GetChkLen("kcuid");
	if(tempuid==0)
	{
		alert("没有选择用户");
		return false;
	}
	else
	{
		var myroom=new Array(<%=roomcur%>);
		roomindex=$("room").selectedIndex;
		if(tempuid>=myroom[roomindex])
		{
			alert("选中的考生数量超出此考场剩余位置！");
			return false;
		}
		else
		{
			//alert("OK");
			document.form1.submit();
		}
	}
}
function gogtype(gtype)
{
location.href="?jid=<%=jid%>"+"&gtype="+gtype;
}
function gogw(gwid)
{
location.href="?jid=<%=jid%>"+"&gid="+gwid;
}
function goroom(rid)
{
location.href="?jid=<%=jid%>"+"&rid="+rid;
}
</script>
</body>
</html>
