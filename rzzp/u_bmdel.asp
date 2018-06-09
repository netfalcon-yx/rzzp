<!--#include file="conn.asp"-->
<%
chku 1
id=request.QueryString("id")
if id<>"" then
	id=intsql(id)
	'sql="select etime from tb_job where jid="&id
'	set rs=server.CreateObject("adodb.recordset")
'	rs.open sql,conn,1,1
'	if not rs.eof then
'		if datediff("d",date,rs("etime"))<0 then msg "报名已结束，不用删除！","-1"
'	else
'		msg "删除报名信息出错！","-1"
'	end if
'	rs.close
	
	sql="select * from tb_bm where id="&id&" and uid="&session("uid")
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,3
	if not rs.eof then
		if rs("hg1") or rs("hg2") then
			msg "报名信息已审核，不能再删除！","-1"
		else
			rs.delete
			rs.update
		end if
		rs.close
	end if
	'conn.execute sql
	
	if err then
		rw err.description
	else
		msg "删除报名信息成功！","u_bminfo.asp"
	end if
else
	response.Redirect("u_bminfo.asp")
end if
%>