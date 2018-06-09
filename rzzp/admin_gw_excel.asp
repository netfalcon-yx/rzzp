<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>招聘岗位</title>
<style>
.printtable{BORDER-COLLAPSE: collapse;}
.printtable th{border-bottom:1px solid #000000;height:30px;line-height:30px;text-align:center;font-size:14px}
.printtable TBODY TR TD
{
 BORDER:#000000 1px solid;padding-left:5px;height:25px;text-align:center;
}
.text {mso-number-format:\@; }
</style>
<%
Response.AddHeader "Content-Disposition", "attachment;filename=tongji_dw.xls" 
Response.ContentType = "application/vnd.ms-excel"
%>
</head>
<%
set rs=server.CreateObject("adodb.recordset")
set rs2=server.CreateObject("adodb.recordset")
jid=request.QueryString("jid")
if jid<>"" then
	jid=intsql(jid)
	sql="select jname,endflag from tb_job where jid="&jid
	rs.open sql,conn,1,1
	if not rs.eof then
		jname=rs("jname")
		endflag=rs("endflag")
	end if
	rs.close
else
	msg "请选择招聘信息！","-1"
end if

%>
<body>
<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#333333" class="printtable">
  <tr>
    <th bgcolor="#CCCCCC">编号</th>
    <th bgcolor="#CCCCCC">岗位名称</th>
    <th width="20%" bgcolor="#CCCCCC">所属部门</th>
    <th bgcolor="#CCCCCC">岗位类型</th>
    <th bgcolor="#CCCCCC">计划人数</th>
    <th bgcolor="#CCCCCC">报名人员</th>
    <th bgcolor="#CCCCCC">报名人数</th>
    <th bgcolor="#CCCCCC">合格人选</th>
    <th bgcolor="#CCCCCC">合格人数</th>
  </tr>
  <%
  sql="select * from tb_gw where jid="&jid&" order by gtype,gid"
  rs.open sql,conn,1,1
  i=1
  while not rs.eof
  %>
  <tr>
    <td align="center" bgcolor="#FFFFFF"><%=i%></td>
    <td align="center" bgcolor="#FFFFFF"><%=rs("gwmc")%></td>
    <td align="center" bgcolor="#FFFFFF"><%=rs("bm")%></td>
    <td align="center" bgcolor="#FFFFFF"><%=UCase(rs("gtype"))%></td>
    <td align="center" bgcolor="#FFFFFF"><%=rs("jhrs")%></td>
    <td align="center" bgcolor="#FFFFFF">
	<%
	j=0
	sql2="select id,uid,(select uname from tb_user where uid=a.uid)as uname from tb_bm a where jid="&jid&" and gid="&rs("gid")&" order by id"
	rs2.open sql2,conn,1,1
	while not rs2.eof
		rw rs2("uname")&"&nbsp;"
		j=j+1
		rs2.movenext
	wend
	rs2.close
	
	%>	</td>
    <td align="center" bgcolor="#FFFFFF"><span class='redfont'><%=j%></span>人</td>
    <td align="center" bgcolor="#FFFFFF">
	<%
	j=0
	sql2="select id,uid,(select uname from tb_user where uid=a.uid)as uname from tb_bm a where jid="&jid&" and gid="&rs("gid")&" and hg1=true and hg2=true order by id"
	rs2.open sql2,conn,1,1
	while not rs2.eof
		rw rs2("uname")&"&nbsp;"
		j=j+1
		rs2.movenext
	wend
	rs2.close
	%>	</td>
    <td align="center" bgcolor="#FFFFFF"><span class='redfont'><%=j%></span>人</td>
  </tr>
  <%
  		i=i+1
		rs.movenext
	wend
	rs.close
  %>
</table>
</body>
</html>
