<!--#include file="conn.asp"-->
<%chku 2%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40"><meta name=ProgId content=Excel.Sheet>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����ͳ��</title>
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
<style media="print" type="text/css">����
.Noprint{display:none;}
.PageNext{page-break-before:always;}����
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
Response.AddHeader "Content-Disposition", "attachment;filename=��λ����ͳ�ƻ��ܱ�.xls" 
Response.ContentType = "application/vnd.ms-excel"
%>
</head>
<%
jid=request.QueryString("jid")
if jid<>"" then
	jid=intsql(jid)
else
	msg "��ѡ����Ƹ��Ϣ��","-1"
end if
'hgflag=request.QueryString("hgflag")
set rs=server.CreateObject("adodb.recordset")
sql="select jname from tb_job where jid="&jid
rs.open sql,conn,1,1
if not rs.eof then
	jname=rs(0)
end if
rs.close
%>
<body>
<%
set rs2=server.CreateObject("adodb.recordset")
'sql="select * from tb_bm where jid="&jid&" and uid in(select uid from tb_user where did="&session("duid")&") and hg1 and hg2 order by id"
sql="select * from tb_bm where jid="&jid&" and gzdw="&session("duid")&" and hg1 order by id"
rs.open sql,conn,1,1
i=1
  %>
<p align="center">��λ��Ƹ���ܱ�</p>
<p style="height:60px;">�걨��λ��<%=session("duname")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����£�</p>
<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#333333" class="printtable">
  <tr>
    <th>���</th>
    <th>������λ</th>
    <th>������λ</th>
    <th>��λ����</th>
    <th>����</th>
    <th>�Ա�</th>
    <th>���֤��</th>
    <th>��������</th>
    <th>����ʱ��</th>
    <th>ԭʼѧ��</th>
    <th>���ѧ��</th>
    <th>��ѧרҵ</th>
    <th>ְ�Ƶȼ�</th>
    <th>��Ч</th>
    <th>358����</th>
    <th>ӦƸ��λ����</th>
    <th>��Ƹ��λ</th>
    <th>���Ż��������</th>    
	<th >��Ƹ��λ</th>
    <th >��λ����</th>
  </tr>
<%
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
	gzzw=rs("jgbs")&rs("gzzw")
	xgwfl=rs("xgwfl")
	gzsj=rs("gzsj")
	
	zyjszw=rs("zyjszw")
	zyjszwmc=rs("zyjszwmc")
	if zyjszw<>"�޵ȼ��ʸ�" then
		zyjszw=zyjszw&zyjszwmc
	else
		zyjszw=zyjszwmc
	end if
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
	jxdj=rs("jxdj")'��Ч�ȼ�
	yxnx=rs("yxnx")'һ�������Ƿ����
	if yxnx then
		yxnx="����"
	else
		yxnx="������"
	end if
	
	sql2="select * from tb_gw where jid="&jid&" and gid="&ugid
	'rw sql2
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		zpdw=rs2("zpdw")
		gwbm=rs2("bm")
		gwmc=rs2("gwmc")
		gwtype=rs2("gtype")
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
	end if
	rs2.close
%>
  <tr align="center">
    <td bgcolor="#FFFFFF"><%=i%></td>
    <td bgcolor="#FFFFFF"><%=session("duname")%></td>
    <td bgcolor="#FFFFFF"><%=gzzw%></td>
    <td bgcolor="#FFFFFF"><%=xgwfl%></td>
    <td bgcolor="#FFFFFF"><%=uname%></td>
    <td bgcolor="#FFFFFF"><%=sex%></td>
    <td bgcolor="#FFFFFF" class="text"><%=card%></td>
    <td bgcolor="#FFFFFF" class="text"><%=year(birthday)&"-"&month(birthday)%></td>
    <td bgcolor="#FFFFFF" class="text"><%=year(gzsj)&"-"&month(gzsj)%></td>
    <td bgcolor="#FFFFFF"><%=xl%></td>
    <td bgcolor="#FFFFFF"><%=rs("xl2")%></td>
    <td bgcolor="#FFFFFF"><%=rs("byzy")%></td>
    <td bgcolor="#FFFFFF"><%=zyjszw%></td>
    <td bgcolor="#FFFFFF"><%=jxdj%></td>
    <td bgcolor="#FFFFFF"><%=yxnx%></td>
    <td bgcolor="#FFFFFF"><%=ugid%></td>
    <td bgcolor="#FFFFFF"><%=zpdw%></td>
    <td bgcolor="#FFFFFF"><%=gwbm%></td>    
	<td bgcolor="#FFFFFF"><%=gwmc%></td>
    <td bgcolor="#FFFFFF"><%=gwtype%></td>
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
