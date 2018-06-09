<!--#include file="conn.asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>新增招聘信息</title>
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
      <td width="25%" align="right">招聘名称：</td>
      <td><label>
        <input name="jtit" type="text" id="jtit" size="50" require="true" msg="请输入招聘名称！" value="<%=jname%>" />
        <span class="redfont">*</span></label></td>
    </tr>
    <tr>
      <td align="right">报名开始时间：</td>
      <td><label>
        <input name="btime" type="text" id="btime" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss',istime: true})" require="true" msg="请输入招聘起始时间！" value="<%=btime%>" />
        <span class="redfont">*</span></label></td>
    </tr>
    <tr>
      <td align="right">报名结束时间：</td>
      <td><label>
        <input name="etime" type="text" id="etime" onclick="laydate({format: 'YYYY-MM-DD hh:mm:ss',istime: true})" require="true" msg="请输入招聘截止时间！" value="<%=etime%>" />
        <span class="redfont">*</span> 截止</label></td>
    </tr>
    <tr>
      <td align="right">登录开放：</td>
      <td><label>
        <input name="jobsta" type="radio" class="radio" value="8" <%if jobsta=8 then rw "checked"%> />
      关闭 
      <input name="jobsta" type="radio" class="radio" value="0" <%if jobsta=0 then rw "checked"%> />
      开放
      </label></td>
    </tr>
    <tr>
      <td align="right">成绩查询：</td>
      <td><input name="cjsta" type="radio" class="radio" value="0" <%if cjsta=false then rw "checked"%> />
关闭
  <input name="cjsta" type="radio" class="radio" value="1" <%if cjsta then rw "checked"%> />
开放 </td>
    </tr>
    <tr>
      <td align="right">成绩比例：</td>
      <td>笔试
        <input name="bsbl" type="text" id="bsbl" value="<%=bsbl%>" size="6" require="true" msg="请输入笔试成绩比例！" />
%：面试
<input name="msbl" type="text" id="msbl" value="<%=msbl%>" size="6" require="true" msg="请输入面试成绩比例！"  />
% 
(百分比)</td>
    </tr>
    <tr>
      <td align="right">准考证打印：</td>
      <td>
      <input name="zkzflag" type="checkbox" class="radio" id="zkzflag" value="1" <%if zkzflag then rw "checked"%> />      
      开放(如设置开放,请确保已审核、已分配考场,已设置考试时间)</td>
    </tr>
    <tr>
      <td align="right">是否结束：</td>
      <td><label>
        <input name="isend" type="radio" class="radio" value="0"  <%if endflag<>true then rw "checked"%>/>
      否
      <input name="isend" type="radio" class="radio" value="1" <%if endflag then rw "checked"%> />
      是(设置为结束，请确保成绩已公布，招聘已完成）</label></td>
    </tr>
    <tr>
      <td align="right">文档说明：</td>
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
        <a href="javascript:void(0)" onclick="document.getElementById('joldfname').value=''"><img src="icon/del_icon.gif" width="16" height="16" />删除</a></td>
    </tr>
	<%end if%>
    <tr>
      <td>&nbsp;</td>
      <td><label>
        <input name="jadd" type="submit" class="but2" id="jadd" value="保 存" />
        <input name="hdjid" type="hidden" id="hdjid" value="<%=jid%>" />
      </label><%if jfname<>"" then rw "(说明：不需要文档说明时选择删除)"%></td>
    </tr>
  </table>
</form>
</body>
</html>
