<!--#include file="conn.asp"-->
<%chku 0%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����ǼǱ�</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="comm.js"></script>
<style>
.mytable{border-top:#000000 1px solid;border-left:#000000 1px solid;line-height:20px;border-collapse:collapse}
.mytable th{border-bottom:#000000 1px solid;border-right:#000000 1px solid;}
.mytable td{border-bottom:#000000 1px solid;border-right:#000000 1px solid;}
</style>
</head>
<%
id=request.QueryString("id")

if id="" then
	msg "��������!","-1"
else
	id=intsql(id)
end if
set rs=server.CreateObject("adodb.recordset")
sql="select * from tb_bm where id="&id&" and gzdw="&session("duid")
if sql="" then msg "��������","-1"

rs.open sql,conn,1,1
if rs.eof then
	msg "�޴��û�������Ϣ!","-1"
else
	uid=rs("uid")
	jid=rs("jid")
	gid=rs("gid")
	xl=rs("xl")
	xl2=rs("xl2")
	xw=rs("xw")
	byyxzy=rs("byyxzy")
	bysj=rs("bysj")
	
	byyxzy2=rs("byyxzy2")
	bysj2=rs("bysj2")
		
	gzdw=rs("gzdw")
	gzzw=rs("gzzw")
	gzsj=rs("gzsj")
	zyjszw=rs("zyjszw")
	zyjszwmc=rs("zyjszwmc")
	if zyjszw<>"�޵ȼ��ʸ�" then
		zyjszw=zyjszw&zyjszwmc
	else
		zyjszw=zyjszwmc
	end if
	if zyjszw="����" then zyjszw=rs("zyjszw2")
	qdsj=rs("qdsj")
	zyzgz=rs("zyzgz")
	zysj2=rs("zysj2")
	xcszy=rs("xcszy")
	zynx=rs("zynx")
	if zynx<>"" then zynx=zynx&"��"
	
	zzmm=rs("zzmm")
	zzsj=rs("zzsj")
	xxjl=rs("xxjl")
	gzjl=rs("gzjl")
	jcqk=rs("jcqk")
	gzyj=rs("gzyj")
	jtcy=rs("jtcy")
	bz=rs("bz")
	
	
	'����������������Ϣ
	wyjcd=rs("wyjcd")
	byzy=rs("byzy")
	byzy2=rs("byzy2")
	snjxkh=rs("snjxkh")
	j3njxkh=rs("j3njxkh")
	rzsj=rs("xrzsj")
	xgwfl=rs("xgwfl")
	
	'udoc=rs("udoc")
	'udoc2=rs("udoc2")
	'udoc3=rs("udoc3")
	
	'fgwid=rs("fgwid")
	'fgwid2=rs("fgwid2")
	hg1=rs("hg1")
	hg1bz=rs("hg1bz")
	
	hg2=rs("hg2")
	hg2bz=rs("hg2bz")
	jgbs=rs("jgbs")
	
	jxdj=rs("jxdj")'��Ч�ȼ�
	yxnx=rs("yxnx")'һ�������Ƿ����
	if yxnx then
		yxnx="����"
	else
		yxnx="������"
	end if
end if
rs.close

sql="select jname,endflag from tb_job where jid="&jid
rs.open sql,conn,1,1
if not rs.eof then
	jname=rs("jname")
	endflag=rs("endflag")
end if
rs.close

if hg2 then
	endflag=True
end if

sql="select dname from tb_duser where uid="&gzdw
rs.open sql,conn,1,1
if not rs.eof then
	gzdw=rs(0)
end if
rs.close

sql="select * from tb_gw where jid="&jid&" and gid="&gid
rs.open sql,conn,1,1
if not rs.eof then
	bm=rs("bm")&":"
	gwmc=rs("gwmc")
	gtype=rs("gtype")
	zpdw=rs("zpdw")
end if
rs.close

'if fgwid<>0 then
'	sql="select bm,gwmc from tb_gw where gid="&fgwid
'	rs.open sql,conn,1,1
'	if not rs.eof then
'		fgw="����1��"&rs("bm")&":"&rs("gwmc")
'	end if
'	rs.close
'else
'	fgw=""
'end if
'
'if fgwid2<>0 then
'	sql="select bm,gwmc from tb_gw where gid="&fgwid2
'	rs.open sql,conn,1,1
'	if not rs.eof then
'		fgw2="&nbsp;����2��"&rs("bm")&":"&rs("gwmc")
'	end if
'	rs.close
'else
'	fgw2=""
'end if

sql="select * from tb_user where uid="&uid
rs.open sql,conn,1,1
if not rs.eof then
	uname=rs("uname")
	birthday=rs("birthday")
	sex=rs("sex")
	mz=rs("mz")
	card=rs("card")
	'hy=rs("hy")
	jg=rs("jg")'����
	hj=rs("hj")'������
	st=rs("st")'���彡��
	erpid=rs("erpid")
	uphoto=rs("uphoto")
	if uphoto<>"" then
		uphoto="doc/"&uphoto
	else
		uphoto="doc/nophoto.jpg"
	end if
end if
rs.close
%>
<body>
<h4 style="line-height:55px">��Ƹ�����ǼǱ�</h4>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:95%;">
    <tr>
      <td width="113" align="center" bgcolor="#F7F7F7">��&nbsp;&nbsp;&nbsp;��</td>
      <td width="95" align="center" style="overflow:hidden"><%=uname%></td>
      <td width="89" align="center" bgcolor="#F7F7F7">�ֹ�����λ</td>
      <td colspan="3" align="center"><%=gzdw%></td>
      <td width="135" rowspan="5" align="center"><img  src="<%=uphoto%>" class="uphoto2" /></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">��&nbsp;&nbsp;&nbsp;��</td>
      <td align="center"><%=sex%></td>
      <td align="center" bgcolor="#F7F7F7">��������</td>
      <td width="84" align="center"><%=year(birthday)&"-"&month(birthday)%></td>
      <td width="62" align="center" bgcolor="#F7F7F7">����</td>
      <td width="66" align="center"><%=jg%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">��&nbsp;&nbsp;&nbsp;��</td>
      <td align="center"><%=mz%></td>
      <td align="center" bgcolor="#F7F7F7">����ʱ��</td>
      <td align="center"><%=gzsj%></td>
      <td align="center" bgcolor="#F7F7F7">������</td>
      <td align="center"><%=hj%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">������ò</td>
      <td align="center"><%=zzmm%></td>
      <td align="center" bgcolor="#F7F7F7">�뵳(��)ʱ��</td>
      <td align="center"><%=zzsj%></td>
      <td align="center" bgcolor="#F7F7F7">����״��</td>
      <td align="center"><%=st%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">���֤����</td>
      <td colspan="5"><%=card%></td>
    </tr>
    <tr>
      <td rowspan="2" align="center" bgcolor="#F7F7F7">ѧ����ѧλ��</td>
      <td colspan="2">ȫ�������ѧ����<%=xl%></td>
      <td rowspan="2" bgcolor="#F7F7F7">��ҵʱ�䡢ԺУ��רҵ</td>
      <td colspan="3"><%=year(bysj)&"-"&month(bysj)&byyxzy&byzy%></td>
    </tr>
    <tr>
      <td colspan="2">��ְ���ѧ����<%=xl2%></td>
      <td colspan="3"><%=year(bysj2)&"-"&month(bysj2)&byyxzy2&byzy2%></td>
    </tr>
	<tr>
      <td align="center" bgcolor="#F7F7F7">רҵ�����ʸ�</td>
      <td colspan="3"><%=zyjszw%></td>
      <td colspan="2" align="center" bgcolor="#F7F7F7"><p>ְҵ�ʸ�</p></td>
      <td align="center"><%=zyzgz%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7"><p>�ֹ���������λ<br />
      ������(����)</p></td>
      <td colspan="3"><%=jgbs%></td>
      <td colspan="2" align="center" bgcolor="#F7F7F7">�ֹ�����λ</td>
      <td><%=gzzw%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7"><p>ӦƸ��λ����</p>
      <p>(��λ+��λ)</p></td>
      <td colspan="3"><strong><%=zpdw%> <%=gwmc%></strong></td>
      <td colspan="2" align="center" bgcolor="#F7F7F7">ӦƸ��λ����</td>
      <td align="center"><strong><%=gid%></strong></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">���θ�λ����</td>
      <td colspan="3" align="center"><%=xgwfl%></td>
      <td colspan="2" align="center" bgcolor="#F7F7F7">ӦƸ��λ����</td>
      <td align="center"><%=gtype%></td>
    </tr>
     <tr>
      <td align="center" bgcolor="#F7F7F7">�����꼨Ч</td>
      <td colspan="3" align="center"><%=jxdj%></td>
      <td colspan="2" align="center">"358"һ������</td>
      <td align="center"><%=yxnx%></td>
    </tr>
    <tr>
      <td align="center" valign="middle" bgcolor="#F7F7F7" style="height:150px;padding-top:20px">��<br />
      ��<br />
      ��<br />
      ��</td>
      <td colspan="6" align="left" valign="top" >
	  <%
	  tempxxjl=split(gzjl,chr(13))
	  for i=0 to UBound(tempxxjl)
	  	if i<=16 then
	  		rw tempxxjl(i)&"<br>"
		else
			Exit For
		end if
	  next
	  %></td>
    </tr>
    <tr>
	  <td  align="center" bgcolor="#F7F7F7" style="height:180px;padding-top:30px">��<br />
Ҫ<br />
��<br />
��<br />
��<br />
��</td>
	  <td colspan="6" align="left" valign="top" ><%
	  tempgzyj=split(gzyj,chr(13))
	  for i=0 to UBound(tempgzyj)
	  	if i<=19 then
	  		rw tempgzyj(i)&"<br>"
		else
			Exit For
		end if
	  next
	  %></td>
	  </tr>
	<tr>
      <td align="center" bgcolor="#F7F7F7" style="height:150px;padding-top:20px"><p>��</p>
      <p>��</p>
      <p>��</p>
      <p>��</p></td>
      <td colspan="6" align="left" valign="top" ><%=replace(jcqk,chr(13),"<br>")%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7" style="height:150px;padding-top:10px"><p>��</p>
        <p>ͥ<br />
        ��</p>
        <p>Ա<br />
        ��</p>
        <p>��</p></td>
      <td colspan="6" align="left" valign="top" ><%=replace(jtcy,chr(13),"<br>")%></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#F7F7F7">���㵥λ<br />
      ������</td>
      <td colspan="3"><form id="form1" name="form1" method="post" action="d_chkubm.asp">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><label>
              <input name="hg1" type="checkbox" class="radio" value="1" <%if hg1 then rw "checked"%> />
            ͬ�ⱨ��<br />
            (��ѧ����רҵ�����ʸ񡢼�Ч�ȼ���358���޵Ȳ��ϸ񣬴�������ѡ����д������)</label></td>
          </tr>
          <tr>
            <td><label>
              ��������
                  <input name="yj1" type="text" id="yj1" value="<%=hg1bz%>" />
            </label></td>
          </tr>
          <tr>
            <td><label>
              <input name="chk1" type="submit" class="but2" id="chk1" value="�� ��" />
              <input name="hdid" type="hidden" id="hdid" value="<%=id%>" />
              <input name="hdjid" type="hidden" id="hdjid" value="<%=jid%>" />
            </label></td>
          </tr>
        </table>
            </form>      </td>
      <td align="center" bgcolor="#F7F7F7">���й�˾���ʲ�<br />
      ������</td>
      <td colspan="2">
	  <%
	  	if hg2 then
	  		rw "��ͬ��"
		else
			rw hg2bz&"&nbsp;"
		end if
	%>	  </td>
    </tr>
    
   
	<tr>
      <td align="center" bgcolor="#F7F7F7">��&nbsp;&nbsp;&nbsp;&nbsp;ע</td>
      <td colspan="6" style="height:30px"><%=replace(bz,chr(13),"<br>")%>&nbsp;</td>
    </tr>
	<tr>
	  <td align="center" bgcolor="#F7F7F7">������</td>
	  <td colspan="6" style="line-height:30px">
      <%
	  sql="select * from tb_ufile where uid="&uid
	  rs.open sql,conn,1,1
	  if not rs.eof then
	  while not rs.eof
	  	rw "<img src='icon/down-11.gif' width='16' height='16'  /> <a href='doc/"&rs("furl")&"' target='_blank'>"&getuftype(rs("ftype"))&"</a><br>"
		rs.movenext
	  wend
	  else
	  	rw "û���ϴ�������"
	  end if
	  rs.close
	  set rs=nothing
	  closeconn
	  %>
      </td>
    </tr>
</table>

</body>
</html>
