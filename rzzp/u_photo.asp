<!--#include file="conn.asp"-->
<%chku 1%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>密码修改</title>
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
    <th height="35" colspan="2" align="center" class="qtx">个人照片管理</td>    </tr>
  <tr>
    <td colspan="2" align="center" style="height:180px;"><img src="<%=uphoto%>" class="uphoto2" id="picdemo" /></td>
    </tr>
  <tr>
    <td width="25%" height="35" align="right" bgcolor="#F7F7FF">更新照片：</td>
    <td width="75%" bgcolor="#FFFFFF"><label>
      <input name="file" type="file" size="40" dataType="Require" msg="请选择要上传的照片！" onchange="document.all.picdemo.src=this.value" />
    </label></td>
  </tr>
  <tr>
    <td height="35" align="right" bgcolor="#FFFFFF">说明：</td>
    <td bgcolor="#FFFFFF"><p>1、照片大小为：10K至1M以内，尺寸宽高比例为3:4，最低像素120*160，格式为：JPG。<br />
    2、照片用于准考证打印，所以在报名前请先上传照片。<br />
	3、照片应为近期1寸免冠登记照。</p>
      </td>
  </tr>
  <tr>
    <td height="35" align="right" bgcolor="#FFFFFF">&nbsp;</td>
    <td bgcolor="#FFFFFF"><label>
      <input name="Submit" type="button" class="but2" value="确定" onclick="chkimginfo()" />
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
	chkflag=geterr("请上传jpg格式的照片!");
}
//判断是否IE6
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
		chkflag=geterr("照片的像素不能低于120*160像素!");
		} 
	if(imgsize>1000 || imgsize<10)
		{
		chkflag=geterr("照片的大小不能低于10K或超出1M!");
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
