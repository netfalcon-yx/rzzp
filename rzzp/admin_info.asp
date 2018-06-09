<!--#include file="conn.asp"-->
<!--#include file="page.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<LINK href="style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>管理新闻</title>
</head>
<%chku 9%>
<body >
<div class="unav">当前位置：通知公告管理--【<a href="admin_addinfo.asp">新增信息</a>】</div>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" class="mytable">
  <tr> 
    <th width="5%" height="25" align="center">ID</th>
    <th align="center">信息标题</th>
    <th width="10%" align="center">类型</th>
    <th width="10%" align="center">置顶</th>
    <th width="10%" align="center">状态</th>
    <th width="12%" align="center">发布日期</th>
    <th width="12%" align="center">操作</th>
  </tr>
  <%
sql = "select * from tb_NEWS  order by istop,infotime desc,id desc" 
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
	select case rs("ntype")  
		case 1
			ntype="新闻公告"
		case 2
			ntype="考试须知"
		case 3
			ntype="诚信承诺"
		case 4
			ntype="内部资料"
		case else
			ntype=""
	end select
%>
  <tr bgcolor="#FFFFFF"> 
    <td height="25" align="center"><%=i%></td>
    <td>
      <a href="NEWS_view.asp?id=<%=rs("id")%>" title="<%=rs("title")%>"><%=temptitle%></a></td>
    <td align="center"><%=ntype%></td>
    <td align="center">
	<%
	if isnull(rs("istop")) or rs("istop")=0 then 
		response.write("否")
	else
		response.write("<font color=#ff0000>是</font>")
	end if
	%></td>
    <td align="center"><%
	if isnull(rs("ishow")) or rs("ishow")=0 then 
		response.write("隐藏")
	else
		response.write("显示")
	end if
	%></td>
    <td align="center"><%=rs("infotime")%></td>
    <td align="center"><a href="admin_infomodi.asp?id=<%=rs("id")%>">修改</a> <a href="admin_infodel.asp?id=<%=rs("id")%>" onClick="{if(confirm('警告：确定删除该条内容吗?')){return true;}return false;}">删除</a></td>
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
