<!--#include file="conn.asp"-->
<!--#include file="md5.asp"-->
<%
chklocal
Dim Usr,Pwd
Uno=Request.form("uname") '�ӱ��������
Pwd=Request.form("upsw") 'ͬ��
utype=Request.form("utype") 'ͬ��
if (Uno<>"") and (Pwd<>"") then '�ж�����Ϊ�ǿ�
	Pwd=replace(Pwd," ","")
	Uno=replace(Uno," ","")
	utype=replace(utype," ","")
	
	Uno=Replace(Replace(Uno,"'",""),"=","") 'Ƕ��������replace���������������ַ�
	Pwd=Replace(Replace(Pwd,"'",""),"=","")
	utype=Replace(Replace(utype,"'",""),"=","")
	pwd=md5(pwd)
	
	set rs=server.createobject("adodb.recordset")
	if utype=1 or utype=2 then
		sql="select * from tb_job"
		rs.open sql,conn,1,1
		if not rs.eof then
			jsta=rs("jobtype")
		end if
		rs.close
		if jsta=8 then msg "ϵͳ��δ���ţ����Ժ��¼��","-1"
	end if
	
	'response.Write(md5(pwd))
	
	select case utype
		case 1
			sql="select * from tb_user where lgname='" & Uno & "' and psw='"&Pwd&"'"
			
			'�ȶ�ȡ����ϵͳѧ����
			rs.open sql,conn,1,1
			if not rs.eof then
				session("uid")=rs("uid")
				session("uname")=rs("uname")
				session("utype")=1
			else
				msg "�����û������������","-1"	
			end if
			rs.close
			rw  "<script>top.location.href='u_index.asp'</script>"
		case 2
			sql="select * from tb_duser where uid="&Uno&" and psw='"&Pwd&"'"
			rs.open sql,conn,1,1
			if not rs.eof then
				session("duid")=rs("uid")
				session("duname")=rs("dname")
				session("utype")=2
			else
				msg "���㵥λ�������û������������","login.asp"
			end if
			rs.close
			rw  "<script>top.location.href='d_index.asp'</script>"
		case 9
			sql="select * from tb_admin where aname='"&Uno&"' and psw='"&Pwd&"'"
			rs.open sql,conn,1,1
			if not rs.eof then
				session("adminid")=rs("aid")
				session("adminname")=rs("aname")
				session("utype")=9
			else
				msg "����Ա�û������������","-1"
			end if
			rs.close
			rw  "<script>top.location.href='admin_index.asp'</script>"
		case else
			msg "����ȷѡ���û����ͣ�","-1"
	end select
		
	set rs=nothing
	conn.close
	set conn=nothing
else
	msg "�����Ƿ��п�ֵ��","-1"
end if

%>