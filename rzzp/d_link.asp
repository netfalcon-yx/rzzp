<!--#include file="conn.asp"-->
<%chku 2%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��λ��ϵ��ʽ����</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="comm.js"></script>
<script language="javascript" src="chkfm.js"></script>
</head>
<%
sql="select * from tb_duser where uid="&session("duid")
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
duname=rs("duname")
gw=rs("gw")
tel=rs("tel")
mb=rs("mb")
email=rs("email")
rs.close
%>
<body>
<div class="unav">��ǰλ�ã���ϵ��ʽ����</div>

<form id="form1" name="form1" method="post" action="d_link_save.asp" onSubmit="return Validator.Validate(this,1)">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:500px">
    <tr>
      <th colspan="2">��ϵ��ʽ����</th>
    </tr>
    <tr>
      <td width="20%" align="right">�� ����</td>
      <td><label>
        <input name="duname" type="text" id="duname" value="<%=duname%>" dataType="Require" msg="������������"  />
        <span class="redfont">*</span></label></td>
    </tr>
    <tr>
      <td align="right">�� λ��</td>
      <td><label>
        <input name="gw" type="text" id="gw" value="<%=gw%>" dataType="Require" msg="�������λ��" />
        <span class="redfont">*</span></label></td>
    </tr>
    <tr>
      <td align="right">�칫�绰��</td>
      <td><label>
        <input name="tel" type="text" id="tel" value="<%=tel%>"  dataType="Require" msg="������칫�绰��" />
        <span class="redfont">*</span></label></td>
    </tr>
    <tr>
      <td align="right">�� ����</td>
      <td><label>
        <input name="mb" type="text" id="mb" value="<%=mb%>" dataType="Require" msg="�������ֻ����룡" />
        <span class="redfont">*(���ϼ����ʲ��ſɲ鿴)</span></label></td>
    </tr>
    <tr>
      <td align="right">�������䣺</td>
      <td><label>
        <input name="email" type="text" id="email" value="<%=email%>" dataType="Require" msg="������������䣡" />
        <span class="redfont">*</span></label></td>
    </tr>
    <tr>
      <td align="right" class="redfont">��ע��</td>
      <td>��˼�Ϊ�㵥λ�˴���Ƹ�����ˣ�����ȷ��д��ϵ��ʽ���Ա��ϼ����ʲ��ż�����λ�����������Լ�ʱ������ϵ!</td>
    </tr>
    <tr>
      <td align="right">&nbsp;</td>
      <td><label>
        <input name="Submit" type="submit" class="but2" value="����" />
      </label></td>
    </tr>
  </table>
</form>
</body>
</html>
