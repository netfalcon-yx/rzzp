<!--#include file="conn.asp"-->
<%chku 0%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>密码修改</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="chkfm.js"></script>
</head>

<body>
<form id="form1" name="form1" method="post" action="u_savepsw.asp" onSubmit="return Validator.Validate(this)">
<table  border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:500px;padding-left:5px;margin-top:10px">
  <tr>
    <th height="35" colspan="2" align="center" class="qtx">密 码 修 改</td>
    </tr>
  <tr>
    <td width="25%" height="35" align="right" bgcolor="#F7F7FF">请输入原密码：</td>
    <td width="75%" bgcolor="#FFFFFF"><label>
      <input name="oldpsw" type="password" id="oldpsw" datatype="Require" msg="请输入原密码！" />
      <span class="errtxt">*</span></label></td>
  </tr>
  <tr>
    <td height="35" align="right" bgcolor="#F7F7FF">请输入新密码：</td>
    <td bgcolor="#FFFFFF"><label>
      <input name="psw1" type="password" id="psw1" datatype="Require" msg="请输入新密码！" />
      <span class="errtxt">*</span></label></td>
  </tr>
  <tr>
    <td height="35" align="right" bgcolor="#F7F7FF">请确认新密码：</td>
    <td bgcolor="#FFFFFF"><label>
      <input name="psw2" type="password" id="psw2" datatype="Repeat" to="psw1"  msg="两次密码不一致！"/>
      <span class="errtxt">*</span></label></td>
  </tr>
  <tr>
    <td height="35" align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF"><label>
      <input name="Submit" type="submit" class="but2" value="提交" />
    </label></td>
  </tr>
</table>
</form>
</body>
</html>
