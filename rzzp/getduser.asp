<!--#include file="conn.asp"-->
<%
tempdept=""
sql="select * from tb_duser"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
while not rs.eof
	tempdept=tempdept&"<option value='"&rs("uid")&"'>"&rs("dname")&"</option>"
	rs.movenext
wend
rs.close
rw "var tempdept="""&tempdept&""";"
%>