<!--#include file="conn.asp"-->
<%chku 9%>
<%
Function Get_SafeStr(str)
	Get_SafeStr = Replace(Replace(Replace(Trim(str), "'", ""), Chr(34), ""), ";", "")
End Function
newsid=request.Form("newsid")
title=server.HTMLEncode(request.Form("title"))
tcolor=request.Form("tcolor")
strong=request.Form("strong")
istop=request.Form("istop")	
pubdt=request.Form("pubdt")
ntype=request.Form("ntype")
ishow=request.Form("ishow")
' 开始：eWebEditor编辑区取值-----------------
sContent = ""
For i = 1 To Request.Form("newcontent").Count
	sContent = sContent & Request.Form("newcontent")(i)
Next
' 结束：eWebEditor编辑区取值-----------------

set rs=server.createobject("adodb.recordset")
sql="select * from tb_NEWS where id="&newsid
rs.open sql,conn,1,3

rs("title")=title
rs("content")=sContent
rs("tcolor")=tcolor
rs("tfont")=strong
rs("istop")=istop
rs("ntype")=ntype
rs("ishow")=ishow
if pubdt="" then
	rs("infotime")=date
else
	rs("infotime")=pubdt
end if

rs.update
rs.close
set rs=nothing
msg "信息修改成功！","admin_info.asp"
%>
