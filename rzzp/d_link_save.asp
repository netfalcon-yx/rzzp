<!--#include file="conn.asp"-->
<%chku 2%>
<%
duname=server.HTMLEncode(request.Form("duname"))
gw=server.HTMLEncode(request.Form("gw"))
tel=server.HTMLEncode(request.Form("tel"))
mb=server.HTMLEncode(request.Form("mb"))
email=server.HTMLEncode(request.Form("email"))

if duname<>"" and gw<>"" and tel<>"" and mb<>"" and email<>"" then
	sql="select * from tb_duser where uid="&session("duid")
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
	rs("duname")=duname
	rs("gw")=gw
	rs("tel")=tel
	rs("mb")=mb
	rs("email")=email
	rs.update
	rs.close
	msg "��ϵ��ʽ����ɹ�!","d_link.asp"
else
	msg "�����Ƿ��п�ֵ!","-1"
end if
%>