<!--#include file="conn.asp"-->
<%chku 2%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����ͳ��</title>

<style>
.printtable{BORDER-COLLAPSE: collapse;}
.printtable th{border-bottom:1px solid #000000;height:30px;line-height:30px;text-align:center;font-size:14px}
.printtable TBODY TR TD
{
 BORDER:#000000 1px solid;padding-left:5px;height:25px;text-align:center;
}
.text {mso-number-format:\@; }
</style>
<style media="print" type="text/css">����
.Noprint{display:none;}����
</style>
<%
Response.AddHeader "Content-Disposition", "attachment;filename=student_yue.xls" 
Response.ContentType = "application/vnd.ms-excel"
%>
</head>
<%
jid=request.QueryString("jid")
if jid<>"" then
	jid=intsql(jid)
else
	msg "��ѡ����Ƹ��Ϣ��","-1"
end if
%>
<body>
<div class="Noprint"><h3 style="text-align:center">��ʹ�ú����ӡ ����ӡ��</h3></div>
<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#333333" class="printtable">
  <tr>
    <th bgcolor="#CCCCCC">���</th>
    <th bgcolor="#CCCCCC">������λ</th>
    <th bgcolor="#CCCCCC">����</th>
    <th bgcolor="#CCCCCC">�Ա�</th>
    <th bgcolor="#CCCCCC">����</th>
    <th bgcolor="#CCCCCC">��������</th>
    <th bgcolor="#CCCCCC">�μӹ���ʱ��</th>
    <th bgcolor="#CCCCCC">������ò</th>
    <th bgcolor="#CCCCCC">ְ��</th>
    <th bgcolor="#CCCCCC">ȫ����ѧ��</th>
    <th bgcolor="#CCCCCC">�����ѧ��</th>
    <th bgcolor="#CCCCCC">ѧУ��רҵ</th>
    <th bgcolor="#CCCCCC">�ֹ�����λ</th>
    <th bgcolor="#CCCCCC">�ִ���רҵ</th>
    <th bgcolor="#CCCCCC">רҵ����</th>
    <th bgcolor="#CCCCCC">ӦƸ��λ</th>
    <th bgcolor="#CCCCCC">������</th>
    <th bgcolor="#CCCCCC">������</th>
  </tr>
  <%
  set rs=server.CreateObject("adodb.recordset")
  set rs2=server.CreateObject("adodb.recordset")
  sql="select * from tb_bm where jid="&jid&" and gzdw="&session("duid")&" order by gid,id"
  rs.open sql,conn,1,1
  i=1
  while not rs.eof
  	uid=rs("uid")
	gid=rs("gid")
	xl=rs("xl")
	xl2=rs("xl2")
	xw=rs("xw")
	byyx=rs("byyx")
	yxmc=rs("yxmc")
	zy=rs("zy")
	bysj=rs("bysj")
	gzdw=rs("gzdw")
	zyzgz=rs("zyzgz")
	gzzw=rs("gzzw")
	gzsj=rs("gzsj")
	zyjszw=rs("zyjszw")
	qdsj=rs("qdsj")
	
	xcszy=rs("xcszy")
	zynx=rs("zynx")
	
	zzmm=rs("zzmm")
	zzsj=rs("zzsj")
	xxjl=rs("xxjl")
	gzjl=rs("gzjl")
	jcqk=rs("jcqk")
	jtcy=rs("jtcy")
	bz=rs("bz")
	fgwid=rs("fgwid")
	hg1=rs("hg1")
	hg1bz=rs("hg1bz")
	
	hg2=rs("hg2")
	hg2bz=rs("hg2bz")
	
	if hg1 then
		hg1="��"
	else
		hg1=hg1bz
	end if
	
	if hg2 then
		hg2="��"
	else
		hg2=hg2bz
	end if
	
	sql2="select dname from tb_duser where uid="&gzdw
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		gzdw=rs2(0)
	end if
	rs2.close
	
	sql2="select bm,gwmc from tb_gw where gid="&gid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		bm=rs2("bm")&":"
		gwmc=rs2("gwmc")
	end if
	rs2.close
	
	sql2="select * from tb_user where uid="&uid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		uname=rs2("uname")
		birthday=rs2("birthday")
		sex=rs2("sex")
		mz=rs2("mz")
		birthday=rs2("birthday")
		jg=rs2("jg")
		hj=rs2("hj")
		st=rs2("st")
	end if
	rs2.close
  %>
  <tr>
    <td bgcolor="#FFFFFF"><%=i%></td>
    <td bgcolor="#FFFFFF"><%=gzdw%></td>
    <td bgcolor="#FFFFFF"><%=uname%></td>
    <td bgcolor="#FFFFFF"><%=sex%></td>
    <td bgcolor="#FFFFFF"><%=mz%></td>
    <td bgcolor="#FFFFFF"><%=birthday%></td>
    <td bgcolor="#FFFFFF"><%=gzsj%></td>
    <td bgcolor="#FFFFFF"><%=zzmm%></td>
    <td bgcolor="#FFFFFF"><%=zyjszw%></td>
    <td bgcolor="#FFFFFF"><%=xl%></td>
    <td bgcolor="#FFFFFF"><%=xl2%></td>
    <td bgcolor="#FFFFFF"><%=byyx&"<br>"&zy%></td>
    <td bgcolor="#FFFFFF"><%=gzzw%></td>
    <td bgcolor="#FFFFFF"><%=xcszy%></td>
    <td bgcolor="#FFFFFF"><%=zynx%></td>
    <td bgcolor="#FFFFFF"><%=gwmc%></td>
    <td bgcolor="#FFFFFF"><%=hg1%></td>
    <td bgcolor="#FFFFFF"><%=hg2%></td>
  </tr>
  
  <%
  	i=i+1
  	rs.movenext
  wend
  %>
  <tr>
    <td colspan="18" align="center" bgcolor="#FFFFFF">��ע������λ���²��ŶԱ�������Ա������ͳ�ƣ�������©�����ӱ�������ϱ�������д��������������ͨ���ģ�����ز��Ͻ��и���</td>
  </tr>
</table>
</body>
</html>
