<!--#include FILE="UpLoadclass.asp"-->
<!--#include file="conn2.asp"-->
<script type="text/javascript">
var dg =  frameElement.lhgDG;
</script>
<%
chku 9

dim request2 
'建立上传对象
set request2=New UpLoadClass
request2.FileType="doc/docx/xls/xlsx/wps/pdf/ceb/rar/zip/ppt/pptx"
request2.SavePath="doc/"
'设置为手动保存模式
request2.AutoSave=2
request2.MaxSize=10240000

'打开对象
request2.open()
jid=request2.form("hdjid")
jtit=server.HTMLEncode(request2.form("jtit"))
btime=request2.form("btime")
etime=request2.form("etime")
zkzflag=request2.form("zkzflag")
endflag=request2.form("isend")
jobsta=request2.form("jobsta")
cjsta=request2.form("cjsta")

bsbl=request2.form("bsbl")
msbl=request2.form("msbl")

jfile=request2.form("file"&"_Name")
joldfname=request2.form("joldfname")

if jfile<>"" then'如果有文件就先保存文件
	if request2.Save("file",0) then
		'显示保存位置
		savejfile=request2.Form("file")
	else
		select case request2.Error
			case -1
				errtxt="上传没有开始"
			case 0
				errtxt="上传成功"
			case 1
				errtxt="文件太大超过限制：10M!"
			case 2
				errtxt="文件类型不匹配，请检查上传的是否是图像文件！"
			case 3
				errtxt="上传文件过大或类型不正确"
			case 4
				errtxt="异常，不存在上传"
			case 5
				errtxt="上传已经取消，请检查总上载数据是否小于最大限制"
			case else
				errtxt="未知上传错误"
		end select
	end if
end if
set request2=nothing '释放上传对象

set rs=server.CreateObject("adodb.recordset")
if jid="" then
	sql="select * from tb_job where jid=0"
	rs.open sql,conn,1,3
	rs.addnew
else
	sql="select * from tb_job where jid="&jid
	rs.open sql,conn,1,3
	if joldfname="" then
		rs("jfile")=""
		rs("jfname")=""
	end if
end if

rs("jname")=jtit
rs("btime")=btime
rs("etime")=etime
if zkzflag="1" then
	rs("zkzflag")=true
else
	rs("zkzflag")=false
end if
rs("jobtype")=jobsta
if endflag="1" then
	rs("endflag")=true
else
	rs("endflag")=false
end if

if cjsta="1" then
	rs("gkflag")=true
else
	rs("gkflag")=false
end if

if savejfile<>"" then
	rs("jfile")=savejfile
	rs("jfname")=jfile
end if
rs("bsbl")=bsbl
rs("msbl")=msbl
rs.update
rs.close

if err then
	rw err.description
else
	rw "<script>alert('招聘信息更新成功！');dg.curWin.location.reload();dg.cancel();</script>"
end if

%>