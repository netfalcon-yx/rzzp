<!--#Include File="conn.Asp"-->
<%chku 9%>
<script type="text/javascript">
var dg =  frameElement.lhgDG;
</script>
<%
utype=request.QueryString("utype")
uid=request.QueryString("uid")
if utype="" or uid="" then
	rw "<script>alert('参数错误!');dg.cancel()</script>"
else
	utype=intsql(utype)
	uid=intsql(uid)
	if utype=1 then
		sql="update tb_user set psw='"&inipsw&"' where uid="&uid
	elseif utype=2 then
		sql="update tb_duser set psw='"&inipsw&"' where uid="&uid
	end if
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