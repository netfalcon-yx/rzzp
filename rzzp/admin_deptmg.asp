<!--#Include File="conn.Asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���㵥λ����</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="comm.js"></script>
<script type="text/javascript" src="lhgdialog/lhgcore.min.js"></script> 
<script type="text/javascript" src="lhgdialog/lhgdialog.min.js"></script>
</head>
<%
set rs=server.CreateObject("adodb.recordset")
did=request.Form("hd_deptid")
dname=request.Form("dept")
if dname<>"" then
	if did<>"" then
		sql="select * from tb_duser where uid="&did
		rs.open sql,conn,1,3
	else
		sql="select * from tb_duser where uid=0"
		rs.open sql,conn,1,3
		rs.addnew
		rs("psw")=inipsw
	end if
	rs("dname")=dname
	rs.update
	rs.close
	response.Redirect("admin_deptmg.asp")
end if
%>
<body>
<div class="unav">��ǰλ�ã����㵥λ������ʼ�����룺123456��</div>
<form id="form1" name="form1" method="post" action="admin_deptmg.asp">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" id="tbdept">
    <tr>
      <th width="5%">���</th>
      <th>���㵥λ����</th>      
      <th width="8%">����</th>
      <th width="10%">��λ</th>
      <th width="10%">�칫�绰</th>
      <th width="12%">�ֻ�</th>
      <th width="15%">����</th>
	  <th width="10%">��ʼ������</th>
      <th width="10%">�༭</th>
    </tr>
	<%
	sql="select * from tb_duser"
	rs.open sql,conn,1,1
	i=1
	while not rs.eof
	%>
    <tr>
      <td align="center"><%=i%></td>
      <td><%if rs("psw")=inipsw then rw "<span class='redfont'>*</span>"%><%=rs("dname")%></td>
      <td align="center"><%=rs("duname")%></td>
      <td align="center"><%=rs("gw")%></td>
      <td align="center"><%=rs("tel")%></td>
      <td align="center"><%=rs("mb")%></td>
      <td align="center"><%=rs("email")%></td>
	  <td align="center"><a href="javascript:void(0)" onclick="{if(confirm('��ʾ��ȷ��Ҫ��ʼ�����û�������?')){openwin2('<%=rs("uid")%>',2)}return false;}">��ʼ��</a></td>
      <td align="center"><a href="javascript:setmdf(<%=rs("uid")%>,'<%=rs("dname")%>')" title="�༭���㵥λ����">�༭</a> <a href="admin_unit_del.asp?did=<%=rs("uid")%>" onClick="{if(confirm('���棺ȷ��ɾ������������?')){return true;}return false;}">ɾ��</a></td>
    </tr>
	<%
		i=i+1
		rs.movenext
	wend
	rs.close
	%>
    <tr id="currow" style="display:none">
      <td colspan="9">
        ���㵥λ���ƣ�
          <input name="dept" type="text" id="dept" size="50" />
        <input name="save" type="submit" class="but2" id="save" value="�� ��" />
        <input name="hd_deptid" type="hidden" id="hd_deptid" />
      &nbsp;
      <input name="nodo" type="button" class="but1" id="nodo" value="ȡ��" onclick="$('currow').style.display='none';document.form1.reset();" />      </td>
    </tr>
    <tr>
      <td colspan="9" align="center"><input name="addnew" type="button" class="but1" id="addnew" value="�� ��" onclick="$('currow').style.display=''" /></td>
    </tr>
  </table>
</form>
<script language="javascript">
showtable("tbdept");
document.form1.reset();
function setmdf(did,dname)
{
	$("hd_deptid").value=did;
	$("dept").value=dname;
	$('currow').style.display='';
	$("dept").focus();
}
function openwin2(uid,utype)
{
	temppage="admin_inipsw.asp?uid="+uid+"&utype="+utype;
	temptit="��ʼ������";
	//temppage="admin_t_test.asp?tid="+tid;
	var dlg = new J.dialog({ title:temptit,rang:true,page:temppage,autoSize:true,cover:true,btns: false,maxBtn:false,btnBar:false,bgcolor:'#000',iconTitle:false}); 
	dlg.ShowDialog();
}
</script>
</body>
</html>
