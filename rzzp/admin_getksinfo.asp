<!--#include file="conn.asp"-->
<!--#include file="JSON_204.asp"-->
<%
'chku 9
cid=request.querystring("cid")
if cid<>"" then
	Set member = jsObject()
	sql="select a.*,(select dname from tb_duser where uid=a.did)as dname from tb_user a where card='"&cid&"'"
	set rs=server.createobject("adodb.recordset")
	rs.open sql,conn,1,3
	if not rs.eof then
		member("uid") = rs("uid")
		member("uname") = rs("uname")
		member("ugzdw") = rs("dname")
		member("usex") = rs("sex")
		member("ucard") = rs("card")
		if rs("uphoto")<>"" then
			member("photo") = rs("uphoto")
		else
			member("photo")="nophoto.jpg"
		end if
		if rs("uface")="" or isnull(rs("uface")) then
			member("xcfacesta")=""
		else
			member("xcfacesta")="<a href='photo/"&rs("uface")&"' target=_blank>°Ã’’∆¨“—≤…ºØ</a>"
		end if
		did=rs("did")
		uid=rs("uid")
		'rw callback&"("
		'member.Flush
		'rw callback&")"
		'member.Clean
	end if
	rs.close
	
	sql="select top 1 jid from tb_job order by jid desc"
	rs.open sql,conn,1,1
	if not rs.eof then
	jid=rs(0)
	end if
	rs.close

	sql="select gid from tb_bm where jid="&jid&" and uid="&uid
	rs.open sql,conn,1,1
	if not rs.eof then
		member("gid")=rs("gid")
	end if
	rs.close
	
	sql="select * from tb_zkz where jid="&jid&" and cardid='"&cid&"'"
	rs.open sql,conn,1,1
	if not rs.eof then
		member("ktype")=rs("ktype")
		member("kh")=rs("kh")
		member("kc")=rs("kc")
		member("kcjs")=rs("kcjs")
		member("zwh")=rs("zwh")
		member("bssj")=rs("bssj")
		member("ksdz")=rs("ksdz")
	end if
	rs.close
	set rs=nothing
	closeconn
	member.Flush
	member.Clean
end if
%>