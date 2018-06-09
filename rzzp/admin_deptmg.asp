<!--#Include File="conn.Asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>基层单位管理</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="comm.js"></script>
<script type="text/javascript" src="lhgdialog/lhgcore.min.js"></script> 
<script type="text/javascript" src="lhgdialog/lhgdialog.min.js"></script>
</head>
<%
set rs=server.CreateObject("adodb.recordset")
did=request.Form("hd_deptid")
dname=request.Form("dept")
if dname<>"" then
	if did<>"" then
		sql="select * from tb_duser where uid="&did
		rs.open sql,conn,1,3
	else
		sql="select * from tb_duser where uid=0"
		rs.open sql,conn,1,3
		rs.addnew
		rs("psw")=inipsw
	end if
	rs("dname")=dname
	rs.update
	rs.close
	response.Redirect("admin_deptmg.asp")
end if
%>
<body>
<div class="unav">当前位置：基层单位管理【初始化密码：123456】</div>
<form id="form1" name="form1" method="post" action="admin_deptmg.asp">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" id="tbdept">
    <tr>
      <th width="5%">编号</th>
      <th>基层单位名称</th>      
      <th width="8%">姓名</th>
      <th width="10%">岗位</th>
      <th width="10%">办公电话</th>
      <th width="12%">手机</th>
      <th width="15%">邮箱</th>
	  <th width="10%">初始化密码</th>
      <th width="10%">编辑</th>
    </tr>
	<%
	sql="select * from tb_duser"
	rs.open sql,conn,1,1
	i=1
	while not rs.eof
	%>
    <tr>
      <td align="center"><%=i%></td>
      <td><%if rs("psw")=inipsw then rw "<span class='redfont'>*</span>"%><%=rs("dname")%></td>
      <td align="center"><%=rs("duname")%></td>
      <td align="center"><%=rs("gw")%></td>
      <td align="center"><%=rs("tel")%></td>
      <td align="center"><%=rs("mb")%></td>
      <td align="center"><%=rs("email")%></td>
	  <td align="center"><a href="javascript:void(0)" onclick="{if(confirm('提示：确定要初始化该用户密码吗?')){openwin2('<%=rs("uid")%>',2)}return false;}">初始化</a></td>
      <td align="center"><a href="javascript:setmdf(<%=rs("uid")%>,'<%=rs("dname")%>')" title="编辑基层单位名称">编辑</a> <a href="admin_unit_del.asp?did=<%=rs("uid")%>" onClick="{if(confirm('警告：确定删除该条内容吗?')){return true;}return false;}">删除</a></td>
    </tr>
	<%
		i=i+1
		rs.movenext
	wend
	rs.close
	%>
    <tr id="currow" style="display:none">
      <td colspan="9">
        基层单位名称：
          <input name="dept" type="text" id="dept" size="50" />
        <input name="save" type="submit" class="but2" id="save" value="保 存" />
        <input name="hd_deptid" type="hidden" id="hd_deptid" />
      &nbsp;
      <input name="nodo" type="button" class="but1" id="nodo" value="取消" onclick="$('currow').style.display='none';document.form1.reset();" />      </td>
    </tr>
    <tr>
      <td colspan="9" align="center"><input name="addnew" type="button" class="but1" id="addnew" value="新 增" onclick="$('currow').style.display=''" /></td>
    </tr>
  </table>
</form>
<script language="javascript">
showtable("tbdept");
document.form1.reset();
function setmdf(did,dname)
{
	$("hd_deptid").value=did;
	$("dept").value=dname;
	$('currow').style.display='';
	$("dept").focus();
}
function openwin2(uid,utype)
{
	temppage="admin_inipsw.asp?uid="+uid+"&utype="+utype;
	temptit="初始化密码";
	//temppage="admin_t_test.asp?tid="+tid;
	var dlg = new J.dialog({ title:temptit,rang:true,page:temppage,autoSize:true,cover:true,btns: false,maxBtn:false,btnBar:false,bgcolor:'#000',iconTitle:false}); 
	dlg.ShowDialog();
}
</script>
</body>
</html>
