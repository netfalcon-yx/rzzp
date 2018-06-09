<!--#include file="conn.asp"-->
<%chku 9%>
<script type="text/javascript">
var dg =  frameElement.lhgDG;
</script>
<%
rid=request.Form("hdrid")
rname=request.Form("rname")
raddr=request.Form("raddr")
rmax=request.Form("rmax")

set rs=server.CreateObject("adodb.recordset")
if rid<>"" then
	rid=intsql(rid)
	sql="select * from tb_room where rid="&rid
	rs.open sql,conn,1,3
else
	sql="select * from tb_room where rid=0"
	rs.open sql,conn,1,3
	rs.addnew
end if

rs("rname")=rname
rs("raddr")=raddr
rs("rmax")=rmax
rs.update
rs.close
set rs=nothing

if err then
	rw err.description
else
	rw "<script>dg.curDoc.location.reload();dg.cancel();</script>"
end if
%>