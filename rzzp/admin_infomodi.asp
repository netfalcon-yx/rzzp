<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet" type="text/css">
<title>�������</title>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<script language="javascript" type="text/javascript" src="calendar.js"></script>
<script language = "JavaScript">

	// ���ύ�ͻ��˼��
	function doCheck(){

		if (document.myform.title.value==""){
			alert("���ű��ⲻ��Ϊ�գ�");
			return false;
		}
		// getHTML()ΪeWebEditor�Դ��Ľӿں���������Ϊȡ�༭��������
		if (eWebEditor1.getHTML()==""){
			alert("�������ݲ���Ϊ�գ�");
			return false;
		}

		// ����Ч�Լ������Զ��ϴ�Զ���ļ�
		// ������remoteUpload(strEventUploadAfter)
		// ������strEventUploadAfter ; �ϴ���󣬴����ĺ�����������ϴ�����趯���ɲ������
		//eWebEditor1.remoteUpload("doSubmit()");
		return true;

	}

	// ���ύ����Զ���ϴ���ɺ󣬴����˺�����
	function doSubmit(){
		document.myform.submit();
	}
</script>
<body leftmargin="0" topmargin="0" >
<% 
newsid=request("id")
Set rso=Server.CreateObject("ADODB.RecordSet") 
sql="select * from tb_NEWS where  id="&newsid
rso.Open sql,conn,1,1
if rso.eof and rso.bof then
	response.Write("û�м�¼")
else
%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable">
  <form name="myform" method="post" action="admin_saveinfomodi.asp" onSubmit="return doCheck();">
    <tr> 
      <th height="30" colspan="2" align="center">�� Ϣ �� ��</th>
    </tr>
    <tr> 
      <td height="25" align="right"><font color="#FF0000">*</font>���ű��⣺</td>
      <td>
<input name="title" type="text" class="input" value="<%=rso("title")%>" size="70"></td>
    </tr>
	<tr>
      <td height="25" align="right">��Ϣ���ͣ�</td>
	  <td><label>
        <select name="ntype" size="1" id="ntype">
          <option value="">ѡ����Ϣ����</option>
          <option value="1">���Ź���</option>
          <option value="2">������֪</option>
          <option value="3">���ų�ŵ</option>
          <option value="4">�ڲ�����</option>
        </select>
      </label></td>
    </tr>
	<tr>
      <td height="25" align="right">�������ã�</td>
      <td><select name="tcolor" type="text" id="tcolor">
	  <option value="">Ĭ����ɫ</option>
	  <option value="#FF0000" style="background-color:#FF0000;"></option>
	  <option value="#0000FF" style="background-color:#0000FF;"></option>
	  <option value="#00FFFF" style="background-color:#00FFFF;"></option>
	  <option value="#FF9900" style="background-color:#FF9900;"></option>
	  <option value="#339966" style="background-color:#339966;"></option>
	</select>
	<label> �Ӵ֣�
	<input name="strong" type="radio" class="radio" value="0" <%if rso("tfont")=false then response.write("checked")%> >
	��ͨ </label>
	<label>
	<input name="strong" type="radio" class="radio" value="1" <%if rso("tfont")=true then response.write("checked")%>>
	�Ӵ�</label>
	<script language="javascript">document.myform.ntype.value="<%=rso("ntype")%>";document.myform.tcolor.value="<%=rso("tcolor")%>";</script>
	  <input name="newsid" type="hidden" id="newsid" value="<%=newsid%>"></td>
    </tr>
    <tr> 
      <td height="25" align="right">�Ƿ��ö���</td>
      <td>
        <label>
        <input name="istop" type="radio" class="radio" value="false" <%if rso("istop")=false then response.Write("checked")%>>
�� </label>
        <label>
        <input name="istop" type="radio" class="radio" value="true" <%if rso("istop")=true then response.Write("checked")%>>
��</label></td>
    </tr>
     <tr>
      <td height="25" align="right">��ʾ״̬��</td>
      <td valign="top"><input name="ishow" type="radio" class="radio" id="radio" value="1" <%if rso("ishow") then rw " checked" %> />
        ������ʾ 
          <input name="ishow" type="radio" class="radio" id="radio2" value="0" <%if rso("ishow")=false then rw " checked" %> />
���� </td>
    </tr>
    <tr>
      <td height="25" align="right">����ʱ�䣺</td>
      <td valign="top"><input name="pubdt" type="text" id="pubdt" onClick="new Calendar().show(this);" value="<%=replace(rso("infotime"),"/","-")%>" size="15" maxlength="15"  readonly="readonly"  />
      (������Ϣ������ʱ���Ⱥ����򣬿ɵ�������ʱ��)</td>
    </tr>
    
    <tr> 
      <td height="25" align="right" valign="top"><font color="#FF0000">*</font>�������ݣ�</td>
      <td valign="top"> <textarea name="newcontent" style="display:none"><%=Server.HtmlEncode(rso("Content"))%></textarea>
        <IFRAME ID="eWebEditor1" src="edit/ewebeditor.htm?id=newcontent&style=coolblue&savepathfilename=d_savepathfilename" frameborder="0" scrolling="no" width="550" height="350"></IFRAME></td>
    </tr>
    
    <tr> 
      <td height="30" align="center">&nbsp;</td>
      <td height="30"><input type="submit" name="Submit" value="�ύ" class="but2" /></td>
    </tr>
  </form>
  <tr> 
    <td height="30" colspan="2" align="center">&nbsp;</td>
  </tr>
</table>
<% End If
rso.close
set rso=nothing
' ============================================
' ���ַ�������HTML����,�滻server.htmlencode
' ȥ��Html��ʽ��������ʾ���
' ============================================
Function outHTML(str)
	Dim sTemp
	sTemp = str
	outHTML = ""
	If IsNull(sTemp) = True Then
		Exit Function
	End If
	sTemp = Replace(sTemp, "&", "&amp;")
	sTemp = Replace(sTemp, "<", "&lt;")
	sTemp = Replace(sTemp, ">", "&gt;")
	sTemp = Replace(sTemp, Chr(34), "&quot;")
	sTemp = Replace(sTemp, Chr(10), "<br>")
	outHTML = sTemp
End Function

' ============================================
' ȥ��Html��ʽ�����ڴ����ݿ���ȡ��ֵ���������ʱ
' ע�⣺value="?"���һ��Ҫ��˫����
' ============================================
Function inHTML(str)
	Dim sTemp
	sTemp = str
	inHTML = ""
	If IsNull(sTemp) = True Then
		Exit Function
	End If
	sTemp = Replace(sTemp, "&", "&amp;")
	sTemp = Replace(sTemp, "<", "&lt;")
	sTemp = Replace(sTemp, ">", "&gt;")
	sTemp = Replace(sTemp, Chr(34), "&quot;")
	inHTML = sTemp
End Function
 %>
</body>
</html>
