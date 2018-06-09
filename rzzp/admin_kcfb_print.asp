<!--#include file="conn.asp"-->
<%chku 9%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40"><meta name=ProgId content=Excel.Sheet>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>考生考场分布打印</title>
<style>
p{font-size:14px;font-weight:bold;line-height:35px;}
.printtable{BORDER-COLLAPSE: collapse;font-size:12px;}
.printtable th{height:30px;line-height:30px;text-align:center;}
.printtable TBODY TR TD
{
 BORDER:#000000 1px solid;padding-left:5px;line-height:25px;
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
Response.AddHeader "Content-Disposition", "attachment;filename=考生考场分布统计表.xls" 
Response.ContentType = "application/vnd.ms-excel"
function strlen(str,n)
	if str<>"" then
		for m=1 to n-len(str)
			str="0"&str
		next
		strlen=str
	else
		strlen=""
	end if
end function
tempy=right(year(date),2)
%>
</head>
<body>
<%
jid=request.QueryString("jid")
if jid<>"" then
	jid=intsql(jid)
else
	msg "请选择招聘信息！","-1"
end if
rid=request.querystring("rid")
'hgflag=request.QueryString("hgflag")
set rs=server.CreateObject("adodb.recordset")
set rs2=server.CreateObject("adodb.recordset")
set rs3=server.CreateObject("adodb.recordset")

sql="select count(kid) from tb_exam where jid="&jid
rs.open sql,conn,1,1
ksrs=rs(0)
rs.close
%>
<p align="center">考生考场分布(共<%=ksrs%>人)</p>
<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#333333" class="printtable">
<%
sql="select distinct rid from tb_exam where jid="&jid&" order by rid"
rs.open sql,conn,1,1
while not rs.eof
	i=1
	rid=rs("rid")
	sql2="select rname from tb_room where rid="&rid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		rname=rs2(0)
	end if
	rs2.close
	
	sql2="select count(kid) from tb_exam where rid="&rid
	rs2.open sql2,conn,1,1
	cur_rs=rs2(0)
	rs2.close
%>
  <tr>
    <td colspan="6"><%=rname%>(<%=cur_rs%>人)</td>
  </tr>
  <tr>
    <th width="5%">序号</th>
    <th>部门名称</th>
    <th>岗位名称</th>
    <th width="5%">人数</th>
    <th>准考证号</th>
    <th width="15%">备注</th>
  </tr>
  <%
  tmpgid=""
  'sql2="select * from tb_bm where jid="&jid&" and hg1 and hg2 and uid in(select uid from tb_exam where jid="&jid&" and rid="&rid&") order by gid"
  sql2="select * from tb_gw order by gid"
  rs2.open sql2,conn,1,1
  while not rs2.eof
  	gid=rs2("gid")
	gtype=UCase(rs2("gtype"))
	bm=rs2("bm")
	gwmc=rs2("gwmc")
	'sql3="select count(id) from tb_bm where jid="&jid&" and hg1 and hg2 and uid in(select uid from tb_exam where jid="&jid&" and rid="&rid&")"
	sql3="select * from tb_exam where jid="&jid&" and rid="&rid&" and uid in(select uid from tb_bm where jid="&jid&" and gid="&gid&" and hg1 and hg2)"
	rs3.open sql3,conn,1,1
	if not rs3.eof then
		bmrs=rs3.RecordCount 
		'khend=rs3("kh")&"～"&bmrs
		khend=rs3("kh")
		rs3.movelast
		khend=khend&"～"&right(rs3("kh"),3)
  %>
  <tr>
    <td align="center"><%=i%></td>
    <td><%=bm%></td>
    <td><%=gwmc%></td>
    <td align="center"><%=bmrs%></td>
    <td><%=khend%></td>
    <td>&nbsp;</td>
  </tr>
  <%
  	i=i+1
  	end if
	rs3.close
	rs2.movenext
	wend
	rs2.close
	rs.movenext
wend
rs.close
set rs=nothing
%>
</table>
</body>
</html>
