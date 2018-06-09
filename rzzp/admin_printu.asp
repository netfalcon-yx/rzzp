<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>单位报名审核</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="comm.js"></script>
<style>
.mytable{border-top:#000000 1px solid;border-left:#000000 1px solid;line-height:20px;border-collapse:collapse}
.mytable th{border-bottom:#000000 1px solid;border-right:#000000 1px solid;}
.mytable td{border-bottom:#000000 1px solid;border-right:#000000 1px solid;}
.uzzcontent{overflow:hidden;font-size:14px;line-height:22px;}
@media print { 
.Noprint{display:none;visibility:hidden}
.PageNext{page-break-after: always;}　
}
</style>
<style media="print" type="text/css">　　
.Noprint{display:none;}
.PageNext{page-break-after: always;}　　
</style>
</head>
<%
id=request.QueryString("id")

if id="" then
	msg "参数错误!","-1"
else
	id=intsql(id)
end if
set rs=server.CreateObject("adodb.recordset")
sql="select * from tb_bm where id="&id
rs.open sql,conn,1,1
if rs.eof then
	msg "无此用户报名信息!","-1"
else
	uid=rs("uid")
	jid=rs("jid")
	gid=rs("gid")
	xl=rs("xl")
	xl2=rs("xl2")
	xw=rs("xw")
	byyxzy=rs("byyxzy")
	bysj=rs("bysj")
	
	byyxzy2=rs("byyxzy2")
	bysj2=rs("bysj2")
		
	gzdw=rs("gzdw")
	gzzw=rs("gzzw")
	gzsj=rs("gzsj")
	zyjszw=rs("zyjszw")
	if zyjszw="其它" then zyjszw=rs("zyjszw2")
	qdsj=rs("qdsj")
	zyzgz=rs("zyzgz")
	zysj2=rs("zysj2")
	xcszy=rs("xcszy")
	zynx=rs("zynx")
	if zynx<>"" then zynx=zynx&"年"
	
	zzmm=rs("zzmm")
	zzsj=rs("zzsj")
	xxjl=rs("xxjl")
	gzjl=rs("gzjl")
	jcqk=rs("jcqk")
	gzyj=rs("gzyj")
	jtcy=rs("jtcy")
	bz=rs("bz")
	
	fgwid=rs("fgwid")
	fgwid2=rs("fgwid2")
	hg1=rs("hg1")
	hg1bz=rs("hg1bz")
	
	hg2=rs("hg2")
	hg2bz=rs("hg2bz")
	jgbs=rs("jgbs")
end if
rs.close

sql="select endflag from tb_job where jid="&jid
rs.open sql,conn,1,1
if not rs.eof then
	endflag=rs("endflag")
end if
rs.close

if hg2 then
	endflag=True
end if

sql="select dname from tb_duser where uid="&gzdw
rs.open sql,conn,1,1
if not rs.eof then
	gzdw=rs(0)
end if
rs.close

sql="select bm,gwmc from tb_gw where gid="&gid
rs.open sql,conn,1,1
if not rs.eof then
	bm=rs("bm")&":"
	gwmc=rs("gwmc")
end if
rs.close

if fgwid<>0 then
	sql="select bm,gwmc from tb_gw where gid="&fgwid
	rs.open sql,conn,1,1
	if not rs.eof then
		fgw="调剂1："&rs("bm")&":"&rs("gwmc")
	end if
	rs.close
else
	fgw=""
end if

if fgwid2<>0 then
	sql="select bm,gwmc from tb_gw where gid="&fgwid2
	rs.open sql,conn,1,1
	if not rs.eof then
		fgw2="&nbsp;调剂2："&rs("bm")&":"&rs("gwmc")
	end if
	rs.close
else
	fgw2=""
end if

sql="select * from tb_user where uid="&uid
rs.open sql,conn,1,1
if not rs.eof then
	uname=rs("uname")
	birthday=rs("birthday")
	sex=rs("sex")
	mz=rs("mz")
	hy=rs("hy")
	jg=rs("jg")
	hj=rs("hj")
	st=rs("st")
	uphoto=rs("uphoto")
	if uphoto<>"" then
		uphoto="doc/"&uphoto
	else
		uphoto="doc/nophoto.jpg"
	end if
end if
rs.close
%>
<body onload="window.print()">
<h4 style="line-height:55px">公开招聘报名登记表</h4>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:645px;">
    <tr>
      <td width="84" align="center" bgcolor="#F7F7F7">姓&nbsp;&nbsp;&nbsp;&nbsp;名</td>
      <td width="94" align="center" style="overflow:hidden"><%=uname%></td>
      <td width="79" align="center" bgcolor="#F7F7F7">性&nbsp;&nbsp;别</td>
      <td width="96" align="center"><%=sex%></td>
      <td width="69" align="center" bgcolor="#F7F7F7">民&nbsp;&nbsp;&nbsp;族</td>
      <td width="95" align="center"><%=mz%></td>
      <td width="132" rowspan="5" align="center"><img  src="<%=uphoto%>" class="uphoto2" /></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">出生年月</td>
      <td align="center"><%=year(birthday)&"-"&month(birthday)%></td>
      <td align="center" bgcolor="#F7F7F7">出生地</td>
      <td align="center"><div class="uzzcontent" style="height:20px;width:90px;text-align:center"><%=jg%></div></td>
      <td align="center" bgcolor="#F7F7F7">身体状况</td>
      <td align="center"><%=st%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">工作时间</td>
      <td align="center"><%=year(gzsj)&"-"&month(gzsj)%></td>
      <td align="center" bgcolor="#F7F7F7">婚姻状况</td>
      <td align="center"><%=hy%></td>
      <td align="center" bgcolor="#F7F7F7">政治面貌</td>
      <td align="center"><%=zzmm%></td>
    </tr>
    <tr>
      <td rowspan="2" align="center" bgcolor="#F7F7F7">何时何校何<br />
      专业毕业</td>
      <td align="center" bgcolor="#F7F7F7">全日制学历</td>
      <td colspan="4"><%=year(bysj)&"-"&month(bysj)&"&nbsp;"&byyxzy&"&nbsp;"&xl&"&nbsp;毕业"%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">在职学历</td>
      <td colspan="4"><%=year(bysj2)&"-"&month(bysj2)&"&nbsp;"&byyxzy2&"&nbsp;"&xl2&"&nbsp;毕业"%></td>
    </tr>
    
    <tr>
      <td colspan="2" align="center" bgcolor="#F7F7F7">现工作单位及工作职务</td>
      <td colspan="5"><%=gzdw&"&nbsp;"&jgbs&"&nbsp;"&gzzw%></td>
    </tr>
	<tr>
      <td colspan="2" align="center" bgcolor="#F7F7F7">现 从 事 专 业 及 年 限</td>
      <td colspan="5"><%=xcszy%>&nbsp;<%=zynx%></td>
    </tr>
    <tr>
      <td colspan="2" align="center" bgcolor="#F7F7F7">专业技术资格及取得时间</td>
      <td colspan="5"><%=zyjszw&qdsj%>&nbsp;</td>
    </tr>
    
    
    <tr>
      <td colspan="2" align="center" bgcolor="#F7F7F7">报&nbsp;&nbsp;&nbsp;&nbsp;考&nbsp;&nbsp;&nbsp;&nbsp;岗&nbsp;&nbsp;&nbsp;&nbsp;位</td>
      <td colspan="5"><%=bm&gwmc%></td>
    </tr>
    <tr>
      <td colspan="2" align="center" bgcolor="#F7F7F7">调&nbsp;&nbsp;&nbsp;&nbsp;剂&nbsp;&nbsp;&nbsp;&nbsp;岗&nbsp;&nbsp;&nbsp;&nbsp;位</td>
      <td colspan="5"><%=fgw%><%=fgw2%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7" style="height:330px">工<br />
      作<br />
      及<br />
      学<br />
      习<br />
      经<br />
      历</td>
      <td colspan="6" align="left" valign="top" >
	  <%
	  tempxxjl=split(xxjl,chr(13))
	  for i=0 to UBound(tempxxjl)
	  	if i<=16 then
	  		rw tempxxjl(i)&"<br>"
		else
			Exit For
		end if
	  next
	  %></td>
    </tr>
    
   
    <tr>
      <td align="center" bgcolor="#F7F7F7" style="height:270px">主<br />
      要<br />
      荣<br />
      誉</td>
      <td colspan="6" align="left" valign="top" >
	  <%
	  tempjcqk=split(jcqk,chr(13))
	  for i=0 to UBound(tempjcqk)
	  	if i<=14 then
	  		rw tempjcqk(i)&"<br>"
		else
			Exit For
		end if
	  next
	  %>
	  </td>
    </tr>
	 </table>
	<div class="PageNext"></div>
	<table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:645px;margin-top:75px">
	<tr>
      <td width="84" align="center" bgcolor="#F7F7F7" style="height:420px">主<br />
      要<br />
      工<br />
      作<br />
      成<br />
      绩</td>
      <td colspan="3" align="left" valign="top" >
	  <%
	  tempgzyj=split(gzyj,chr(13))
	  for i=0 to UBound(tempgzyj)
	  	if i<=19 then
	  		rw tempgzyj(i)&"<br>"
		else
			Exit For
		end if
	  next
	  %>
	 </td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7" style="height:220px">家庭<br />
        成员<br />
        及主<br />
        要社<br />
        会关<br />
        系</td>
      <td colspan="3" align="left" valign="top" ><%=replace(jtcy,chr(13),"<br>")%></td>
    </tr>
    
    <tr>
      <td align="center" valign="middle" bgcolor="#F7F7F7" style="height:220px;">所在<br />
        单位<br />
      初审<br />
      意见</td>
      <td width="298"  valign="bottom">
	  <%
	  	if hg1 then
	  		rw "√同意"
		else
			rw hg1bz&"&nbsp;"
		end if
		%><p align="right">&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</p>	  </td>
      <td width="64" align="center" bgcolor="#F7F7F7">省公<br />
        司人<br />
        事董<br />
        事部<br />
        审核<br />
      意见</td>
      <td width="281" valign="bottom">
	  <%
	  	if hg2 then
	  		rw "√同意"
		else
			rw hg2bz&"&nbsp;"
		end if
		%><p align="right">&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</p> </td>
    </tr>
	<tr>
      <td align="center" bgcolor="#F7F7F7">备&nbsp;&nbsp;&nbsp;&nbsp;注</td>
      <td colspan="6" style="height:30px"><%=replace(bz,chr(13),"<br>")%>&nbsp;</td>
    </tr>
</table>

</body>
</html>
