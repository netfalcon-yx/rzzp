<!--#include file="conn.asp"-->
<%chku 1%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>招聘岗位</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="lhgdialog/lhgcore.min.js"></script> 
<script type="text/javascript" src="lhgdialog/lhgdialog.min.js"></script>
</head>
<%
set rs=server.CreateObject("adodb.recordset")
sql="select top 1 * from tb_job order by jid desc"
rs.open sql,conn,1,1
if not rs.eof then
	jid=rs("jid")
	jname=rs("jname")
	btime=rs("btime")
	etime=rs("etime")
	endflag=rs("endflag")
	if endflag then
		endflag="<span class='redfont'>本次招聘已结束</span>"
	else
		endflag="<span class='bluefont'>报名进行中</span>"
		if datediff("s",now,btime)>0 then	endflag="报名还没开始"
		if datediff("s",now,etime)<0 then	endflag="<span class='redfont'>报名已截止</span>"
	end if
end if
rs.close
'response.End()
ubmchk=false
sql="select gid from tb_bm where jid="&jid&" and uid="&session("uid")
rs.open sql,conn,1,1
if not rs.eof then
	bmgid=rs(0)
	if rs("hg1") or rs("hg2") then ubmchk=true
	tempbm="<a href=""javascript:alert('一次只能报名一个岗位!');location.href='u_bminfo.asp';"">报名</a>"
else
	tempbm=""
end if
rs.close
%>
<body>
<div class="unav">报名起止时间：<%=btime%>至<%=etime%>，<%=endflag%></div>
<table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable">
  <tr>
    <th width="10%">编号</th>
    <th>岗位名称</th>
    <th width="25%">招聘单位</th>
    <th width="18%">所属部门</th>
    <th width="12%">计划人数</th>
    <th width="10%">岗位报名</th>
  </tr>
  <%
  'sql="select * from tb_gw where jid="&jid&" and gid in(7,8,9) order by gid"
  sql="select * from tb_gw where jid="&jid&" order by gid"
  rs.open sql,conn,1,1
  i=1
  while not rs.eof
  	tempbm2=""
  	if bmgid=rs("gid") then
		tempbm2="<span class='redfont'>√已报</span>"
		'a="<a href='?jid="&jid&"&udo=d' onclick='return confirm(""是否要删除你的报名?\n\n删除后不可恢复，只能重新报名！"");'>×删除</a>"
	elseif tempbm<>"" then
		tempbm2=tempbm
	else
		tempbm2="<a href='u_baom.asp?jid="&jid&"&gid="&rs("gid")&"'>报名</a>"
	end if
  %>
  <tr>
    <td align="center"><%=rs("gid")%></td>
    <td><a href="javascript:openwin2('<%=jid%>','<%=rs("gid")%>')"><%=rs("gwmc")%></a></td>
    <td align="center"><%=rs("zpdw")%></td>
    <td align="center"><%=rs("bm")%></td>
    <td align="center"><%=rs("jhrs")%></td>
    <td align="center"><%=tempbm2%></td>
  </tr>
  <%
  		i=i+1
		rs.movenext
	wend
	rs.close
  %>
</table>
<script language="javascript">
function openwin2(jid,gid)
{
	temppage="gw_view.asp?jid="+jid+"&gid="+gid;
	temptit="招聘岗位浏览";
	var dlg = new J.dialog({ title:temptit,rang:true,page:temppage,cover:true,btns: false, autoSize:true,maxBtn:false,btnBar:false,bgcolor:'#000',iconTitle:false}); 
	dlg.ShowDialog();
}
</script>
</body>
</html>
