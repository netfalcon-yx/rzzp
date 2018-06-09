<!--#include file="conn.asp"-->
<%chku 9%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40"><meta name=ProgId content=Excel.Sheet>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>报名统计</title>
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
Response.AddHeader "Content-Disposition", "attachment;filename=单位报名统计表.xls" 
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
did=request.querystring("did")
set rs=server.CreateObject("adodb.recordset")
sql="select jname from tb_job where jid="&jid
rs.open sql,conn,1,1
if not rs.eof then
	jname=rs(0)
end if
rs.close
%>
<body>
<p align="center"><%=jname%>统计表</p>
<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#333333" class="printtable">
  <tr>
    <th>序号</th>
    <th>工作单位</th>    
    <th>姓名</th>
    <th>性别</th>
    <th>出生年月</th>
    <th>工作时间</th>
    <th>政治面貌</th>
    <th>专业技术资格</th>
    <th>全日制学历</th>
    <th>毕业院校及专业</th>
    <th>在职学历</th>
    <th>毕业院校及专业2</th>
    <th>现工作岗位</th>
    <th>现从事专业</th>
    <th>专业年限</th>    
	<th >应聘岗位</th>
    <th >岗位编号</th>
  </tr>
<%
set rs2=server.CreateObject("adodb.recordset")
if did<>"" then
  	sql="select * from tb_bm where jid="&jid&" and gzdw="&did&" and hg1 and hg2 order by gzdw,gid,id"
else
	sql="select * from tb_bm where jid="&jid&" and hg1 and hg2 order by gzdw,gid,id"
end if
  rs.open sql,conn,1,1
  i=1
  tmp_gid=""
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
	
	sql2="select dname from tb_duser where uid="&udid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		gzdw=rs2(0)
	end if
	rs2.close

	sql2="select bm,gwmc from tb_gw where gid="&ugid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		gwbm=rs2("bm")
		gwmc=rs2("gwmc")
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
	end if
	rs2.close
  %>
  <tr align="center">
    <td bgcolor="#FFFFFF"><%=i%></td>
    <td bgcolor="#FFFFFF"><%=gzdw%></td>    
    <td bgcolor="#FFFFFF"><%=uname%></td>
    <td bgcolor="#FFFFFF"><%=sex%></td>
    <td bgcolor="#FFFFFF" class="text"><%=year(birthday)&"-"&month(birthday)%></td>
    <td bgcolor="#FFFFFF" class="text"><%=year(gzsj)&"-"&month(gzsj)%></td>
    <td bgcolor="#FFFFFF"><%=zzmm%></td>
    <td bgcolor="#FFFFFF"><%=zyjszw%></td>
    <td bgcolor="#FFFFFF"><%=xl%></td>
    <td bgcolor="#FFFFFF"><%=byyxzy%></td>
    <td bgcolor="#FFFFFF"><%=rs("xl2")%></td>
    <td bgcolor="#FFFFFF"><%=rs("byyxzy2")%></td>
    <td bgcolor="#FFFFFF"><%=gzzw%></td>
    <td bgcolor="#FFFFFF"><%=xcszy%></td>
    <td bgcolor="#FFFFFF"><%=zynx%></td>    
	<td bgcolor="#FFFFFF"><%=gwbm&":"&gwmc%></td>
    <td bgcolor="#FFFFFF"><%=ugid%></td>
  </tr>  
  <%
  	i=i+1
  	rs.movenext
  wend
  rs.close
  %>
</table>
</body>
</html>
