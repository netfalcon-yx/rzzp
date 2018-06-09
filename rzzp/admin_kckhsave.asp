<!--#include file="conn.asp"-->
<%
chku 9
jid=request.QueryString("jid")
tempy=right(year(date),2)

if jid<>"" then
	set rs=server.CreateObject("adodb.recordset")
	set rs2=server.CreateObject("adodb.recordset")
	jid=intsql(jid)
		
	'生成前先删除已生成的考号
	sql="delete from tb_exam where jid="&jid
	conn.execute sql
	
	'先生成A岗考号
	'i=1
	tmpno=""
	sql="select gid from tb_gw where jid="&jid&" and gtype='a' order by gid"
	'sql="select * from tb_bm where jid="&jid&" and hg1 and hg2 and gid in(select gid from tb_gw where gtype='a' and jid="&jid&") order by gid,rnd(-1 * id +time())"
	rs.open sql,conn,1,1
	while not rs.eof
		j=1
		gid=rs("gid")		
		'sql2="select id,uid from tb_bm where jid="&jid&" and hg1 and hg2 and gid="&rs("gid")&" order by rnd(-1 * id +time())"
		sql2="select id,uid from tb_bm where jid="&jid&" and hg1 and hg2 and gid="&gid&" order by rnd(id)"
		rs2.open sql2,conn,1,1
		while not rs2.eof
			'tmpno="A"&tempy&strlen(i,2)&strlen(j,3)
			tmpno="A"&tempy&strlen(gid,2)&strlen(j,3)		
			sql="insert into tb_exam(jid,uid,kh) values("&jid&","&rs2("uid")&",'"&tmpno&"')"
			conn.execute sql
			
			j=j+1
			rs2.movenext
		wend
		rs2.close
		'i=i+1	
		rs.movenext		
	wend
	rs.close
	
	'再生成B岗考号
	tmpno=""
	sql="select gid from tb_gw where jid="&jid&" and gtype='b' order by gid"
	'sql="select * from tb_bm where jid="&jid&" and hg1 and hg2 and gid in(select gid from tb_gw where gtype='a' and jid="&jid&") order by gid,rnd(-1 * id +time())"
	rs.open sql,conn,1,1
	while not rs.eof
		j=1
		gid=rs("gid")	
		'sql2="select id,uid from tb_bm where jid="&jid&" and hg1 and hg2 and gid="&rs("gid")&" order by rnd(-1 * id +time())"
		sql2="select id,uid from tb_bm where jid="&jid&" and hg1 and hg2 and gid="&gid&" order by rnd(id)"
		rs2.open sql2,conn,1,1
		while not rs2.eof
			'tmpno="B"&tempy&strlen(i,2)&strlen(j,3)
			tmpno="B"&tempy&strlen(gid,2)&strlen(j,3)
			sql="insert into tb_exam(jid,uid,kh) values("&jid&","&rs2("uid")&",'"&tmpno&"')"
			conn.execute sql
			
			j=j+1
			rs2.movenext
		wend
		rs2.close
		'i=i+1	
		rs.movenext
	wend
	rs.close
			
	if err then
		rw err.description
	else
		msg "准考证号分配成功！","admin_kc.asp?jid="&jid
	end if
else
	msg "招聘信息参数出错！","-1"
end if

function strlen(str,n)
	if str<>"" then
		for m=1 to n-len(str)
			str="0"&str
		next
		strlen=str
	else
		strlen=""
	end if
end function
%>
