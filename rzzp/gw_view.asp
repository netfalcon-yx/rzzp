<!--#include file="conn.asp"-->
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
		dw=rs("zpdw")
		bm=rs("bm")
		jhrs=rs("jhrs")
		gtype=rs("gtype")
		gwtj=rs("gwtj")
		gwzz=rs("gwcontent")
		bz=rs("bz")
		gj=rs("gwjb")
	end if
	rs.close
end if
%>
<body>
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:600px;">
    <tr>
      <td width="20%" align="right">岗位名称：</td>
      <td><strong><%=gwmc%></strong></td>
    </tr>
    <tr>
      <td align="right">招聘单位：</td>
      <td><%=dw%></td>
    </tr>
    <tr>
      <td align="right">部门机构：</td>
      <td><%=bm%></td>
    </tr>
    <tr>
      <td align="right">岗位类型：</td>
      <td><%=ucase(gtype)%></td>
    </tr>
    
    <tr>
      <td align="right">计划人数：</td>
      <td><%=jhrs%></td>
    </tr>
    <tr>
      <td align="right">上岗条件：</td>
      <td><%=replace(replace(gwtj,chr(10),"<br>"),chr(13),"<br>")%></td>
    </tr>
    <tr>
      <td align="right">岗位职责：</td>
      <td><%=replace(replace(gwzz,chr(10),"<br>"),chr(13),"<br>")%></td>
    </tr>
    <tr>
      <td align="right">备注：</td>
      <td><%=bz%></td>
    </tr>
  </table>
</body>
</html>
