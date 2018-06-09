<!--#include file="conn.asp"-->
<%
chku 2
id=request.Form("hdid")
jid=request.Form("hdjid")
if id<>"" and jid<>"" then
	id=intsql(id)
	jid=intsql(jid)
	hg1=request.Form("hg1")
	hgbz=request.Form("yj1")
	if hgbz<>"" then hgbz=server.HTMLEncode(hgbz)
	if hg1=1 then
		hg1=true
	else
		hg1=false
	end if
	sql="update tb_bm set hg1="&hg1&",hg1bz='"&hgbz&"' where id="&id&" and jid="&jid&" and gzdw="&session("duid")
	conn.execute sql
	
	if err then
		rw err.description
	else
		msg "审核完成!","d_gw.asp?jid="&jid
	end if
else
	msg "参数出错!","-1"
end if	
%>