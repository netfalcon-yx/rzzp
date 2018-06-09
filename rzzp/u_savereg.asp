<!--#Include File="conn.Asp"-->
<!--#Include File="md5.Asp"-->
<%
chklocal
lgname=request.Form("lgname")

set rs=server.createobject("adodb.recordset")
sql="select count(uid) from tb_user where lgname='"&lgname&"'"
rs.open sql,conn,1,1
if rs(0)>0 then	msg "此身份证号已注册！","-1"
rs.close

psw2=request.Form("psw2")
psw2=md5(psw2)
uname=request.Form("uname")
did=request.Form("gzdw")
card=lgname
birthday=request.Form("birthday")
sex=request.Form("sex")
mz=request.Form("mz")
hy=request.Form("hy")
jg=request.Form("jg")
hj=request.Form("hj")
'erpid=request.Form("erpid")
'dz=request.Form("dz")
'yb=request.Form("yb")
tel=request.Form("tel")
mb=request.Form("mb")
email=request.Form("email")
st=request.Form("st")
'isqm=request.Form("isqm")

uip = Request.ServerVariables("HTTP_X_FORWARDED_FOR") 
If uip = "" Then uip = Request.ServerVariables("REMOTE_ADDR") 

sql="select * from tb_user where uid=0"
rs.open sql,conn,1,3
rs.addnew
rs("lgname")=lgname
rs("psw")=psw2
rs("uname")=uname
rs("did")=did
rs("card")=card
rs("birthday")=birthday
rs("sex")=sex
rs("mz")=mz
rs("hy")=hy
rs("jg")=jg
rs("hj")=hj
'rs("erpid")=erpid
'rs("dz")=dz
'rs("yb")=yb
rs("tel")=tel
rs("mb")=mb
rs("email")=email
rs("st")=st
rs("uip")=uip
'rs("qm")=isqm
rs.update
rs.close

if err then
	rw err.description
	msg "注册失败！","-1"
else
	msg "注册成功，请重新登录！","login.asp"
end if

%>