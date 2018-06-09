<!--#include file="conn.asp"-->
<%chku 9%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40"><meta name=ProgId content=Excel.Sheet>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>成绩统计</title>
<style>
p{font-size:14px;font-weight:bold;line-height:35px;}
.printtable{BORDER-COLLAPSE: collapse;font-size:12px;}
.printtable th{height:30px;line-height:30px;text-align:center;font-weight:normal}
.printtable TBODY TR TD
{
 BORDER:#000000 1px solid;padding-left:5px;line-height:25px;text-align:center;
}
.text {mso-number-format:\@; }
.redfont{color:red}
@media print { 
.Noprint{display:none;visibility:hidden}　
}
</style>
<style media="print" type="text/css">　　
.Noprint{display:none;}
.PageNext{page-break-before:always;}　　
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>285</x:DefaultRowHeight>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>3</x:ActiveRow>
       <x:ActiveCol>1</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
<%
Response.AddHeader "Content-Disposition", "attachment;filename=岗位报名成绩汇总表.xls" 
Response.ContentType = "application/vnd.ms-excel"
%>
</head>
<%
jid=request.QueryString("jid")
if jid<>"" then
	jid=intsql(jid)
else
	msg "请选择招聘信息！","-1"
end if

'hgflag=request.QueryString("hgflag")
set rs=server.CreateObject("adodb.recordset")
sql="select jname,bsbl,msbl from tb_job where jid="&jid
rs.open sql,conn,1,1
if not rs.eof then
	jname=rs("jname")
	bsbl=rs("bsbl")
	msbl=rs("msbl")
end if
rs.close
%>
<body>
<%
curgw="" 
set rs1=server.CreateObject("adodb.recordset") 
set rs2=server.CreateObject("adodb.recordset")
'if gid<>"" then
	'if hgflag="" then
  		'sql="select * from tb_bm where jid="&jid&" and gid="&gid&" order by gid,gzdw,id"
	'else
		'sql="select * from tb_bm where jid="&jid&" and gid="&gid&" and hg1 and hg2 order by gid,gzdw,id"
	'end if
'else
	'if hgflag="" then
		'sql="select * from tb_bm where jid="&jid&" order by gid,gzdw,id"
	'else
		'sql="select * from tb_cj order by (cj1+cj2) desc"
	'end if
'end if
sql_1="select * from tb_gw where jid="&jid&"  order by gid"
  rs1.open sql_1,conn,1,1
  i=1
  %>
<p align="center"><%=jname%>成绩汇总表</p>
<p style="height:60px;">申报单位：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（盖章）</p>
<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#333333" class="printtable">
  <tr>
    <th>序号</th>
    <th>工作单位</th>
    <th>工作岗位</th>
    <th>岗位分类</th>
    <th>姓名</th>
    <th>身份证号</th>
    <th>性别</th>
    <th>出生年月</th>
    <th>工作时间</th>
    <th>原始学历</th>
    <th>最高学历</th>
    <th>所学专业</th>
    <th>职称等级</th>
    <th>应聘岗位代码</th>
    <th>招聘单位</th>
    <th>部门或内设机构</th>    
	<th >招聘岗位</th>
    <th >岗位归类</th>
    <th >笔试成绩</th>
    <th >面试成绩</th>
    <th >总成绩</th>
    <th >电话</th>
  </tr>
<%
tmpgid=0
 while not rs1.eof
 	gid=rs1("gid")
	zpdw=rs1("zpdw")
	gwbm=rs1("bm")
	gwmc=rs1("gwmc")
	gwtype=rs1("gtype")
		
	'sql="select * from tb_cj where sfz in(select card from tb_user where uid in(select uid from tb_bm where gid="&gid&" and hg2)) order by (cj1+cj2) desc"
	sql="select * from tb_cj where jid="&jid&" and cj1<>null and cj2<>null and sfz in(select card from tb_user where uid in(select uid from tb_bm where gid="&gid&" and jid="&jid&" and hg2)) order by (cj1*"&bsbl&"/100+cj2*"&msbl&"/100) desc"

	rs.open sql,conn,1,1
	while not rs.eof
	if tmpgid<>gid then
		tmpgid=gid
		trcol=" bgcolor='#FFFF00'"
	else
		trcol=""
	end if
 	zcj=rs("zcj")
	cj1=rs("cj1")
	cj2=rs("cj2")
	
	if cj1<>"" and cj2<>"" and (not isnull(cj1)) and (not isnull(cj2)) then
		if msbl<>"" and bsbl<>"" then zcj=FormatNumber(cj1*bsbl/100+cj2*msbl/100,2)
	end if
	
  	sfz=rs("sfz")
	sql2="select * from tb_bm where  jid="&jid&" and uid=(select uid from tb_user where card='"&sfz&"')"
	'rw sql2
	'response.End()
	rs2.open sql2,conn,1,1
	uid=rs2("uid")
	ugid=rs2("gid")
	xl=rs2("xl")
	xw=rs2("xw")
	byyxzy=rs2("byyxzy")
	bysj=rs2("bysj")
	byzy=rs2("byzy")
	xl2=rs2("xl2")	
	udid=rs2("gzdw")
	zyzgz=rs2("zyzgz")
	'gzzw=rs2("gzzw")
	gzzw=rs2("jgbs")&rs2("gzzw")
	xgwfl=rs2("xgwfl")
	gzsj=rs2("gzsj")
	'zyjszw=rs2("zyjszw")
	zyjszw=rs2("zyjszw")
	zyjszwmc=rs2("zyjszwmc")
	if zyjszw<>"无等级资格" then
		zyjszw=zyjszw&zyjszwmc
	else
		zyjszw=zyjszwmc
	end if
	qdsj=rs2("qdsj")
	
	xcszy=rs2("xcszy")
	zynx=rs2("zynx")
	
	zzmm=rs2("zzmm")
	zzsj=rs2("zzsj")
	xxjl=rs2("xxjl")
	gzjl=rs2("gzjl")
	jcqk=rs2("jcqk")
	jtcy=rs2("jtcy")
	bz=rs2("bz")
	fgwid=rs2("fgwid")
	rs2.close
	
	sql2="select dname from tb_duser where uid="&udid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		gzdw=rs2(0)
	end if
	rs2.close

	
	sql2="select * from tb_user where uid="&uid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		uname=rs2("uname")
		birthday=rs2("birthday")
		sex=rs2("sex")
		mz=rs2("mz")
		erpid=rs2("erpid")
		card=rs2("card")
		'birthday=rs2("birthday")
		jg=rs2("jg")
		hj=rs2("hj")
		st=rs2("st")
		mb=rs2("mb")
	end if
	rs2.close
%>
  <tr align="center" <%=trcol%>>
    <td ><%=i%></td>
    <td ><%=gzdw%></td>
    <td ><%=gzzw%></td>
    <td ><%=xgwfl%></td>
    <td ><%=uname%></td>
    <td  class="text"><%=card%></td>
    <td ><%=sex%></td>
    <td  class="text"><%=year(birthday)&"-"&month(birthday)%></td>
    <td  class="text"><%=year(gzsj)&"-"&month(gzsj)%></td>
    <td ><%=xl%></td>
    <td ><%=xl2%></td>
    <td ><%=byzy%></td>
    <td ><%=zyjszw%></td>
    <td ><%=ugid%></td>
    <td ><%=zpdw%></td>
    <td ><%=gwbm%></td>    
	<td ><%=gwmc%></td>
    <td ><%=gwtype%></td>
    <td ><%=cj1%></td>
    <td ><%=cj2%></td>
    <td ><%=zcj%></td>
    <td ><%=mb%></td>
  </tr>  
  <%
  		i=i+1
  		rs.movenext
	wend
	rs.close
	rs1.movenext
  wend
  rs1.close
  %>
</table>
</body>
</html>
