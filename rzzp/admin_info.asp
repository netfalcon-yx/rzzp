<!--#include file="conn.asp"-->
<!--#include file="page.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<LINK href="style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��������</title>
</head>
<%chku 9%>
<body >
<div class="unav">��ǰλ�ã�֪ͨ�������--��<a href="admin_addinfo.asp">������Ϣ</a>��</div>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" class="mytable">
  <tr> 
    <th width="5%" height="25" align="center">ID</th>
    <th align="center">��Ϣ����</th>
    <th width="10%" align="center">����</th>
    <th width="10%" align="center">�ö�</th>
    <th width="10%" align="center">״̬</th>
    <th width="12%" align="center">��������</th>
    <th width="12%" align="center">����</th>
  </tr>
  <%
sql = "select * from tb_NEWS  order by istop,infotime desc,id desc" 
i=1
'response.Write(sql)
Set mypage=new xdownpage
mypage.getconn=conn
	'sql���
mypage.getsql=sql
	'����ÿһҳ�ļ�¼������Ϊ20��setcolor(rsg("title"),rsg("tfont"),rsg("tcolor"))
mypage.pagesize=25
page=mypage.pagesize

'����Recordset
set rs=mypage.getrs()
page=mypage.pagesize
while not rs.eof and page>0
 	temptitle=rs("title")
	if rs("tfont") then temptitle="<strong>"&temptitle&"</strong>"
	if rs("tcolor")<>"" then temptitle="<font color="&rs("tcolor")&">"&temptitle&"</font>"
	select case rs("ntype")  
		case 1
			ntype="���Ź���"
		case 2
			ntype="������֪"
		case 3
			ntype="���ų�ŵ"
		case 4
			ntype="�ڲ�����"
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
		response.write("��")
	else
		response.write("<font color=#ff0000>��</font>")
	end if
	%></td>
    <td align="center"><%
	if isnull(rs("ishow")) or rs("ishow")=0 then 
		response.write("����")
	else
		response.write("��ʾ")
	end if
	%></td>
    <td align="center"><%=rs("infotime")%></td>
    <td align="center"><a href="admin_infomodi.asp?id=<%=rs("id")%>">�޸�</a> <a href="admin_infodel.asp?id=<%=rs("id")%>" onClick="{if(confirm('���棺ȷ��ɾ������������?')){return true;}return false;}">ɾ��</a></td>
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
