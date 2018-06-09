<!--#include file="conn.asp"-->
<%
chku 9
jid=request.QueryString("jid")
if jid<>"" then
	jid=intsql(jid)
	
	sql="delete * from tb_bm where jid="&jid
	conn.execute sql
	
	sql="delete * from tb_cj where jid="&jid
	conn.execute sql
	
	sql="delete * from tb_exam where jid="&jid
	conn.execute sql
	
	sql="delete * from tb_gw where jid="&jid
	conn.execute sql
	
	sql="delete * from tb_job where jid="&jid
	conn.execute sql
	
	if err then
		response.Write(err.description)
	else
		msg "成功删除招聘!","admin_job.asp"
	end if
else
	msg "参数错误!","-1"
end if
%>