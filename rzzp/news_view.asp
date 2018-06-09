<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="conn.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>新闻浏览</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<%
id=request.QueryString("id")
id=intsql(id)

sql="select * from tb_news where id="&id
set rs = Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,1,3
if rs.eof then	msg "此信息不存在！","-1"
rs("hits")=rs("hits")+1
rs.update
if err then rw err.description

tempcome=request.servervariables("HTTP_REFERER")
%>
<body>
<div class="unav">信息浏览 >>【<a href="<%=tempcome%>">返回</a>】</div>
<div class="newstit"><%=rs("title")%></div>
<div class="newspub">发布时间：<%=rs("infotime")%> 浏览次数：<%=rs("hits")%></div>
<div class="newscontent"><%=rs("content")%></div>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
</body>
</html>
