<!--#Include File="conn.Asp"-->
<%chku 2%>
<script type="text/javascript">
var dg =  frameElement.lhgDG;
</script>
<%
uid=request.QueryString("uid")
if uid="" then
	rw "<script>alert('��������!');dg.cancel()</script>"
else
	uid=intsql(uid)
	sql="update tb_user set psw='"&inipsw&"' where uid="&uid&" and did="&session("duid")
	
	if sql<>"" then
		conn.execute sql
		if err then
			rw "<script>alert('��������!');dg.cancel()</script>"
		else
			rw "<script>alert('�û������ʼ���ɹ�!');dg.cancel()</script>"
		end if
	else
		rw "<script>alert('��������!');dg.cancel()</script>"
	end if
end if
%>