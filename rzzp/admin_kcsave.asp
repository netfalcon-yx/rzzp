<!--#include file="conn.asp"-->
<%
chku 9
jid=request.QueryString("jid")
kcuid=request.Form("kcuid")
room=request.Form("room")

if jid<>"" and kcuid<>"" and room<>"" then
	jid=intsql(jid)
	kcuid=replace(kcuid," ","")
	'rw kcuid
	'response.End()
	uarr=split(kcuid,",")
	
	for i=0 to ubound(uarr) 
		sql="update tb_exam set rid="&room&" where jid="&jid&" and uid="&uarr(i)
		conn.execute sql
	next
		
	if err then
		rw err.description
	else
		msg "��������ɹ���","admin_kc.asp?jid="&jid
	end if
else
	msg "�����Ƿ��п�ֵ��","-1"
end if

function strlen(str,n)
	if str<>"" then
		for j=1 to n-len(str)
			str="0"&str
		next
		strlen=str
	else
		strlen=""
	end if
end function
%>
