<!--#include file="conn2.asp"-->
<!--#include file="fname.asp"-->
<%
chku 9
Server.ScriptTimeOut=5000
function fixsql(str)
	dim newstr
	newstr = trim(str)
	if isnull(newstr) then
		newstr = ""
	else
		newstr = replace(newstr,"'","''")
	end if
	fixsql = newstr
end Function
%>
<!--#include FILE="UpLoadclass.asp"-->

<%
dim request2 
'建立上传对象
set request2=New UpLoadClass
request2.FileType="xls"
request2.SavePath="doc/"
'设置为手动保存模式
request2.AutoSave=2
request2.MaxSize=10240000

savephoto=""
'打开对象
request2.open()

tphoto=request2.form("file"&"_Name")
jid=request2.form("hd_jid")
if jid="" then
response.Write("参数出错！")
response.End()
end if

if tphoto<>"" then'如果有照片就先保存照片
	if request2.Save("file",0) then
		'显示保存位置
		savephoto=request2.Form("file")
		set conn2=CreateObject("ADODB.Connection")
		conn2.Open "Provider=Microsoft.Jet.OLEDB.4.0;Jet OLEDB:Database Password=;Extended properties=Excel 5.0;Data Source="&Server.MapPath("doc/"&savephoto) '要导入的EXCEL表名称
		
		'-----------------------------------------------------------------------------------------------------------------
		'这里要说明的是，数据库和Excel表和该文件必须在网站同一目录里
		'-----------------------------------------------------------------------------------------------------------------
		sql = "SELECT * FROM [Sheet1$]"      '要导入的Excel数据里面的表的名称，后面一定要加$
		On Error Resume Next 
		set rs = conn2.execute(sql)
		if err then
			rw "<span class='errtxt'>错误：</span>"&err.description
			response.End()
		end if
		if not rs.eof then
			rs.movenext'标题偏移量
		else
			rw "没有数据记录，请检查第一个单元是否为Sheet1"
			response.End()
		end if
		
		set rs2=server.createobject("adodb.recordset")		
		temprow=1
		while not rs.eof
			
			newgid=fixsql(rs(0))'岗位代码
			dw=fixsql(rs(1))'招聘单位
			bm=fixsql(rs(2))'招聘部门
			gwmc=fixsql(rs(3))'岗位名称
			kslx=fixsql(rs(8))'考试类别
			if newgid<>"" and bm<>"" and gwmc<>"" then
				newgid=intsql(newgid)
				'sql2="select max(gid) from tb_gw where jid="&jid
'				rs2.open sql2,conn,1,1
'				if isnull(rs2(0)) then
'					newgid=1
'				else
'					newgid=rs2(0)+1
'				end if
'				rs2.close
				
				sql2="select * from tb_gw where jid="&jid&" and gid="&newgid
				On Error Resume Next 
				rs2.open sql2,conn,1,3
				if rs2.eof then			
					rs2.addnew
					rs2("gid")=newgid
					rs2("jid")=jid
				end if
				rs2("zpdw")=dw
				rs2("bm")=bm
				rs2("gwmc")=gwmc
				
				rs2("gtype")=fixsql(rs(4))
				'rs2("gwjb")=fixsql(rs(6))
				rs2("jhrs")=fixsql(rs(5))
				rs2("gwtj")=fixsql(rs(6))
				rs2("gwcontent")=fixsql(rs(7))
				
				rs2("jid")=jid
				rs2("kslx")=kslx
				'rs2("bz")=fixsql(rs(7))
				rs2.update
				rs2.close
			'response.end
				if err then
					rw err.description&"<br>"
					rw "<font color=#ff0000>第"&temprow&"条失败,部门:"&bm&"，岗位名称："&gwmc&"</font><Br />"
					'On Error Resume Next	
				'else
					'rw "第"&temprow&"条记录导入成功!<Br />"
				end if
				Response.Flush
			else
				rw "第"&temprow&"条记录,编号："&newgid&",部门:"&bm&"，岗位名称："&gwmc&"为空!<Br />"
			end if
		
			temprow=temprow+1
			rs.movenext
		wend
		conn.close
		set conn = nothing
		conn2.close
		set conn2 = Nothing
		
		Response.Write temprow&"条记录导入完成!"
	else
		select case request2.Error
			case -1
				errtxt="上传没有开始"
			case 0
				errtxt="上传成功"
			case 1
				errtxt="文件太大超过限制：10M!"
			case 2
				errtxt="文件类型不匹配，请检查上传的是否是图像文件！"
			case 3
				errtxt="上传文件过大或类型不正确"
			case 4
				errtxt="异常，不存在上传"
			case 5
				errtxt="上传已经取消，请检查总上载数据是否小于最大限制"
			case else
				errtxt="未知上传错误"
		end select
	end if
end if
set request2=nothing '释放上传对象

if errtxt<>"" then
	rw  errtxt&"文档上传失败！"
elseif err then
	rw err.description
else
	msg "文档上传成功！","admin_gw.asp?jid="&jid
end if
%>
