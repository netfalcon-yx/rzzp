<!--#Include File="conn.Asp"-->
<%chku 9%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=webname%>--��̨����</title>
<link href="maincss.css" rel="stylesheet" type="text/css">
<script language="javascript" src="hmenu.js"></script>
</head>
<body>
<div class="maintop" id="maintop">
	<div id="logotxt"></div>
	<div id="right"><b>��ӭ<%=session("adminname")%> <a href="quit.asp">�˳���¼</a></b></div>
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="89%">
  <tr>
    <td width="200" valign="top" bgcolor="#F3FAFF" style="border:#009F93 1px solid;border-bottom:none;">
	<div class="left2_2" id="menulist">
	     <ul>
		   <li><span>�˵�����</span></li>
		   
		   <li><a href="admin_info.asp" target="frmright">���Ź������</a></li>		   
		   <li><a href="admin_job.asp" target="frmright">��Ƹ��λ����</a></li>
		   <li><a href="admin_jobchk.asp" target="frmright" class="curmenu">�������ͳ��</a></li>
		   
		   <li><a href="admin_kcfp.asp" target="frmright">׼��֤����</a></li>
            <li><a href="admin_zkzphoto1.asp" target="frmright">׼��֤����</a></li>
            <li><a href="admin_jkkc.asp" target="frmright">�࿼������ӡ</a></li>
		  
		   <li><a href="admin_cj_view.asp" target="frmright">���Գɼ�����</a></li>

		   
		   <li><a href="admin_umg_admin.asp" target="frmright">ע���û�����</a></li>
		   <li><a href="admin_deptmg.asp" target="frmright">���㵥λ����</a></li>
		   <li><a href="admin_data_clear.asp" target="frmright">�����������</a></li>
		   <li><a href="admin_bkdb.asp" target="frmright">���ݹ�����</a></li>
           <li><a href="u_mdfpsw.asp" target="frmright">��¼�����޸�</a></li>
		   <li><a href="quit.asp">�˳��û���¼</a></li>
		 </ul>
    </div></td>
    <td width="1" valign="top">&nbsp;</td>
    <td  valign="top" style="border:#009F93 1px solid;">
	<IFRAME class=main_iframe id=frmright name=frmright src="admin_jobchk.asp" frameBorder=0 scrolling=yes></IFRAME>	</td>
  </tr>
</table>

</body>
</html>
