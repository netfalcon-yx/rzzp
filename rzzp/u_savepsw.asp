<!--#include file="conn.asp"-->
<!--#include file="md5.asp"-->
<%
chku 0
password1=request.form("oldpsw")
psw1=request.form("psw1")
password2=request.form("psw2")

if password1<>"" and  password2<>"" then	
	if psw1<>password2 then msg "两次输入密码不一致！","-1"	
	if len(password2)<4 then msg "为确保安全，密码长度不能少于4位！","-1"
end if

set rs=server.CreateObject("ADODB.RecordSet")
select case session("utype")
	case 1
		sql="select psw from tb_user where uid="& session("uid")
	case 2
		sql="select psw from tb_duser where uid="& session("duid")
	case 9
		sql="select psw from tb_admin where aid="& session("adminid")
	case else
		msg "登录信息出错！","-1"
end select
rs.open sql,conn,1,3
if not rs.eof then
	if md5(password1)<>rs("psw") then 
		msg "原密码输入出错！","-1"
	else
		rs("psw")=md5(password2)
	end if
	rs.update
end if
rs.close
set rs=nothing
conn.close
set conn=nothing
tempcome=request.servervariables("HTTP_REFERER")

msg "密码修改完成！",tempcome
%>
