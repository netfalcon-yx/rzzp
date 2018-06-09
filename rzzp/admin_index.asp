<!--#Include File="conn.Asp"-->
<%chku 9%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=webname%>--后台管理</title>
<link href="maincss.css" rel="stylesheet" type="text/css">
<script language="javascript" src="hmenu.js"></script>
</head>
<body>
<div class="maintop" id="maintop">
	<div id="logotxt"></div>
	<div id="right"><b>欢迎<%=session("adminname")%> <a href="quit.asp">退出登录</a></b></div>
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="89%">
  <tr>
    <td width="200" valign="top" bgcolor="#F3FAFF" style="border:#009F93 1px solid;border-bottom:none;">
	<div class="left2_2" id="menulist">
	     <ul>
		   <li><span>菜单导航</span></li>
		   
		   <li><a href="admin_info.asp" target="frmright">新闻公告管理</a></li>		   
		   <li><a href="admin_job.asp" target="frmright">招聘岗位管理</a></li>
		   <li><a href="admin_jobchk.asp" target="frmright" class="curmenu">报名审核统计</a></li>
		   
		   <li><a href="admin_kcfp.asp" target="frmright">准考证导入</a></li>
            <li><a href="admin_zkzphoto1.asp" target="frmright">准考证核验</a></li>
            <li><a href="admin_jkkc.asp" target="frmright">监考考场打印</a></li>
		  
		   <li><a href="admin_cj_view.asp" target="frmright">考试成绩管理</a></li>

		   
		   <li><a href="admin_umg_admin.asp" target="frmright">注册用户管理</a></li>
		   <li><a href="admin_deptmg.asp" target="frmright">基层单位管理</a></li>
		   <li><a href="admin_data_clear.asp" target="frmright">清除测试数据</a></li>
		   <li><a href="admin_bkdb.asp" target="frmright">数据管理备份</a></li>
           <li><a href="u_mdfpsw.asp" target="frmright">登录密码修改</a></li>
		   <li><a href="quit.asp">退出用户登录</a></li>
		 </ul>
    </div></td>
    <td width="1" valign="top">&nbsp;</td>
    <td  valign="top" style="border:#009F93 1px solid;">
	<IFRAME class=main_iframe id=frmright name=frmright src="admin_jobchk.asp" frameBorder=0 scrolling=yes></IFRAME>	</td>
  </tr>
</table>

</body>
</html>
