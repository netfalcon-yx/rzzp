<!--#include file="conn2.asp"-->
<!--#include file="fname.asp"-->
<%
chku 1
Server.ScriptTimeOut=5000
%>
<!--#include FILE="UpLoadclass.asp"-->

<%
dim request2 
'建立上传对象
set request2=New UpLoadClass
request2.FileType="jpg/jpeg"
request2.SavePath="doc/"
'设置为手动保存模式
request2.AutoSave=2
request2.MaxSize=1024000

savephoto=""
'打开对象
request2.open()

tphoto=request2.form("file"&"_Name")


if tphoto<>"" then'如果有照片就先保存照片
	tfsize=request2.form("file"&"_Size")
	if tfsize<10000 then
		msg "照片小于10K,为确保照片清晰，请上传10K至1M以内大小的照片！","u_photo.asp"
	end if
	if request2.Save("file",0) then
		'显示保存位置
		savephoto=request2.Form("file")
		set rs=server.CreateObject("adodb.recordset")
		sql = "SELECT uphoto from tb_user where uid="&session("uid")
		rs.open sql,conn,1,3
		if not rs.eof then
			uphoto=rs("uphoto")
			if uphoto<>"" and not isnull(uphoto) then
				DelFile uphoto
			end if
			rs("uphoto")=savephoto
			rs.update
		end if
		rs.close
	else
		select case request2.Error
			case -1
				errtxt="上传没有开始"
			case 0
				errtxt="上传成功"
			case 1
				errtxt="文件太大超过限制：1M!"
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

if errtxt<>"" then
	msg errtxt&"照片上传失败！","u_photo.asp"
elseif err then
	rw err.description
	msg "照片上传失败！","u_photo.asp"
else
	msg "照片上传成功，下一步请点击招聘岗位浏览报名！","u_job.asp"
end if
%>
