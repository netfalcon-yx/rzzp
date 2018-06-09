<!--#include file="conn.asp"-->
<%'chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>准考证打印</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<style>
body{margin-top:35px;}
.zkzrdb{width:240px;height:80px;margin-left:200px;margin-top:60px;text-align:center;line-height:40px;}
.printtable{BORDER-COLLAPSE: collapse;font-size:14px}
.printtable TBODY TR TD{BORDER:#000000 1px solid;}
.prtable2 TBODY TR TD{border:none}
.zkztxt{padding-left:10px;}
@media print { 
.Noprint{display:none;visibility:hidden}　
}
</style>
<style media="print" type="text/css">　　
.Noprint{display:none;}　　
</style>
</head>
<%
jid=request.QueryString("jid")
uid=request.QueryString("uid")
if jid<>"" then
	jid=intsql(jid)
else
	msg "招聘参数出错！","-1"
end if

if uid<>"" then
	uid=intsql(uid)
else
	msg "用户参数出错！","-1"
end if

set rs=server.CreateObject("adodb.recordset")
set rs2=server.CreateObject("adodb.recordset")

sql="select jname from tb_job where jid="&jid
rs.open sql,conn,1,1
if not rs.eof then
	jtit=rs("jname")
end if
rs.close

sql="select gid from tb_bm where jid="&jid&" and uid="&uid
rs.open sql,conn,1,1
if not rs.eof then
	gid=rs("gid")
end if
rs.close

sql="select a.*,(select dname from tb_duser where uid=a.did)as dname from tb_user a where uid="&uid
rs.open sql,conn,1,1
if not rs.eof then
	dname=rs("dname")
	uname=rs("uname")
	card=rs("card")
	sex=rs("sex")
	mz=rs("mz")
	uphoto=rs("uphoto")
	uface=rs("uface")
	cardid=rs("card")
	if uphoto<>"" then uphoto="doc/"&uphoto
	'if uface<>"" then uphoto="photo/"&uface
end if
rs.close


sql="select * from tb_zkz where jid="&jid&" and cardid='"&card&"'"
rs.open sql,conn,1,1
if not rs.eof then
	ktype=rs("ktype")
	kh=rs("kh")
	kc=rs("kc")
	kcjs=rs("kcjs")
	zwh=rs("zwh")
	bssj=rs("bssj")
	ksdz=rs("ksdz")
end if
rs.close

%>
<body onload="printTure()">
<div class="Noprint">
  <h4><span class="redfont">准考证打印时请使用A4纸张横向打印</span> 【<a href="javascript:window.print()">打印</a>】 </h4>
</div>
<table width="100%" height="595" border="0" align="center" cellpadding="0" cellspacing="0" class="printtable" >
  <tr>
    <td width="50%" valign="top" bgcolor="#FFFFFF">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="printtable" style="line-height:58px;border:none">
      <tr>
        <td colspan="4" align="center" bgcolor="#FFFFFF"><h4 style="line-height:30px">准考证</h4></td>
        </tr>
      <tr>
        <td width="28%" align="center" bgcolor="#FFFFFF">姓 &nbsp;&nbsp;&nbsp;名：</td>
        <td colspan="2" bgcolor="#FFFFFF" class="zkztxt"><%=uname%></td>
        <td width="32%" rowspan="3" align="center" bgcolor="#FFFFFF"><img src="<%=uphoto%>" width="110" height="140" /></td>
      </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">性 &nbsp;&nbsp;&nbsp;别：</td>
        <td colspan="2" bgcolor="#FFFFFF" class="zkztxt"><%=sex%></td>
      </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">身 份 证 号：</td>
        <td colspan="2" bgcolor="#FFFFFF" class="zkztxt"><%=card%></td>
        </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">工 作 单 位：</td>
        <td colspan="3" bgcolor="#FFFFFF" class="zkztxt"><%=dname%></td>
        </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">应聘岗位代码：</td>
        <td colspan="3" bgcolor="#FFFFFF" class="zkztxt"><%=gid%></td>
        </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">准 考 证 号：</td>
        <td width="20%" bgcolor="#FFFFFF" class="zkztxt"><%=kh%></td>
        <td width="20%" align="center" bgcolor="#FFFFFF">考 场 号：</td>
        <td bgcolor="#FFFFFF" class="zkztxt"><%=kc%></td>
        </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">考 场 教 室：</td>
        <td bgcolor="#FFFFFF" class="zkztxt"><%=kcjs%></td>
        <td align="center" bgcolor="#FFFFFF">座 位 号：</td>
        <td bgcolor="#FFFFFF" class="zkztxt"><%=zwh%></td>
      </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">笔 试 时 间：<br /></td>
        <td colspan="3" bgcolor="#FFFFFF" class="zkztxt"><%=bssj%></td>
      </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">考 试 地 点：</td>
        <td colspan="3" bgcolor="#FFFFFF" class="zkztxt"><%=ksdz%></td>
      </tr>
    </table></td>
    <td valign="top" bgcolor="#FFFFFF"></td>
    <td width="49%" valign="top" bgcolor="#FFFFFF">
	<%
	sql="select top 1 * from tb_news where ntype=2 and ishow=true order by id desc"
	rs.open sql,conn,1,1
	if not rs.eof then
		tit=rs("title")
		content=rs("content")
	end if
	rs.close
	%>
	<h4 style="margin-top:5px">考试守则</h4>
	<div class="newscontent" style="line-height:23px"><%=content%></div>
	</td>
  </tr>
</table>
<script>
 function printTure()
 {
     window.print();
     window.opener=null; 
     window.open('','_self'); 
     window.close();
 }
 </script>
</body>
</html>
