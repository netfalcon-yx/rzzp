<!--#include file="conn.asp"-->
<%chku 1%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����޸�</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="chkfm.js"></script>
</head>
<%

sql="select uphoto from tb_user where uid="&session("uid")
set rs=server.CreateObject("ADODB.RecordSet")
rs.open sql,conn,1,1
if not rs.eof then
	uphoto=rs(0)
	if uphoto="" or isnull(uphoto) then
		uphoto="doc/nophoto.jpg"
	else
		uphoto="doc/"&uphoto
	end if
end if
rs.close
%>
<body>
<form action="u_photosave.asp" method="post" enctype="multipart/form-data" name="form1" id="form1" onSubmit="return Validator.Validate(this,1)">
<table  border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:500px;padding-left:5px;margin-top:10px">
  <tr>
    <th height="35" colspan="2" align="center" class="qtx">������Ƭ����</td>    </tr>
  <tr>
    <td colspan="2" align="center" style="height:180px;"><img src="<%=uphoto%>" class="uphoto2" id="picdemo" /></td>
    </tr>
  <tr>
    <td width="25%" height="35" align="right" bgcolor="#F7F7FF">������Ƭ��</td>
    <td width="75%" bgcolor="#FFFFFF"><label>
      <input name="file" type="file" size="40" dataType="Require" msg="��ѡ��Ҫ�ϴ�����Ƭ��" onchange="document.all.picdemo.src=this.value" />
    </label></td>
  </tr>
  <tr>
    <td height="35" align="right" bgcolor="#FFFFFF">˵����</td>
    <td bgcolor="#FFFFFF"><p>1����Ƭ��СΪ��10K��1M���ڣ��ߴ��߱���Ϊ3:4���������120*160����ʽΪ��JPG��<br />
    2����Ƭ����׼��֤��ӡ�������ڱ���ǰ�����ϴ���Ƭ��<br />
	3����ƬӦΪ����1����ڵǼ��ա�</p>
      </td>
  </tr>
  <tr>
    <td height="35" align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF"><label>
      <input name="Submit" type="button" class="but2" value="ȷ��" onclick="chkimginfo()" />
    </label></td>
  </tr>
</table>
</form>
<script language="javascript" type="text/javascript"> 
function chkimginfo() 
{ 
var img=new Image(); 
var imgurl=document.all.file.value;
var point = imgurl.lastIndexOf(".");
var type = imgurl.substr(point);
var chkflag=true;
if(type!=".jpg" && type!=".JPG")
{
	chkflag=geterr("���ϴ�jpg��ʽ����Ƭ!");
}
//�ж��Ƿ�IE6
var isIE6= /msie 6/i.test(navigator.userAgent);
if(isIE6)
{
	img.src=imgurl;
	var imgw=img.width;
	var imgh= img.height;
	var imgsize=(img.fileSize/1024).toFixed(2);
	//alert(imgw+"|"+imgh+"|"+imgsize);
	if(imgw<120 || imgh<160)
		{
		chkflag=geterr("��Ƭ�����ز��ܵ���120*160����!");
		} 
	if(imgsize>1000 || imgsize<10)
		{
		chkflag=geterr("��Ƭ�Ĵ�С���ܵ���10K�򳬳�1M!");
		}
}
if(chkflag)document.form1.submit();

}
function geterr(errtxt)
{
	alert(errtxt);
	document.all.file.value="";
	return false;
}
</script> 
</body>
</html>
