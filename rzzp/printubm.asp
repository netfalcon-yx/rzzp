<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="X-UA-Compatible" content="IE=6">
<title>报名登记表</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<style>
.mytable{border-top:#000000 1px solid;border-left:#000000 1px solid;line-height:20px;border-collapse:collapse}
.mytable th{border-bottom:#000000 1px solid;border-right:#000000 1px solid;}
.mytable td{border-bottom:#000000 1px solid;border-right:#000000 1px solid;}
.uzzcontent{overflow:hidden;font-size:14px;line-height:22px;}
@media print { 
.Noprint{display:none;visibility:hidden}
.PageNext{page-break-after: always;page-break-inside:avoid}
}
</style>
<style media="print" type="text/css">　　
.Noprint{display:none;}
.PageNext{page-break-after: always;page-break-inside:avoid}　　
</style>
</head>
<!--#include file="conn.asp"-->
<%chku 0
id=request.QueryString("id")

if id="" then
	msg "参数错误!","-1"
else
	id=intsql(id)
end if
set rs=server.CreateObject("adodb.recordset")
if session("utype")=1 then
	sql="select * from tb_bm where id="&id&" and uid="&session("uid")
elseif session("utype")=2 then
	sql="select * from tb_bm where id="&id&" and gzdw="&session("duid")
elseif session("utype")=9 then
	sql="select * from tb_bm where id="&id
end if
if sql="" then msg "参数错误！","-1"

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
	if gzsj<>"" then gzsj=year(gzsj)&"-"&month(gzsj)
	zyjszw=rs("zyjszw")
	zyjszwmc=rs("zyjszwmc")
	if zyjszw<>"无等级资格" then
		zyjszw=zyjszw&zyjszwmc
	else
		zyjszw=zyjszwmc
	end if
	if zyjszw="其它" then zyjszw=rs("zyjszw2")
	qdsj=rs("qdsj")
	zyzgz=rs("zyzgz")
	zysj2=rs("zysj2")
	xcszy=rs("xcszy")
	zynx=rs("zynx")
	if zynx<>"" then zynx=zynx&"年"
	
	zzmm=rs("zzmm")
	zzsj=rs("zzsj")
	if zzsj<>"" then zzsj=year(zzsj)&"-"&month(zzsj)
	xxjl=rs("xxjl")
	gzjl=rs("gzjl")
	jcqk=rs("jcqk")
	gzyj=rs("gzyj")
	jtcy=rs("jtcy")
	bz=rs("bz")
	
	
	'这下面是新增的信息
	wyjcd=rs("wyjcd")
	byzy=rs("byzy")
	byzy2=rs("byzy2")
	snjxkh=rs("snjxkh")
	j3njxkh=rs("j3njxkh")
	rzsj=rs("xrzsj")
	xgwfl=rs("xgwfl")
	
	'fgwid=rs("fgwid")
	'fgwid2=rs("fgwid2")
	hg1=rs("hg1")
	hg1bz=rs("hg1bz")
	
	hg2=rs("hg2")
	hg2bz=rs("hg2bz")
	jgbs=rs("jgbs")
	
	jxdj=rs("jxdj")'绩效等级
	yxnx=rs("yxnx")'一线年限是否符合
	if yxnx then
		yxnx="符合"
	else
		yxnx="不符合"
	end if
end if
rs.close

sql="select jname,endflag from tb_job where jid="&jid
rs.open sql,conn,1,1
if not rs.eof then
	jname=rs("jname")
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

sql="select * from tb_gw where jid="&jid&" and gid="&gid
rs.open sql,conn,1,1
if not rs.eof then
	bm=rs("bm")&":"
	gwmc=rs("gwmc")
	gtype=rs("gtype")
	zpdw=rs("zpdw")
end if
rs.close

'if fgwid<>0 then
'	sql="select bm,gwmc from tb_gw where gid="&fgwid
'	rs.open sql,conn,1,1
'	if not rs.eof then
'		fgw="调剂1："&rs("bm")&":"&rs("gwmc")
'	end if
'	rs.close
'else
'	fgw=""
'end if
'
'if fgwid2<>0 then
'	sql="select bm,gwmc from tb_gw where gid="&fgwid2
'	rs.open sql,conn,1,1
'	if not rs.eof then
'		fgw2="&nbsp;调剂2："&rs("bm")&":"&rs("gwmc")
'	end if
'	rs.close
'else
'	fgw2=""
'end if

sql="select * from tb_user where uid="&uid
rs.open sql,conn,1,1
if not rs.eof then
	uname=rs("uname")
	birthday=rs("birthday")
	sex=rs("sex")
	mz=rs("mz")
	card=rs("card")
	'hy=rs("hy")
	jg=rs("jg")'籍贯
	hj=rs("hj")'出生地
	st=rs("st")'身体健康
	erpid=rs("erpid")
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
<div class="PageNext">
  <h4 style="line-height:55px">岗位招聘登记表</h4>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:645px;">
    <tr>
      <td width="109" align="center" bgcolor="#F7F7F7">姓&nbsp;&nbsp;&nbsp;名</td>
      <td width="83" align="center" style="overflow:hidden"><%=uname%></td>
      <td width="92" align="center" bgcolor="#F7F7F7">工作单位</td>
      <td colspan="3" align="center"><%=gzdw%></td>
      <td width="129" rowspan="5" align="center"><img  src="<%=uphoto%>" class="uphoto2" /></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">性&nbsp;&nbsp;&nbsp;别</td>
      <td align="center"><%=sex%></td>
      <td align="center" bgcolor="#F7F7F7">出生年月</td>
      <td width="82" align="center"><%=year(birthday)&"-"&month(birthday)%></td>
      <td width="70" align="center" bgcolor="#F7F7F7">籍贯</td>
      <td width="79" align="center"><%=jg%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">民&nbsp;&nbsp;&nbsp;族</td>
      <td align="center"><%=mz%></td>
      <td align="center" bgcolor="#F7F7F7">工作时间</td>
      <td align="center"><%=gzsj%></td>
      <td align="center" bgcolor="#F7F7F7">出生地</td>
      <td align="center"><%=hj%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">政治面貌</td>
      <td align="center"><%=zzmm%></td>
      <td align="center" bgcolor="#F7F7F7">入党(团)时间</td>
      <td align="center"><%=zzsj%></td>
      <td align="center" bgcolor="#F7F7F7">健康状况</td>
      <td align="center"><%=st%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">身份证号码</td>
      <td colspan="5"><%=card%></td>
    </tr>
    <tr>
      <td rowspan="2" align="center" bgcolor="#F7F7F7">学历(学位)</td>
      <td colspan="2">全日制最高学历：<%=xl%></td>
      <td rowspan="2" bgcolor="#F7F7F7">毕业时间、院校及专业</td>
      <td colspan="3"><%=year(bysj)&"-"&month(bysj)&byyxzy&byzy%></td>
    </tr>
    <tr>
      <td colspan="2">在职最高学历：<%=xl2%></td>
      <td colspan="3"><%=year(bysj2)&"-"&month(bysj2)&byyxzy2&byzy2%></td>
    </tr>
	<tr>
      <td align="center" bgcolor="#F7F7F7">专业技术资格</td>
      <td colspan="3"><%=zyjszw%></td>
      <td colspan="2" align="center"><p>职业资格</p></td>
      <td align="center"><%=zyzgz%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7"><p>现工作三级单位及部门(班组)</p></td>
      <td colspan="3"><%=jgbs%></td>
      <td colspan="2" align="center">现工作岗位</td>
      <td align="center"><%=gzzw%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">应聘岗位名称</td>
      <td colspan="3"><%=zpdw%> <%=gwmc%></td>
      <td colspan="2" align="center">应聘岗位代码</td>
      <td align="center"><%=gid%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">现任岗位分类</td>
      <td colspan="3" align="center"><%=xgwfl%></td>
      <td colspan="2" align="center">应聘岗位分类</td>
      <td align="center"><%=gtype%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">近三年绩效</td>
      <td colspan="3" align="center"><%=jxdj%></td>
      <td colspan="2" align="center">"358"一线年限</td>
      <td align="center"><%=yxnx%></td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#F7F7F7" style="height:150px;padding-top:30px">工<br />
      作<br />
      简<br />
      历</td>
      <td colspan="6" align="left" valign="top" >
	  <%
	  tempxxjl=split(gzjl,chr(13))
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
      <td align="center" valign="middle" bgcolor="#F7F7F7" style="height:180px;padding-top:20px"><span style="height:180px;padding-top:20px">主<br />
要<br />
工<br />
作<br />
成<br />
绩</span></td>
      <td colspan="6" align="left" valign="top" >
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
    </table></div>
	<div>
	<table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:645px;margin-top:50px">
	<tr>
      <td width="106" align="center" bgcolor="#F7F7F7" style="height:220px;padding-top:50px"><p>获</p>
      <p>奖</p>
      <p>情</p>
      <p>况</p></td>
      <td align="left" valign="top" ><%=replace(jcqk,chr(13),"<br>")%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7" style="height:160px;padding-top:15px"><p>家</p>
        <p>庭<br />
        成</p>
        <p>员<br />
        情</p>
        <p>况</p></td>
      <td align="left" valign="top" ><%=replace(jtcy,chr(13),"<br>")%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7" style="height:160px;padding-top:30px"><p>本</p>
      <p>人</p>
      <p>承</p>
      <p>诺</p></td>
      <td align="left" valign="top" ><p>&nbsp;&nbsp;报名表所填写的信息准确无误，所提交的证件、资料真实有效，若有虚假，所产生的一切后果由本人承担。</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p align="right" style="margin-right:80px;">报名人（签名）</p>
      <p >&nbsp;</p>
      <p align="right"> &nbsp;&nbsp;年&nbsp;&nbsp;   月&nbsp;&nbsp; 日</p></td>
    </tr>

    <tr>
      <td align="center" valign="middle" bgcolor="#F7F7F7" style="height:160px;padding-top:10px"><p>所在<br />
        单位<br />
        <p>审核<br />
      意见</p></td>
      <td valign="bottom">
	  <%
	  	if hg1 then
	  		rw "√同意"
		else
			rw hg1bz&"&nbsp;"
		end if
		%>
        <p align="right" style="line-height:100px;margin-right:150px;">（盖章）</p>
        <p align="right">&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</p>	  </td>
      </tr>
    
    <tr>
      <td align="center" valign="middle" bgcolor="#F7F7F7" style="height:160px;padding-top:10px"><p>地市<br />
      人资</p>
        <p>部门</p>
        <p>审核<br />
      意见</p></td>
      <td valign="bottom">
	  <%
	  	if hg2 then
	  		rw "√同意"
		else
			rw hg2bz&"&nbsp;"
		end if
		%>
        <p align="right" style="line-height:100px;margin-right:150px;">（盖章）</p>
        <p align="right">&nbsp;&nbsp;&nbsp;&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</p>	  </td>
      </tr>

        
</table>
</div>
</body>
</html>
