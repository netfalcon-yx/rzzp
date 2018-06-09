<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style.css" rel="stylesheet" type="text/css">
<title>添加新闻</title>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<script language="javascript" type="text/javascript" src="calendar.js"></script>
<script language = "JavaScript">

	// 表单提交客户端检测
	function doCheck(){

		if (document.myform.title.value==""){
			alert("新闻标题不能为空！");
			return false;
		}
		// getHTML()为eWebEditor自带的接口函数，功能为取编辑区的内容
		if (eWebEditor1.getHTML()==""){
			alert("新闻内容不能为空！");
			return false;
		}

		// 表单有效性检测完后，自动上传远程文件
		// 函数：remoteUpload(strEventUploadAfter)
		// 参数：strEventUploadAfter ; 上传完后，触发的函数名，如果上传完后不需动作可不填参数
		//eWebEditor1.remoteUpload("doSubmit()");
		return true;

	}

	// 表单提交（当远程上传完成后，触发此函数）
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
	response.Write("没有记录")
else
%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable">
  <form name="myform" method="post" action="admin_saveinfomodi.asp" onSubmit="return doCheck();">
    <tr> 
      <th height="30" colspan="2" align="center">信 息 修 改</th>
    </tr>
    <tr> 
      <td height="25" align="right"><font color="#FF0000">*</font>新闻标题：</td>
      <td>
<input name="title" type="text" class="input" value="<%=rso("title")%>" size="70"></td>
    </tr>
	<tr>
      <td height="25" align="right">信息类型：</td>
	  <td><label>
        <select name="ntype" size="1" id="ntype">
          <option value="">选择信息类型</option>
          <option value="1">新闻公告</option>
          <option value="2">考试须知</option>
          <option value="3">诚信承诺</option>
          <option value="4">内部资料</option>
        </select>
      </label></td>
    </tr>
	<tr>
      <td height="25" align="right">标题设置：</td>
      <td><select name="tcolor" type="text" id="tcolor">
	  <option value="">默认颜色</option>
	  <option value="#FF0000" style="background-color:#FF0000;"></option>
	  <option value="#0000FF" style="background-color:#0000FF;"></option>
	  <option value="#00FFFF" style="background-color:#00FFFF;"></option>
	  <option value="#FF9900" style="background-color:#FF9900;"></option>
	  <option value="#339966" style="background-color:#339966;"></option>
	</select>
	<label> 加粗：
	<input name="strong" type="radio" class="radio" value="0" <%if rso("tfont")=false then response.write("checked")%> >
	普通 </label>
	<label>
	<input name="strong" type="radio" class="radio" value="1" <%if rso("tfont")=true then response.write("checked")%>>
	加粗</label>
	<script language="javascript">document.myform.ntype.value="<%=rso("ntype")%>";document.myform.tcolor.value="<%=rso("tcolor")%>";</script>
	  <input name="newsid" type="hidden" id="newsid" value="<%=newsid%>"></td>
    </tr>
    <tr> 
      <td height="25" align="right">是否置顶：</td>
      <td>
        <label>
        <input name="istop" type="radio" class="radio" value="false" <%if rso("istop")=false then response.Write("checked")%>>
否 </label>
        <label>
        <input name="istop" type="radio" class="radio" value="true" <%if rso("istop")=true then response.Write("checked")%>>
是</label></td>
    </tr>
     <tr>
      <td height="25" align="right">显示状态：</td>
      <td valign="top"><input name="ishow" type="radio" class="radio" id="radio" value="1" <%if rso("ishow") then rw " checked" %> />
        正常显示 
          <input name="ishow" type="radio" class="radio" id="radio2" value="0" <%if rso("ishow")=false then rw " checked" %> />
隐藏 </td>
    </tr>
    <tr>
      <td height="25" align="right">发布时间：</td>
      <td valign="top"><input name="pubdt" type="text" id="pubdt" onClick="new Calendar().show(this);" value="<%=replace(rso("infotime"),"/","-")%>" size="15" maxlength="15"  readonly="readonly"  />
      (新闻信息按发布时间先后排序，可调整发布时间)</td>
    </tr>
    
    <tr> 
      <td height="25" align="right" valign="top"><font color="#FF0000">*</font>新闻内容：</td>
      <td valign="top"> <textarea name="newcontent" style="display:none"><%=Server.HtmlEncode(rso("Content"))%></textarea>
        <IFRAME ID="eWebEditor1" src="edit/ewebeditor.htm?id=newcontent&style=coolblue&savepathfilename=d_savepathfilename" frameborder="0" scrolling="no" width="550" height="350"></IFRAME></td>
    </tr>
    
    <tr> 
      <td height="30" align="center">&nbsp;</td>
      <td height="30"><input type="submit" name="Submit" value="提交" class="but2" /></td>
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
' 把字符串进行HTML解码,替换server.htmlencode
' 去除Html格式，用于显示输出
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
' 去除Html格式，用于从数据库中取出值填入输入框时
' 注意：value="?"这边一定要用双引号
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
