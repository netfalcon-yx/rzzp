<!--#include FILE="UpLoadclass.asp"-->
<!--#include file="conn2.asp"-->
<script type="text/javascript">
var dg =  frameElement.lhgDG;
</script>
<%
chku 9

dim request2 
'�����ϴ�����
set request2=New UpLoadClass
request2.FileType="doc/docx/xls/xlsx/wps/pdf/ceb/rar/zip/ppt/pptx"
request2.SavePath="doc/"
'����Ϊ�ֶ�����ģʽ
request2.AutoSave=2
request2.MaxSize=10240000

'�򿪶���
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

if jfile<>"" then'������ļ����ȱ����ļ�
	if request2.Save("file",0) then
		'��ʾ����λ��
		savejfile=request2.Form("file")
	else
		select case request2.Error
			case -1
				errtxt="�ϴ�û�п�ʼ"
			case 0
				errtxt="�ϴ��ɹ�"
			case 1
				errtxt="�ļ�̫�󳬹����ƣ�10M!"
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
	rw "<script>alert('��Ƹ��Ϣ���³ɹ���');dg.curWin.location.reload();dg.cancel();</script>"
end if

%>