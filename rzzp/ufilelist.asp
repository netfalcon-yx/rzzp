<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<style>
.ftable{line-height:25px;}
.ftable img{vertical-align:middle;margin-right:10px}
</style>
</head>
<%
did=request.QueryString("did")
if session("utype")<>1 then
	uid=request.QueryString("uid")
	if uid<>"" then
		uid=intsql(uid)
	else
		rw "用户参数错误！"
		response.End()
	end if
end if
if did<>"" then
	if session("utype")=1 then
		sql="delete from tb_ufile where uid="&session("uid")&" and id="&intsql(did)
	elseif session("utype")=2 then
		sql="delete from tb_ufile where uid=(select uid from tb_user where uid="&uid&" and did="&session("duid")&") and id="&intsql(did)
	elseif session("utype")=9 then
		sql="delete from tb_ufile where uid="&uid&" and id="&intsql(did)
	end if
	if sql<>"" then conn.execute sql
end if
%>
<body>
  <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="ftable">
  <%
  if session("utype")=1 then
	  sql="select * from tb_ufile where uid="&session("uid")
  elseif session("utype")=2 then
	  sql="select * from tb_ufile where uid=(select uid from tb_user where uid="&uid&" and did="&session("duid")&")"
  elseif session("utype")=9 then
	  sql="select * from tb_ufile where uid="&uid
  end if
  'sql="select * from tb_ufile where uid="&session("uid")
  set rs=server.createobject("adodb.recordset")
  rs.open sql,conn,1,1
  if not rs.eof then
  while not rs.eof
  %>
    <tr>
      <td><img src="icon/down-11.gif" width="16" height="16"  /><a href="doc/<%=rs("furl")%>" target="_blank"><%=getuftype(rs("ftype"))%></a> 【<a href='javascript:void(0)' onclick="if(confirm('确定要删除该附件吗？\r\n删除后不可恢复，如有需要请重新上传！'))location.href='?did=<%=rs("id")%>&uid=<%=uid%>'">×删除</a>】</td>
    </tr>
  <%
  	rs.movenext
wend
else
	rw "<tr><td>还没有上传附件</td></tr>"
end if
rs.close
set rs=nothing
closeconn
  %>
  </table>
</body>
</html>
