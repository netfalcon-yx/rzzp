<!--#include file="conn.asp"-->
<%
chku 1
id=request.QueryString("id")
if id<>"" then
	id=intsql(id)
	'sql="select etime from tb_job where jid="&id
'	set rs=server.CreateObject("adodb.recordset")
'	rs.open sql,conn,1,1
'	if not rs.eof then
'		if datediff("d",date,rs("etime"))<0 then msg "�����ѽ���������ɾ����","-1"
'	else
'		msg "ɾ��������Ϣ����","-1"
'	end if
'	rs.close
	
	sql="select * from tb_bm where id="&id&" and uid="&session("uid")
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
	if not rs.eof then
		if rs("hg1") or rs("hg2") then
			msg "������Ϣ����ˣ�������ɾ����","-1"
		else
			rs.delete
			rs.update
		end if
		rs.close
	end if
	'conn.execute sql
	
	if err then
		rw err.description
	else
		msg "ɾ��������Ϣ�ɹ���","u_bminfo.asp"
	end if
else
	response.Redirect("u_bminfo.asp")
end if
%>