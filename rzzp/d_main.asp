<!--#include file="conn.asp"-->
<%chku 2%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�û�����</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div class='unav'>�ҵı�����Ϣ</div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable">
  <tr>
    <th width="5%">���</th>
    <th width="15%">��Ƹ����</th>
    <th width="15%">��λ����</th>
    <th width="12%">����ʱ��</th>
    <th width="8%">��λ���</th>
    <th width="8%">�������</th>
    <th width="12%">���Գɼ�</th>
    <th width="10%">���Գɼ�</th>
    <th width="15%">�༭</th>
  </tr>
  <%
  set rs=server.CreateObject("adodb.recordset")
  set rs2=server.CreateObject("adodb.recordset")
  sql="select * from tb_bm where uid="&session("uid")
  rs.open sql,conn,1,1
  i=1
  while not rs.eof
  	jid=rs("jid")
	gid=rs("gid")
	sql2="select * from tb_job where jid="&jid
	rs2.open sql2,conn,1,1
	jname=rs2("jname")
	btime=rs2("btime")
	etime=rs2("etime")
	rs2.close
	
	sql2="select bm,gwmc from tb_gw where gid="&gid
	rs2.open sql2,conn,1,1
	bm=rs2("bm")
	gwmc=rs2("gwmc")
	rs2.close
	
	tempdel=""
	if rs("hg1") or rs("hg2") then
		tempdel="<a href='javascript:alert(""����˲���ɾ����"")'>ɾ��</a>"
	else
		tempdel="<a href='u_bmdel.asp?id="&rs("id")&"' onclick='{if(confirm(""���棺ȷ��ɾ���ñ�����Ϣ��?"")){return true;}return false;}'>ɾ��</a>"
	end if
  %>
  <tr>
    <td align="center"><%=i%></td>
    <td align="center"><%=jname%></td>
    <td align="center"><%=bm%>:<%=gwmc%></td>
    <td align="center"><%=rs("bmdt")%></td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center"><a href="u_baom.asp?id=<%=rs("id")%>&jid=<%=jid%>&gid=<%=gid%>">�༭</a> <%=tempdel%> ׼��֤</td>
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
