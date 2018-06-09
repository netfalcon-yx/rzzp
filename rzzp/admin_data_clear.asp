<!--#include file="conn.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<%
chku 9
d_sta=""
sub updata()
	db=server.mappath("db/#pubjob.mdb")
	bkfolder=Server.MapPath(".")&"\db"
	bkname=bkfolder&"\#"&replace(replace(replace(now(),":",""),"/","")," ","#")&".mdb"
	Set Fso=server.createobject("scripting.filesystemobject")
	fso.copyfile db,bkname
	Set Fso = nothing
	if err.number<>0 then
		d_sta="备份数据库出错！<br>"
		rw err.description
		err.clear
		response.End()
	else
		d_sta="备份数据库成功！<br>"
	end if
end sub

if request.Form("cpsw")<>"" then
	if request.Form("cpsw")="!hbsgcc" then
		'先备份数据库再说
		updata()
		'response.End()
		'清除报名结果	
		sql="delete from tb_bm"
		conn.execute sql
		
		sql="alter table tb_bm alter column id autoincrement(1,1)"
		conn.execute sql
		if err.number<>0 then
			d_sta=d_sta&"清除报名数据出错！<br>"
			err.clear
		else
			d_sta=d_sta&"清除报名数据成功！<br>"
		end if
		
		'清除准考证	
		sql="delete from tb_zkz"
		conn.execute sql		
		if err.number<>0 then
			d_sta=d_sta&"清除准考证数据出错！<br>"
			err.clear
		else
			d_sta=d_sta&"清除准考证数据成功！<br>"
		end if
		
		'清除考试成绩	
		sql="delete from tb_cj"
		conn.execute sql
		sql="alter table tb_cj alter column id autoincrement(1,1)"
		conn.execute sql
				
		if err.number<>0 then
			d_sta=d_sta&"清除考试成绩数据出错！<br>"
			err.clear
		else
			d_sta=d_sta&"清除考试成绩数据成功！<br>"
		end if
		
		'清除用户注册数据	
		sql="delete from tb_user"
		conn.execute sql
		sql="alter table tb_user alter column uid autoincrement(1,1)"
		conn.execute sql
		
		if err.number<>0 then
			d_sta=d_sta&"清除用户注册数据出错！<br>"
			err.clear
		else
			d_sta=d_sta&"清除用户注册数据成功！<br>"
		end if
		
		'清除用户附件数据	
		sql="delete from tb_ufile"
		conn.execute sql
		sql="alter table tb_ufile alter column id autoincrement(1,1)"
		conn.execute sql
		
		if err.number<>0 then
			d_sta=d_sta&"清除用户附件数据出错！<br>"
			err.clear
		else
			d_sta=d_sta&"清除用户附件数据成功！<br>"
		end if
		
		'清除基层单位用户联系方式数据	
		'sql="update tb_duser set duname=null,gw=null,tel=null,mb=null,email=null"
		'conn.execute sql
		
		'if err.number<>0 then
			'd_sta=d_sta&"清除单位用户联系方式出错！<br>"
			'err.clear
		'else
			'd_sta=d_sta&"清除单位用户联系方式成功！<br>"
		'end if
		'清除岗位数据	
		sql="delete from tb_gw"
		conn.execute sql
		
		if err.number<>0 then
			d_sta=d_sta&"清除岗位数据出错！<br>"
			err.clear
		else
			d_sta=d_sta&"清除岗位数据成功！<br>"
		end if

		
	else
		msg "请输入正确的防删除密码！","-1"
	end if
	
end if

%>
<body>
<form id="form1" name="form1" method="post" action="admin_data_clear.asp?dt=<%=now()%>">
  <table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:600px;">
    <tr>
      <td colspan="2" align="center"><strong>删除临时数据</strong></td>
    </tr>
    <tr>
      <td width="20%" align="right" class="btz">说明：</td>
      <td>此操作用于正式使用前，删除之前的一些测试模拟数据（包括：用户注册信息，报名信息、成绩信息、考号信息等），<span class="redfont">正式投入使用后切不可进行此操作，否则将删除所有用户的数据</span>！</td>
    </tr>
    <tr>
      <td align="right">删除密码：</td>
      <td><label>
        <input name="cpsw" type="password" id="cpsw" />
        <input name="Submit" type="submit" class="but2" value="清除数据" />
      （为防止意外删除数据，特设置了防删除密码，输入正确的密码后才能删除！）</label></td>
    </tr>
    <tr>
      <td align="right">删除状态：</td>
      <td><%=d_sta%></td>
    </tr>
  </table>
</form>
</body>
</html>
