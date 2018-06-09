<!--#include file="conn.asp"-->
<%chku 1%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>报名信息</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable">
  <tr>
    <th width="4%">编号</th>
    <th width="35%">报名岗位</th>
    <th width="10%">报名时间</th>
    <th width="15%">所在单位审核</th>
    <th width="15%">人资部审核</th>
    <th>编辑</th>
  </tr>
  <%
  set rs=server.CreateObject("adodb.recordset")
  set rs2=server.CreateObject("adodb.recordset")
  sql="select top 1 * from tb_bm where uid="&session("uid")&" order by id desc"
  rs.open sql,conn,1,1
  i=1
  while not rs.eof
  	bmid=rs("id")
	jid=rs("jid")
	gid=rs("gid")
	
	chk1=rs("hg1")
	chk2=rs("hg2")
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
			chk2="&nbsp;"
		else
			chk2="<span class='redfont'>"&chk2&"</span>"
		end if
	end if
	
	sql2="select * from tb_job where jid="&jid
	rs2.open sql2,conn,1,1
	jname=rs2("jname")
	btime=rs2("btime")
	etime=rs2("etime")
	rs2.close
	
	sql2="select zpdw,bm,gwmc,gtype from tb_gw where jid="&jid&" and gid="&gid
	rs2.open sql2,conn,1,1
	zpdw=rs2("zpdw")
	bm=rs2("bm")
	gwmc=rs2("gwmc")
	gtype=rs2("gtype")
	rs2.close
	
	tempdel=""
	tempedit="<a href='printubm.asp?id="&bmid&"' target=_blank>打印报名登记表</a> "
	if rs("hg1") or rs("hg2") then
		'tempdel="<a href='javascript:alert(""已审核不能删除！"")'>删除</a>"
		tempedit=tempedit&"<a href='u_baom.asp?id="&rs("id")&"&jid="&jid&"&gid="&gid&"' onclick='alert(""已审核只能浏览不能再编辑！"")'>编辑</a>"
		tempedit=tempedit&" <a href='javascript:alert(""已审核不能删除！"")'>删除</a>"
	else
		'tempdel="<a href='u_bmdel.asp?id="&rs("id")&"' onclick='{if(confirm(""警告：确定删除该报名信息吗?"")){return true;}return false;}'>删除</a>"
		tempedit=tempedit&"<a href='u_baom.asp?id="&rs("id")&"&jid="&jid&"&gid="&gid&"'>报名修改</a>"
		tempedit=tempedit&" <a href='u_bmdel.asp?id="&rs("id")&"' onclick='return confirm(""提示：确定删除该报名信息吗?\n\n删除后不能恢复，只能重新报名！"")'>删除</a>"
	end if
	
		
  %>
  <tr>
    <td align="center"><%=i%></td>
    <td align="center"><%=zpdw%>:<%=bm%>:<%=gwmc%></td>
    <td align="center"><%=rs("bmdt")%></td>
    <td align="center"><%=chk1%></td>
    <td align="center"><%=chk2%></td>
    <td align="center"><%=tempedit%></td>
  </tr>
  <%
  	i=i+1
  	rs.movenext
	wend
	rs.close
	if i=1 then
		sql="select * from tb_job"
		rs.open sql,conn,1,1
		if not rs.eof then
  %>
<tr>
    <td colspan="6" align="center">还没有报名 >> <a href="u_gw.asp?jid=<%=rs("jid")%>">点击开始选岗报名</a></td>
  </tr>
<%
		end if
		rs.close
	end if
	set rs=nothing
	closeconn
%>
</table>
</body>
</html>
