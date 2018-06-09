<!--#include file="conn.asp"-->
<%chku 9%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40"><meta name=ProgId content=Excel.Sheet>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>考场考生信息表打印</title>
<style>
p{font-size:14px;font-weight:bold;line-height:35px;}
.printtable{BORDER-COLLAPSE: collapse;font-size:12px;}
.printtable th{height:30px;line-height:30px;text-align:center;}
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
Response.AddHeader "Content-Disposition", "attachment;filename=考场考生信息表.xls" 
Response.ContentType = "application/vnd.ms-excel"
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
if rid<>"" then rid=intsql(rid)
set rs=server.CreateObject("adodb.recordset")
set rs2=server.CreateObject("adodb.recordset")
%>
<p align="center">考场考生信息表</p>
<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#333333" class="printtable">
  <tr>
    <th>序号</th>
    <th>考号</th>
    <th>姓名</th>
    <th>身份证号</th>
    <th>单位</th>
    <th>报名岗位</th>
    <th>岗位编号</th>
    <th>考场</th>
    <th>电话</th>
  </tr>
  <%
if rid="" then
	sql="select * from tb_exam where jid="&jid&" order by kh"
else
	sql="select * from tb_exam where jid="&jid&" and rid="&rid&" order by kh"
end if
rs.open sql,conn,1,1
i=1
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
	end if
	rs2.close
	
	sql2="select dname from tb_duser where uid=(select gzdw from tb_bm where uid="&uid&" and jid="&jid&")"
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		udw=rs2("dname")
	end if
	rs2.close
	
	sql2="select gid,bm,gwmc from tb_gw where gid=(select gid from tb_bm where jid="&jid&" and uid="&uid&")"
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		'bmgw=rs2("bm")&":"&rs2("gwmc")
		gid=rs2("gid")
		bmgw=rs2("gwmc")
	end if
	rs2.close
  %>
  <tr>
    <td><%=i%></td>
    <td><%=kh%></td>
    <td><%=uname%></td>
    <td class="text"><%=card%></td>
    <td><%=udw%></td>
    <td><%=bmgw%></td>
    <td><%=gid%></td>
    <td><%=rname%></td>
    <td class="text"><%=mb%></td>
  </tr>
  <%
  	i=i+1
  	rs.movenext
wend
rs.close
set rs=nothing
  %>
</table>

</body>
</html>
