<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>������Ƹ��Ϣ</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="laydate/laydate.js"></script>
<script language="javascript" src="chkfm.js"></script>
</head>
<%
jid=request.QueryString("jid")
if jid<>"" then
	jid=intsql(jid)
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from tb_job where jid="&jid
	rs.open sql,conn,1,1
	if not rs.eof then
		jname=rs("jname")
		btime=replace(rs("btime"),"/","-")
		etime=replace(rs("etime"),"/","-")
		jfile=rs("jfile")
		jfname=rs("jfname")
		zkzflag=rs("zkzflag")
		endflag=rs("endflag")
		jobsta=rs("jobtype")
		cjsta=rs("gkflag")
		bsbl=rs("bsbl")
		msbl=rs("msbl")
	end if
	rs.close
end if
%>
<body>
<form action="admin_jadd_save.asp" method="post" enctype="multipart/form-data" name="form1" id="form1" onSubmit="return Validator.Validate(this,1)">
  <table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:600px;">
    <tr>
      <td width="25%" align="right">��Ƹ���ƣ�</td>
      <td><label>
        <input name="jtit" type="text" id="jtit" size="50" require="true" msg="��������Ƹ���ƣ�" value="<%=jname%>" />
        <span class="redfont">*</span></label></td>
    </tr>
    <tr>
      <td align="right">������ʼʱ�䣺</td>
      <td><label>
        <input name="btime" type="text" id="btime" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss',istime: true})" require="true" msg="��������Ƹ��ʼʱ�䣡" value="<%=btime%>" />
        <span class="redfont">*</span></label></td>
    </tr>
    <tr>
      <td align="right">��������ʱ�䣺</td>
      <td><label>
        <input name="etime" type="text" id="etime" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss',istime: true})" require="true" msg="��������Ƹ��ֹʱ�䣡" value="<%=etime%>" />
        <span class="redfont">*</span> ��ֹ</label></td>
    </tr>
    <tr>
      <td align="right">��¼���ţ�</td>
      <td><label>
        <input name="jobsta" type="radio" class="radio" value="8" <%if jobsta=8 then rw "checked"%> />
      �ر� 
      <input name="jobsta" type="radio" class="radio" value="0" <%if jobsta=0 then rw "checked"%> />
      ����
      </label></td>
    </tr>
    <tr>
      <td align="right">�ɼ���ѯ��</td>
      <td><input name="cjsta" type="radio" class="radio" value="0" <%if cjsta=false then rw "checked"%> />
�ر�
  <input name="cjsta" type="radio" class="radio" value="1" <%if cjsta then rw "checked"%> />
���� </td>
    </tr>
    <tr>
      <td align="right">�ɼ�������</td>
      <td>����
        <input name="bsbl" type="text" id="bsbl" value="<%=bsbl%>" size="6" require="true" msg="��������Գɼ�������" />
%������
<input name="msbl" type="text" id="msbl" value="<%=msbl%>" size="6" require="true" msg="���������Գɼ�������"  />
% 
(�ٷֱ�)</td>
    </tr>
    <tr>
      <td align="right">׼��֤��ӡ��</td>
      <td>
      <input name="zkzflag" type="checkbox" class="radio" id="zkzflag" value="1" <%if zkzflag then rw "checked"%> />      
      ����(�����ÿ���,��ȷ������ˡ��ѷ��俼��,�����ÿ���ʱ��)</td>
    </tr>
    <tr>
      <td align="right">�Ƿ������</td>
      <td><label>
        <input name="isend" type="radio" class="radio" value="0"  <%if endflag<>true then rw "checked"%>/>
      ��
      <input name="isend" type="radio" class="radio" value="1" <%if endflag then rw "checked"%> />
      ��(����Ϊ��������ȷ���ɼ��ѹ�������Ƹ����ɣ�</label></td>
    </tr>
    <tr>
      <td align="right">�ĵ�˵����</td>
      <td><label>
        <input name="file" type="file" size="40" />
      </label></td>
    </tr>
	<%if jfname<>"" then%>
    <tr>
      <td align="right">&nbsp;</td>
      <td><label>
        <input name="joldfname" type="text" id="joldfname" size="50" readonly="true" value="<%=jfname%>" />
      </label>	  
        <a href="javascript:void(0)" onclick="document.getElementById('joldfname').value=''"><img src="icon/del_icon.gif" width="16" height="16" />ɾ��</a></td>
    </tr>
	<%end if%>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input name="jadd" type="submit" class="but2" id="jadd" value="�� ��" />
        <input name="hdjid" type="hidden" id="hdjid" value="<%=jid%>" />
      </label><%if jfname<>"" then rw "(˵��������Ҫ�ĵ�˵��ʱѡ��ɾ��)"%></td>
    </tr>
  </table>
</form>
</body>
</html>
