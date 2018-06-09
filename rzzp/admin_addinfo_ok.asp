<!--#include file="conn.asp"-->
<%
chku 9
Function Get_SafeStr(str)
	Get_SafeStr = Replace(Replace(Replace(Trim(str), "'", ""), Chr(34), ""), ";", "")
End Function

title=request.Form("title")
tcolor=request.Form("tcolor")
strong=request.Form("strong")
istop=request.Form("istop")
ntype=request.Form("ntype")
if istop="" then istop=false
pubdt=request.Form("pubdt")


' 开始：eWebEditor编辑区取值-----------------
sContent = ""
For i = 1 To Request.Form("newcontent").Count
	sContent = sContent & Request.Form("newcontent")(i)
Next
' 结束：eWebEditor编辑区取值-----------------



set rs=server.createobject("adodb.recordset")
sql="select * from tb_NEWS where id=0"
rs.open sql,conn,1,3
rs.addnew
rs("title")=title
rs("content")=sContent
rs("tcolor")=tcolor
rs("tfont")=strong
rs("ntype")=ntype
rs("istop")=istop
if pubdt="" then
	rs("infotime")=date
else
	rs("infotime")=pubdt
end if

rs.update
if err then response.Write(err.description )
rs.close
set rs=nothing
conn.close  
set conn=nothing
msg "信息提交成功！","admin_info.asp"
%>
