<!--#include file="conn.asp"-->
<%
chku 9
did=request.QueryString("id")
did=intSql(did)
if did<>0 then
	sql="delete from tb_news where id="&did
	conn.execute sql
	msg "�ɹ�ɾ��!","admin_info.asp"
else
	msg "��������!","-1"
end if
%>
