<!--#include file="conn.asp"-->
<%chku 9%>
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
if endflag then
	tempdel="alert('本次招聘已完成，不能再删除岗位！');return false;"
	tempedit="alert('本次招聘已完成，不能再编辑岗位！');return false;"
else
	tempdel="{if(confirm('警告：删除此岗位同时将删除此岗位的报名、考试信息，确定要删除吗?')){return true;}return false;}"
	tempedit="{return true;}"
end if
%>
<body>
<div class="unav">当前位置：<%=jname%> -> 岗位浏览 【<a href="javascript:openwin('<%=jid%>','')">新增岗位</a>】【<a href="admin_gw_in.asp?jid=<%=jid%>">Excel导入岗位</a>】</div>
<table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable">
  <tr>
    <th width="5%">编号</th>
    <th>岗位名称</th>
    <th width="15%">招聘单位</th>
    <th width="15%">部门机构</th>
    <th width="8%">岗位类型</th>
    <th width="8%">计划人数</th>
    <th width="10%">审核人数</th>
    <th width="8%">面试分数线</th>
    <th width="10%">编辑</th>
  </tr>
  <%
  sql="select * from tb_gw where jid="&jid&" order by gid"
  rs.open sql,conn,1,1
  i=1
  while not rs.eof
  %>
  <tr>
    <td align="center"><%=rs("gid")%></td>
    <td><a href="javascript:openwin2('<%=jid%>','<%=rs("gid")%>')"><%=rs("gwmc")%></a></td>
    <td align="center"><%=rs("zpdw")%></td>
    <td align="center"><%=rs("bm")%></td>
    <td align="center"><%=UCase(rs("gtype"))%></td>
    <td align="center"><%=rs("jhrs")%></td>
    <td align="center">
	<%
	sql2="select count(id) from tb_bm where jid="&jid&" and gid="&rs("gid")&" and hg1=true and hg2=true"
	rs2.open sql2,conn,1,1
	bsrs=rs2(0)
	rs2.close
	if bsrs>0 then
		rw "<a href='admin_gw_tongji.asp?jid="&jid&"&gwid="&rs("gid")&"'>"&bsrs&"人</a>"
	else
		rw "<span class='redfont'>"&bsrs&"</span>人"
	end if	
	%>	</td>
    <td align="center"><%=rs("rwcj")%></td>
    <td align="center"><a href="javascript:openwin('<%=jid%>','<%=rs("gid")%>')" onclick="<%=tempedit%>">编辑</a> <a href="admin_gw_del.asp?jid=<%=jid%>&gid=<%=rs("gid")%>" onClick="<%=tempdel%>">删除</a></td>
  </tr>
  <%
  		i=i+1
		rs.movenext
	wend
	rs.close
  %>
</table>
<script language="javascript">
function openwin(jid,gid)
{
	temppage="admin_gw_add.asp?jid="+jid+"&gid="+gid;
	temptit="招聘岗位编辑";
	var dlg = new J.dialog({ title:temptit,rang:true,page:temppage,cover:true,btns: false, autoSize:true,maxBtn:false,btnBar:false,bgcolor:'#000',iconTitle:false}); 
	dlg.ShowDialog();
}
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
