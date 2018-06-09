<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>报名统计</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script src="comm.js" language="javascript"></script>
</head>
<%
jid=request.QueryString("jid")
if jid<>"" then
	jid=intsql(jid)
else
	msg "请选择招聘信息！","-1"
end if
uname=request.Form("uname")
'gid=request.querystring("gwid")
hgflag=request.QueryString("h")
set rs=server.CreateObject("adodb.recordset")
%>
<body>
<div class="unav">
  <form id="form1" name="form1" method="post" action="?jid=<%=jid%>">
  当前位置：招聘报名统计【<a href="admin_tj_dwsum.asp?jid=<%=jid%>">按单位合计统计</a>】&nbsp;&nbsp;【<a href="admin_tj_gwsum.asp?jid=<%=jid%>">按岗位合计统计</a>】&nbsp;&nbsp;【<a href="?jid=<%=jid%>" class="redfont"><strong class="redfont">报名汇总统计√</strong></a>】【<a href="?jid=<%=jid%>&h=0">未通过审核浏览</a>】
  <a href="admin_gwbm_print.asp?jid=<%=jid%>&h=<%=hgflag%>" target="_blank">导出Excel报名汇总表</a>
  <input name="uname" type="text" id="uname" size="10" maxlength="4" value="<%=uname%>" />
  <input name="button" type="submit" class="but2" id="button" value="搜索" />
  </form>
</div>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#333333" class="mytable" id="gwtable">
  <tr>
    <th width="5%" >序号</th>
    <th width="12%" >工作单位</th>    
    <th width="8%" >姓名</th>
    <th width="4%" >性别</th>
    <th width="8%" >出生年月</th>
    <th width="8%" >工作时间</th>
    <th width="8%" >政治面貌</th>
    <th width="8%" >职称</th>
    <th width="8%" >原始学历</th>
    <th width="8%" >现工作岗位</th>
    <th >应聘岗位</th>
  </tr>
  <%
curgw=""  
set rs2=server.CreateObject("adodb.recordset")
'if gid<>"" then
'  	sql="select zpdw,bm,gwmc from tb_gw where gid="&gid
'	rs.open sql,conn,1,1
'	if not rs.eof then
'		curgw=rs("zpdw")&":"&rs("bm")&":"&rs("gwmc")
'	end if
'	rs.close
'	if hgflag="" then
'		sql="select * from tb_bm where jid="&jid&" and gid="&gid&" and hg1 and hg2 order by gid,gzdw,id"
'	else
'		sql="select * from tb_bm where jid="&jid&" and gid="&gid&" order by gid,gzdw,id"
'	end if
'else
'	if hgflag="" then
'		sql="select * from tb_bm where jid="&jid&" and hg1 and hg2 order by gid,gzdw,id"
'	else
'		sql="select * from tb_bm where jid="&jid&" order by gid,gzdw,id"
'	end if
'end if
hsql=""
if hgflag="0" then hsql=" and (hg1=false or hg2=false)"
if uname<>"" then
	sql="select * from tb_bm where jid="&jid&" and uid in(select uid from tb_user where uname like '%"&uname&"%') "&hsql&" order by gid,gzdw,id"
else
	if hsql="" then
		sql="select * from tb_bm where jid="&jid&" and hg1 and hg2 order by gid,gzdw,id"
	else
		sql="select * from tb_bm where jid="&jid&hsql&" order by gid,gzdw,id"
	end if
end if
  rs.open sql,conn,1,1
  i=1
  while not rs.eof
  	uid=rs("uid")
	ugid=rs("gid")
	xl=rs("xl")
	xl2=rs("xl2")
	xw=rs("xw")
	byyxzy=rs("byyxzy")
	bysj=rs("bysj")	
	
	udid=rs("gzdw")
	zyzgz=rs("zyzgz")
	gzzw=rs("gzzw")
	gzsj=rs("gzsj")
	zyjszw=rs("zyjszw")
	qdsj=rs("qdsj")
	
	xcszy=rs("xcszy")
	zynx=rs("zynx")
	
	zzmm=rs("zzmm")
	zzsj=rs("zzsj")
	xxjl=rs("xxjl")
	gzjl=rs("gzjl")
	jcqk=rs("jcqk")
	jtcy=rs("jtcy")
	bz=rs("bz")
	fgwid=rs("fgwid")
	
	uhg=""
	hg1=rs("hg1")
	hg2=rs("hg2")
	if hg1 then
		uhg="<font color=#0000FF>√</font>"
	elseif rs("hg1bz")<>"" and (not isnull(rs("hg1bz"))) then
		uhg="<font color=#0000FF>×</font>"
	end if
	if hg2 then
		uhg=uhg&"<font color=#FF0000>√</font>"
	elseif rs("hg2bz")<>"" and (not isnull(rs("hg2bz"))) then
		uhg=uhg&"<font color=#FF0000>×</font>"		
	end if
	
	sql2="select dname from tb_duser where uid="&udid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		gzdw=rs2(0)
	end if
	rs2.close
	
	if curgw="" then
		sql2="select zpdw,bm,gwmc from tb_gw where jid="&jid&" and gid="&ugid
		rs2.open sql2,conn,1,1
		if not rs2.eof then
			bmgw=rs2("zpdw")&":"&rs2("bm")&":"&rs2("gwmc")
		end if
		rs2.close
	else
		bmgw=curgw
	end if	
	
	sql2="select * from tb_user where uid="&uid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		uname=rs2("uname")
		birthday=rs2("birthday")
		sex=rs2("sex")
		mz=rs2("mz")
		'birthday=rs2("birthday")
		jg=rs2("jg")
		hj=rs2("hj")
		st=rs2("st")
	end if
	rs2.close
  %>
  <tr align="center">
    <td bgcolor="#FFFFFF"><%=i%></td>
    <td bgcolor="#FFFFFF"><%=gzdw%></td>    
    <td bgcolor="#FFFFFF"><a href="admin_uinfo.asp?id=<%=rs("id")%>"><%=uname%></a>  <%=uhg%></td>
    <td bgcolor="#FFFFFF"><%=sex%></td>
    <td bgcolor="#FFFFFF" class="text"><%=year(birthday)&"-"&month(birthday)%></td>
    <td bgcolor="#FFFFFF" class="text"><%=year(gzsj)&"-"&month(gzsj)%></td>
    <td bgcolor="#FFFFFF"><%=zzmm%></td>
    <td bgcolor="#FFFFFF"><%=zyjszw%></td>
    <td bgcolor="#FFFFFF"><%=xl%></td>
    <td bgcolor="#FFFFFF"><%=gzzw%></td>
    <td bgcolor="#FFFFFF"><%=bmgw%></td>
  </tr>  
  <%
  	i=i+1
  	rs.movenext
  wend
  rs.close
  %>
  <tr align="center">
    <td colspan="11" bgcolor="#FFFFFF">合计：报名人数 <span class="redfont"><%=i-1%></span> 人</td>
  </tr>
</table>
<script language="javascript">
//showtable("gwtable");
$("gid").value="<%=gid%>";
function gogw(gwid)
{
location.href="?jid=<%=jid%>"+"&gwid="+gwid;
}
</script>
</body>
</html>
