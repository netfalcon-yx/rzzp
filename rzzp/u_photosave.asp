<!--#include file="conn2.asp"-->
<!--#include file="fname.asp"-->
<%
chku 1
Server.ScriptTimeOut=5000
%>
<!--#include FILE="UpLoadclass.asp"-->

<%
dim request2 
'�����ϴ�����
set request2=New UpLoadClass
request2.FileType="jpg/jpeg"
request2.SavePath="doc/"
'����Ϊ�ֶ�����ģʽ
request2.AutoSave=2
request2.MaxSize=1024000

savephoto=""
'�򿪶���
request2.open()

tphoto=request2.form("file"&"_Name")


if tphoto<>"" then'�������Ƭ���ȱ�����Ƭ
	tfsize=request2.form("file"&"_Size")
	if tfsize<10000 then
		msg "��ƬС��10K,Ϊȷ����Ƭ���������ϴ�10K��1M���ڴ�С����Ƭ��","u_photo.asp"
	end if
	if request2.Save("file",0) then
		'��ʾ����λ��
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
				errtxt="�ϴ�û�п�ʼ"
			case 0
				errtxt="�ϴ��ɹ�"
			case 1
				errtxt="�ļ�̫�󳬹����ƣ�1M!"
			case 2
				errtxt="�ļ����Ͳ�ƥ�䣬�����ϴ����Ƿ���ͼ���ļ���"
			case 3
				errtxt="�ϴ��ļ���������Ͳ���ȷ"
			case 4
				errtxt="�쳣���������ϴ�"
			case 5
				errtxt="�ϴ��Ѿ�ȡ�������������������Ƿ�С���������"
			case else
				errtxt="δ֪�ϴ�����"
		end select
	end if
end if
set request2=nothing '�ͷ��ϴ�����

if errtxt<>"" then
	msg errtxt&"��Ƭ�ϴ�ʧ�ܣ�","u_photo.asp"
elseif err then
	rw err.description
	msg "��Ƭ�ϴ�ʧ�ܣ�","u_photo.asp"
else
	msg "��Ƭ�ϴ��ɹ�����һ��������Ƹ��λ���������","u_job.asp"
end if
%>
