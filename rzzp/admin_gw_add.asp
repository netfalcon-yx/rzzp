<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>岗位浏览</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="chkfm.js"></script>
</head>
<%
jid=request.QueryString("jid")
gid=request.QueryString("gid")
if gid<>"" then
	gid=intsql(gid)
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from tb_gw where jid="&jid&" and gid="&gid
	rs.open sql,conn,1,1
	if not rs.eof then
		gwmc=rs("gwmc")
		bm=rs("bm")
		dw=rs("zpdw")
		gj=rs("gwjb")
		jhrs=rs("jhrs")
		gtype=lcase(rs("gtype"))
		gwtj=rs("gwtj")
		gwzz=rs("gwcontent")
		bz=rs("bz")
		kslx=ucase(rs("kslx"))
		rwcj=rs("rwcj")
	end if
	rs.close
end if
%>
<body>
<form id="form1" name="form1" method="post" action="admin_gw_save.asp?jid=<%=jid%>" onSubmit="return Validator.Validate(this,1)">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:500px;">
    <tr>
      <td width="20%" align="right">岗位名称：</td>
      <td><label>
        <input name="gwmc" type="text" id="gwmc" dataType="Require" msg="请输入岗位名称！" value="<%=gwmc%>" />
        <span class="redfont">*</span></label></td>
    </tr>
    <tr>
      <td align="right">招聘单位：</td>
      <td><input name="zpdw" type="text" id="zpdw" dataType="Require" msg="请输入招聘单位！" value="<%=dw%>" />
      <span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right">部门机构：</td>
      <td><label>
          <input name="bm" type="text" id="bm" value="<%=bm%>" dataType="Require" msg="请输入部门机构！" />
        <span class="redfont">*</span></label></td>
    </tr>
    <tr>
      <td align="right">岗位类型：</td>
      <td><input type="text" name="gtype" id="gtype" value="<%=gtype%>" dataType="Require" msg="请选择岗位类型！"  />
        <span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right">标准岗级：</td>
      <td><input type="text" name="gj" id="gj" value="<%=gj%>" /></td>
    </tr>
    <tr>
      <td align="right">计划人数：</td>
      <td><label>
        <input name="jhrs" type="text" id="jhrs" size="10" require="true" dataType="Integer" msg="请输入正确计划人数！" value="<%=jhrs%>" />
        <span class="redfont">*</span></label></td>
    </tr>
    <tr>
      <td align="right">上岗条件：</td>
      <td><label>
        <textarea name="sgtj" cols="50" rows="6" id="sgtj"><%=gwtj%></textarea>
      </label></td>
    </tr>
    <tr>
      <td align="right">岗位职责：</td>
      <td><label>
        <textarea name="gwzz" cols="50" rows="6" id="gwzz"><%=gwzz%></textarea>
      </label></td>
    </tr>
    <tr>
      <td align="right">岗位备注：</td>
      <td><label>
        <input name="bz" type="text" id="bz" size="60" value="<%=bz%>" />
      </label></td>
    </tr>
    <tr>
      <td align="right">考试类别：</td>
      <td><input name="kslx" type="text" id="kslx" value="<%=kslx%>" size="8" maxlength="4" /></td>
    </tr>
    <tr>
      <td align="right">入围分数线：</td>
      <td><input name="rwcj" type="text" id="rwcj" value="<%=rwcj%>" size="8" maxlength="6" />
        (考生笔试成绩出来后设置)</td>
    </tr>
    <tr>
      <td align="right">&nbsp;</td>
      <td><label>
        <input name="gwbut" type="submit" class="but2" id="gwbut" value="保 存" />
        <input name="hdgid" type="hidden" id="hdgid" value="<%=gid%>" />
      </label></td>
    </tr>
  </table>
</form>
</body>
</html>
