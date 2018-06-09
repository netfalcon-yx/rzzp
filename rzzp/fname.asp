<%
Function deleteAFile(filespec)
'//功能：文件删除
'//形参：文件名
'//返回值：成功为1，失败为-1
'//
If ReportFileStatus(filespec) = 1 Then
	fso.deleteFile(filespec)
	deleteAFile = 1
Else
	deleteAFile = -1
End if
End Function

Function ReportFileStatus(FileName) 
'//功能：判断文件是否存在
'//形参：文件名
'//返回值：成功为1，失败为-1
'//
Dim msg
msg = -1
If (fso.FileExists(FileName)) Then
msg = 1
Else
msg = -1
End If
ReportFileStatus = msg
End Function
%>