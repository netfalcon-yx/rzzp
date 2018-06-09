<!--#Include File="conn.Asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>用户基本资料修改</title>
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
'if session("utype")<>1 and session("utype")<>9 then msg "权限不足无法编辑注册资料！","-1"
'if session("uid")="" or isnull(session("uid")) then msg "还没有登录或登录信息已超时，请重新登录！","-1"
chku 0

if session("utype")=1 then
	sql="select * from tb_user where uid="&session("uid")
elseif session("utype")=2 then
	if muid="" then msg "用户参数出错！","-1"
	sql="select * from tb_user where uid="&muid&" and did="&session("duid")
elseif session("utype")=9 then
	if muid="" then msg "用户参数出错！","-1"
	sql="select * from tb_user where uid="&muid
end if
if sql="" then msg "用户参数出错！","-1"

set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if not rs.eof then
%>
<div class="unav">当前位置：考生首页 -> 基本信息修改</div>
<form id="form1" name="form1" method="post" action="u_savemdf.asp?uid=<%=muid%>" onSubmit="return Validator.Validate(this,3)">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F2F2F2" class="mytable" style="line-height:30px;padding-left:4px">
    <tr>
      <td align="right" bgcolor="#FFFFF7">身份证号码：</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="card" type="text" id="card" size="35"  value="<%=rs("card")%>" readonly style="background:#EFEFEF" />
      </label></td>
      <td bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td width="20%" align="right" bgcolor="#FFFFF7">真实姓名：</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="uname" type="text" id="uname" maxlength="20" dataType="Require" msg="请输入真实姓名！" value="<%=rs("uname")%>" />
      </label></td>
      <td width="30%" bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">工作单位：</td>
      <td bgcolor="#FFFFFF">
	  <select name="gzdw" size="1" id="gzdw" dataType="Require" msg="请输入工作单位！" >
		<option value="">--选择单位--</option>
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
      <td align="right" bgcolor="#FFFFF7">出生日期</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="birthday" type="text" id="birthday" onclick="laydate()" dataType="Require" msg="请输入出生年月！" readonly value="<%=rs("birthday")%>" />
      </label></td>
      <td bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">性 别：</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="sex" type="radio" class="radio" value="男" <%if rs("sex")="男" then rw "checked"%> />
      男 
      <input name="sex" type="radio" class="radio" value="女" dataType="Group" msg="请选择性别" <%if rs("sex")="女" then rw "checked"%> />
      女</label></td>
      <td bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">民 族：</td>
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
      </label><script language="javascript">$("mz").value="<%=rs("mz")%>";</script></td>
      <td bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">婚姻状况：</td>
      <td bgcolor="#FFFFFF"><input name="hy" type="radio" class="radio" value="未婚" <%if rs("hy")="未婚" then rw "checked"%> />
未婚
  <input name="hy" type="radio" class="radio" value="已婚" <%if rs("hy")="已婚" then rw "checked"%> />
  已婚 
  <label>
  <input name="hy" type="radio" class="radio" value="离异" dataType="Group" msg="请选择婚姻状况" <%if rs("hy")="离异" then rw "checked"%> />
  离异</label></td>
      <td bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">籍贯：</td>
      <td bgcolor="#FFFFFF"><label>
      <input name="jg" type="text" id="jg" value="<%=rs("jg")%>" datatype="Require" msg="请输入出生地！" />
      </label>
<script language="javascript">$("jg").value="<%=rs("jg")%>";</script></td>
      <td bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">出生地：</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="hj" type="text" id="hj" size="35" dataType="Require" msg="请输入户籍所在地！" value="<%=rs("hj")%>" />
      </label></td>
      <td bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">固定电话：</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="tel" type="text" id="tel" size="35" value="<%=rs("tel")%>" />
      </label></td>
      <td bgcolor="#FFFFFF"></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">手机号码：</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="mb" type="text" id="mb" size="35" dataType="Require" msg="请输入手机号码！"  value="<%=rs("mb")%>" />
      </label></td>
      <td bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">内网邮箱：</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="email" type="text" id="email" size="35" value="<%=rs("email")%>" />
      </label></td>
      <td bgcolor="#FFFFFF"></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">身体状况：</td>
      <td bgcolor="#FFFFFF"><label>
        <input name="st" type="text" id="st" value="<%=rs("st")%>" dataType="Require" msg="请输入身体状况！" />
      如：健康、良好、一般</label></td>
      <td bgcolor="#FFFFFF"><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF">&nbsp;</td>
      <td colspan="2" bgcolor="#FFFFFF"><label>
        <input name="ureg" type="submit" class="but1" id="ureg" value="修 改" />
      &nbsp;
      <input name="ucancel" type="button" class="but2" id="ucancel" value="取消" onclick="history.back()" />
      说明：带<span class="redfont">*</span>号为必填项</label></td>
    </tr>
  </table>
</form>
<%
end if
rs.close
set rs=nothing
%>
<script language="javascript">
//禁止后退键 作用于Firefox、Opera  
document.onkeypress=banBackSpace;  
//禁止后退键  作用于IE、Chrome  
document.onkeydown=banBackSpace;  
</script>
</body>
</html>
