<!--#include file="conn.asp"-->
<%chku 1%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��Ƹ��Ϣ</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="unav">��ǰλ�ã���λ����</div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable">
  <tr>
    <th width="5%">���</th>
    <th>����</th>
    <th width="12%"> ������ʼʱ��</th>
    <th width="13%">����ʱ��</th>
    <th width="18%">�ĵ�˵��</th>
    <th width="8%">��λ����</th>
    <th width="17%">��Ƹ״̬</th>
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
	
	'zkzflag=rs("zkzflag")
'	if zkzflag then
'		zkzflag="<a href='u_zkz.asp?jid="&rs("jid")&"'>׼��֤����</a>"
'	else
'		zkzflag="׼��֤δ����"
'	end if
	
	btime=rs("btime")
	etime=rs("etime")
	endflag=rs("endflag")
	if endflag then
		endflag="<span class='redfont'>�ѽ���</span>"
	else
		endflag="<span class='bluefont'>����������</span>"
		if datediff("s",now,btime)>0 then	endflag="����δ��ʼ"	'msg "������Ƹ������û�п�ʼ!","-1"
		if datediff("s",now,etime)<0 then	endflag="<span class='redfont'>�����ѽ�ֹ</span>"	'msg "������Ƹ�����ѽ���!","-1"
	end if

	
	sql2="select count(gid) from tb_gw where jid="&rs("jid")
	rs2.open sql2,conn,1,1
	jobs=rs2(0)
	rs2.close
  %>
  <tr>
    <td align="center"><%=i%></td>
    <td><a href="u_gw.asp?jid=<%=rs("jid")%>"><%=rs("jname")%></a></td>
    <td align="center"><%=rs("btime")%></td>
    <td align="center"><%=rs("etime")%></td>
    <td align="center"><%=jfile%></td>
    <td align="center"><a href="u_gw.asp?jid=<%=rs("jid")%>"><%=jobs%></a></td>
    <td align="center"><%=endflag%></td>
  </tr>
  <%
  	rs.movenext
	wend
	rs.close
  %>
</table>

</body>
</html>
