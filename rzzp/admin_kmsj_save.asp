<!--#Include File="conn.Asp"-->
<%
chku 9
ak1=request.Form("ak1")
ak2=request.Form("ak2")
ak3=request.Form("ak3")
as1=request.Form("as1")
as2=request.Form("as2")
as3=request.Form("as3")
as11=request.Form("as11")
as21=request.Form("as21")
as31=request.Form("as31")

bk1=request.Form("bk1")
bk2=request.Form("bk2")
bk3=request.Form("bk3")
bs1=request.Form("bs1")
bs2=request.Form("bs2")
bs3=request.Form("bs3")
bs11=request.Form("bs11")
bs21=request.Form("bs21")
bs31=request.Form("bs31")

sql="update tb_gtype set kskm='"&ak1&"',kssj='"&as1&" "&as11&"' where tid='a1'"
conn.execute sql

sql="update tb_gtype set kskm='"&ak2&"',kssj='"&as2&" "&as21&"' where tid='a2'"
conn.execute sql

sql="update tb_gtype set kskm='"&ak3&"',kssj='"&as3&" "&as31&"' where tid='a3'"
conn.execute sql

sql="update tb_gtype set kskm='"&bk1&"',kssj='"&bs1&" "&bs11&"' where tid='b1'"
conn.execute sql

sql="update tb_gtype set kskm='"&bk2&"',kssj='"&bs2&" "&bs21&"' where tid='b2'"
conn.execute sql

sql="update tb_gtype set kskm='"&bk3&"',kssj='"&bs3&" "&bs31&"' where tid='b3'"
conn.execute sql

if err then
	rw err.description
else
	msg "更新考试科目时间成功","admin_kmsj.asp"
end if
%>
