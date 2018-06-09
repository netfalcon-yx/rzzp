<!--#Include File="conn.Asp"-->
<%chku 2%>
<script type="text/javascript">
var dg =  frameElement.lhgDG;
</script>
<%
uid=request.QueryString("uid")
if uid="" then
	rw "<script>alert('参数错误!');dg.cancel()</script>"
else
	uid=intsql(uid)
	sql="update tb_user set psw='"&inipsw&"' where uid="&uid&" and did="&session("duid")
	
	if sql<>"" then
		conn.execute sql
		if err then
			rw "<script>alert('参数错误!');dg.cancel()</script>"
		else
			rw "<script>alert('用户密码初始化成功!');dg.cancel()</script>"
		end if
	else
		rw "<script>alert('参数错误!');dg.cancel()</script>"
	end if
end if
%>