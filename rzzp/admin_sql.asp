<!--#include file="conn2.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>执行SQL</title>
<link href="css.css" rel="stylesheet" type="text/css" />
<link href="fm.css" rel="stylesheet" type="text/css" />
</head>
<%
chku 9
sql_sta=""
tmp_sql=trim(request.Form("sql"))
if tmp_sql<>"" then
	if left(tmp_sql,6)="select" then
		set rs=conn.execute(tmp_sql)
		while not rs.eof
			for   i=0   to   rs.fields.count-1
				response.Write(rs.fields(i).value&",")
			next
			response.Write("<br>")
			rs.movenext
		wend
		rs.close
	else
		conn.execute tmp_sql
	end if
	if err.number<>0 then
		sql_sta= "执行出错："&err.description
	else
		sql_sta= "执行成功！"
	end if
end if
%>
<body>
<form id="form1" name="form1" method="post" action="">
  <table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="table2">
    <tr>
      <th>用于系统维护执行修改数据的SQL语句</th>
    </tr>
    <tr>
      <td align="center"><label>
        <textarea name="sql" cols="100" rows="8" id="sql"></textarea>
      </label></td>
    </tr>
    <tr>
      <td align="center"><label>
        <input name="Submit" type="submit" class="but2" value="提交" />
      </label></td>
    </tr>
    <tr>
      <td align="center"><%=sql_sta%></td>
    </tr>
  </table>
</form>
</body>
</html>
