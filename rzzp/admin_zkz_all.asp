<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>׼��֤��ӡ</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<style>
body{margin-top:35px;}
.zkzrdb{width:240px;height:80px;margin-left:200px;margin-top:60px;text-align:center;line-height:40px;}
.printtable{BORDER-COLLAPSE: collapse;}
.printtable TBODY TR TD{BORDER:#000000 1px solid;height:25px;}
.prtable2 TBODY TR TD{border:none}
</style>
<style media="print" type="text/css">����
.Noprint{display:none;}
.PageNext{page-break-after: always;}����
</style>
</head>
<%
jid=request.QueryString("jid")
rid=request.QueryString("rid")
if jid<>"" then
	jid=intsql(jid)
else
	msg "��Ƹ��������","-1"
end if

set rs=server.CreateObject("adodb.recordset")
set rs2=server.CreateObject("adodb.recordset")
set rsall=server.CreateObject("adodb.recordset")

sql="select zkzflag,jname from tb_job where jid="&jid

rs.open sql,conn,1,1
if not rs.eof then
	jtit=rs("jname")
	zkzflag=rs("zkzflag")
end if
rs.close

if zkzflag<>true then
	msg "׼��֤��ӡ�����û�п��ţ�","-1"
end if

if rid<>"" then
	rid=intsql(rid)
else
	msg "Ϊ����������������ѡ�񿼳���ӡ��","-1"
end if



sql2="select * from tb_room where rid="&rid
rs2.open sql2,conn,1,1
if not rs2.eof then
	rname=rs2("rname")
	raddr=rs2("raddr")
end if
rs2.close

sql="select * from tb_news where ntype=2"
rs.open sql,conn,1,1
if not rs.eof then
	newstit=rs("title")
	newscontent=rs("content")
end if
rs.close

%>
<body onload="window.print()">
<div class="Noprint">
  <h4><span class="redfont">׼��֤��ӡʱ��ʹ��A4ֽ�ź����ӡ</span> ��<a href="javascript:window.print()">��ӡ</a>�� </h4>
</div>
<%
sql_all="select * from tb_exam where jid="&jid&" and rid="&rid

rsall.open sql_all,conn,1,1
while not rsall.eof
	uid=rsall("uid")
	kh=rsall("kh")
	
	sql="select * from tb_user where uid="&uid
	rs.open sql,conn,1,1
	if not rs.eof then
		uname=rs("uname")
		card=rs("card")
		sex=rs("sex")
		mz=rs("mz")
		uphoto=rs("uphoto")
		if uphoto<>"" then uphoto="doc/"&uphoto
	end if
	rs.close
	
	sql="select dname from tb_duser where uid=(select gzdw from tb_bm where uid="&uid&" and jid="&jid&")"
	rs.open sql,conn,1,1
	if not rs.eof then
		udw=rs("dname")
	end if
	rs.close
	
	sql2=""
	sql="select gtype,bm,gwmc from tb_gw where gid=(select gid from tb_bm where jid="&jid&" and uid="&uid&")"
	rs.open sql,conn,1,1
	if not rs.eof then
		gtype=rs("gtype")
		gbm=rs("bm")
		gwmc=rs("gwmc")
		
		if gtype="a" then
			sql2="select * from tb_gtype where left(tid,1)='"&gtype&"' order by tid"
		elseif gtype="b" then
			sql2="select * from tb_gtype where left(tid,1)='"&gtype&"' order by tid"
		end if
	end if
	rs.close
%>
<table width="842" height="595" border="0" align="center" cellpadding="0" cellspacing="0" class="printtable" style="margin-top:90px">
  <tr>
    <td width="48%" valign="top" bgcolor="#FFFFFF">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="printtable" style="line-height:30px;">
      <tr>
        <td colspan="3" align="center" bgcolor="#FFFFFF"><h4><%=jtit%>׼��֤</h4></td>
        </tr>
      <tr>
        <td width="20%" align="center" bgcolor="#FFFFFF">�� &nbsp;&nbsp;&nbsp;��</td>
        <td width="48%" align="center" bgcolor="#FFFFFF"><%=uname%></td>
        <td width="32%" rowspan="5" align="center" bgcolor="#FFFFFF"><img src="<%=uphoto%>" width="110" height="140" /></td>
      </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">���֤��</td>
        <td align="center" bgcolor="#FFFFFF"><%=card%></td>
        </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">׼��֤��</td>
        <td align="center" bgcolor="#FFFFFF"><%=kh%></td>
        </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
        <td align="center" bgcolor="#FFFFFF"><%=sex%></td>
        </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
        <td align="center" bgcolor="#FFFFFF"><%=mz%></td>
        </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">������λ</td>
        <td colspan="2" align="center" bgcolor="#FFFFFF"><%=gbm&"��"&gwmc%></td>
      </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">������λ</td>
        <td colspan="2" align="center" bgcolor="#FFFFFF"><%=udw%></td>
        </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">��&nbsp;��&nbsp;��</td>
        <td colspan="2" align="center" bgcolor="#FFFFFF"><%=rname%></td>
        </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">������ַ</td>
        <td colspan="2" align="center" bgcolor="#FFFFFF"><%=raddr%></td>
      </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">���Կ�Ŀ<br />
          ����ʱ��<br /></td>
        <td colspan="2" align="center" bgcolor="#FFFFFF">
		
		<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="prtable2" style="line-height:25px;margin:5px auto;">
          <tr>
            <td align="center" bgcolor="#FFFFFF">���Կ�Ŀ</td>
            <td align="center" bgcolor="#FFFFFF">��������</td>
            <td align="center" bgcolor="#FFFFFF">����ʱ��</td>
          </tr>
		  <%
		if sql2<>"" then
			rs2.open sql2,conn,1,1
			while not rs2.eof
			kssj=rs2("kssj")
		%>
          <tr>
            <td align="center" bgcolor="#FFFFFF"><%=rs2("kskm")%></td>
            <td align="center" bgcolor="#FFFFFF"><%=left(kssj,10)%></td>
            <td align="center" bgcolor="#FFFFFF"><%=mid(kssj,11)%></td>
          </tr>
		  <%
		  	rs2.movenext
			wend
			rs2.close
		end if
		  %>
        </table></td>
      </tr>
    </table>
	
	<div class="zkzrdb">����ʡ������˾������Դ����<br />
	  <%=year(date())&"��"&month(date())&"��"%></div>
	</td>
    <td valign="top" bgcolor="#FFFFFF"></td>
    <td width="49%" valign="top" bgcolor="#FFFFFF">
	<h4 style="margin-top:5px"><%=newstit%></h4>
	<div class="newscontent"><%=newscontent%></div>
	</td>
  </tr>
</table>
<div class="PageNext"></div>
<%
	rsall.movenext
wend
rsall.close
%>
</body>
</html>
