<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�û�ע����֪</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="comm.js"></script>
<script language="javascript" src="chkfm.js"></script>
<script language="javascript" src="laydate/laydate.js"></script>
</head>

<body>
<div class="maintop" id="maintop">
	<div id="logotxt"></div>
</div>

<div class="umain">
<div class="unav">��ǰλ�ã�������ҳ -> ����ע��</div>
<form id="form1" name="form1" method="post" action="u_savereg.asp" onSubmit="return Validator.Validate(this,3)">
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#F2F2F2" style="line-height:25px;padding-left:4px">
    <tr>
      <td width="20%" align="right" bgcolor="#FFFFFF">���֤�ţ�</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="lgname" type="text" id="lgname" size="35" maxlength="18" require="true" dataType="LimitB" min="18" max="18"  msg="������18λ���ȵ����֤�ţ�" />
      </label> <a href="javascript:void(0)" onclick="chku()">����ظ�</a><span id="chksid"></span></td>
      <td width="25%" bgcolor="#FFFFFF" class="redfont">*18λ�������֤��ע��</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">��¼���룺</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="psw" type="password" id="psw" maxlength="20" require="true" dataType="LimitB" min="3" max="20"  msg="������3��20λ���룡" />
      </label></td>
      <td bgcolor="#FFFFFF" class="redfont">*3��20λ��ĸ���������</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">ȷ�����룺</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="psw2" type="password" id="psw2" dataType="Repeat" to="psw" msg="������������벻һ��" />
      </label></td>
      <td bgcolor="#FFFFFF" class="redfont">*3��20λ��ĸ���������</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">��ʵ������</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="uname" type="text" id="uname" maxlength="20" dataType="Require" msg="��������ʵ������" />
      </label></td>
      <td bgcolor="#FFFFFF" class="redfont">*</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">������λ��</td>
      <td bgcolor="#FFFFFF"><label>
        <select name="gzdw" size="1" id="gzdw" dataType="Require" msg="�����빤����λ��" >
          <option value="">--ѡ��λ--</option>
          <%
		set rs=server.CreateObject("adodb.recordset")
		sql="select * from tb_duser"
		rs.open sql,conn,1,1
		while not rs.eof
			rw "<option value="&rs("uid")&">"&rs("dname")&"</option>"&chr(13)
			rs.movenext
		wend
		rs.close
		%>
          </select>
        </label></td>
      <td bgcolor="#FFFFFF" class="redfont">&nbsp;</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">�������ڣ�</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="birthday" type="text" id="birthday" placeholder="YYYY-MM-DD" onclick="laydate()" dataType="Require" msg="������������£�" readonly  />
        </label></td>
      <td bgcolor="#FFFFFF" class="redfont">*</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">�� ��</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="sex" type="radio" class="radio" value="��" checked="checked" />
      �� 
      <input name="sex" type="radio" class="radio" value="Ů" dataType="Group" msg="��ѡ���Ա�"  />
      Ů</label></td>
      <td bgcolor="#FFFFFF" class="redfont">*</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">�� �壺</td>
      <td bgcolor="#FFFFFF"><label>
        <select name="mz" size="1" id="mz" dataType="Require" msg="��ѡ������" >
          <option value="">��ѡ������</option>
		   <option value="����">����</option>
            <option value="�ɹ���">�ɹ���</option>
            <option value="����">����</option>
            <option value="����">����</option>
            <option value="��������">��������</option>
            <option value="���">���</option>
            <option value="������">������</option>
            <option value="������">������</option>
            <option value="������">������</option>
            <option value="ŭ��">ŭ��</option>
            <option value="������">������</option>
            <option value="���״���">���״���</option>
            <option value="����">����</option>
            <option value="׳��">׳��</option>
            <option value="����">����</option>
            <option value="����">����</option>
            <option value="��ɽ��">��ɽ��</option>
            <option value="������">������</option>
            <option value="Ǽ��">Ǽ��</option>
            <option value="������">������</option>
            <option value="���α����">���α����</option>
            <option value="ԣ����">ԣ����</option>
            <option value="������">������</option>
            <option value="����">����</option>
            <option value="������">������</option>
            <option value="����">����</option>
            <option value="����">����</option>
            <option value="������">������</option>
            <option value="�¶�������">�¶�������</option>
            <option value="������">������</option>
            <option value="������">������</option>
            <option value="����˹��">����˹��</option>
            <option value="����">����</option>
            <option value="�Ű���">�Ű���</option>
            <option value="ά�����">ά�����</option>
            <option value="������">������</option>
            <option value="������">������</option>
            <option value="������">������</option>
            <option value="ˮ��">ˮ��</option>
            <option value="����">����</option>
            <option value="������">������</option>
            <option value="������">������</option>
            <option value="���¿���">���¿���</option>
            <option value="��������">��������</option>
            <option value="�����">�����</option>
            <option value="����">����</option>
            <option value="����">����</option>
            <option value="������">������</option>
            <option value="����">����</option>
            <option value="������">������</option>
            <option value="���Ӷ���">���Ӷ���</option>
            <option value="ë����">ë����</option>
            <option value="��������">��������</option>
            <option value="�°���">�°���</option>
            <option value="������">������</option>
            <option value="��ŵ��">��ŵ��</option>
        </select>
      </label></td>
      <td bgcolor="#FFFFFF" class="redfont">*</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">����״����</td>
      <td bgcolor="#FFFFFF"><input name="hy" type="radio" class="radio" value="δ��" />
δ��
  <input name="hy" type="radio" class="radio" value="�ѻ�" />
  �ѻ� 
  <label>
  <input name="hy" type="radio" class="radio" value="����" dataType="Group" msg="��ѡ�����״��"  />
  ����</label></td>
      <td bgcolor="#FFFFFF" class="redfont">*</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">���᣺</td>
      <td bgcolor="#FFFFFF"><label>
      <input name="jg" type="text" id="jg" dataType="Require" msg="����������أ�" />
      �磺��������</label></td>
      <td bgcolor="#FFFFFF" class="redfont">*</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">�����أ�</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="hj" type="text" id="hj" size="35" dataType="Require" msg="�����뻧�����ڵأ�" />
        �磺��������</label></td>
      <td bgcolor="#FFFFFF" class="redfont">*</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">�̶��绰��</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="tel" type="text" id="tel" size="35"  />
        </label></td>
      <td bgcolor="#FFFFFF" class="redfont">&nbsp;</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">�ֻ����룺</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="mb" type="text" id="mb" size="35" maxlength="11" dataType="Require" msg="�������ֻ����룡" />
      </label></td>
      <td bgcolor="#FFFFFF" class="redfont">*</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">����E-Mail��</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="email" type="text" id="email" size="35" />
      </label></td>
      <td bgcolor="#FFFFFF" class="redfont">&nbsp;</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">����״����</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="st" type="text" id="st" dataType="Require" msg="����������״����"  />
        �磺���������á�һ��</label></td>
      <td bgcolor="#FFFFFF" class="redfont">*</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
      <td colspan="2" bgcolor="#FFFFFF"><label>
        <input name="ureg" type="submit" class="but1" id="ureg" value="ע ��" />
        &nbsp;
        <input name="ucancel" type="button" class="but2" id="ucancel" value="ȡ��" onclick="location.href='login.asp'" />
        ˵������*��Ϊ������</label></td>
    </tr>
  </table>
</form>
</div>
<script language="javascript">
//��ֹ���˼� ������Firefox��Opera  
document.onkeypress=banBackSpace;  
//��ֹ���˼�  ������IE��Chrome  
document.onkeydown=banBackSpace;  
function chku()
{
	//var usid=$F("sid");
	var usid=document.getElementById("lgname").value;
	if(usid=="")
	{
	alert("���֤�Ų���Ϊ�գ�");
	return;
	}
	var http_request=InitAjax();
	url="chkusid.asp?sid="+usid+"&number="+Math.random();
    http_request.open('GET', url, false); 
    http_request.send(null); 
   
  if (http_request.readyState == 4)  
���� { 
  ������// �յ������ķ�������Ӧ  
  ������if (http_request.status == 200) { 
��������  //HTTP��������Ӧ��ֵOK 
��������  requestdoc = http_request.responseText;  
��������  //�����������ص��ַ���д��ҳ����IDΪmessage������  
    }  
������   else { 
��������  requestdoc = http_request.status; 
������   } 
����  }
	//document.getElementById("chksid").innerHTML=requestdoc;
	//alert(requestdoc);
	if(requestdoc!="1") 
		document.getElementById("chksid").innerHTML="<font color=#FF0000>�����֤���ظ���</font>";
	else
		document.getElementById("chksid").innerHTML="<font color=#0000FF>�̿���ע��</font>";
  //return requestdoc; 
	//var ResultStr=getResponseText("chkusid.asp?sid="+usid);
	
}

function InitAjax()
{
var ajax;
if(window.ActiveXObject){
var versions = ['Microsoft.XMLHTTP', 'MSXML.XMLHTTP', 'Microsoft.XMLHTTP', 'Msxml2.XMLHTTP.7.0', 'Msxml2.XMLHTTP.6.0', 'Msxml2.XMLHTTP.5.0', 'Msxml2.XMLHTTP.4.0', 'MSXML2.XMLHTTP.3.0', 'MSXML2.XMLHTTP'];
for(var i=0; i <versions.length; i++) {
try {
ajax = new ActiveXObject(versions[i]);
if(ajax) {
return ajax;
}
} catch(e) {e.description}

}
}
else if(window.XMLHttpRequest)
{
ajax = new XMLHttpRequest();
}

return ajax;
}

</script>
</body>
</html>
