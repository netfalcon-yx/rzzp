<!--#Include File="conn.Asp"-->
<%chku 1%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=webname%>--用户中心</title>
<link href="maincss.css" rel="stylesheet" type="text/css">
<script language="javascript" src="hmenu.js"></script> 
</head>

<body>
<div class="maintop" id="maintop">
	<div id="logotxt"></div>
	<div id="right"><b>欢迎<%=session("uname")%> <a href="quit.asp">退出登录</a></b></div>
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="89%">
  <tr>
    <td width="200" valign="top" bgcolor="#F3FAFF" style="border:#009F93 1px solid;border-bottom:none;">
	<div class="left2_2" id="menulist">
	     <ul>
		   <li><span>用户菜单导航</span></li>
		   
		   <li><a href="u_news.asp" target="frmright">考试公告</a></li>
		   <li><a href="u_gw.asp" target="frmright" class="curmenu">在线报名</a></li>
		   <li><a href="u_bminfo.asp" target="frmright" >报名审核查看</a></li>
           <li><a href="u_cjinfo.asp" target="frmright" >考试成绩查询</a></li>
		   
		   <li><a href="u_baseinfo.asp" target="frmright">注册资料修改</a></li>
		   <li><a href="u_photo.asp" target="frmright">个人照片管理</a></li>
		   <li><a href="u_mdfpsw.asp" target="frmright">个人密码管理</a></li>
		   <li><a href="u_link.asp" target="frmright">单位招聘联系人</a></li>
           <li><a href="doc/baominguser.doc" target="_blank">系统操作说明</a></li>
		   <li><a href="quit.asp">退出用户登录</a></li>
		 </ul>
    </div></td>
    <td width="1" valign="top">&nbsp;</td>
    <td  valign="top" style="border:#009F93 1px solid;">
	<IFRAME class=main_iframe id=frmright name=frmright src="u_main.asp" frameBorder=0 scrolling=yes></IFRAME>	</td>
  </tr>
</table>
</body>
</html>
