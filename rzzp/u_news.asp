<!--#include file="conn.asp"-->
<!--#include file="page.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<LINK href="style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>新闻列表</title>
</head>

<body >

<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" class="mytable">
  <tr> 
    <th width="5%" height="25" align="center">ID</th>
    <th width="80%" align="center">信息标题</th>
    <th width="15%" align="center">发布日期</th>
  </tr>
  <%
sql="select * from tb_NEWS where ntype=1 and ishow=true order by istop,infotime desc,id desc" 
i=1
'response.Write(sql)
Set mypage=new xdownpage
mypage.getconn=conn
	'sql语句
mypage.getsql=sql
	'设置每一页的记录条数据为20条setcolor(rsg("title"),rsg("tfont"),rsg("tcolor"))
mypage.pagesize=25
page=mypage.pagesize

'返回Recordset
set rs=mypage.getrs()
page=mypage.pagesize
while not rs.eof and page>0
 	temptitle=rs("title")
	if rs("tfont") then temptitle="<strong>"&temptitle&"</strong>"
	if rs("tcolor")<>"" then temptitle="<font color="&rs("tcolor")&">"&temptitle&"</font>"  
%>
  <tr bgcolor="#FFFFFF"> 
    <td height="25" align="center"><%=i%></td>
    <td>
      <a href="NEWS_view.asp?id=<%=rs("id")%>" title="<%=rs("title")%>"><%=temptitle%></a></td>
    <td align="center"><%=rs("infotime")%></td>
  </tr>
<%
	i=i+1
	rs.movenext
	page=page-1
wend                                                   
%>
</table>
  
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
      <td height="30" align="center"> 
   		<%mypage.showpage()%>
      </td>
  </tr>
</table>
<% 
'rs.close
set rs=nothing
%>

</body>
</html>
