<!--#Include File="conn.Asp"-->
<%
sid=request.QueryString("sid")
if sid<>"" then
	sql="select count(uid) from tb_user where lgname='"&sid&"'"
	set rs=server.createobject("adodb.recordset")
	rs.open sql,conn,1,1
	if rs(0)>0 then
		rw 0
	else
		rw 1
	end if
	rs.close 
	set rs=nothing
else
	rw 0
end if
%>