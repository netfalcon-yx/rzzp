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
did=request.querystring("dwid")
hgflag=request.QueryString("hgflag")
set rs=server.CreateObject("adodb.recordset")
%>
<body>
<div class="unav">
	<span style="float:right;margin-right:10px"><strong>>><a href="admin_gw_tongji.asp?jid=<%=jid%>">切换为按岗位统计</a></strong></span>
  <form id="form1" name="form1" method="post" action="">
    当前位置：招聘报名统计【按单位统计明细】
      <label></label> 请选择统计单位：
    <label>   
    <select name="gzdw" size="1" id="gzdw" onchange="javascript:godw(this.value)" >
	<option value="">--全部单位--</option>
	<%
	sql="select * from tb_duser order by uid"
	rs.open sql,conn,1,1
	while not rs.eof
		rw "<option value="&rs("uid")&">"&rs("dname")&"</option>"&chr(13)
		rs.movenext
	wend
	rs.close
	%>
	</select>
    </label>
    &nbsp;&nbsp;<a href="admin_tj_dwsum.asp?jid=<%=jid%>">返回单位报名合计</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="getTblData('dwtable')">导出Excel</a>&nbsp;&nbsp;
  </form>
</div>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#333333" class="mytable" id="dwtable">
  <tr>
    <th width="5%" >序号</th>
    <th width="12%" >工作单位</th>    
    <th width="8%" >姓名</th>
    <th width="4%" >性别</th>
    <th width="8%" >出生年月</th>
    <th width="8%" >电话</th>
    <th width="8%" >工作时间</th>
    <th width="8%" >政治面貌</th>
    <th width="8%" >职称</th>
    <th width="8%" >原始学历</th>
    <th width="8%" >现工作岗位</th>
    <th >应聘岗位</th>
  </tr>
  <%
curgzdw=""
  
set rs2=server.CreateObject("adodb.recordset")
if did<>"" then
	sql="select dname from tb_duser where uid="&did
	rs.open sql,conn,1,1
	if not rs.eof then
		curgzdw=rs(0)
	end if
	rs.close
	if hgflag="" then
		sql="select * from tb_bm where jid="&jid&" and gzdw="&did&" and hg1 and hg2 order by gzdw,gid,id"
	else
		sql="select * from tb_bm where jid="&jid&" and gzdw="&did&" order by gzdw,gid,id"
	end if
	
else
	if hgflag="" then
		sql="select * from tb_bm where jid="&jid&" and hg1 and hg2 order by gzdw,gid,id"
	else
		sql="select * from tb_bm where jid="&jid&" order by gzdw,gid,id"
	end if
end if
  rs.open sql,conn,1,1
  i=1
  while not rs.eof
  	uid=rs("uid")
	gid=rs("gid")
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
	
	if curgzdw="" then
		sql2="select dname from tb_duser where uid="&udid
		rs2.open sql2,conn,1,1
		if not rs2.eof then
			gzdw=rs2(0)
		end if
		rs2.close
	else
		gzdw=curgzdw
	end if
	
	sql2="select zpdw,bm,gwmc from tb_gw where jid="&jid&" and gid="&gid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		bmgw=rs2("zpdw")&":"&rs2("bm")&":"&rs2("gwmc")
	end if
	rs2.close
	
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
        mb=rs2("mb")
	end if
	rs2.close
  %>
  <tr align="center">
    <td bgcolor="#FFFFFF"><%=i%></td>
    <td bgcolor="#FFFFFF"><%=gzdw%></td>    
    <td bgcolor="#FFFFFF"><a href="admin_uinfo.asp?id=<%=rs("id")%>"><%=uname%></a> <%=uhg%></td>
    <td bgcolor="#FFFFFF"><%=sex%></td>
    <td bgcolor="#FFFFFF" class="text"><%=year(birthday)&"-"&month(birthday)%></td>
    <td bgcolor="#FFFFFF"><%=mb%></td>
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
    <td colspan="12" bgcolor="#FFFFFF">合计：报名人数 <span class="redfont"><%=i-1%></span> 人</td>
  </tr>
</table>
<script language="javascript">
//showtable("gwtable");
$("gzdw").value="<%=did%>";
function godw(dwid)
{
location.href="?jid=<%=jid%>"+"&dwid="+dwid;
}
</script>
</body>
</html>
