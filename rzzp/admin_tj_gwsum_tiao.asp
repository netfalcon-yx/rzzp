<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��λ�ϼ�</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script src="comm.js" language="javascript"></script>
</head>
<%
jid=request.QueryString("jid")
if jid<>"" then
	jid=intsql(jid)
else
	msg "��ѡ����Ƹ��Ϣ��","-1"
end if
set rs=server.CreateObject("adodb.recordset")
set rs2=server.CreateObject("adodb.recordset")
%>
<body>
<div class="unav">��ǰλ�ã���Ƹ����ͳ��(������)</div>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="mytable" id="gwtable">
  <tr>
    <th width="5%">���</th>
    <th>��λ����</th>
    <th width="10%">��������</th>
    <th width="15%">���ͨ����������</th>
    <th width="10%">����1����</th>
    <th width="10%">����2����</th>
  </tr>
  <%
  i=1
  sql="select * from tb_gw order by gid"
  rs.open sql,conn,1,1
  while not rs.eof
  	sql2="select count(id) from tb_bm where jid="&jid&" and gid="&rs("gid")
	rs2.open sql2,conn,1,1
	bmrs=rs2(0)
	rs2.close
	
	sql2="select count(id) from tb_bm where jid="&jid&" and gid="&rs("gid")&" and hg1=true and hg2=true"
	rs2.open sql2,conn,1,1
	bsrs=rs2(0)
	rs2.close
	
	'����1
	sql2="select count(id) from tb_bm where jid="&jid&" and fgwid="&rs("gid")
	rs2.open sql2,conn,1,1
	tj1rs=rs2(0)
	rs2.close
	
	'����2
	sql2="select count(id) from tb_bm where jid="&jid&" and fgwid2="&rs("gid")
	rs2.open sql2,conn,1,1
	tj2rs=rs2(0)
	rs2.close
	
  %>
  <tr>
    <td align="center"><%=i%></td>
    <td><%=rs("bm")%>:<%=rs("gwmc")%></td>
    <td align="center"><a href="admin_gw_tongji.asp?jid=<%=jid%>&gwid=<%=rs("gid")%>&hgflag=0"><%=bmrs%></a></td>
    <td align="center"><a href="admin_gw_tongji.asp?jid=<%=jid%>&gwid=<%=rs("gid")%>"><%=bsrs%></a></td>
    <td align="center"><a href="admin_gw_tongji_tiao.asp?jid=<%=jid%>&gwid=<%=rs("gid")%>&tjflag=1"><%=tj1rs%></a></td>
    <td align="center"><a href="admin_gw_tongji_tiao.asp?jid=<%=jid%>&gwid=<%=rs("gid")%>&tjflag=2"><%=tj2rs%></a></td>
  </tr>
  <%
  	i=i+1
  	rs.movenext
wend
rs.close
set rs=nothing
  %>
</table>
<script language="javascript">

</script>
</body>
</html>
