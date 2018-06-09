<!--#include file="conn.asp"-->
<!--#include file="md5.asp"-->
<%
chklocal
Dim Usr,Pwd
Uno=Request.form("uname") '从表单获得数据
Pwd=Request.form("upsw") '同上
utype=Request.form("utype") '同上
if (Uno<>"") and (Pwd<>"") then '判断数据为非空
	Pwd=replace(Pwd," ","")
	Uno=replace(Uno," ","")
	utype=replace(utype," ","")
	
	Uno=Replace(Replace(Uno,"'",""),"=","") '嵌套了两个replace函数，过滤特殊字符
	Pwd=Replace(Replace(Pwd,"'",""),"=","")
	utype=Replace(Replace(utype,"'",""),"=","")
	pwd=md5(pwd)
	
	set rs=server.createobject("adodb.recordset")
	if utype=1 or utype=2 then
		sql="select * from tb_job"
		rs.open sql,conn,1,1
		if not rs.eof then
			jsta=rs("jobtype")
		end if
		rs.close
		if jsta=8 then msg "系统暂未开放，请稍后登录！","-1"
	end if
	
	'response.Write(md5(pwd))
	
	select case utype
		case 1
			sql="select * from tb_user where lgname='" & Uno & "' and psw='"&Pwd&"'"
			
			'先读取考试系统学生表
			rs.open sql,conn,1,1
			if not rs.eof then
				session("uid")=rs("uid")
				session("uname")=rs("uname")
				session("utype")=1
			else
				msg "考生用户名或密码错误！","-1"	
			end if
			rs.close
			rw  "<script>top.location.href='u_index.asp'</script>"
		case 2
			sql="select * from tb_duser where uid="&Uno&" and psw='"&Pwd&"'"
			rs.open sql,conn,1,1
			if not rs.eof then
				session("duid")=rs("uid")
				session("duname")=rs("dname")
				session("utype")=2
			else
				msg "基层单位负责人用户名或密码错误！","login.asp"
			end if
			rs.close
			rw  "<script>top.location.href='d_index.asp'</script>"
		case 9
			sql="select * from tb_admin where aname='"&Uno&"' and psw='"&Pwd&"'"
			rs.open sql,conn,1,1
			if not rs.eof then
				session("adminid")=rs("aid")
				session("adminname")=rs("aname")
				session("utype")=9
			else
				msg "管理员用户名或密码错误！","-1"
			end if
			rs.close
			rw  "<script>top.location.href='admin_index.asp'</script>"
		case else
			msg "请正确选择用户类型！","-1"
	end select
		
	set rs=nothing
	conn.close
	set conn=nothing
else
	msg "请检查是否有空值！","-1"
end if

%>