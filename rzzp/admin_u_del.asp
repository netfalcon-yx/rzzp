<!--#include file="conn.asp"-->
<%
chku 2
uid=request.QueryString("uid")
if uid<>"" then
	uid=intsql(uid)
		
	sql="delete * from tb_bm where uid="&uid&" and gzdw="&session("duid")
	conn.execute sql
			
	sql="delete * from tb_exam where uid="&uid
	conn.execute sql
	
	sql="delete * from tb_user where uid="&uid&" and did="&session("duid")
	conn.execute sql
	
	if err then
		response.Write(err.description)
	else
		msg "�ɹ�ɾ���û�!","admin_umg.asp"
	end if
else
	msg "��������!","-1"
end if
%>