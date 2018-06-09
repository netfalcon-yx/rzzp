<!--#include file="conn.asp"-->
<%chku 2%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>单位联系方式管理</title>
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
<div class="unav">当前位置：联系方式管理</div>

<form id="form1" name="form1" method="post" action="d_link_save.asp" onSubmit="return Validator.Validate(this,1)">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:500px">
    <tr>
      <th colspan="2">联系方式设置</th>
    </tr>
    <tr>
      <td width="20%" align="right">姓 名：</td>
      <td><label>
        <input name="duname" type="text" id="duname" value="<%=duname%>" dataType="Require" msg="请输入姓名！"  />
        <span class="redfont">*</span></label></td>
    </tr>
    <tr>
      <td align="right">岗 位：</td>
      <td><label>
        <input name="gw" type="text" id="gw" value="<%=gw%>" dataType="Require" msg="请输入岗位！" />
        <span class="redfont">*</span></label></td>
    </tr>
    <tr>
      <td align="right">办公电话：</td>
      <td><label>
        <input name="tel" type="text" id="tel" value="<%=tel%>"  dataType="Require" msg="请输入办公电话！" />
        <span class="redfont">*</span></label></td>
    </tr>
    <tr>
      <td align="right">手 机：</td>
      <td><label>
        <input name="mb" type="text" id="mb" value="<%=mb%>" dataType="Require" msg="请输入手机号码！" />
        <span class="redfont">*(仅上级人资部门可查看)</span></label></td>
    </tr>
    <tr>
      <td align="right">内网邮箱：</td>
      <td><label>
        <input name="email" type="text" id="email" value="<%=email%>" dataType="Require" msg="请输入电子邮箱！" />
        <span class="redfont">*</span></label></td>
    </tr>
    <tr>
      <td align="right" class="redfont">备注：</td>
      <td>填报人即为你单位此次招聘负责人，请正确填写联系方式，以便上级人资部门及本单位报名考生可以及时与您联系!</td>
    </tr>
    <tr>
      <td align="right">&nbsp;</td>
      <td><label>
        <input name="Submit" type="submit" class="but2" value="保存" />
      </label></td>
    </tr>
  </table>
</form>
</body>
</html>
