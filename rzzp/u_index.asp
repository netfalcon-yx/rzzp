<!--#Include File="conn.Asp"-->
<%chku 1%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=webname%>--�û�����</title>
<link href="maincss.css" rel="stylesheet" type="text/css">
<script language="javascript" src="hmenu.js"></script> 
</head>

<body>
<div class="maintop" id="maintop">
	<div id="logotxt"></div>
	<div id="right"><b>��ӭ<%=session("uname")%> <a href="quit.asp">�˳���¼</a></b></div>
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="89%">
  <tr>
    <td width="200" valign="top" bgcolor="#F3FAFF" style="border:#009F93 1px solid;border-bottom:none;">
	<div class="left2_2" id="menulist">
	     <ul>
		   <li><span>�û��˵�����</span></li>
		   
		   <li><a href="u_news.asp" target="frmright">���Թ���</a></li>
		   <li><a href="u_gw.asp" target="frmright" class="curmenu">���߱���</a></li>
		   <li><a href="u_bminfo.asp" target="frmright" >������˲鿴</a></li>
           <li><a href="u_cjinfo.asp" target="frmright" >���Գɼ���ѯ</a></li>
		   
		   <li><a href="u_baseinfo.asp" target="frmright">ע�������޸�</a></li>
		   <li><a href="u_photo.asp" target="frmright">������Ƭ����</a></li>
		   <li><a href="u_mdfpsw.asp" target="frmright">�����������</a></li>
		   <li><a href="u_link.asp" target="frmright">��λ��Ƹ��ϵ��</a></li>
           <li><a href="doc/baominguser.doc" target="_blank">ϵͳ����˵��</a></li>
		   <li><a href="quit.asp">�˳��û���¼</a></li>
		 </ul>
    </div></td>
    <td width="1" valign="top">&nbsp;</td>
    <td  valign="top" style="border:#009F93 1px solid;">
	<IFRAME class=main_iframe id=frmright name=frmright src="u_main.asp" frameBorder=0 scrolling=yes></IFRAME>	</td>
  </tr>
</table>
</body>
</html>
