<!--#include file="conn.asp"-->
<%
chku 9
chk=request.QueryString("chk")
id=request.Form("hdid")
jid=request.Form("hdjid")
if id<>"" and jid<>"" and chk<>"" then
	id=intsql(id)
	jid=intsql(jid)
	chk=intsql(chk)
	
	if chk=1 then
		hg1=request.Form("hg1")
		hgbz=request.Form("yj1")
		if hgbz<>"" then hgbz=server.HTMLEncode(hgbz)
		if hg1=1 then
			hg1=true
		else
			hg1=false
		end if
		sql="update tb_bm set hg1="&hg1&",hg1bz='"&hgbz&"' where id="&id&" and jid="&jid
		conn.execute sql
	elseif chk=2 then
		hg2=request.Form("hg2")
		hg2bz=request.Form("yj2")
		if hg2bz<>"" then hg2bz=server.HTMLEncode(hg2bz)
		if hg2=1 then
			hg2=true
		else
			hg2=false
		end if
		sql="update tb_bm set hg2="&hg2&",hg2bz='"&hg2bz&"' where id="&id&" and jid="&jid
		conn.execute sql
		
		'tjgw=request.Form("tjgw")
'		if tjgw<>"" then
'			tjgw=split(tjgw,":")
'			tjgwno=cint(tjgw(0))
'			tjgwid=tjgw(1)
'			if tjgwno=1 then
'				sql="update tb_bm set gid=fgwid,fgwid=gid where id="&id&" and jid="&jid
'				conn.execute sql
'			elseif tjgwno=2 then
'				sql="update tb_bm set gid=fgwid2,fgwid2=gid where id="&id&" and jid="&jid
'				conn.execute sql
'			end if
'			
'		end if
	end if
	
	if err then
		rw err.description
	else
		msg "审核完成!","admin_gwchk.asp?jid="&jid
	end if
else
	msg "参数出错!","-1"
end if	
%>