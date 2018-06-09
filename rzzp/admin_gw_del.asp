<!--#include file="conn.asp"-->
<%
chku 9
gid=request.QueryString("gid")
jid=request.QueryString("jid")
if gid<>"" then
	gid=intsql(gid)
	jid=intsql(jid)
	set rs=server.createobject("adodb.recordset")
	'sql="select jid from tb_gw where gid="&gid
'	rs.open sql,conn,1,1
'	if not rs.eof then
'		jid=rs(0)
'	end if
'	rs.close
	
	sql="delete * from tb_bm where jid="&jid&" and gid="&gid
	conn.execute sql
			
	sql="delete * from tb_gw where jid="&jid&" and gid="&gid
	conn.execute sql
	
	if err then
		response.Write(err.description)
	else
		msg "成功删除岗位!","admin_gw.asp?jid="&jid
	end if
else
	msg "参数错误!","-1"
end if
%>