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
		end if
		if not rs.eof then
			rs.movenext'����ƫ����
		else
			rw "û�����ݼ�¼�������һ����Ԫ�Ƿ�ΪSheet1"
			response.End()
		end if
		
		set rs2=server.createobject("adodb.recordset")		
		temprow=1
		while not rs.eof
			
			newgid=fixsql(rs(0))'��λ����
			dw=fixsql(rs(1))'��Ƹ��λ
			bm=fixsql(rs(2))'��Ƹ����
			gwmc=fixsql(rs(3))'��λ����
			kslx=fixsql(rs(8))'�������
			if newgid<>"" and bm<>"" and gwmc<>"" then
				newgid=intsql(newgid)
				'sql2="select max(gid) from tb_gw where jid="&jid
'				rs2.open sql2,conn,1,1
'				if isnull(rs2(0)) then
'					newgid=1
'				else
'					newgid=rs2(0)+1
'				end if
'				rs2.close
				
				sql2="select * from tb_gw where jid="&jid&" and gid="&newgid
				On Error Resume Next 
				rs2.open sql2,conn,1,3
				if rs2.eof then			
					rs2.addnew
					rs2("gid")=newgid
					rs2("jid")=jid
				end if
				rs2("zpdw")=dw
				rs2("bm")=bm
				rs2("gwmc")=gwmc
				
				rs2("gtype")=fixsql(rs(4))
				'rs2("gwjb")=fixsql(rs(6))
				rs2("jhrs")=fixsql(rs(5))
				rs2("gwtj")=fixsql(rs(6))
				rs2("gwcontent")=fixsql(rs(7))
				
				rs2("jid")=jid
				rs2("kslx")=kslx
				'rs2("bz")=fixsql(rs(7))
				rs2.update
				rs2.close
			'response.end
				if err then
					rw err.description&"<br>"
					rw "<font color=#ff0000>��"&temprow&"��ʧ��,����:"&bm&"����λ���ƣ�"&gwmc&"</font><Br />"
					'On Error Resume Next	
				'else
					'rw "��"&temprow&"����¼����ɹ�!<Br />"
				end if
				Response.Flush
			else
				rw "��"&temprow&"����¼,��ţ�"&newgid&",����:"&bm&"����λ���ƣ�"&gwmc&"Ϊ��!<Br />"
			end if
		
			temprow=temprow+1
			rs.movenext
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

if errtxt<>"" then
	rw  errtxt&"�ĵ��ϴ�ʧ�ܣ�"
elseif err then
	rw err.description
else
	msg "�ĵ��ϴ��ɹ���","admin_gw.asp?jid="&jid
end if
%>
