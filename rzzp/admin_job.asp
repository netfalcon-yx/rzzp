<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��Ƹ��Ϣ</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="lhgdialog/lhgcore.min.js"></script> 
<script type="text/javascript" src="lhgdialog/lhgdialog.min.js"></script>
</head>

<body>
<div class="unav">��ǰλ�ã���Ƹ��Ϣ���� ��<a href="javascript:openwin('')">��������</a>�� </div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable">
  <tr>
    <th width="5%">���</th>
    <th width="25%">����</th>
    <th width="10%">��ʼʱ��</th>
    <th width="10%">����ʱ��</th>
    <th width="20%">�ĵ�˵��</th>
    <th width="10%">��λ����</th>
    <th width="20%">��λ�༭</th>
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
	jsta=rs("jobtype")
	
	sql2="select count(gid) from tb_gw where jid="&rs("jid")
	rs2.open sql2,conn,1,1
	jobs=rs2(0)
	rs2.close
  %>
  <tr>
    <td align="center"><%=i%></td>
    <td><a href="admin_gw.asp?jid=<%=rs("jid")%>"><%=rs("jname")%></a><%if jsta=8 then rw "(δ����)"%></td>
    <td align="center"><%=rs("btime")%></td>
    <td align="center"><%=rs("etime")%></td>
    <td align="center"><%=jfile%></td>
    <td align="center"><%=jobs%></td>
    <td align="center"><a href="admin_job_del.asp?jid=<%=rs("jid")%>" onClick="{if(confirm('���棺ɾ������Ƹ��Ϣͬʱ��ɾ������Ƹ�����и�λ�����������ԣ�ȷ��Ҫɾ����?')){return true;}return false;}">ɾ��</a> <a href="javascript:openwin('<%=rs("jid")%>')">�༭</a> <a href="admin_gw.asp?jid=<%=rs("jid")%>">��λ����</a></td>
  </tr>
  <%
  	i=i+1
  	rs.movenext
	wend
	rs.close
  %>
 
</table>
<script language="javascript">
function openwin(jid)
{
	temppage="admin_jobadd.asp?jid="+jid;
	temptit="��Ƹ��Ϣ�༭";
	var dlg = new J.dialog({ title:temptit,rang:true,page:temppage,cover:true,btns: false, autoSize:true,maxBtn:false,btnBar:false,bgcolor:'#000',iconTitle:false}); 
	dlg.ShowDialog();
}
</script>
</body>
</html>
