<%
Function deleteAFile(filespec)
'//���ܣ��ļ�ɾ��
'//�βΣ��ļ���
'//����ֵ���ɹ�Ϊ1��ʧ��Ϊ-1
'//
If ReportFileStatus(filespec) = 1 Then
	fso.deleteFile(filespec)
	deleteAFile = 1
Else
	deleteAFile = -1
End if
End Function

Function ReportFileStatus(FileName) 
'//���ܣ��ж��ļ��Ƿ����
'//�βΣ��ļ���
'//����ֵ���ɹ�Ϊ1��ʧ��Ϊ-1
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