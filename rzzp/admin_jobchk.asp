<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��Ƹ��Ϣ</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="unav">��ǰλ�ã���Ƹ��λ���</div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable">
  <tr>
    <th width="5%">���</th>
    <th>����</th>
    <th width="10%">������ʼʱ��</th>
    <th width="15%">����ʱ��</th>
    <th width="20%">�ĵ�˵��</th>
    <th width="8%">��λ����</th>
    <th width="8%">�������</th>
    <th width="10%">����ͳ��</th>
  </tr>
  <%
  sql="select * from tb_job order by jid desc"
  set rs=server.CreateObject("adodb.recordset")
  set rs2=server.CreateObject("adodb.recordset")
  rs.open sql,conn,1,1
  i=1
  while not rs.eof
  	jfile=rs("jfile")
	if jfile="" or isnull(jfile) then
		jfile="����"
	else
		jfile="<a href='doc/"&jfile&"' target='_blank'>"&rs("jfname")&"</a>"
	end if
	
	sql2="select count(gid) from tb_gw where jid="&rs("jid")
	rs2.open sql2,conn,1,1
	jobs=rs2(0)
	rs2.close
	
	bmrs="���ޱ���"
	'sql2="select count(id) from tb_bm where jid="&rs("jid")&" and hg1"
	sql2="select count(id) from tb_bm where jid="&rs("jid")&" and hg1 and hg2"
	rs2.open sql2,conn,1,1
	bmrs=rs2(0)
	if bmrs>0 then	bmrs=bmrs&"�� <a href='admin_gwchk.asp?jid="&rs("jid")&"'>������</a>"
	rs2.close
  %>
  <tr>
    <td align="center"><%=i%></td>
    <td><a href="admin_gwchk.asp?jid=<%=rs("jid")%>"><%=rs("jname")%></a></td>
    <td align="center"><%=rs("btime")%></td>
    <td align="center"><%=rs("etime")%></td>
    <td align="center"><%=jfile%></td>
    <td align="center"><%=jobs%></td>
    <td align="center"><%=bmrs%></td>
    <td align="center"><a href="admin_tj_dwsum.asp?jid=<%=rs("jid")%>">ͳ��</a></td>
  </tr>
  <%
  	i=i+1
  	rs.movenext
	wend
	rs.close
  %>
</table>
</body>
</html>
