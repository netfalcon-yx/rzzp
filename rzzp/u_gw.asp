<!--#include file="conn.asp"-->
<%chku 1%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��Ƹ��λ</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="lhgdialog/lhgcore.min.js"></script> 
<script type="text/javascript" src="lhgdialog/lhgdialog.min.js"></script>
</head>
<%
set rs=server.CreateObject("adodb.recordset")
sql="select top 1 * from tb_job order by jid desc"
rs.open sql,conn,1,1
if not rs.eof then
	jid=rs("jid")
	jname=rs("jname")
	btime=rs("btime")
	etime=rs("etime")
	endflag=rs("endflag")
	if endflag then
		endflag="<span class='redfont'>������Ƹ�ѽ���</span>"
	else
		endflag="<span class='bluefont'>����������</span>"
		if datediff("s",now,btime)>0 then	endflag="������û��ʼ"
		if datediff("s",now,etime)<0 then	endflag="<span class='redfont'>�����ѽ�ֹ</span>"
	end if
end if
rs.close
'response.End()
ubmchk=false
sql="select gid from tb_bm where jid="&jid&" and uid="&session("uid")
rs.open sql,conn,1,1
if not rs.eof then
	bmgid=rs(0)
	if rs("hg1") or rs("hg2") then ubmchk=true
	tempbm="<a href=""javascript:alert('һ��ֻ�ܱ���һ����λ!');location.href='u_bminfo.asp';"">����</a>"
else
	tempbm=""
end if
rs.close
%>
<body>
<div class="unav">������ֹʱ�䣺<%=btime%>��<%=etime%>��<%=endflag%></div>
<table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable">
  <tr>
    <th width="10%">���</th>
    <th>��λ����</th>
    <th width="25%">��Ƹ��λ</th>
    <th width="18%">��������</th>
    <th width="12%">�ƻ�����</th>
    <th width="10%">��λ����</th>
  </tr>
  <%
  'sql="select * from tb_gw where jid="&jid&" and gid in(7,8,9) order by gid"
  sql="select * from tb_gw where jid="&jid&" order by gid"
  rs.open sql,conn,1,1
  i=1
  while not rs.eof
  	tempbm2=""
  	if bmgid=rs("gid") then
		tempbm2="<span class='redfont'>���ѱ�</span>"
		'a="<a href='?jid="&jid&"&udo=d' onclick='return confirm(""�Ƿ�Ҫɾ����ı���?\n\nɾ���󲻿ɻָ���ֻ�����±�����"");'>��ɾ��</a>"
	elseif tempbm<>"" then
		tempbm2=tempbm
	else
		tempbm2="<a href='u_baom.asp?jid="&jid&"&gid="&rs("gid")&"'>����</a>"
	end if
  %>
  <tr>
    <td align="center"><%=rs("gid")%></td>
    <td><a href="javascript:openwin2('<%=jid%>','<%=rs("gid")%>')"><%=rs("gwmc")%></a></td>
    <td align="center"><%=rs("zpdw")%></td>
    <td align="center"><%=rs("bm")%></td>
    <td align="center"><%=rs("jhrs")%></td>
    <td align="center"><%=tempbm2%></td>
  </tr>
  <%
  		i=i+1
		rs.movenext
	wend
	rs.close
  %>
</table>
<script language="javascript">
function openwin2(jid,gid)
{
	temppage="gw_view.asp?jid="+jid+"&gid="+gid;
	temptit="��Ƹ��λ���";
	var dlg = new J.dialog({ title:temptit,rang:true,page:temppage,cover:true,btns: false, autoSize:true,maxBtn:false,btnBar:false,bgcolor:'#000',iconTitle:false}); 
	dlg.ShowDialog();
}
</script>
</body>
</html>
