<!--#Include File="conn.Asp"-->
<%
'chku 1
'if session("utype")<>1 and session("utype")<>2 and session("utype")<>9 then msg "权限不足无法保存注册资料！","-1"
chku 0

chklocal

uname=request.Form("uname")
did=request.Form("gzdw")
card=request.Form("card")
birthday=request.Form("birthday")
sex=request.Form("sex")
mz=request.Form("mz")
hy=request.Form("hy")
jg=request.Form("jg")
hj=request.Form("hj")
'dz=request.Form("dz")
'yb=request.Form("yb")
tel=request.Form("tel")
mb=request.Form("mb")
email=request.Form("email")
st=request.Form("st")
'erpid=request.Form("erpid")
'isqm=request.Form("isqm")

set rs=server.CreateObject("adodb.recordset")
if session("utype")=1 then
	sql="select * from tb_user where uid="&session("uid")
elseif session("utype")=2 then
	sql="select * from tb_user where uid="&request.QueryString("uid")&" and did="&session("duid")
elseif session("utype")=9 then
	sql="select * from tb_user where uid="&request.QueryString("uid")
end if
rs.open sql,conn,1,3
if not rs.eof then
	mdfuid=rs("uid")
	rs("uname")=uname
	rs("did")=did
	rs("card")=card
	rs("birthday")=birthday
	rs("sex")=sex
	rs("mz")=mz
	rs("hy")=hy
	rs("jg")=jg
	rs("hj")=hj
	'rs("dz")=dz
	'rs("yb")=yb
	rs("tel")=tel
	rs("mb")=mb
	rs("email")=email
	rs("st")=st
	'rs("erpid")=erpid
	'rs("qm")=isqm
	rs.update
end if
rs.close

if err then
	rw err.description
	msg "更新失败！","-1"
else
	sql="update tb_bm set gzdw="&did&" where uid="&mdfuid
	conn.execute(sql)
	if session("utype")=1 then
		msg "用户信息更新成功！","u_baseinfo.asp"
	elseif session("utype")=2 then
		msg "用户信息更新成功！","admin_umg.asp"
	else
		msg "用户信息更新成功！","admin_umg_admin.asp"
	end if
end if

%>