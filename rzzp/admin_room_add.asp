<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�������ҹ���</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="chkfm.js"></script>
</head>
<%
rid=request.QueryString("rid")
if rid<>"" then
	rid=intsql(rid)
	sql="select * from tb_room where rid="&rid
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,1,1
	if not rs.eof then
		rname=rs("rname")
		raddr=rs("raddr")
		rmax=rs("rmax")
	end if
	rs.close
end if
%>
<body>
<form id="form1" name="form1" method="post" action="admin_room_save.asp"  onSubmit="return Validator.Validate(this,1)">
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:400px">
    <tr>
      <td width="30%" align="right">�������ƣ�</td>
      <td><label>
        <input name="rname" type="text" id="rname" size="40" dataType="Require" msg="�����뿼�����ƣ�" value="<%=rname%>" />
        <span class="redfont">*</span></label></td>
    </tr>
    <tr>
      <td align="right">��ϸ��ַ��</td>
      <td><label>
        <input name="raddr" type="text" id="raddr" size="40" dataType="Require" msg="�����뿼����ַ��"value="<%=raddr%>"  />
        <span class="redfont">*</span></label></td>
    </tr>
    <tr>
      <td align="right">����������</td>
      <td><label>
        <input name="rmax" type="text" id="rmax" size="10" require="true" dataType="Integer" msg="����ȷ�����������������"  value="<%=rmax%>" />
        <span class="redfont">*</span></label></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input name="Submit" type="submit" class="but2" value="�� ��" />
        <input name="hdrid" type="hidden" id="hdrid" value="<%=rid%>" />
      </label></td>
    </tr>
  </table>
</form>
</body>
</html>
