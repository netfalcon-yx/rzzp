<!--#include file="conn.asp"-->
<%
set rs=server.createobject("ADODB.recordset") 
sql="select face from tb_face where id=" & trim(request("id"))
'response.Write(sql)
'response.End() 
rs.open sql,conn,1,1
'rw rs(0)
'response.End()
if not rs.eof then 
	Response.ContentType = "image/*" 
	bsize=rs(0).ActualSize 
	'response.Write trim(rs("face"))
	'response.End()
	'Response.BinaryWrite rs(0)
	Response.BinaryWrite rs(0).getChunk(bsize)
end if
rs.close
set rs=nothing 
set conn=nothing 
%>