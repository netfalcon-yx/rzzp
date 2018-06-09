<!--#include file="conn.asp"-->
<%chku 9%>
<style type="text/css"> 
<!-- 
body,td,th { 
font-size: 12px; 
} 
.STYLE1 { 
color: #FFFFFF; 
font-weight: bold; 
} 
.STYLE2 {color: #FF0000} 
--> 
</style><BODY topMargin=0 leftmargin="0" marginheight="0"> 
<% 
db="db/#pubjob.mdb"
backf="doc"
currf=server.mappath(db)  

If Request.QueryString("action")="back" Then 
backf=server.mappath(backf) 
backfy=request.form("backfy") 
On error resume next 
Set objfso = Server.CreateObject("Scripting.FileSystemObject") 

if err then 
err.clear 
response.write "<script>alert(""不能建立fso对象，请确保你的空间支持fso:！"");history.back();</script>" 
response.end 
end if 

if objfso.Folderexists(backf) = false then 
Set fy=objfso.CreateFolder(backf) 
end if 

objfso.copyfile currf,backf& "\"& backfy 
response.write "<script>alert(""备份数据库成功"");location.href='admin_bkdb.asp';</script>" 
End If 


sub bklist()
	Set fso = Server.CreateObject("Scripting.FileSystemObject")
	TruePath=server.mappath(backf)
	Set theFolder=fso.GetFolder(TruePath)
	For Each theFile In theFolder.Files
	response.write  "<option value='doc/"&theFile.Name&"'>"&theFile.Name&"</option>"
	next
	set theFolder=nothing
	set fso=nothing
end sub

sub getbks()
	bks=0
	fall=0 
    dim objFSO,objFd,objFile 
    set objFSO=server.CreateObject("scripting.FileSystemObject") 
    if objFso.folderExists(server.MapPath(backf)) then 
      set objFd=objFSO.getFolder(server.MapPath(backf)) 
      for each objFile in objFd.Files
		if left(objFile.Name,6)="@dbbk-" then
			response.Write(objFile.Name)&chr(9)
			fsize=objFile.size
			fall=fall+fsize
			bks=bks+1
		end if
      Next 
	  response.Write("<br><br>已备份文件数："&bks&"个,占用空间："&FormatSize(fall)&"<br><br>")
	  response.Write("<font color=red>如果备份数据占用空间超过<b>100M</b>，请及时联系我们删除数据，以免影响网站运行速度！</font><br>")
    else 
      response.Write("还没有进行过数据备份！") 
    end if 
	set objFSO=nothing
end sub

Function FormatSize(FileSize)

	If FileSize<1024 then FormatSize = FileSize & " Byte"
	
	If FileSize/1024 <1024 And FileSize/1024 > 1 then 
	
		FileSize = FileSize/1024 
	
		FormatSize=round(FileSize*100)/100 & " KB" 
	
	Elseif FileSize/(1024*1024) > 1 Then
	
		FileSize = FileSize/(1024*1024)
	
		FormatSize = round(FileSize*100)/100 & " MB" 
	end if

End function
%> 
<form name="form1" method="POST" action="admin_bkdb.asp?action=back"> 
<div align="center"> 
<center> 
<table border="0" cellpadding="3" style="border-collapse: collapse" bordercolor="#111111" width="98%" id="AutoNumber1" cellspacing="3"> 
<tr> 
<td width="100%" bgcolor="#990000"><span class="STYLE1">备份数据库</span></td> 
</tr> 
 
 
<tr> 
<td width="100%" bgcolor="#FBFDFF">数据库名称：<span style="background-color: #F7FFF7"> 
<input type="text" name="backfy" size="50" value="@dbbk-<%=replace(replace(replace(now(),":","")," ","@"),"/","-")%>.asp"> 

<input type="submit" name="Submit" value="备份" > 
<span class="STYLE2">注：尽量不要更改以上项</span></span></td> 
</tr>
<tr>
  <td bgcolor="#FBFDFF">
  <br><strong>备份信息：</strong><br><br><%getbks()%><br>
您可以定期用这个功能来备份您的网站数据，以保证您的数据安全！<br>
  </td>
</tr> 
</table> 
</center> 
</div> 
</form> 
