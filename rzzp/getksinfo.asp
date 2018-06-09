<!--#include file="conn.asp"-->
<!--#include file="JSON_204.asp"-->
<%
cid=request.querystring("cid")
if cid<>"" then
	Set member = jsObject()
	sql="select * from tb_zkz where cardid='"&cid&"'"
	set rs=server.createobject("adodb.recordset")
	rs.open sql,conn,1,3
	if not rs.eof then
		rs("usta")="1"
		rs("ustadt")=now()
		rs.update
		'member("xm") = rs("uname")
		member("zkz") = rs("kh")
		member("sta") = 1
		'rw callback&"("
		'member.Flush
		'rw callback&")"
		'member.Clean
	end if
	rs.close
	sql="select uname from tb_user where card='"&cid&"'"
	rs.open sql,conn,1,1
	if not rs.eof then
	member("xm") = rs("uname")
	end if
	rs.close
	member.Flush
	member.Clean
	set rs=nothing
	closeconn
end if
%>