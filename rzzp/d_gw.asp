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
<div class="unav">当前位置：<%=jname%> -> 岗位报名审核&nbsp;&nbsp;【<a href="d_tongji.asp?jid=<%=jid%>" target="_blank">导出报名汇总表</a>】</div>
<table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" id="tbgwlist">
  <tr>
    <th width="5%">编号</th>
    <th width="10%">姓 名</th>
    <th width="19%">报考岗位名称</th>
    <th width="12%">所属部门</th>
    <th width="8%">计划人数</th>
    <th width="10%">报名时间</th>
    <th width="8%">所在单位审核</th>
    <th width="10%">人资部审核</th>
    <th>审核浏览打印</th>
  </tr>
  <%
  sql="select * from tb_bm where jid="&jid&" and gzdw="&session("duid")&" order by hg1 desc,id"
  rs.open sql,conn,1,1
  i=1
  while not rs.eof
  	chkedit=""
	chk1=rs("hg1")
	chk2=rs("hg2")
	uid=rs("uid")
	
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
		chkedit="<a href='d_mdf_baom.asp?id="&id&"&uid="&uid&"'>编辑</a>&nbsp;"
		
		chk2=rs("hg2bz")
		if chk2="" or isnull(chk2) then
			chk2="&nbsp;"
		else
			chk2="<span class='redfont'>"&chk2&"</span>"
		end if
	end if
	
	
	sql2="select uname from tb_user where uid="&uid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		uname=rs2(0)
	end if
	rs2.close
	
	gid=rs("gid")
	sql2="select bm,gwmc,gtype,jhrs from tb_gw where jid="&jid&" and gid="&gid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		bm=rs2("bm")
		gwmc=rs2("gwmc")
		gtype=rs2("gtype")
		jhrs=rs2("jhrs")
	end if
	rs2.close
  %>
  <tr>
    <td align="center"><%=i%></td>
    <td align="center"><a href="javascript:void(0)" onclick="openwin('<%=rs("uid")%>')"><%=uname%></a></td>
    <td align="center"><a href="javascript:openwin2('<%=jid%>','<%=rs("gid")%>')"><%=gwmc%></a></td>
    <td align="center"><%=bm%></td>
    <td align="center"><%=jhrs%></td>
    <td align="center"><%=rs("bmdt")%></td>
    <td align="center"><%=chk1%></td>
    <td align="center"><%=chk2%></td>
    <td align="center"><%=chkedit%><a href='d_uinfo.asp?id=<%=rs("id")%>'>审核</a>&nbsp;<a href="printubm.asp?id=<%=id%>" target="_blank">打印登记表</a></td>
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
function openwin(uid)
{
	temppage="d_uview.asp?uid="+uid;
	temptit="用户资料浏览";
	//temppage="admin_t_test.asp?tid="+tid;
	var dlg = new J.dialog({ title:temptit,rang:true,page:temppage,autoSize:true,cover:true,btns: false,maxBtn:false,btnBar:false,bgcolor:'#000',iconTitle:false}); 
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
