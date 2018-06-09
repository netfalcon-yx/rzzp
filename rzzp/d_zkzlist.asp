<!--#include file="conn.asp"-->
<!--#include file="page.asp"-->
<%chku 2%>
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
	sql="select jname,zkzflag from tb_job where jid="&jid
	rs.open sql,conn,1,1
	if not rs.eof then
		jname=rs("jname")
		zkzflag=rs("zkzflag")
	end if
	rs.close
else
	msg "请选择招聘信息！","-1"
end if
if zkzflag=false then msg "准考证打印还未开放！","-1"
curdw=""
sql="select dname from tb_duser where uid="&session("duid")
rs.open sql,conn,1,1
if not rs.eof then
	curdw=rs(0)
end if
rs.close

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
<div class="unav">当前位置：<%=jname%> -> <%=curdw%>：准考证打印 </div>
<table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" id="gwtable">
  <tr>
    <th width="5%">编号</th>
    <th width="15%">准考证号</th>
    <th width="10%">姓 名</th>
    <th width="20%">工作单位</th>
    <th>报考部门岗位名称</th>
    <th width="15%">考场</th>
    </tr>
  <%
sql="select * from tb_exam where jid="&jid&" and uid in(select uid from tb_user where did="&session("duid")&") order by kh"
Set mypage=new xdownpage
mypage.getconn=conn
	'sql语句
mypage.getsql=sql
	'设置每一页的记录条数据为20条setcolor(rsg("title"),rsg("tfont"),rsg("tcolor"))
mypage.pagesize=15
page=mypage.pagesize

'返回Recordset
set rs=mypage.getrs()
page=mypage.pagesize
i=1
alluid=""
while not rs.eof and page>0
	uid=rs("uid")
	if alluid="" then
		alluid=uid
	else
		alluid=alluid&","&uid
	end if
		
	sql2="select uname from tb_user where uid="&uid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		uname=rs2(0)
	end if
	rs2.close
		
	gid=rs("gid")
	sql2="select bm,gwmc,gtype,jhrs from tb_gw where gid=(select gid from tb_bm where jid="&jid&" and uid="&uid&")"
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		bm=rs2("bm")
		gwmc=rs2("gwmc")
		gtype=rs2("gtype")
	end if
	rs2.close
	
	uroom=""
	sql2="select rname from tb_room where rid="&rs("rid")
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		uroom=rs2(0)
	end if
	rs2.close
  %>
  <tr>
    <td align="center"><%=i%></td>
    <td align="center"><a href="d_zkz_view.asp?jid=<%=jid%>&uid=<%=uid%>"><%=rs("kh")%></a></td>
    <td align="center"><a href="d_zkz_view.asp?jid=<%=jid%>&uid=<%=uid%>"><%=uname%></a></td>
    <td align="center"><%=curdw%></td>
    <td align="center"><%=bm&":"&gwmc%></td>
    <td align="center"><%=uroom%>&nbsp;</td>
    </tr>
  <%
  		i=i+1
		rs.movenext
		page=page-1
	wend
  %>
   <tr>
    <td colspan="6" align="center"><%mypage.showpage()%></td>
  </tr>
</table>
<% 
rs.close
set rs=nothing
%>
<script language="javascript">
showtable("gwtable");
</script>
</body>
</html>
