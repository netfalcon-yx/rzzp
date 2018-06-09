<!--#include FILE="UpLoadclass.asp"-->
<!--#include file="conn2.asp"-->
<script type="text/javascript">
var dg =  frameElement.lhgDG;
</script>
<%
chku 0

dim request2 
'建立上传对象
set request2=New UpLoadClass
request2.FileType="doc/docx/wps/jpg/jpeg/gif/png/bmp/pdf"
request2.SavePath="doc/"
'设置为手动保存模式
request2.AutoSave=2
request2.MaxSize=5120000

'打开对象
request2.open()
jid=request2.form("hdjid")
docid=request2.form("hdid")
if session("utype")=1 then
	uid=session("uid")
else
	uid=request2.form("hduid")	
end if
jfile=request2.form("file"&"_Name")

if jfile<>"" then'如果有文件就先保存文件
	newfname=year(date())&month(date())&day(date())&hour(now())&minute(now())&second(now())&"_"&uid&"."&request2.Form("file_Ext") 
	'if request2.Save("file",0) then'newfname
	if request2.Save("file",newfname) then
		'显示保存位置
		savejfile=request2.Form("file")
		set rs=server.createobject("adodb.recordset")
		sql="select * from tb_ufile where uid="&uid&" and ftype="&docid
		rs.open sql,conn,1,3
		if rs.eof then
			rs.addnew
			rs("uid")=uid
			rs("ftype")=docid
		else
			oldfile=rs("furl")
			DelFile oldfile
		end if
		rs("furl")=savejfile
		rs("fname")=jfile
		rs.update
		rs.close
		set rs=nothing
		closeconn
		if err then errtxt=description
	else
		select case request2.Error
			case -1
				errtxt="上传没有开始"
			case 0
				errtxt="上传成功"
			case 1
				errtxt="文件太大超过限制：5M!"
			case 2
				errtxt="文件类型不匹配，请检查上传的是否是以下文件格式：<br><br>"&request2.FileType&"！"
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
else
	errtxt="没有选择文件上传！"
end if
set request2=nothing '释放上传对象

if errtxt<>"" then
	rw errtxt
	rw "<script>alert('上传失败！');dg.cancel();</script>"
else

'set rs=server.CreateObject("adodb.recordset")

rw "<script>dg.curDoc.getElementById('fmufile').src='ufilelist.asp?uid="&uid&"&t="&now&"';dg.cancel();</script>"
end if
%>