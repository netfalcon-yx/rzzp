<!--#include file="conn.asp"-->
<%chku 9%>
<%
rid=request.QueryString("rid")
if rid<>"" then rid=intsql(rid)

sql="delete from tb_room where rid="&rid
conn.execute sql

response.Redirect("admin_room.asp")
%>