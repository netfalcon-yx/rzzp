<!--#include file="conn.asp"-->
<%chku 9%>
<script type="text/javascript">
var dg =  frameElement.lhgDG;
</script>
<%
jid=request.QueryString("jid")
gid=request.Form("hdgid")
set rs=server.CreateObject("adodb.recordset")
if jid<>"" then
	jid=intsql(jid)
	gwmc=request.Form("gwmc")
	bm=request.Form("bm")
	gtype=lcase(request.Form("gtype"))
	zpdw=lcase(request.Form("zpdw"))
	gwjb=lcase(request.Form("gj"))
	jhrs=request.Form("jhrs")
	sgtj=server.HTMLEncode(request.Form("sgtj"))
	gwzz=server.HTMLEncode(request.Form("gwzz"))
	bz=server.HTMLEncode(request.Form("bz"))
	kslx=ucase(request.Form("kslx"))
	rwcj=request.Form("rwcj")
	if gid<>"" then
		gid=intsql(gid)
		sql="select * from tb_gw where jid="&jid&" and  gid="&gid
		rs.open sql,conn,1,3
	else
		sql="select max(gid) from tb_gw where jid="&jid
		rs.open sql,conn,1,1
		if isnull(rs(0)) then
			newgid=1
		else
			newgid=rs(0)+1
		end if
		rs.close
		
		sql="select * from tb_gw where gid=0"
		rs.open sql,conn,1,3
		rs.addnew
		rs("gid")=newgid
		rs("jid")=jid
	end if
	
	rs("gwmc")=gwmc	
	rs("bm")=bm
	rs("zpdw")=zpdw
	rs("gwjb")=gwjb
	rs("jhrs")=jhrs
	rs("gtype")=gtype
	rs("gwtj")=sgtj
	rs("gwcontent")=gwzz
	rs("bz")=bz
	rs("kslx")=kslx
	rs("rwcj")=rwcj
	rs.update
	rs.close
	set rs=nothing

	if err then
		rw err.description
	else
		rw "<script>dg.curDoc.location.reload();dg.cancel();</script>"
	end if
else
	rw "<script>alert('²ÎÊý³ö´í£¡');dg.cancel();</script>"
end if


%>