<!--#include file="conn2.asp"-->
<%
chku 9
Server.ScriptTimeOut=5000
%>
<!--#include FILE="UpLoadclass.asp"-->

<%
dim request2 
'�����ϴ�����
set request2=New UpLoadClass
request2.FileType="xls/xlsx"
request2.SavePath="doc/"
'����Ϊ�ֶ�����ģʽ
request2.AutoSave=2
request2.MaxSize=51200000

	'�򿪶���
request2.open()

jid=request2.form("hdjid")
cjtype=request2.form("cjtype")

if jid="" then msg "��ѡ��������Ƹ��","-1"
'response.End()
%>
<link href="style.css" rel="stylesheet" type="text/css" />
<table width="560" border="0" align="center" cellpadding="5" cellspacing="0" bgcolor="#F7F9F9" style="border:1px solid #999999">
<tr> 
<td style="line-height:1.8"><strong>Excel���ݵ���</strong>
<%


'�������Сͼ�ɹ���ϵͳ����Ŀ���ļ���
if request2.Save("file1",0) then
	'��ʾ����λ��
	rw "<br>Excel�ĵ��ϴ��ɹ�!׼����ȡ����......<br>"
else
	rw("Excel�ĵ��ϴ�ʧ�ܣ�<br>")
	select case request2.Error
		case -1
			errtxt="�ϴ�û�п�ʼ"
		case 0
			errtxt="�ϴ�����"
		case 1
			errtxt="�ļ�̫�󳬹����ƣ�50M!"
		case 2
			errtxt="�ļ����Ͳ�ƥ�䣬�����ϴ����Ƿ���excel�ļ���"
		case 3
			errtxt="�ϴ��ļ���������Ͳ���ȷ"
		case 4
			errtxt="�쳣���������ϴ�"
		case 5
			errtxt="�ϴ��Ѿ�ȡ�������������������Ƿ�С��������� "
		case else
			errtxt="δ֪�ϴ�����"
	end select
	set request2=nothing '�ͷ��ϴ�����
	rw errtxt
	rw "<br>[<a href='admin_cj_view.asp'>����</a>]"
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
conn2.Open "Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password=;Extended properties='Excel 5.0;HDR=Yes;IMEX=1';Data Source="&Server.MapPath("doc/"&doc)'Ҫ�����EXCEL������

'-----------------------------------------------------------------------------------------------------------------
'����Ҫ˵�����ǣ����ݿ��Excel��͸��ļ���������վͬһĿ¼��
'-----------------------------------------------------------------------------------------------------------------
sql = "SELECT * FROM [Sheet1$]"      'Ҫ�����Excel��������ı�����ƣ�����һ��Ҫ��$
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
			rw "<font color=#ff0000>��"&temprow&"��ʧ��,���֤:"&fixsql(sfz)&"��������"&uname&"</font><Br />"
			rw err.description&"<br>"
			On Error Resume Next	
		else
			rw "��"&temprow&"����¼�ɹ�!<Br />"
		end if
	end if

	Response.Flush

	rs.movenext
wend


conn.close
set conn = nothing
conn2.close
set conn2 = Nothing

rw "�������!"

set request2=nothing '�ͷ��ϴ�����
DelFile doc 

rw "<br>[<a href='admin_cj_view.asp'>���Գɼ����</a>]"
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
