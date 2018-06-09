<!--#include file="conn.asp"-->
<%
chku 2
chklocal
id=request.Form("hdbmid")
if id<>"" then
	id=intsql(id)
else
	msg "招聘岗位参数错误！","-1"
end if

set rs=server.CreateObject("adodb.recordset")

gid=request.Form("gid")
xl=request.Form("xl")
xw=request.Form("xw")
byyxzy=request.Form("byyxzy")
bysj=request.Form("bysj")
xl2=request.Form("xl2")
byyxzy2=request.Form("byyxzy2")
bysj2=request.Form("bysj2")

'gzdw=request.Form("gzdw")
gzzw=request.Form("gzzw")
gzsj=request.Form("gzsj")
zyjszw=request.Form("zyjszw")
if zyjszw="其它" then
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
'zynx=request.Form("zynx")

zzmm=request.Form("zzmm")
zzsj=request.Form("zzsj")
'xxjl=server.HTMLEncode(request.Form("xxjl"))
gzjl=server.HTMLEncode(request.Form("gzjl"))
jcqk=server.HTMLEncode(request.Form("jcqk"))
gzyj=server.HTMLEncode(request.Form("gzyj"))
jtcy=server.HTMLEncode(request.Form("jtcy"))
bz=server.HTMLEncode(request.Form("bz"))

jxdj=request.Form("jxdj")
yxnx=request.Form("yxnx")
if yxnx=""  then yxnx=false
'这下面是新增的信息
'wyjcd=request.Form("wyjcd")
byzy=request.Form("byzy")
byzy2=request.Form("byzy2")
'snjxkh=request.Form("snjxkh")
'j3njxkh=request.Form("j3njxkh")
'rzsj=request.Form("rzsj")
xgwfl=request.Form("xgwfl")

'fgwid=request.Form("fgwid")
'fgwid2=request.Form("fgwid2")


sql="select * from tb_bm where id="&id&" and gzdw="&session("duid")
rs.open sql,conn,1,3


rs("gid")=gid
rs("xl")=xl
rs("xw")=xw
rs("byyxzy")=byyxzy
rs("bysj")=bysj

rs("xl2")=xl2
rs("byyxzy2")=byyxzy2
rs("bysj2")=bysj2

'rs("gzdw")=gzdw
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
'rs("zynx")=zynx

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
'这下面是新增的信息
'rs("wyjcd")=wyjcd
rs("byzy")=byzy
rs("byzy2")=byzy2
'rs("snjxkh")=snjxkh
'rs("j3njxkh")=j3njxkh
'rs("xrzsj")=rzsj
rs("xgwfl")=xgwfl
rs.update
rs.close

if err then
	rw err.description
else
	msg "用户报名信息编辑成功！","d_uinfo.asp?id="&id
end if

%>