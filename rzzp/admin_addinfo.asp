<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="style.css" type="text/css">
<title>������Ź���</title>
<script language="javascript" src="calendar.js"></script>
</head>
<script language = "JavaScript"> 

	// ���ύ�ͻ��˼��
	function doCheck(){

		if (document.myform.title.value==""){
			alert("���ű��ⲻ��Ϊ�գ�");
			return false;
		}
		if (document.myform.ntype.value==""){
			alert("�������Ͳ���Ϊ�գ�");
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
<body leftmargin="0" topmargin="0">

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable">
  <form name="myform" method="post" action="admin_addinfo_ok.asp" onSubmit="return doCheck();">
    <tr> 
      <th height="30" colspan="2" align="center">������Ϣ¼��</th>
    </tr>
    <tr> 
      <td height="25" align="right"><font color="#FF0000">*</font>���ű��⣺</td>
      <td>
<input name="title" type="text" class="input" size="70"></td>
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
	<input name="strong" type="radio" class="radio" value="0" checked >
	��ͨ </label>
	<label>
	<input name="strong" type="radio" class="radio" value="1" >
	�Ӵ�</label>	  </td>
    </tr>
    <tr> 
      <td height="25" align="right">�ö���ʾ��</td>
      <td><label>
        <input name="istop" type="radio" class="radio" value="false" checked>
�� </label>
        <label>
        <input name="istop" type="radio" class="radio" value="true">
��</label></td>
    </tr>
    
    <tr>
      <td height="25" align="right">����ʱ�䣺</td>
      <td valign="top">	  
      <input name="pubdt" type="text" id="pubdt" onClick="new Calendar().show(this);" value="<%=replace(date(),"/","-")%>" size="15" maxlength="15"  readonly="readonly"  />
      (������Ϣ������ʱ���Ⱥ����򣬿ɵ�������ʱ��)	  </td>
    </tr>
    
    <tr> 
      <td height="25" align="right" valign="top"><font color="#FF0000">*</font>�������ݣ�</td>
      <td valign="top"> <textarea name="newcontent" style="display:none"></textarea>
        <IFRAME ID="eWebEditor1" src="edit/ewebeditor.htm?id=newcontent&style=coolblue&savepathfilename=d_savepathfilename" frameborder="0" scrolling="no" width="550" height="350"></IFRAME></td>
    </tr>
    
    <tr> 
      <td height="35" align="center">&nbsp;</td>
      <td height="30"><input type="submit" name="Submit" value="�ύ" class="but2" /></td>
    </tr>
  </form>
  <tr> 
    <td height="30" colspan="2" align="center">&nbsp;</td>
  </tr>
</table>
</body>
</html>
