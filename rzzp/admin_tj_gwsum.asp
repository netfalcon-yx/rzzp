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
<div class="unav">��ǰλ�ã���Ƹ����ͳ�ơ�<a href="admin_tj_dwsum.asp?jid=<%=jid%>">����λ�ϼ�ͳ��</a>��&nbsp;&nbsp;��<strong class="redfont">����λ�ϼ�ͳ�ơ�</strong>��&nbsp;&nbsp;��<a href="admin_tj_huizong.asp?jid=<%=jid%>">��������ͳ��</a>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>> <a href="javascript:void(0)" onclick="getTblData('gwtable')">����Excel</a>&nbsp;&nbsp; <a href="admin_gw_tongji.asp?jid=<%=jid%>">�����λ������ϸ</a></div>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="mytable" id="gwtable">
  <tr>
    <th width="5%">���</th>
    <th width="18%">��λ����</th>
    <th>��Ƹ��λ</th>
    <th width="15%">���Ż���</th>
    <th width="8%">�ƻ�����</th>
    <th width="8%">��������</th>
    <th width="10%">���ͨ������</th>
    <th width="6%">��������</th>
    <th width="7%">����(����)</th>
    <th width="7%">����(���)</th>
  </tr>
  <%
  i=1
  bmi=0
  bsi=0
  msi=0
  khi=0
  sql="select * from tb_gw where jid="&jid&" order by gid"
  rs.open sql,conn,1,1
  while not rs.eof
  	jhrs=rs("jhrs")
	if jhrs=1 then
		kkrs=5
	else
		kkrs=jhrs*3
	end if
	
	sql2="select count(id) from tb_bm where jid="&jid&" and gid="&rs("gid")
	rs2.open sql2,conn,1,1
	bmrs=rs2(0)
	rs2.close
	bmi=bmi+bmrs
	
	sql2="select count(id) from tb_bm where jid="&jid&" and gid="&rs("gid")&" and hg1=true and hg2=true"
	rs2.open sql2,conn,1,1
	bsrs=rs2(0)
	rs2.close
	bsi=bsi+bsrs
	
	bmkkflag=""
	if bmrs>=kkrs then
		bmkkflag="<span class='bluefont'>��</span>"
	else
		bmkkflag="<span class='redfont'>��</span>"
	end if
	
	shkkflag=""
	if bsrs>=kkrs then
		shkkflag="<span class='bluefont'>��</span>"
	else
		shkkflag="<span class='redfont'>��</span>"
	end if
	
	
  %>
  <tr>
    <td align="center"><%=rs("gid")%></td>
    <td><%=rs("gwmc")%></td>
    <td align="center"><%=rs("zpdw")%></td>
    <td align="center"><%=rs("bm")%></td>
    <td align="center"><%=rs("jhrs")%></td>
    <td align="center"><a href="admin_gw_tongji.asp?jid=<%=jid%>&gwid=<%=rs("gid")%>&hgflag=0"><%=bmrs%></a></td>
    <td align="center"><a href="admin_gw_tongji.asp?jid=<%=jid%>&gwid=<%=rs("gid")%>"><%=bsrs%></a></td>
    <td align="center"><%=kkrs%></td>
    <td align="center"><%=bmkkflag%></td>
    <td align="center"><%=shkkflag%></td>
  </tr>
  
  <%
  	i=i+1
  	rs.movenext
wend
rs.close
set rs=nothing
  %>
  <tr>
   <td align="center">&nbsp;</td>
    <td colspan="4">�ϼƣ�</td>
    <td align="center"><%=bmi%></td>
    <td align="center"><%=bsi%></td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
  </tr>
</table>
<script language="javascript">

</script>
</body>
</html>
