<!--#include file="conn.asp"-->
<%
chku 9
sql="alter table tb_zkz add column usta char"
conn.execute sql
sql="alter table tb_zkz add column ustadt char"
conn.execute sql
if err then
	rw "err:"&err.description
else
	rw "ok"
end if
%>
