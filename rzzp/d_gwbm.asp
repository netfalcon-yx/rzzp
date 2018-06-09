<!--#include file="conn.asp"-->
<%chku 2%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>招聘岗位</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="comm.js"></script>
<script type="text/javascript" src="lhgdialog/lhgcore.min.js"></script> 
<script type="text/javascript" src="lhgdialog/lhgdialog.min.js"></script>
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
<div class="unav">当前位置：<%=jname%> -> 岗位报名浏览</div>
<table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" id="tbgwlist">
  <tr>
    <th width="10%">编号</th>
    <th width="40%">岗位名称</th>
    <th width="20%">所属部门</th>
    <th width="15%">计划人数</th>
    <th width="15%">单位报名人数</th>
  </tr>
  <%
  Randomize
  sql="select * from tb_gw where jid="&jid&" order by gid"
  
  rs.open sql,conn,1,1
  i=1
  while not rs.eof
  	sql2="select count(id) from tb_bm where jid="&jid&" and gid="&rs("gid")&" and gzdw="&session("duid")
	rs2.open sql2,conn,1,1
	dwbmrs=rs2(0)
	rs2.close
	if dwbmrs>0 then
		bmview="<b><a href='d_gw.asp?jid="&rs("jid")&"'><span class='redfont'>"&dwbmrs&"</span></a></b>"
	else
		bmview="无"
	end if
  %>
  <tr>
    <td align="center"><%=i%></td>
    <td><a href="javascript:openwin2('<%=jid%>','<%=rs("gid")%>')"><%=rs("gwmc")%></a></td>
    <td align="center"><%=rs("bm")%></td>
    <td align="center"><%=rs("jhrs")%></td>
    <td align="center"><%=bmview%></td>
  </tr>
  <%
  		i=i+1
		rs.movenext
	wend
	rs.close
  %>
</table>
<script language="javascript">
showtable("tbgwlist");
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
