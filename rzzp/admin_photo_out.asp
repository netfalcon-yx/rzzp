<!--#include file="conn.asp"-->
<style>
body{font-size:12px;}
.uphoto{width:122px;height:182px;margin:10px;float:left;text-align:center}
.uphoto img{width:120px;height:160px;}
.uphoto span{height:20px;line-height:20px;display:block}
.cl{clear:both}
</style>
<%
chku 9
Function CopyFiles(TempSource,TempEnd)	
    IF FSO.FileExists(TempSource)=false Then  
       'Response.Write "要复制的源照片 <b>"&TempEnd&"</b> 不存在!<br />"  
       'Set FSO=Nothing  
       Exit Function 
	else
		FSO.CopyFile TempSource,TempEnd
		if err then
			rw err.description&"<br>"
		else
			i=i+1
		end if 
    End If
End Function

Function createfolder(folder) 
	'set fs=createobject("scripting.filesystemobject")    
	url=server.mappath(folder)     
	if Not FSO.folderexists(url)   then  FSO.createfolder(url)  
End Function 

function GetFileExt(sFileName)
	 GetFileExt = lCase(Mid(sFileName,InStrRev (sFileName, ".")+1))
End function

Dim FSO 
Set FSO = Server.CreateObject("Scripting.FileSystemObject")  
folder="outphoto"'需要创建的文件夹名称  
Call createfolder(folder) 

i=0	
'sql="select uid,kh from tb_exam where jid=6 and ischk order by kh"
'sql="select uid,kh from tb_exam where jid=6 and isms order by kh"

set rs=server.CreateObject("adodb.recordset")
set rs2=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
while not rs.eof
	kh=rs("kh")
	uid=rs("uid")
	uphoto=""
	uname=""
	tmpphoto=""
	sql2="select uid,uname,uphoto from tb_user where uid="&uid
	rs2.open sql2,conn,1,1
	if not rs2.eof then
		uname=rs2("uname")
		uphoto=rs2("uphoto")
		if uphoto<>"" and not isnull(uphoto) then
			tmpphoto=kh&"-"&uname
			outphoto=Server.MapPath("outphoto/"&tmpphoto&"."&GetFileExt(uphoto))
			uphoto=Server.MapPath("doc/"&uphoto)
			Call CopyFiles(uphoto,outphoto)
			response.Write("<div class='uphoto'><img src='outphoto/"&tmpphoto&"."&GetFileExt(uphoto)&"'><span>"&tmpphoto&"</span></div>")
		end if
	end if
	rs2.close
	rs.movenext
wend
rs.close
set rs=nothing
Set FSO = Nothing  
rw "<div class='cl'></div>"&i&"个照片已复制到：outphoto目录下！"
%>