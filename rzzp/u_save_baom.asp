<!--#include file="conn.asp"-->
<%
chku 1
chklocal
jid=request.Form("hdjid")
gid=request.Form("gid")
id=request.Form("hdbmid")
if jid<>"" and gid<>"" then
	jid=intsql(jid)
	gid=intsql(gid)
else
	msg "��Ƹ��λ��������","-1"
end if

set rs=server.CreateObject("adodb.recordset")
sql="select * from tb_job where jid="&jid
rs.open sql,conn,1,1
if not rs.eof then
	btime=rs("btime")
	etime=rs("etime")
	
	if datediff("s",now,btime)>0 then	msg "������Ƹ������û�п�ʼ!","-1"
	if datediff("s",now,etime)<0 then	msg "������Ƹ�����ѽ���!","-1"
else
	msg "û�и���Ƹ��Ϣ!","-1"
end if
rs.close

xl=request.Form("xl")
xw=request.Form("xw")
byyxzy=request.Form("byyxzy")
bysj=request.Form("bysj")

xl2=request.Form("xl2")
byyxzy2=request.Form("byyxzy2")
bysj2=request.Form("bysj2")

gzdw=request.Form("gzdw")
gzzw=request.Form("gzzw")
gzsj=request.Form("gzsj")
zyjszw=request.Form("zyjszw")
if zyjszw="����" then
	zyjszw2=request.Form("zyjszw2")
else
	zyjszw2=""
end if

zyjszwmc=request.Form("zyjszwmc")

qdsj=request.Form("qdsj")

jgbs=request.Form("jgbs")

zyzgz=request.Form("zyzgz")
zysj2=request.Form("zysj2")
xcszy=request.Form("xcszy")
zynx=request.Form("zynx")

zzmm=request.Form("zzmm")
zzsj=request.Form("zzsj")

jxdj=request.Form("jxdj")
yxnx=request.Form("yxnx")
if yxnx=""  then yxnx=false
'����������������Ϣ
'wyjcd=request.Form("wyjcd")
byzy=request.Form("byzy")
byzy2=request.Form("byzy2")
'snjxkh=request.Form("snjxkh")
'j3njxkh=request.Form("j3njxkh")
'rzsj=request.Form("rzsj")
xgwfl=request.Form("xgwfl")
'udoc2=request.Form("udoc2")
'udoc3=request.Form("udoc3")
'xxpx=server.HTMLEncode(request.Form("xxpx"))
		
'xxjl=server.HTMLEncode(trim(request.Form("xxjl")))
gzjl=server.HTMLEncode(trim(request.Form("gzjl")))
jcqk=server.HTMLEncode(trim(request.Form("jcqk")))
gzyj=server.HTMLEncode(trim(request.Form("gzyj")))
jtcy=server.HTMLEncode(trim(request.Form("jtcy")))
bz=server.HTMLEncode(trim(request.Form("bz")))
'fgwid=request.Form("fgwid")
'fgwid2=request.Form("fgwid2")
'zjs=request.Form("udoc1")

if id="" then
	sql="select count(id) from tb_bm where jid="&jid&" and uid="&session("uid")
	rs.open sql,conn,1,1
	if not rs.eof then
		if rs(0)>=1 then	msg "������Ƹ���ѱ���,��Ҫ���±�������ɾ���ϴα�����Ϣ��","u_bminfo.asp"
	end if
	rs.close
	
	sql="select * from tb_bm where id=0"
	rs.open sql,conn,1,3
	rs.addnew
	rs("jid")=jid
	rs("uid")=session("uid")
else
	id=intsql(id)
	sql="select * from tb_bm where id="&id
	rs.open sql,conn,1,3
	
end if
rs("gid")=gid
rs("xl")=xl
rs("xw")=xw
rs("byyxzy")=byyxzy
rs("bysj")=bysj

rs("xl2")=xl2
rs("byyxzy2")=byyxzy2
rs("bysj2")=bysj2

rs("gzdw")=gzdw
rs("gzzw")=gzzw
rs("gzsj")=gzsj
rs("zyjszw")=zyjszw
rs("zyjszwmc")=zyjszwmc
rs("qdsj")=qdsj

rs("jgbs")=jgbs

rs("zyjszw2")=zyjszw2
rs("zyzgz")=zyzgz
rs("zysj2")=zysj2
rs("xcszy")=xcszy
rs("zynx")=zynx

rs("zzmm")=zzmm
rs("zzsj")=zzsj
'rs("xxjl")=xxjl
rs("gzjl")=gzjl
rs("jcqk")=jcqk
rs("gzyj")=gzyj
rs("jtcy")=jtcy
rs("bz")=bz
'rs("fgwid")=fgwid
'rs("fgwid2")=fgwid2
rs("jxdj")=jxdj
rs("yxnx")=yxnx
'����������������Ϣ
'rs("wyjcd")=wyjcd
rs("byzy")=byzy
rs("byzy2")=byzy2
'rs("snjxkh")=snjxkh
'rs("j3njxkh")=j3njxkh
'rs("xrzsj")=rzsj
rs("xgwfl")=xgwfl
'rs("xxpx")=xxpx
		
'rs("udoc")=zjs
'rs("udoc2")=udoc2
'rs("udoc3")=udoc3
rs.update
rs.close

if err then
	rw err.description
else
	msg "������Ϣ��ɹ����ύ���뾡��Я�����й�֤����\n\r\n\r���ϵ�����λ���²��Ž����ʸ���ˣ����ǰ\n\r\n\r�Կɽ��и�����Ϣ�޸ġ���˳ɹ��������޸ģ����\n\r\n\r���ɹ��ڱ�����ֹ����ǰ�����������λ��","u_bminfo.asp"
end if

%>