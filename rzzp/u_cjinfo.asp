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
<%
  set rs=server.CreateObject("adodb.recordset")
  set rs2=server.CreateObject("adodb.recordset")
  sql="select top 1 * from tb_bm where uid="&session("uid")&" order by id desc"
  rs.open sql,conn,1,1
  i=1
  if not rs.eof then
  	jid=rs("jid")
	gid=rs("gid")
	bmdt=rs("bmdt")
	
	sql2="select * from tb_job where jid="&jid
	rs2.open sql2,conn,1,1
	jname=rs2("jname")
	cjsta=rs2("gkflag")
	bsbl=rs2("bsbl")
	msbl=rs2("msbl")
	if cjsta=false then
		cjsta="成绩还没有发布"
	else
		cjsta="成绩已发布"
	end if
	'btime=rs2("btime")
	'etime=rs2("etime")
	rs2.close
	
	rw "<p class='newstit'>发布状态："&cjsta&"</p>"
else
	rw "<p class='newstit'>没有报名信息</p>"
	response.End()
end if
rs.close
set rs=nothing
%>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable">
  <tr>
    <th>报名单位部门岗位</th>
    <th width="15%">报名时间</th>
    <th width="10%">准考证</th>
    <th width="10%">笔试成绩</th>
    <th width="12%">入围面试分数线</th>
    <th width="10%">面试成绩</th>
    <th width="7%">总成绩</th>
  </tr>
  <%
	sql2="select * from tb_gw where jid="&jid&" and gid="&gid
	rs2.open sql2,conn,1,1
	zpdw=rs2("zpdw")
	bm=rs2("bm")
	gwmc=rs2("gwmc")
	gtype=rs2("gtype")
	if cjsta="成绩已发布" then
		fsx=rs2("rwcj")
	else
		fsx=""
	end if
	rs2.close
	
	zkzh=""
	sql2="select * from tb_zkz where jid="&jid&" and cardid=(select card from tb_user where uid="&session("uid")&")"
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		zkzh="<a href='u_zkz_1.asp?jid="&jid&"'>"&rs2("kh")&"</a>"
	end if
	rs2.close
	
	if cjsta="成绩已发布" then
		sql2="select * from tb_cj where jid="&jid&" and sfz=(select card from tb_user where uid="&session("uid")&")"
	
		rs2.open sql2,conn,1,1
		if not rs2.eof then
			cj1=rs2("cj1")
			cj2=rs2("cj2")
			'zcj=rs2("zcj")
			if cj1<>"" and cj2<>"" then zcj=cj1*bsbl/100+cj2*msbl/100
		else
			cj1=""
			cj2=""
		end if
		rs2.close
		set rs2=nothing
	end if
	closeconn 
  %>
  <tr>
    <td><%=zpdw&"："&bm%>：<%=gwmc%></td>
    <td align="center"><%=bmdt%></td>
    <td align="center"><%=zkzh%></td>
    <td align="center"><%=cj1%></td>
    <td align="center"><%=fsx%></td>
    <td align="center"><%=cj2%></td>
    <td align="center"><%=zcj%></td>
  </tr>
  <%if cjsta="成绩已发布" and cj1=""  then%>
  <tr>
    <td colspan="7" class="redfont"><strong>注意：为确保招聘工作的公正性，入围面试人选的成绩暂不发布，待面试结束后一并告之。</strong></td>
  </tr>
  <%end if%>
</table>
</body>
</html>
