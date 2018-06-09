<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>考场打印</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<style>
body{padding-left:30px}
.printtable{BORDER-COLLAPSE: collapse;}
.printtable TBODY TR TD{BORDER:#000000 1px solid;height:25px;}
.udiv{width:270px;height:145px;border:1px solid #000000;margin-right:15px;margin-bottom:8px;float:left;overflow:hidden}
.udiv img{width:110px;height:140px;margin:2px;float:left}
.udiv #uinfo{width:155px;height:140px;line-height:20px;overflow:hidden;float:right}
.clear{clear:both;height:0px;display:block;*display:inline;}
@media print { 
.Noprint{display:none;visibility:hidden}
.PageNext{page-break-after: always;page-break-inside:avoid}　
}
</style>
<style media="print" type="text/css">　　
.Noprint{display:none;visibility:hidden}　　
.PageNext{page-break-after: always;page-break-inside:avoid}　　
</style>
</head>
<%
jid=request.QueryString("jid")
if jid<>"" then
	jid=intsql(jid)
else
	msg "招聘参数出错！","-1"
end if
kc=request.QueryString("kc")
if kc="" then
	kcmc="全部考场信息"
else
	kcmc=kc
end if
%>
<body onload="window.print()">
<p align="center"><h4><%=kcmc%><span class="Noprint">(请设置为横向打印)</span></h4></p>
<%
set rs=server.CreateObject("adodb.recordset")
set rs2=server.CreateObject("adodb.recordset")

if kc="" then
	sql="select * from tb_zkz where jid="&jid&" order by kh"
else
	sql="select * from tb_zkz where jid="&jid&" and kc='"&kc&"' order by kh"
end if
rs.open sql,conn,1,1
i=0
j=0
tmp_nextp=""
while not rs.eof
	sfz=rs("cardid")
	kh=rs("kh")
	kc=rs("kc")
	kcjs=rs("kcjs")
	zwh=rs("zwh")
	
	'sql2="select a.*,(select dname from tb_duser where uid=a.did)as dname from tb_user a where card='"&sfz&"'"
	sql2="select * from tb_user where card='"&sfz&"'"
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		uid=rs2("uid")
		uname=rs2("uname")
		'sex=rs2("sex")
		'tel=rs2("mb")
		'dname=replace(rs2("dname"),"国网湖北省电力公司","")
		if rs2("uface")<>"" then
			uphoto="photo/"&rs2("uface")
		else
			uphoto="doc/"&rs2("uphoto")
		end if
	end if
	rs2.close
	
	'zpdwbmgw=""
'	sql2="select bm,gwmc,zpdw from tb_gw where gid=(select gid from tb_bm where jid="&jid&" and uid="&uid&")"
'	rs2.open sql2,conn,1,1
'	if not rs2.eof then
'		'bmgw=rs2("bm")&":"&rs2("gwmc")
'		zpdwbmgw=replace(rs2("zpdw"),"国网湖北省电力公司","")&":"&rs2("gwmc")
'		'zpdw=rs2("zpdw")
'		'bmgw=rs2("gwmc")
'	end if
'	rs2.close
	if tmp_nextp="" then
		tmp_nextp="<div class='PageNext'>"
		rw tmp_nextp
	end if
	rw "<div class='udiv'><img src='"&uphoto&"'><div id='uinfo'>考号："&kh&"<br>姓名："&uname&"<br>"&sfz&"<br>考场："&kc&"<br>教室："&kcjs&"<br>座位号："&zwh&"<br>签到：</div></div>"&chr(13)
	'i=i+1
	j=j+1
'	if i>=3 then
'		i=0
'		rw "<div class='clean'></div>"&chr(13)
'	end if
	
	if j>=12 then
		rw "</div>"
		tmp_nextp=""
		j=0
		'rw "<div class='PageNext'></div><div class='clear'></div>"
	end if	
	rs.movenext
wend
if tmp_nextp<>"" then rw "</div>"
rs.close

%>
</body>
</html>
