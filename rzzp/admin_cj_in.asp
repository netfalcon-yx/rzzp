<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>考场成绩导入</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<%
jid=request.QueryString("jid")
if jid<>"" then
	jid=intsql(jid)
	set rs=server.CreateObject("adodb.recordset")
	sql="select jname from tb_job where jid="&jid
	rs.open sql,conn,1,1
	if not rs.eof then	jname=rs("jname")
	rs.close
else
	msg "参数出错！","-1"
end if
%>
<body>
<form action="admin_upload_cj.asp" method="post" enctype="multipart/form-data" name="form1" onsubmit="javascript:return chkfiletype()">
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:600px;">
        <tr>
          <th height="25" align="center">成绩Excel文件导入</th>
        </tr>
        
        <tr>
          <td height="30" bgcolor="#FBFBF9">招聘名称：<b><%=jname%></b></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FBFBF9">成绩类型：
            <select name="cjtype" size="1" id="cjtype">
              <option value="1">笔试成绩</option>
              <option value="2">面试成绩</option>
          </select></td>
        </tr>
        <tr>
          <td height="30" bgcolor="#FBFBF9">成绩文件：
            <input name="file1" type="file" class="smallInput" size="50" maxlength="50">
            （Excel格式）</td>
        </tr>
        
        <tr>
          <td height="35" align="center" bgcolor="#FBFBF9">
              <input name="Submit" type="submit" class="but2" value="上 传">
              &nbsp;&nbsp;
            <input name="Submit" type="reset" class="but1" value="重 置">
            <input name="hdjid" type="hidden" id="hdjid" value="<%=jid%>" /></td>
        </tr>
        <tr>
          <td height="40" align="center" bgcolor="#FBFBF9"><img src="icon/down-11.gif" width="16" height="16" align="absmiddle" /><a href="doc/cj_moban.xls" target="_blank"> 成绩Excel文件模板</a>（说明：模板文件自带两条示例数据，上传时请删除）</td>
        </tr>
  </table>
</form>
<script language="javascript">
function chkfiletype()
{
	fname=document.form1.file1.value;
	if(fname=="")
	{
	alert('请选择您要上传的Excel文件！');
	return false;
	}
	else
	{
	return true;
	}
}
</script>
</body>
</html>