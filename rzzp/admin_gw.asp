<!--#include file="conn.asp"-->
<%chku 9%>
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
set rs2=server.CreateObject("adodb.recordset")
jid=request.QueryString("jid")
if jid<>"" then
	jid=intsql(jid)
	sql="select jname,endflag from tb_job where jid="&jid
	rs.open sql,conn,1,1
	if not rs.eof then
		jname=rs("jname")
		endflag=rs("endflag")
	end if
	rs.close
else
	msg "��ѡ����Ƹ��Ϣ��","-1"
end if
if endflag then
	tempdel="alert('������Ƹ����ɣ�������ɾ����λ��');return false;"
	tempedit="alert('������Ƹ����ɣ������ٱ༭��λ��');return false;"
else
	tempdel="{if(confirm('���棺ɾ���˸�λͬʱ��ɾ���˸�λ�ı�����������Ϣ��ȷ��Ҫɾ����?')){return true;}return false;}"
	tempedit="{return true;}"
end if
%>
<body>
<div class="unav">��ǰλ�ã�<%=jname%> -> ��λ��� ��<a href="javascript:openwin('<%=jid%>','')">������λ</a>����<a href="admin_gw_in.asp?jid=<%=jid%>">Excel�����λ</a>��</div>
<table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable">
  <tr>
    <th width="5%">���</th>
    <th>��λ����</th>
    <th width="15%">��Ƹ��λ</th>
    <th width="15%">���Ż���</th>
    <th width="8%">��λ����</th>
    <th width="8%">�ƻ�����</th>
    <th width="10%">�������</th>
    <th width="8%">���Է�����</th>
    <th width="10%">�༭</th>
  </tr>
  <%
  sql="select * from tb_gw where jid="&jid&" order by gid"
  rs.open sql,conn,1,1
  i=1
  while not rs.eof
  %>
  <tr>
    <td align="center"><%=rs("gid")%></td>
    <td><a href="javascript:openwin2('<%=jid%>','<%=rs("gid")%>')"><%=rs("gwmc")%></a></td>
    <td align="center"><%=rs("zpdw")%></td>
    <td align="center"><%=rs("bm")%></td>
    <td align="center"><%=UCase(rs("gtype"))%></td>
    <td align="center"><%=rs("jhrs")%></td>
    <td align="center">
	<%
	sql2="select count(id) from tb_bm where jid="&jid&" and gid="&rs("gid")&" and hg1=true and hg2=true"
	rs2.open sql2,conn,1,1
	bsrs=rs2(0)
	rs2.close
	if bsrs>0 then
		rw "<a href='admin_gw_tongji.asp?jid="&jid&"&gwid="&rs("gid")&"'>"&bsrs&"��</a>"
	else
		rw "<span class='redfont'>"&bsrs&"</span>��"
	end if	
	%>	</td>
    <td align="center"><%=rs("rwcj")%></td>
    <td align="center"><a href="javascript:openwin('<%=jid%>','<%=rs("gid")%>')" onclick="<%=tempedit%>">�༭</a> <a href="admin_gw_del.asp?jid=<%=jid%>&gid=<%=rs("gid")%>" onClick="<%=tempdel%>">ɾ��</a></td>
  </tr>
  <%
  		i=i+1
		rs.movenext
	wend
	rs.close
  %>
</table>
<script language="javascript">
function openwin(jid,gid)
{
	temppage="admin_gw_add.asp?jid="+jid+"&gid="+gid;
	temptit="��Ƹ��λ�༭";
	var dlg = new J.dialog({ title:temptit,rang:true,page:temppage,cover:true,btns: false, autoSize:true,maxBtn:false,btnBar:false,bgcolor:'#000',iconTitle:false}); 
	dlg.ShowDialog();
}
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
