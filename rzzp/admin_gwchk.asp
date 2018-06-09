<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>招聘岗位</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="comm.js"></script>
</head>
<%
set rs=server.CreateObject("adodb.recordset")
set rs2=server.CreateObject("adodb.recordset")
jid=request.QueryString("jid")
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
%>
<body>
<div class="unav">当前位置：<%=jname%> -> 岗位报名审核 【<a href="admin_tj_dwsum.asp?jid=<%=jid%>">按单位统计</a>】&nbsp;【<a href="admin_tj_gwsum.asp?jid=<%=jid%>">按岗位统计</a>】</div>
<table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" id="gwtable">
  <tr>
    <th width="5%">编号</th>
    <th width="10%">姓 名</th>
    <th width="15%">工作单位</th>
    <th>报考部门岗位名称</th>
    <th width="10%">报名时间</th>
    <th width="10%">所在单位审核</th>
    <th width="10%">人资部审核</th>
    <th width="12%">审核浏览</th>
  </tr>
  <%
  sql="select * from tb_bm where jid="&jid&" and hg1=true order by hg2 desc,gid,id"
  rs.open sql,conn,1,1
  i=1
  while not rs.eof
  	chk1=rs("hg1")
	chk2=rs("hg2")
	id=rs("id")
	if chk1 then
		chk1="<span class='bluefont'>√</span>"
	else
		chk1=rs("hg1bz")
		if chk1="" or isnull(chk1) then
			chk1="&nbsp;"
		else
			chk1="<span class='redfont'>"&chk1&"</span>"
		end if
	end if
	
	if chk2 then
		chk2="<span class='bluefont'>√</span>"
	else
		chk2=rs("hg2bz")
		if chk2="" or isnull(chk2) then
			chk2="<span class='redfont'>待审</span>"
		else
			chk2="<span class='redfont'>"&chk2&"</span>"
		end if
	end if
	
	uid=rs("uid")
	dwid=rs("gzdw")
	
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
	
	gid=rs("gid")
	sql2="select zpdw,bm,gwmc,gtype,jhrs from tb_gw where jid="&jid&" and gid="&gid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		zpdw=rs2("zpdw")
		bm=rs2("bm")
		gwmc=rs2("gwmc")
		gtype=rs2("gtype")
		jhrs=rs2("jhrs")
	end if
	rs2.close
  %>
  <tr>
    <td align="center"><%=i%></td>
    <td align="center"><a href='admin_uinfo.asp?id=<%=rs("id")%>'><%=uname%></a></td>
    <td align="center"><%=gzdw%></td>
    <td align="center"><%=zpdw&":"&bm&":"&gwmc%></td>
    <td align="center"><%=rs("bmdt")%></td>
    <td align="center"><%=chk1%></td>
    <td align="center"><%=chk2%></td>
    <td align="center"><a href='admin_uinfo.asp?id=<%=rs("id")%>'>浏览审核</a> &nbsp;<a href="printubm.asp?id=<%=id%>" target="_blank">打印</a></td>
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
