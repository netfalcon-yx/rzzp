<!--#include file="conn.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�ޱ����ĵ�</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<%
chku 9
d_sta=""
sub updata()
	db=server.mappath("db/#pubjob.mdb")
	bkfolder=Server.MapPath(".")&"\db"
	bkname=bkfolder&"\#"&replace(replace(replace(now(),":",""),"/","")," ","#")&".mdb"
	Set Fso=server.createobject("scripting.filesystemobject")
	fso.copyfile db,bkname
	Set Fso = nothing
	if err.number<>0 then
		d_sta="�������ݿ����<br>"
		rw err.description
		err.clear
		response.End()
	else
		d_sta="�������ݿ�ɹ���<br>"
	end if
end sub

if request.Form("cpsw")<>"" then
	if request.Form("cpsw")="!hbsgcc" then
		'�ȱ������ݿ���˵
		updata()
		'response.End()
		'����������	
		sql="delete from tb_bm"
		conn.execute sql
		
		sql="alter table tb_bm alter column id autoincrement(1,1)"
		conn.execute sql
		if err.number<>0 then
			d_sta=d_sta&"����������ݳ���<br>"
			err.clear
		else
			d_sta=d_sta&"����������ݳɹ���<br>"
		end if
		
		'���׼��֤	
		sql="delete from tb_zkz"
		conn.execute sql		
		if err.number<>0 then
			d_sta=d_sta&"���׼��֤���ݳ���<br>"
			err.clear
		else
			d_sta=d_sta&"���׼��֤���ݳɹ���<br>"
		end if
		
		'������Գɼ�	
		sql="delete from tb_cj"
		conn.execute sql
		sql="alter table tb_cj alter column id autoincrement(1,1)"
		conn.execute sql
				
		if err.number<>0 then
			d_sta=d_sta&"������Գɼ����ݳ���<br>"
			err.clear
		else
			d_sta=d_sta&"������Գɼ����ݳɹ���<br>"
		end if
		
		'����û�ע������	
		sql="delete from tb_user"
		conn.execute sql
		sql="alter table tb_user alter column uid autoincrement(1,1)"
		conn.execute sql
		
		if err.number<>0 then
			d_sta=d_sta&"����û�ע�����ݳ���<br>"
			err.clear
		else
			d_sta=d_sta&"����û�ע�����ݳɹ���<br>"
		end if
		
		'����û���������	
		sql="delete from tb_ufile"
		conn.execute sql
		sql="alter table tb_ufile alter column id autoincrement(1,1)"
		conn.execute sql
		
		if err.number<>0 then
			d_sta=d_sta&"����û��������ݳ���<br>"
			err.clear
		else
			d_sta=d_sta&"����û��������ݳɹ���<br>"
		end if
		
		'������㵥λ�û���ϵ��ʽ����	
		'sql="update tb_duser set duname=null,gw=null,tel=null,mb=null,email=null"
		'conn.execute sql
		
		'if err.number<>0 then
			'd_sta=d_sta&"�����λ�û���ϵ��ʽ����<br>"
			'err.clear
		'else
			'd_sta=d_sta&"�����λ�û���ϵ��ʽ�ɹ���<br>"
		'end if
		'�����λ����	
		sql="delete from tb_gw"
		conn.execute sql
		
		if err.number<>0 then
			d_sta=d_sta&"�����λ���ݳ���<br>"
			err.clear
		else
			d_sta=d_sta&"�����λ���ݳɹ���<br>"
		end if

		
	else
		msg "��������ȷ�ķ�ɾ�����룡","-1"
	end if
	
end if

%>
<body>
<form id="form1" name="form1" method="post" action="admin_data_clear.asp?dt=<%=now()%>">
  <table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:600px;">
    <tr>
      <td colspan="2" align="center"><strong>ɾ����ʱ����</strong></td>
    </tr>
    <tr>
      <td width="20%" align="right" class="btz">˵����</td>
      <td>�˲���������ʽʹ��ǰ��ɾ��֮ǰ��һЩ����ģ�����ݣ��������û�ע����Ϣ��������Ϣ���ɼ���Ϣ��������Ϣ�ȣ���<span class="redfont">��ʽͶ��ʹ�ú��в��ɽ��д˲���������ɾ�������û�������</span>��</td>
    </tr>
    <tr>
      <td align="right">ɾ�����룺</td>
      <td><label>
        <input name="cpsw" type="password" id="cpsw" />
        <input name="Submit" type="submit" class="but2" value="�������" />
      ��Ϊ��ֹ����ɾ�����ݣ��������˷�ɾ�����룬������ȷ����������ɾ������</label></td>
    </tr>
    <tr>
      <td align="right">ɾ��״̬��</td>
      <td><%=d_sta%></td>
    </tr>
  </table>
</form>
</body>
</html>
