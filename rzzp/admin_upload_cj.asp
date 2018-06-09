<!--#include file="conn2.asp"-->
<%
chku 9
Server.ScriptTimeOut=5000
%>
<!--#include FILE="UpLoadclass.asp"-->

<%
dim request2 
'建立上传对象
set request2=New UpLoadClass
request2.FileType="xls/xlsx"
request2.SavePath="doc/"
'设置为手动保存模式
request2.AutoSave=2
request2.MaxSize=51200000

	'打开对象
request2.open()

jid=request2.form("hdjid")
cjtype=request2.form("cjtype")

if jid="" then msg "请选择所属招聘！","-1"
'response.End()
%>
<link href="style.css" rel="stylesheet" type="text/css" />
<table width="560" border="0" align="center" cellpadding="5" cellspacing="0" bgcolor="#F7F9F9" style="border:1px solid #999999">
<tr> 
<td style="line-height:1.8"><strong>Excel数据导入</strong>
<%


'如果保存小图成功，系统生成目标文件名
if request2.Save("file1",0) then
	'显示保存位置
	rw "<br>Excel文档上传成功!准备读取数据......<br>"
else
	rw("Excel文档上传失败：<br>")
	select case request2.Error
		case -1
			errtxt="上传没有开始"
		case 0
			errtxt="上传错误！"
		case 1
			errtxt="文件太大超过限制：50M!"
		case 2
			errtxt="文件类型不匹配，请检查上传的是否是excel文件！"
		case 3
			errtxt="上传文件过大或类型不正确"
		case 4
			errtxt="异常，不存在上传"
		case 5
			errtxt="上传已经取消，请检查总上载数据是否小于最大限制 "
		case else
			errtxt="未知上传错误"
	end select
	set request2=nothing '释放上传对象
	rw errtxt
	rw "<br>[<a href='admin_cj_view.asp'>返回</a>]"
	response.end
end if

set rs2=server.CreateObject("adodb.recordset")
'sql="select bsbl,msbl from tb_job"
'rs2.open sql,conn,1,1
'bsbl=rs2("bsbl")
'msbl=rs2("msbl")
'rs2.close

doc=request2.Form("file1")

set conn2=CreateObject("ADODB.Connection")
conn2.Open "Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password=;Extended properties='Excel 5.0;HDR=Yes;IMEX=1';Data Source="&Server.MapPath("doc/"&doc)'要导入的EXCEL表名称

'-----------------------------------------------------------------------------------------------------------------
'这里要说明的是，数据库和Excel表和该文件必须在网站同一目录里
'-----------------------------------------------------------------------------------------------------------------
sql = "SELECT * FROM [Sheet1$]"      '要导入的Excel数据里面的表的名称，后面一定要加$
on error resume next
set rs = conn2.execute(sql)
if err then
	rw err.description
	response.End()
end if
temprow=0
while not rs.eof
	uname=rs(0)
	sfz=fixsql(rs(1))
	cj=fixsql(rs(2))
	'On Error Resume Next
	
	if sfz<>"" and (not isnull(sfz)) then
		sql2="select * from tb_cj where jid="&jid&" and sfz='"&sfz&"'"
		rs2.open sql2,conn,1,3
		if rs2.eof then
			rs2.addnew
			rs2("sfz")=sfz
			rs2("jid")=jid
		end if
		if cjtype="1" then rs2("cj1")=cj
		if cjtype="2" then rs2("cj2")=cj
		rs2.update
		rs2.close
		
		temprow=temprow+1
		
		if err then
			rw "<font color=#ff0000>第"&temprow&"条失败,身份证:"&fixsql(sfz)&"，姓名："&uname&"</font><Br />"
			rw err.description&"<br>"
			On Error Resume Next	
		else
			rw "第"&temprow&"条记录成功!<Br />"
		end if
	end if

	Response.Flush

	rs.movenext
wend


conn.close
set conn = nothing
conn2.close
set conn2 = Nothing

rw "导入完成!"

set request2=nothing '释放上传对象
DelFile doc 

rw "<br>[<a href='admin_cj_view.asp'>考试成绩浏览</a>]"
%></td>
</tr>
</table>
<%
function fixsql(str)
	dim newstr
	if isnull(str) or str="" then
		newstr = "&nbsp;"
	else
		'if IsNumeric(newstr) then newstr=cstr(newstr)
		newstr = replace(trim(str),"'","''")
	end if
	fixsql = newstr
end Function
%>
