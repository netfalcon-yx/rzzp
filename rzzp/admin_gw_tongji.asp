<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����ͳ��</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script src="comm.js" language="javascript"></script>
</head>
<%
jid=request.QueryString("jid")
if jid<>"" then
	jid=intsql(jid)
else
	msg "��ѡ����Ƹ��Ϣ��","-1"
end if
gid=request.querystring("gwid")
hgflag=request.QueryString("hgflag")
set rs=server.CreateObject("adodb.recordset")
%>
<body>
<div class="unav">
	<span style="float:right;margin-right:10px"><strong>>><a href="admin_job_tongji.asp?jid=<%=jid%>">�л�Ϊ����λͳ��</a></strong></span>
    <form id="form1" name="form1" method="post" action="">
    ��ǰλ�ã���Ƹ����ͳ�ơ�����λͳ����ϸ��
      <label>   
    <select name="gid" size="1" id="gid" onchange="javascript:gogw(this.value)">
	<option value="">--ȫ����λ--</option>
		<%
		sql="select * from tb_gw where jid="&jid
		rs.open sql,conn,1,1
		while not rs.eof
			if gid=rs("gid") then
				tempgwbm="checked"
			else
				tempgwbm=""
			end if
			rw "<option value='"&rs("gid")&"' "&tempgwbm&">"&rs("gid")&"--"&rs("zpdw")&":"&rs("bm")&":"&rs("gwmc")&"</option>"&chr(13)
			rs.movenext
		wend
		rs.close
		%>
      </select>
    </label>
    &nbsp;&nbsp;<a href="admin_tj_gwsum.asp?jid=<%=jid%>">���ظ�λ�����ϼ�</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="getTblData('gwtable')">����Excel</a>&nbsp;&nbsp;
    </form>
</div>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#333333" class="mytable" id="gwtable">
  <tr>
    <th width="5%" >���</th>
    <th width="12%" >������λ</th>    
    <th width="8%" >����</th>
    <th width="4%" >�Ա�</th>
    <th width="8%" >��������</th>
    <th width="8%" >����ʱ��</th>
    <th width="8%" >������ò</th>
    <th width="8%" >ְ��</th>
    <th width="8%" >ԭʼѧ��</th>
    <th width="8%" >�ֹ�����λ</th>
    <th >ӦƸ��λ</th>
  </tr>
  <%
curgw=""  
set rs2=server.CreateObject("adodb.recordset")
if gid<>"" then
  	sql="select zpdw,bm,gwmc from tb_gw where jid="&jid&" and gid="&gid
	rs.open sql,conn,1,1
	if not rs.eof then
		curgw=rs("zpdw")&":"&rs("bm")&":"&rs("gwmc")
	end if
	rs.close
	if hgflag="" then
		sql="select * from tb_bm where jid="&jid&" and gid="&gid&" and hg1 and hg2 order by gid,gzdw,id"
	else
		sql="select * from tb_bm where jid="&jid&" and gid="&gid&" order by gid,gzdw,id"
	end if
else
	if hgflag="" then
		sql="select * from tb_bm where jid="&jid&" and hg1 and hg2 order by gid,gzdw,id"
	else
		sql="select * from tb_bm where jid="&jid&" order by gid,gzdw,id"
	end if
end if
  rs.open sql,conn,1,1
  i=1
  while not rs.eof
  	uid=rs("uid")
	ugid=rs("gid")
	xl=rs("xl")
	xl2=rs("xl2")
	xw=rs("xw")
	byyxzy=rs("byyxzy")
	bysj=rs("bysj")	
	
	udid=rs("gzdw")
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
	
	uhg=""
	hg1=rs("hg1")
	hg2=rs("hg2")
	if hg1 then
		uhg="<font color=#0000FF>��</font>"
	elseif rs("hg1bz")<>"" and (not isnull(rs("hg1bz"))) then
		uhg="<font color=#0000FF>��</font>"
	end if
	if hg2 then
		uhg=uhg&"<font color=#FF0000>��</font>"
	elseif rs("hg2bz")<>"" and (not isnull(rs("hg2bz"))) then
		uhg=uhg&"<font color=#FF0000>��</font>"		
	end if
	
	sql2="select dname from tb_duser where uid="&udid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		gzdw=rs2(0)
	end if
	rs2.close
	
	if curgw="" then
		sql2="select zpdw,bm,gwmc from tb_gw where jid="&jid&" and gid="&ugid
		rs2.open sql2,conn,1,1
		if not rs2.eof then
			bmgw=rs2("zpdw")&":"&rs2("bm")&":"&rs2("gwmc")
		end if
		rs2.close
	else
		bmgw=curgw
	end if	
	
	sql2="select * from tb_user where uid="&uid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		uname=rs2("uname")
		birthday=rs2("birthday")
		sex=rs2("sex")
		mz=rs2("mz")
		'birthday=rs2("birthday")
		jg=rs2("jg")
		hj=rs2("hj")
		st=rs2("st")
	end if
	rs2.close
  %>
  <tr align="center">
    <td bgcolor="#FFFFFF"><%=i%></td>
    <td bgcolor="#FFFFFF"><%=gzdw%></td>    
    <td bgcolor="#FFFFFF"><a href="admin_uinfo.asp?id=<%=rs("id")%>"><%=uname%></a>  <%=uhg%></td>
    <td bgcolor="#FFFFFF"><%=sex%></td>
    <td bgcolor="#FFFFFF" class="text"><%=year(birthday)&"-"&month(birthday)%></td>
    <td bgcolor="#FFFFFF" class="text"><%=year(gzsj)&"-"&month(gzsj)%></td>
    <td bgcolor="#FFFFFF"><%=zzmm%></td>
    <td bgcolor="#FFFFFF"><%=zyjszw%></td>
    <td bgcolor="#FFFFFF"><%=xl%></td>
    <td bgcolor="#FFFFFF"><%=gzzw%></td>
    <td bgcolor="#FFFFFF"><%=bmgw%></td>
  </tr>  
  <%
  	i=i+1
  	rs.movenext
  wend
  rs.close
  %>
  <tr align="center">
    <td colspan="11" bgcolor="#FFFFFF">�ϼƣ��������� <span class="redfont"><%=i-1%></span> ��</td>
  </tr>
</table>
<script language="javascript">
//showtable("gwtable");
$("gid").value="<%=gid%>";
function gogw(gwid)
{
location.href="?jid=<%=jid%>"+"&gwid="+gwid;
}
</script>
</body>
</html>
