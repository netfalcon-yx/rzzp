<!--#Include File="conn.Asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�û����������޸�</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="chkfm.js"></script>
<script language="javascript" src="comm.js"></script>
<script language="javascript" src="laydate/laydate.js"></script>
</head>

<body>
<%
'chku 1
sql=""
muid=request.QueryString("uid")
'if session("utype")<>1 and session("utype")<>9 then msg "Ȩ�޲����޷��༭ע�����ϣ�","-1"
'if session("uid")="" or isnull(session("uid")) then msg "��û�е�¼���¼��Ϣ�ѳ�ʱ�������µ�¼��","-1"
chku 0

if session("utype")=1 then
	sql="select * from tb_user where uid="&session("uid")
elseif session("utype")=2 then
	if muid="" then msg "�û���������","-1"
	sql="select * from tb_user where uid="&muid&" and did="&session("duid")
elseif session("utype")=9 then
	if muid="" then msg "�û���������","-1"
	sql="select * from tb_user where uid="&muid
end if
if sql="" then msg "�û���������","-1"

set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if not rs.eof then
%>
<div class="unav">��ǰλ�ã�������ҳ -> ������Ϣ�޸�</div>
<form id="form1" name="form1" method="post" action="u_savemdf.asp?uid=<%=muid%>" onSubmit="return Validator.Validate(this,3)">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F2F2F2" class="mytable" style="line-height:30px;padding-left:4px">
    <tr>
      <td align="right" bgcolor="#FFFFF7">���֤���룺</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="card" type="text" id="card" size="35"  value="<%=rs("card")%>" readonly style="background:#EFEFEF" />
      </label></td>
      <td bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td width="20%" align="right" bgcolor="#FFFFF7">��ʵ������</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="uname" type="text" id="uname" maxlength="20" dataType="Require" msg="��������ʵ������" value="<%=rs("uname")%>" />
      </label></td>
      <td width="30%" bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">������λ��</td>
      <td bgcolor="#FFFFFF">
	  <select name="gzdw" size="1" id="gzdw" dataType="Require" msg="�����빤����λ��" >
		<option value="">--ѡ��λ--</option>
		<%
		sql2="select * from tb_duser"
		set rs2=server.createobject("adodb.recordset")
		rs2.open sql2,conn,1,1
		while not rs2.eof
			tempdw=""
			if rs2("uid")=rs("did") then tempdw="selected"
			rw "<option value="&rs2("uid")&" "&tempdw&">"&rs2("dname")&"</option>"&chr(13)
			rs2.movenext
		wend
		rs2.close
		set rs2=nothing
		%>
        </select></td>
      <td bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    
    <tr>
      <td align="right" bgcolor="#FFFFF7">��������</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="birthday" type="text" id="birthday" onclick="laydate()" dataType="Require" msg="������������£�" readonly value="<%=rs("birthday")%>" />
      </label></td>
      <td bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">�� ��</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="sex" type="radio" class="radio" value="��" <%if rs("sex")="��" then rw "checked"%> />
      �� 
      <input name="sex" type="radio" class="radio" value="Ů" dataType="Group" msg="��ѡ���Ա�" <%if rs("sex")="Ů" then rw "checked"%> />
      Ů</label></td>
      <td bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">�� �壺</td>
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
      </label><script language="javascript">$("mz").value="<%=rs("mz")%>";</script></td>
      <td bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">����״����</td>
      <td bgcolor="#FFFFFF"><input name="hy" type="radio" class="radio" value="δ��" <%if rs("hy")="δ��" then rw "checked"%> />
δ��
  <input name="hy" type="radio" class="radio" value="�ѻ�" <%if rs("hy")="�ѻ�" then rw "checked"%> />
  �ѻ� 
  <label>
  <input name="hy" type="radio" class="radio" value="����" dataType="Group" msg="��ѡ�����״��" <%if rs("hy")="����" then rw "checked"%> />
  ����</label></td>
      <td bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">���᣺</td>
      <td bgcolor="#FFFFFF"><label>
      <input name="jg" type="text" id="jg" value="<%=rs("jg")%>" datatype="Require" msg="����������أ�" />
      </label>
<script language="javascript">$("jg").value="<%=rs("jg")%>";</script></td>
      <td bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">�����أ�</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="hj" type="text" id="hj" size="35" dataType="Require" msg="�����뻧�����ڵأ�" value="<%=rs("hj")%>" />
      </label></td>
      <td bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">�̶��绰��</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="tel" type="text" id="tel" size="35" value="<%=rs("tel")%>" />
      </label></td>
      <td bgcolor="#FFFFFF"></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">�ֻ����룺</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="mb" type="text" id="mb" size="35" dataType="Require" msg="�������ֻ����룡"  value="<%=rs("mb")%>" />
      </label></td>
      <td bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">�������䣺</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="email" type="text" id="email" size="35" value="<%=rs("email")%>" />
      </label></td>
      <td bgcolor="#FFFFFF"></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">����״����</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="st" type="text" id="st" value="<%=rs("st")%>" dataType="Require" msg="����������״����" />
      �磺���������á�һ��</label></td>
      <td bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
      <td colspan="2" bgcolor="#FFFFFF"><label>
        <input name="ureg" type="submit" class="but1" id="ureg" value="�� ��" />
      &nbsp;
      <input name="ucancel" type="button" class="but2" id="ucancel" value="ȡ��" onclick="history.back()" />
      ˵������<span class="redfont">*</span>��Ϊ������</label></td>
    </tr>
  </table>
</form>
<%
end if
rs.close
set rs=nothing
%>
<script language="javascript">
//��ֹ���˼� ������Firefox��Opera  
document.onkeypress=banBackSpace;  
//��ֹ���˼�  ������IE��Chrome  
document.onkeydown=banBackSpace;  
</script>
</body>
</html>
