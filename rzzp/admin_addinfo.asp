<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="style.css" type="text/css">
<title>添加新闻公告</title>
<script language="javascript" src="calendar.js"></script>
</head>
<script language = "JavaScript"> 

	// 表单提交客户端检测
	function doCheck(){

		if (document.myform.title.value==""){
			alert("新闻标题不能为空！");
			return false;
		}
		if (document.myform.ntype.value==""){
			alert("新闻类型不能为空！");
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
<body leftmargin="0" topmargin="0">

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable">
  <form name="myform" method="post" action="admin_addinfo_ok.asp" onSubmit="return doCheck();">
    <tr> 
      <th height="30" colspan="2" align="center">新增信息录入</th>
    </tr>
    <tr> 
      <td height="25" align="right"><font color="#FF0000">*</font>新闻标题：</td>
      <td>
<input name="title" type="text" class="input" size="70"></td>
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
	<input name="strong" type="radio" class="radio" value="0" checked >
	普通 </label>
	<label>
	<input name="strong" type="radio" class="radio" value="1" >
	加粗</label>	  </td>
    </tr>
    <tr> 
      <td height="25" align="right">置顶显示：</td>
      <td><label>
        <input name="istop" type="radio" class="radio" value="false" checked>
否 </label>
        <label>
        <input name="istop" type="radio" class="radio" value="true">
是</label></td>
    </tr>
    
    <tr>
      <td height="25" align="right">发布时间：</td>
      <td valign="top">	  
      <input name="pubdt" type="text" id="pubdt" onClick="new Calendar().show(this);" value="<%=replace(date(),"/","-")%>" size="15" maxlength="15"  readonly="readonly"  />
      (新闻信息按发布时间先后排序，可调整发布时间)	  </td>
    </tr>
    
    <tr> 
      <td height="25" align="right" valign="top"><font color="#FF0000">*</font>新闻内容：</td>
      <td valign="top"> <textarea name="newcontent" style="display:none"></textarea>
        <IFRAME ID="eWebEditor1" src="edit/ewebeditor.htm?id=newcontent&style=coolblue&savepathfilename=d_savepathfilename" frameborder="0" scrolling="no" width="550" height="350"></IFRAME></td>
    </tr>
    
    <tr> 
      <td height="35" align="center">&nbsp;</td>
      <td height="30"><input type="submit" name="Submit" value="提交" class="but2" /></td>
    </tr>
  </form>
  <tr> 
    <td height="30" colspan="2" align="center">&nbsp;</td>
  </tr>
</table>
</body>
</html>
