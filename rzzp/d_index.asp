<!--#Include File="conn.Asp"-->
<%
chku 2
sql="select psw,duname from tb_duser where uid="&session("duid")
set rs=conn.execute(sql)
'if rs("psw")=inipsw then msg "���޸ĳ�ʼ����������µ�¼��","u_mdfpsw.asp"
if rs("psw")=inipsw then
	d_gourl="u_mdfpsw.asp"
else
	if rs("duname")="" or isnull(rs("duname")) then
		d_gourl="d_link.asp"
	else
		d_gourl="d_job.asp"
	end if
end if
rs.close
set rs=nothing
%>
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
	<div id="right"><b>��ӭ<%=session("duname")%> <a href="quit.asp">�˳���¼</a></b></div>
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="89%">
  <tr>
    <td width="200" valign="top" bgcolor="#F3FAFF" style="border:#009F93 1px solid;border-bottom:none;">
	<div class="left2_2" id="menulist">
	     <ul>
		   <li><span>�û��˵�����</span></li>
		   <li><a href="d_job.asp" target="frmright" <%if d_gourl="d_job.asp" then rw "class=curmenu"%>>��λ�������</a></li>		  		
		   <li><a href="u_news.asp" target="frmright">�������Ź���</a></li>
		   <li><a href="admin_umg.asp" target="frmright">�û�ע�����</a></li>
		   <li><a href="d_link.asp" target="frmright" <%if d_gourl="d_link.asp" then rw "class=curmenu"%>>��ϵ��ʽ����</a></li>
		   <li><a href="u_mdfpsw.asp" target="frmright">�����������</a></li>
           <li><a href="doc/jicengdw.doc" target="_blank">ϵͳ����˵��</a></li>
		   <li><a href="quit.asp">�˳��û���¼</a></li>
		 </ul>
    </div></td>
    <td width="1" valign="top">&nbsp;</td>
    <td  valign="top" style="border:#009F93 1px solid;">
	<IFRAME class=main_iframe id=frmright name=frmright src="<%=d_gourl%>" frameBorder=0 scrolling=yes></IFRAME>	</td>
  </tr>
</table>
</body>
</html>
