<!--#include file="conn.asp"-->
<%chku 9%>
<%
did=request.QueryString("did")
if did<>"" then did=intsql(did)

sql="delete from tb_duser where uid="&did
conn.execute sql

response.Redirect("admin_deptmg.asp")
%>