<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>单位报名审核</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="comm.js"></script>
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
    jndj=rs("jndj")
    ljjf=rs("ljjf")
	
	byyxzy2=rs("byyxzy2")
	bysj2=rs("bysj2")
	
	gzdw=rs("gzdw")
	gzzw=rs("gzzw")
	gzsj=rs("gzsj")
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
	'xxjl=rs("xxjl")
	gzjl=rs("gzjl")
	jcqk=rs("jcqk")
	gzyj=rs("gzyj")
	jtcy=rs("jtcy")
	bz=rs("bz")
	'fgwid=rs("fgwid")
	'fgwid2=rs("fgwid2")
	
	'这下面是新增的信息
	wyjcd=rs("wyjcd")
	byzy=rs("byzy")
	byzy2=rs("byzy2")
	'snjxkh=rs("snjxkh")
	'j3njxkh=rs("j3njxkh")
	'rzsj=rs("xrzsj")
	xgwfl=rs("xgwfl")
	
	'udoc=rs("udoc")
	'udoc2=rs("udoc2")
	'udoc3=rs("udoc3")
	
	
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

sql="select endflag from tb_job where jid="&jid
rs.open sql,conn,1,1
if not rs.eof then
	jname=rs("jname")
	endflag=rs("endflag")
end if
rs.close

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
	mb=rs("mb")
	'hy=rs("hy")
	jg=rs("jg")
	hj=rs("hj")
	st=rs("st")
	erpid=rs("erpid")
	uphoto=rs("uphoto")
	if uphoto<>"" then
		uphoto="doc/"&uphoto
	else
		uphoto="doc/nophoto.jpg"
	end if
end if
rs.close
tempcome=request.servervariables("HTTP_REFERER")
%>
<body>
<div class="unav">当前位置：报名信息浏览 >> <a href="<%=tempcome%>">返回</a>&nbsp;&nbsp;【<a href="admin_mdf_baom.asp?id=<%=id%>&uid=<%=uid%>">编辑用户报名资料</a>】【<a href="printubm.asp?id=<%=id%>" target="_blank">打印用户报名登记表</a>】</div>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:95%;">
    <tr>
      <td width="113" align="center" bgcolor="#F7F7F7">姓&nbsp;&nbsp;&nbsp;名</td>
      <td width="95"  style="overflow:hidden"><%=uname%></td>
      <td width="89" align="center" bgcolor="#F7F7F7">现工作单位</td>
      <td colspan="3" ><%=gzdw%></td>
      <td width="135" rowspan="5" align="center"><img  src="<%=uphoto%>" class="uphoto2" /></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">性&nbsp;&nbsp;&nbsp;别</td>
      <td ><%=sex%></td>
      <td align="center" bgcolor="#F7F7F7">出生年月</td>
      <td width="84" ><%=year(birthday)&"-"&month(birthday)%></td>
      <td width="62" align="center" bgcolor="#F7F7F7">籍贯</td>
      <td width="66" ><%=jg%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">民&nbsp;&nbsp;&nbsp;族</td>
      <td ><%=mz%></td>
      <td align="center" bgcolor="#F7F7F7">工作时间</td>
      <td ><%=gzsj%></td>
      <td align="center" bgcolor="#F7F7F7">出生地</td>
      <td ><%=hj%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">政治面貌</td>
      <td ><%=zzmm%></td>
      <td align="center" bgcolor="#F7F7F7">入党(团)时间</td>
      <td ><%=zzsj%></td>
      <td align="center" bgcolor="#F7F7F7">健康状况</td>
      <td ><%=st%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">身份证号码</td>
      <td colspan="3"><%=card%></td>
      <td align="center" bgcolor="#F7F7F7">电话</td>
      <td ><%=mb%></td>
    </tr>
    <tr>
      <td rowspan="2" align="center" bgcolor="#F7F7F7">学历（学位）</td>
      <td colspan="3">全日制最高学历：<%=xl%></td>
      <td rowspan="2" bgcolor="#F7F7F7">毕业时间、院校及专业</td>
      <td colspan="1"><%=year(bysj)&"-"&month(bysj)&byyxzy&byzy%></td>
    </tr>
    <tr>
      <td colspan="2">在职最高学历：<%=xl2%></td>
      <td colspan="3"><%=year(bysj2)&"-"&month(bysj2)&byyxzy2&byzy2%></td>
    </tr>
	<tr>
      <td align="center" bgcolor="#F7F7F7">专业技术资格</td>
      <td ><%=zyjszw%></td>
      <td align="center" bgcolor="#F7F7F7">技能等级</td>
      <td ><%=jndj%></td>
      <td colspan="2" align="center" bgcolor="#F7F7F7"><p>职业资格</p></td>
      <td ><%=zyzgz%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7"><p>现工作三级单位<br />
      及部门(班组)</p></td>
      <td colspan="3" ><%=jgbs%></td>
      <td colspan="2" align="center" bgcolor="#F7F7F7">现工作岗位</td>
      <td><%=gzzw%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7"><p>应聘岗位名称</p>
      <p>(单位+岗位)</p></td>
      <td colspan="3"><strong><%=zpdw%> <%=gwmc%></strong></td>
      <td colspan="2" align="center" bgcolor="#F7F7F7">应聘岗位代码</td>
      <td ><strong><a href="admin_gw_tongji.asp?jid=<%=jid%>&gwid=<%=gid%>"><%=gid%></a></strong></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">现任岗位分类</td>
      <td colspan="3" ><%=xgwfl%></td>
      <td colspan="2" align="center" bgcolor="#F7F7F7">应聘岗位分类</td>
      <td ><%=gtype%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">近三年绩效</td>
      <td ><%=jxdj%></td>
      <td align="center"  bgcolor="#F7F7F7">累计积分</td>
      <td ><%=ljjf%></td>
      <td colspan="2" align="center"  bgcolor="#F7F7F7">"358"一线年限</td>
      <td ><%=yxnx%></td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#F7F7F7" style="height:150px;padding-top:20px">工<br />
      作<br />
      经<br />
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
	  <td  align="center" bgcolor="#F7F7F7" style="height:180px;padding-top:30px">主<br />
要<br />
工<br />
作<br />
成<br />
绩</td>
	  <td colspan="6" align="left" valign="top" ><%
	  tempgzyj=split(gzyj,chr(13))
	  for i=0 to UBound(tempgzyj)
	  	if i<=19 then
	  		rw tempgzyj(i)&"<br>"
		else
			Exit For
		end if
	  next
	  %></td>
    </tr>
	<tr>
      <td align="center" bgcolor="#F7F7F7" style="height:150px;padding-top:20px"><p>获</p>
      <p>奖</p>
      <p>情</p>
      <p>况</p></td>
      <td colspan="6" align="left" valign="top" ><%=replace(jcqk,chr(13),"<br>")%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7" style="height:150px;padding-top:10px"><p>家</p>
        <p>庭<br />
        成</p>
        <p>员<br />
        情</p>
        <p>况</p></td>
      <td colspan="6" align="left" valign="top" ><%=replace(jtcy,chr(13),"<br>")%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">基层单位<br />
      审核意见</td>
      <td colspan="3"><form id="form1" name="form1" method="post" action="admin_chkubm.asp?chk=1">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><label>
              <input name="hg1" type="checkbox" class="radio" value="1" <%if hg1 then rw "checked"%>  />
            同意报名<br />
            (如学历、专业技术资格、绩效等级、358年限等不合格，此栏不勾选并填写审核意见)</label></td>
          </tr>
          <tr>
            <td><label>
              审核意见：
                  <input name="yj1" type="text" id="yj1" value="<%=hg1bz%>"  />
            </label></td>
          </tr>
          <tr>
            <td><label>
              <input name="chk1" type="submit" class="but2" id="chk1" value="审 核"  />
              <input name="hdid" type="hidden" id="hdid" value="<%=id%>" />
              <input name="hdjid" type="hidden" id="hdjid" value="<%=jid%>" />
            </label></td>
          </tr>
        </table>
            </form></td>
      <td align="center" bgcolor="#F7F7F7">地市公司人资部<br />
      审核意见</td>
      <td colspan="2">
	  <form id="form2" name="form2" method="post" action="admin_chkubm.asp?chk=2" onsubmit="return bmchk()">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>
              <input name="hg2" type="checkbox" class="radio" value="1" <%if hg2 then rw "checked"%> />
              同意报名			  </td>
          </tr>
          <tr>
            <td><label> 审核意见：
              <input name="yj2" type="text" id="yj2" value="<%=hg2bz%>" />
            </label></td>
          </tr>
          <tr>
            <td><label>
              <input name="chk12" type="submit" class="but2" id="chk12" value="审 核" />
              <input name="hdid" type="hidden" id="hdid" value="<%=id%>" />
              <input name="hdjid" type="hidden" id="hdjid" value="<%=jid%>" />
            </label></td>
          </tr>
        </table>
      </form></td>
    </tr>
    
   
	<tr>
      <td align="center" bgcolor="#F7F7F7">备&nbsp;&nbsp;&nbsp;&nbsp;注</td>
      <td colspan="6" style="height:30px"><%=replace(bz,chr(13),"<br>")%>&nbsp;</td>
    </tr>
	<tr>
	  <td align="center" bgcolor="#F7F7F7">附件：</td>
	  <td colspan="6" style="line-height:30px">
      <%
	  sql="select * from tb_ufile where uid="&uid
	  rs.open sql,conn,1,1
	  if not rs.eof then
	  while not rs.eof
	  	rw "<img src='icon/down-11.gif' width='16' height='16'  /> <a href='doc/"&rs("furl")&"' target='_blank'>"&getuftype(rs("ftype"))&"</a><br>"
		rs.movenext
	  wend
	  else
	  	rw "没有上传附件！"
	  end if
	  rs.close
	  set rs=nothing
	  closeconn
	  %>
      </td>
    </tr>
</table>
<script language="javascript">
endflag="<%=endflag%>";
if(endflag=="True")
{
setfmdis("form1");
setfmdis("form2");
}
function bmchk()
{
tjlen=GetChkLen("tjgw");
if(tjlen>1)
{
	alert("调剂岗位数量不能大于1个！");
	return false
}
return true;
}
</script>
</body>
</html>
