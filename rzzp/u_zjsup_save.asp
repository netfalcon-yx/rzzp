<!--#include FILE="UpLoadclass.asp"-->
<!--#include file="conn2.asp"-->
<script type="text/javascript">
var dg =  frameElement.lhgDG;
</script>
<%
chku 0

dim request2 
'�����ϴ�����
set request2=New UpLoadClass
request2.FileType="doc/docx/wps/jpg/jpeg/gif/png/bmp/pdf"
request2.SavePath="doc/"
'����Ϊ�ֶ�����ģʽ
request2.AutoSave=2
request2.MaxSize=5120000

'�򿪶���
request2.open()
jid=request2.form("hdjid")
docid=request2.form("hdid")
if session("utype")=1 then
	uid=session("uid")
else
	uid=request2.form("hduid")	
end if
jfile=request2.form("file"&"_Name")

if jfile<>"" then'������ļ����ȱ����ļ�
	newfname=year(date())&month(date())&day(date())&hour(now())&minute(now())&second(now())&"_"&uid&"."&request2.Form("file_Ext") 
	'if request2.Save("file",0) then'newfname
	if request2.Save("file",newfname) then
		'��ʾ����λ��
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
				errtxt="�ϴ�û�п�ʼ"
			case 0
				errtxt="�ϴ��ɹ�"
			case 1
				errtxt="�ļ�̫�󳬹����ƣ�5M!"
			case 2
				errtxt="�ļ����Ͳ�ƥ�䣬�����ϴ����Ƿ��������ļ���ʽ��<br><br>"&request2.FileType&"��"
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
else
	errtxt="û��ѡ���ļ��ϴ���"
end if
set request2=nothing '�ͷ��ϴ�����

if errtxt<>"" then
	rw errtxt
	rw "<script>alert('�ϴ�ʧ�ܣ�');dg.cancel();</script>"
else

'set rs=server.CreateObject("adodb.recordset")

rw "<script>dg.curDoc.getElementById('fmufile').src='ufilelist.asp?uid="&uid&"&t="&now&"';dg.cancel();</script>"
end if
%>