<!--#include file="conn.asp"-->
<%chku 2%>
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
@media print { 
.Noprint{display:none;visibility:hidden}
.PageNext{page-break-after: always;}��
}
</style>
<%
jid=request.QueryString("jid")
uid=request.QueryString("uid")
if jid<>"" then
	jid=intsql(jid)
else
	msg "��Ƹ��������","-1"
end if
%>
</head>
<body <%if uid="" then rw "onload=window.print()"%>>
<div class="Noprint">
  <h4><span class="redfont">׼��֤��ӡʱ��ʹ��A4ֽ�ź����ӡ��ȡ��ҳüҳ��</span> ��<a href="javascript:window.print()">��ӡ</a>�� </h4>
</div>
<%
if uid<>"" then	uid=intsql(uid)

set rs=server.CreateObject("adodb.recordset")
set rs2=server.CreateObject("adodb.recordset")

sql="select jname from tb_job where jid="&jid

rs.open sql,conn,1,1
if not rs.eof then
	jtit=rs("jname")
end if
rs.close

'��ȡ������֪����
sql="select * from tb_news where ntype=2"
rs.open sql,conn,1,1
if not rs.eof then
	tit=rs("title")
	content=rs("content")
end if
rs.close

'��ȡAB��λ���Կ�Ŀ
a_kskm=""
sql="select * from tb_gtype where left(tid,1)='a' order by tid"
rs.open sql,conn,1,1
while not rs.eof
	kssj=rs("kssj")
	a_kskm=a_kskm&"<tr><td align='center' bgcolor='#FFFFFF'>"&rs("kskm")&"</td>"
	a_kskm=a_kskm&"<td align='center' bgcolor='#FFFFFF'>"&left(kssj,10)&"</td>"
	a_kskm=a_kskm&"<td align='center' bgcolor='#FFFFFF'>"&mid(kssj,11)&"</td></tr>"
	rs.movenext
wend
rs.close

'��ȡAB��λ���Կ�Ŀ
b_kskm=""
sql="select * from tb_gtype where left(tid,1)='b' order by tid"
rs.open sql,conn,1,1
while not rs.eof
	kssj=rs("kssj")
	b_kskm=b_kskm&"<tr><td align='center' bgcolor='#FFFFFF'>"&rs("kskm")&"</td>"
	b_kskm=b_kskm&"<td align='center' bgcolor='#FFFFFF'>"&left(kssj,10)&"</td>"
	b_kskm=b_kskm&"<td align='center' bgcolor='#FFFFFF'>"&mid(kssj,11)&"</td></tr>"
	rs.movenext
wend
rs.close



if uid<>"" then
	sql_z="select * from tb_exam where uid="&uid
else
	sql_z="select * from tb_exam where uid in(select uid from tb_bm where jid="&jid&" and gzdw="&session("duid")&")"&" order by kh"
end if
set rsz=server.CreateObject("adodb.recordset")
rsz.open sql_z,conn,1,1
while not rsz.eof
	rid=rsz("rid")
	kh=rsz("kh")
	uid=rsz("uid")
	
	sql="select * from tb_user where uid="&uid
	rs.open sql,conn,1,1
	if not rs.eof then
		uname=rs("uname")
		card=rs("card")
		sex=rs("sex")
		mz=rs("mz")
		uphoto=rs("uphoto")
		did=rs("did")
		if uphoto<>"" then uphoto="doc/"&uphoto
	end if
	rs.close

	sql="select dname from tb_duser where uid="&did
	rs.open sql,conn,1,1
	if not rs.eof then
		udw=rs("dname")
	end if
	rs.close

	sql2="select * from tb_room where rid="&rid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		rname=rs2("rname")
		raddr=rs2("raddr")
	end if
	rs2.close

	sql2=""
	sql="select gtype,bm,gwmc from tb_gw where gid=(select gid from tb_bm where jid="&jid&" and uid="&uid&")"
	rs.open sql,conn,1,1
	if not rs.eof then
		gtype=rs("gtype")
		gbm=rs("bm")
		gwmc=rs("gwmc")
	end if
	rs.close
%>
<table width="842" height="595" border="0" align="center" cellpadding="0" cellspacing="0" class="printtable" >
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
		  if lcase(gtype)="a" then
		  	rw a_kskm
		else
			rw b_kskm
		end if
		  %>
        </table></td>
      </tr>
    </table>
	
	<div class="zkzrdb">��λ����<br />
	  <%=year(date())&"��"&month(date())&"��"%></div>
	</td>
    <td valign="top" bgcolor="#FFFFFF"></td>
    <td width="49%" valign="top" bgcolor="#FFFFFF">
	
	<h4 style="margin-top:5px"><%=tit%></h4>
	<div class="newscontent"><%=content%></div>
	</td>
  </tr>
</table>
<%
	rsz.movenext
	if not rsz.eof then rw "<div class='PageNext'></div>"
wend
rsz.close
set rsz=nothing
%>
</body>
</html>
