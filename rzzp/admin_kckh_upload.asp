<!--#include file="conn2.asp"-->
<!--#include file="fname.asp"-->
<%
chku 9

Server.ScriptTimeOut=5000
function fixsql(str)
	dim newstr
	newstr = trim(str)
	if isnull(newstr) then
		newstr = ""
	else
		newstr = replace(newstr,"'","''")
	end if
	fixsql = newstr
end Function
%>
<!--#include FILE="UpLoadclass.asp"-->

<%
dim request2 
'�����ϴ�����
set request2=New UpLoadClass
request2.FileType="xls"
request2.SavePath="doc/"
'����Ϊ�ֶ�����ģʽ
request2.AutoSave=2
request2.MaxSize=10240000

savephoto=""
'�򿪶���
request2.open()

tphoto=request2.form("file"&"_Name")
jid=request2.form("hd_jid")
if jid="" then
response.Write("��������")
response.End()
end if

if tphoto<>"" then'�������Ƭ���ȱ�����Ƭ
	if request2.Save("file",0) then
		'��ʾ����λ��
		savephoto=request2.Form("file")
		set conn2=CreateObject("ADODB.Connection")
		conn2.Open "Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password=;Extended properties=Excel 5.0;Data Source="&Server.MapPath("doc/"&savephoto) 'Ҫ�����EXCEL������
		
		'-----------------------------------------------------------------------------------------------------------------
		'����Ҫ˵�����ǣ����ݿ��Excel��͸��ļ���������վͬһĿ¼��
		'-----------------------------------------------------------------------------------------------------------------
		sql = "SELECT * FROM [Sheet1$]"      'Ҫ�����Excel��������ı�����ƣ�����һ��Ҫ��$
		On Error Resume Next 
		set rs = conn2.execute(sql)
		if err then
			rw "<span class='errtxt'>����</span>"&err.description
			response.End()
		else
			rw "�ϴ��ɹ���׼������....<br>"
		end if
		if rs.eof then
			rw "û�����ݼ�¼�������һ����Ԫ�Ƿ�ΪSheet1"
			response.End()
		end if
		
		set rs2=server.createobject("adodb.recordset")		
		temprow=1
		while not rs.eof
			newgid=fixsql(rs(0))
			cardid=fixsql(rs(2))
			if newgid<>"" and cardid<>"" then
				uflag=false
				sql2="select count(id) from tb_bm where jid="&jid&" and uid=(select uid from tb_usere where card='"&cardid&"')"
				rs2.open sql2,conn,1,1
				if rs2(0)>0 then uflag=true
				rs2.close
				
				if uflag then
					sql2="select * from tb_zkz where jid="&jid&" and cardid='"&cardid&"'"
					'rw sql2
					On Error Resume Next 
					rs2.open sql2,conn,1,3
					if rs2.eof then			
						rs2.addnew
						rs2("jid")=jid
						rs2("cardid")=cardid
					end if
					rs2("ktype")=fixsql(rs(3))
					rs2("kh")=fixsql(rs(4))
					rs2("kc")=fixsql(rs(5))
					
					rs2("kcjs")=fixsql(rs(6))
					rs2("zwh")=fixsql(rs(7))
					rs2("bssj")=fixsql(rs(8))
					rs2("ksdz")=fixsql(rs(9))
					rs2.update
					rs2.close
				'response.end
					if err then
						rw err.description&"<br>"
						rw "<font color=#ff0000>��"&temprow&"��ʧ��,����:"&fixsql(rs(1))&"</font><Br />"
						'On Error Resume Next	
					'else
						'rw "��"&temprow&"����¼����ɹ�!<Br />"
					end if
					Response.Flush
				else
					rw "<font color=#ff0000>��"&temprow&"��ʧ��,����:"&fixsql(rs(1))&"�������ͨ�������</font><Br />"
				end if
			else
				rw "��"&temprow&"����¼,������"&fixsql(rs(1))&"���֤Ϊ��!<Br />"
			end if
		
			rs.movenext
			if not rs.eof then temprow=temprow+1
		wend
		conn.close
		set conn = nothing
		conn2.close
		set conn2 = Nothing
		
		Response.Write temprow&"����¼�������!"
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
'deleteAFile server.MapPath("doc/"&savephoto)
if errtxt<>"" then
	rw  errtxt&"�ĵ��ϴ�ʧ�ܣ�"
elseif err then
	rw err.description
else
	msg "�ĵ��ϴ��ɹ���","admin_kckh.asp?jid="&jid
end if
%>
