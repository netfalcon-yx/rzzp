<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>用户注册须知</title>
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
<div class="unav">当前位置：考生首页 -> 考生注册</div>
<form id="form1" name="form1" method="post" action="u_savereg.asp" onSubmit="return Validator.Validate(this,3)">
  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#F2F2F2" style="line-height:25px;padding-left:4px">
    <tr>
      <td width="20%" align="right" bgcolor="#FFFFFF">身份证号：</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="lgname" type="text" id="lgname" size="35" maxlength="18" require="true" dataType="LimitB" min="18" max="18"  msg="请输入18位长度的身份证号！" />
      </label> <a href="javascript:void(0)" onclick="chku()">检查重复</a><span id="chksid"></span></td>
      <td width="25%" bgcolor="#FFFFFF" class="redfont">*18位长度身份证号注册</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">登录密码：</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="psw" type="password" id="psw" maxlength="20" require="true" dataType="LimitB" min="3" max="20"  msg="请输入3至20位密码！" />
      </label></td>
      <td bgcolor="#FFFFFF" class="redfont">*3到20位字母或数字组合</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">确认密码：</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="psw2" type="password" id="psw2" dataType="Repeat" to="psw" msg="两次输入的密码不一致" />
      </label></td>
      <td bgcolor="#FFFFFF" class="redfont">*3到20位字母或数字组合</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">真实姓名：</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="uname" type="text" id="uname" maxlength="20" dataType="Require" msg="请输入真实姓名！" />
      </label></td>
      <td bgcolor="#FFFFFF" class="redfont">*</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">工作单位：</td>
      <td bgcolor="#FFFFFF"><label>
        <select name="gzdw" size="1" id="gzdw" dataType="Require" msg="请输入工作单位！" >
          <option value="">--选择单位--</option>
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
      <td align="right" bgcolor="#FFFFFF">出生日期：</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="birthday" type="text" id="birthday" placeholder="YYYY-MM-DD" onclick="laydate()" dataType="Require" msg="请输入出生年月！" readonly  />
        </label></td>
      <td bgcolor="#FFFFFF" class="redfont">*</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">性 别：</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="sex" type="radio" class="radio" value="男" checked="checked" />
      男 
      <input name="sex" type="radio" class="radio" value="女" dataType="Group" msg="请选择性别"  />
      女</label></td>
      <td bgcolor="#FFFFFF" class="redfont">*</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">民 族：</td>
      <td bgcolor="#FFFFFF"><label>
        <select name="mz" size="1" id="mz" dataType="Require" msg="请选择民族" >
          <option value="">请选择民族</option>
		   <option value="汉族">汉族</option>
            <option value="蒙古族">蒙古族</option>
            <option value="彝族">彝族</option>
            <option value="侗族">侗族</option>
            <option value="哈萨克族">哈萨克族</option>
            <option value="畲族">畲族</option>
            <option value="纳西族">纳西族</option>
            <option value="仫佬族">仫佬族</option>
            <option value="仡佬族">仡佬族</option>
            <option value="怒族">怒族</option>
            <option value="保安族">保安族</option>
            <option value="鄂伦春族">鄂伦春族</option>
            <option value="回族">回族</option>
            <option value="壮族">壮族</option>
            <option value="瑶族">瑶族</option>
            <option value="傣族">傣族</option>
            <option value="高山族">高山族</option>
            <option value="景颇族">景颇族</option>
            <option value="羌族">羌族</option>
            <option value="锡伯族">锡伯族</option>
            <option value="乌孜别克族">乌孜别克族</option>
            <option value="裕固族">裕固族</option>
            <option value="赫哲族">赫哲族</option>
            <option value="藏族">藏族</option>
            <option value="布依族">布依族</option>
            <option value="白族">白族</option>
            <option value="黎族">黎族</option>
            <option value="拉祜族">拉祜族</option>
            <option value="柯尔克孜族">柯尔克孜族</option>
            <option value="布朗族">布朗族</option>
            <option value="阿昌族">阿昌族</option>
            <option value="俄罗斯族">俄罗斯族</option>
            <option value="京族">京族</option>
            <option value="门巴族">门巴族</option>
            <option value="维吾尔族">维吾尔族</option>
            <option value="朝鲜族">朝鲜族</option>
            <option value="土家族">土家族</option>
            <option value="傈僳族">傈僳族</option>
            <option value="水族">水族</option>
            <option value="土族">土族</option>
            <option value="撒拉族">撒拉族</option>
            <option value="普米族">普米族</option>
            <option value="鄂温克族">鄂温克族</option>
            <option value="塔塔尔族">塔塔尔族</option>
            <option value="珞巴族">珞巴族</option>
            <option value="苗族">苗族</option>
            <option value="满族">满族</option>
            <option value="哈尼族">哈尼族</option>
            <option value="佤族">佤族</option>
            <option value="东乡族">东乡族</option>
            <option value="达斡尔族">达斡尔族</option>
            <option value="毛南族">毛南族</option>
            <option value="塔吉克族">塔吉克族</option>
            <option value="德昂族">德昂族</option>
            <option value="独龙族">独龙族</option>
            <option value="基诺族">基诺族</option>
        </select>
      </label></td>
      <td bgcolor="#FFFFFF" class="redfont">*</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">婚姻状况：</td>
      <td bgcolor="#FFFFFF"><input name="hy" type="radio" class="radio" value="未婚" />
未婚
  <input name="hy" type="radio" class="radio" value="已婚" />
  已婚 
  <label>
  <input name="hy" type="radio" class="radio" value="离异" dataType="Group" msg="请选择婚姻状况"  />
  离异</label></td>
      <td bgcolor="#FFFFFF" class="redfont">*</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">籍贯：</td>
      <td bgcolor="#FFFFFF"><label>
      <input name="jg" type="text" id="jg" dataType="Require" msg="请输入出生地！" />
      如：湖北襄阳</label></td>
      <td bgcolor="#FFFFFF" class="redfont">*</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">出生地：</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="hj" type="text" id="hj" size="35" dataType="Require" msg="请输入户籍所在地！" />
        如：湖北襄阳</label></td>
      <td bgcolor="#FFFFFF" class="redfont">*</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">固定电话：</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="tel" type="text" id="tel" size="35"  />
        </label></td>
      <td bgcolor="#FFFFFF" class="redfont">&nbsp;</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">手机号码：</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="mb" type="text" id="mb" size="35" maxlength="11" dataType="Require" msg="请输入手机号码！" />
      </label></td>
      <td bgcolor="#FFFFFF" class="redfont">*</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">内网E-Mail：</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="email" type="text" id="email" size="35" />
      </label></td>
      <td bgcolor="#FFFFFF" class="redfont">&nbsp;</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">健康状况：</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="st" type="text" id="st" dataType="Require" msg="请输入身体状况！"  />
        如：健康、良好、一般</label></td>
      <td bgcolor="#FFFFFF" class="redfont">*</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
      <td colspan="2" bgcolor="#FFFFFF"><label>
        <input name="ureg" type="submit" class="but1" id="ureg" value="注 册" />
        &nbsp;
        <input name="ucancel" type="button" class="but2" id="ucancel" value="取消" onclick="location.href='login.asp'" />
        说明：带*号为必填项</label></td>
    </tr>
  </table>
</form>
</div>
<script language="javascript">
//禁止后退键 作用于Firefox、Opera  
document.onkeypress=banBackSpace;  
//禁止后退键  作用于IE、Chrome  
document.onkeydown=banBackSpace;  
function chku()
{
	//var usid=$F("sid");
	var usid=document.getElementById("lgname").value;
	if(usid=="")
	{
	alert("身份证号不能为空！");
	return;
	}
	var http_request=InitAjax();
	url="chkusid.asp?sid="+usid+"&number="+Math.random();
    http_request.open('GET', url, false); 
    http_request.send(null); 
   
  if (http_request.readyState == 4)  
　　 { 
  　　　// 收到完整的服务器响应  
  　　　if (http_request.status == 200) { 
　　　　  //HTTP服务器响应的值OK 
　　　　  requestdoc = http_request.responseText;  
　　　　  //将服务器返回的字符串写到页面中ID为message的区域  
    }  
　　　   else { 
　　　　  requestdoc = http_request.status; 
　　　   } 
　　  }
	//document.getElementById("chksid").innerHTML=requestdoc;
	//alert(requestdoc);
	if(requestdoc!="1") 
		document.getElementById("chksid").innerHTML="<font color=#FF0000>×身份证号重复！</font>";
	else
		document.getElementById("chksid").innerHTML="<font color=#0000FF>√可以注册</font>";
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
