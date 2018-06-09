<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>考场打印</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<style>
.printtable{BORDER-COLLAPSE: collapse;}
.printtable TBODY TR TD{BORDER:#000000 1px solid;height:25px;}
.udiv{width:270px;height:145px;border:1px solid #000000;margin-right:5px;margin-bottom:10px;float:left}
.udiv img{width:110px;height:140px;margin:2px;float:left}
.udiv #uinfo{width:155px;height:140px;line-height:20px;overflow:hidden;float:right}
.clear{clear:both;height:0px;display:block;*display:inline;}
</style>
<style media="print" type="text/css">　　
.Noprint{display:none;}　　
.PageNext{page-break-after: always;}　　
</style>
</head>

<body onload="window.print()">
<div class="Noprint"><h4>请设置为横向打印</h4></div>
<table width="850" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td>
<%
jid=request.QueryString("jid")
if jid<>"" then
	jid=intsql(jid)
else
	msg "招聘参数出错！","-1"
end if
nowrid=request.QueryString("rid")
if nowrid<>"" then nowrid=intsql(nowrid)

set rs=server.CreateObject("adodb.recordset")
set rs2=server.CreateObject("adodb.recordset")

if nowrid="" then
	sql="select * from tb_exam where jid="&jid&" order by kh"
else
	sql="select * from tb_exam where jid="&jid&" and rid="&nowrid&" order by kh"
end if
rs.open sql,conn,1,1
i=0
j=0
while not rs.eof
	uid=rs("uid")
	kh=rs("kh")
	rid=rs("rid")
	
	sql2="select rname from tb_room where rid="&rid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		rname=rs2(0)
	end if
	rs2.close
	
	sql2="select * from tb_user where uid="&uid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		uname=rs2("uname")
		card=rs2("card")
		sex=rs2("sex")
		mb=rs2("mb")
		uphoto=rs2("uphoto")
		if uphoto<>"" then uphoto="doc/"&uphoto
	end if
	rs2.close
	
	sql2="select dname from tb_duser where uid=(select gzdw from tb_bm where uid="&uid&" and jid="&jid&")"
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		udw=rs2("dname")
	end if
	rs2.close
	
	sql2="select bm,gwmc from tb_gw where gid=(select gid from tb_bm where jid="&jid&" and uid="&uid&")"
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		'bmgw=rs2("bm")&":"&rs2("gwmc")
		bmgw=rs2("gwmc")
	end if
	rs2.close
	
	rw "<div class='udiv'><img src='"&uphoto&"'><div id='uinfo'>考号："&kh&"<br>姓名："&uname&"<br>"&card&"<br>单位："&udw&"<br>报考："&bmgw&"<br>考场："&rname&"<br>电话："&mb&"</div></div>"&chr(13)
	i=i+1
	j=j+1
	if i>=3 then
		i=0
		rw "<div class='clean'></div>"&chr(13)
	end if
	
	if j>=12 then
		j=0
		rw "<div class='PageNext'></div>"&chr(13)
	end if	
	rs.movenext
wend
rs.close

%>

</td>
  </tr>
</table>
</body>
</html>
