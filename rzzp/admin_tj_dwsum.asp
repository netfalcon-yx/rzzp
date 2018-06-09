<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>单位合计</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script src="comm.js" language="javascript"></script>
</head>
<%
jid=request.QueryString("jid")
if jid<>"" then
	jid=intsql(jid)
else
	msg "请选择招聘信息！","-1"
end if
set rs=server.CreateObject("adodb.recordset")
set rs2=server.CreateObject("adodb.recordset")
%>
<body>
<div class="unav">当前位置：招聘报名统计【<strong class="redfont">按单位合计统计√</strong>】&nbsp;&nbsp;【<a href="admin_tj_gwsum.asp?jid=<%=jid%>">按岗位合计统计</a>】&nbsp;&nbsp;【<a href="admin_tj_huizong.asp?jid=<%=jid%>">报名汇总统计</a>】&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>> <a href="javascript:void(0)" onclick="getTblData('dwtable')">导出Excel</a>&nbsp;&nbsp; <a href="admin_job_tongji.asp?jid=<%=jid%>">浏览单位报名明细</a></div>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="mytable" id="dwtable">
  <tr>
    <th width="5%">序号</th>
    <th width="30%">单位名称</th>
    <th width="15%">报名人数</th>
    <th width="15%">审核通过人数</th>
    <th>备注</th>
  </tr>
  <%
  i=1
  bmi=0
  bsi=0
  sql="select uid,dname from tb_duser order by uid"
  rs.open sql,conn,1,1
  while not rs.eof
  	sql2="select count(id) from tb_bm where jid="&jid&" and gzdw="&rs("uid")
	rs2.open sql2,conn,1,1
	bmrs=rs2(0)
	rs2.close
	bmi=bmi+bmrs
	
	sql2="select count(id) from tb_bm where jid="&jid&" and gzdw="&rs("uid")&" and hg1=true and hg2=true"
	rs2.open sql2,conn,1,1
	bsrs=rs2(0)
	rs2.close
	bsi=bsi+bsrs
	
  %>
  <tr>
    <td align="center"><%=i%></td>
    <td><%=rs("dname")%></td>
    <td align="center"><a href="admin_job_tongji.asp?jid=<%=jid%>&dwid=<%=rs("uid")%>&hgflag=0"><%=bmrs%></a></td>
    <td align="center"><a href="admin_job_tongji.asp?jid=<%=jid%>&dwid=<%=rs("uid")%>"><%=bsrs%></a></td>
    <td>&nbsp;</td>
  </tr>
 
  <%
  	i=i+1
  	rs.movenext
wend
rs.close
set rs=nothing
  %>
   <tr>
    <td align="center">&nbsp;</td>
    <td>合计：</td>
    <td align="center"><%=bmi%></td>
    <td align="center"><%=bsi%></td>
    <td>&nbsp;</td>
  </tr>
</table>

</body>
</html>
