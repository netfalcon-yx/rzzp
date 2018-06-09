<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>学生信息导入</title>
<link href="css.css" rel="stylesheet" type="text/css" />
<script type="text/jscript" src="js/jquery-1.11.1.min.js"></script>
</head>
<%
chkadmin
%>
<body>
<table width="750"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000">
  <tr>
    <td bgcolor="#FFFFFF"><form action="uploadexcel.asp" method="post" enctype="multipart/form-data" name="form1" onsubmit="return(chkfiletype())";>
      <table width="100%"  border="0">
        <tr>
          <td height="25" bgcolor="#99CCFF"><div align="center" style="font-weight: bold">学生信息Excel文档上传</div></td>
        </tr>
        
        <tr>
          <td bgcolor="#FBFBF9">&nbsp;Excel路径：
            <input name="file1" type="file" size="45" maxlength="50"><span class='redtip'></span></td>
        </tr>
        
        <tr>
          <td bgcolor="#FBFBF9"><div align="center">
              <input name="fsubmit" type="submit" class="but2" id="fsubmit" value="上 传" />
          </div></td>
        </tr>
        <tr>
          <td height="40" align="center" bgcolor="#FBFBF9"><img src="ico/71.gif" width="16" height="16" align="absmiddle" /><a href="excel/student-mod.xls" target="_blank"> 学生信息Excel模板</a>（说明：模板文件自带两条示例数据，上传时请删除）</td>
        </tr>
      </table>
    </form></td>
  </tr>
</table>
<script language="javascript">
function chkfiletype()
{
   //上传文件不能为空，格式必须为xsl和xlsx
  var flag=true;
  var fileObject=$("input[name='file1']");
  var filepath=$("input[name='file1']").val();
  if(filepath==undefined||$.trim(filepath)==""){
   fileObject.focus().next().text("请选择上传文件！");
   flag=false;
  }else{
   var fileArr=filepath.split("//");
   var fileTArr=fileArr[fileArr.length-1].toLowerCase().split(".");
   var filetype=fileTArr[fileTArr.length-1];
   if(filetype!="xls"){
	fileObject.focus().next().text("文件必须为后缀为xls的Excel文件！");
	flag=false;
   }else{
	fileObject.next().text("");
   }
  }
  if(flag){$("#fsubmit").attr("disabled","disabled");$("#fsubmit").val("正在上传");}//;  
  return flag;
}
</script>
</body>
</html>
