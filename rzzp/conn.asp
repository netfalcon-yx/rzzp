<%
dim conn,connstr
on error resume next
'connstr="DBQ="+server.mappath("data/nxnews.asp")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("db/#pubjob.mdb")
Set conn=Server.CreateObject("ADODB.CONNECTION")
conn.open connstr
webname="国网湖北省电力公司内部人力资源市场招聘系统"
inipsw="49ba59abbe56e057"	'初始:123456
job_bmend_dt=""

'uftypes="1:自荐书,2:就业毕业证,3:就业学位证,4:最高毕业证,5:最高学位证,6:专业技术资格证书,7:职业资格证书,8:其它"
uftypes="1:就业毕业证,2:就业学位证,3:最高毕业证,4:最高学位证,5:专业技术资格证书,6:职业资格证书,7:身份证扫描件,8:其它"

function intSql(Numeric)
    if IsNumeric(Numeric) then
        intSql=cint(Numeric)
    else
        intSql=0
    end if
end function

sub rw(str)
	response.Write(str)
end sub

Sub Msg (v,gourl)
    if gourl="-1" then
	Response.Write "<script Language=javaScript>alert('"&v&"');history.back();</script>"
	else
	Response.Write "<script Language=javaScript>alert('"&v&"');location.href='"&gourl&"'</script>"
	'response.Redirect(gourl)
	end if
	Response.End
End Sub

Sub Msg2 (v,gourl)
	Response.Write "<script Language=javaScript>alert('"&v&"');top.location.href='"&gourl&"'</script>"
	Response.End
End Sub

Function IsSelfRefer()'检查是否本站提交
	Dim sHttp_Referer, sServer_Name
	sHttp_Referer = CStr(Request.ServerVariables("HTTP_REFERER"))
	sServer_Name = CStr(Request.ServerVariables("SERVER_NAME"))
	If Mid(sHttp_Referer, 8, Len(sServer_Name)) = sServer_Name Then
		IsSelfRefer = True
	Else
		IsSelfRefer = False
	End If
End Function

sub chklocal()
	if IsSelfRefer=false then
		Response.Write " ^@^ 请不要从外部提交数据!"
		Response.End
	end if
end sub

sub chku(utype)
	select case utype
		case 0
			if session("utype")="" or isnull(session("utype")) then	msg "你还没有登录或登录信息已失效！","login.asp"
		case 1
			if session("uid")="" or isnull(session("uid")) or session("utype")<>1 then	msg2 "你还没有登录或登录信息已失效！","login.asp"
		case 2
			if session("duid")="" or isnull(session("duid")) or session("utype")<>2 then	msg2 "你还没有登录或登录信息已失效！","login.asp"
		case 9
			if session("adminid")="" or isnull(session("adminid")) or session("utype")<>9 then	msg2 "你还没有登录或登录信息已失效！","login.asp"
		case else
			msg2 "你还没有登录或登录信息已失效！","login.asp"
	end select
end sub
function get_gznx(ugzdt)
	tmp_nx=0
	nowgzsj=year(date)&"-09-01"
	if IsDate(ugzdt) then
		tmp_nx=DateDiff("m",ugzdt,nowgzsj)
		'rw tmp_nx&"<br>"
		if (tmp_nx mod 12)=0 then
			get_gznx=tmp_nx/12
		else
			get_gznx=FormatNumber(tmp_nx/12,1,-1)
		end if
	else
		get_gznx=""
	end if
end function

sub selectuftype()
	ftypearr=split(uftypes,",")
	for i=0 to UBound(ftypearr)
		tmpftype=split(ftypearr(i),":")
		rw "<option value="&tmpftype(0)&">"&tmpftype(1)&"</option>"
	next
end sub

function getuftype(ftid)
	ftypearr=split(uftypes,",")
	for i=0 to UBound(ftypearr)
		tmpftype=split(ftypearr(i),":")
		if cstr(ftid)=cstr(tmpftype(0)) then
			getuftype=tmpftype(1)
			exit for
		end if
	next
end function
%>
<!--#Include File="sql/Neeao_SqlIn.Asp"-->
