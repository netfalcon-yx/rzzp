<!--#include file="conn.asp"-->
<!--#include file="page.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ע���û�����</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="comm.js"></script>
<script type="text/javascript" src="lhgdialog/lhgcore.min.js"></script> 
<script type="text/javascript" src="lhgdialog/lhgdialog.min.js"></script>
</head>
<%
chku 2
uname=request.Form("uname")
%>
<body>
<div class="unav">
  <form id="form1" name="form1" method="post" action="">
    ��ǰλ�ã�ע���û�����(����û�����ʾ�û���ϸ����)
    �û�������
    <label>
    <input name="uname" type="text" id="uname" value="<%=uname%>" />
    </label>
    <label>
    <input name="usearch" type="submit" class="but1" id="usearch" value="�� ��" />
    </label>
  ����ʼ������:123456��
  </form>
</div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" class="mytable" id="tbulist">
  <tr>
    <th width="5%">���</th>
    <th width="15%">���֤����</th>
    <th width="10%">��ʵ����</th>
    <th width="5%">�Ա�</th>
    <th>������λ</th>
    <th width="15%">�绰/�ֻ�</th>
    <th width="10%">��ʼ����</th>
    <th width="10%">����</th>
  </tr>
  <%
  if uname<>"" then
  		sql="select a.*,(select dname from tb_duser where uid=a.did)as dname from tb_user a where did="&session("duid")&" and uname like '%"&uname&"%' order by uid"
	else
		sql="select a.*,(select dname from tb_duser where uid=a.did)as dname from tb_user a where did="&session("duid")&" order by uid"
	end if
  
  i=1
  Set mypage=new xdownpage
	mypage.getconn=conn
		'sql���
	mypage.getsql=sql
		'����ÿһҳ�ļ�¼������Ϊ20��setcolor(rsg("title"),rsg("tfont"),rsg("tcolor"))
	mypage.pagesize=50
	page=mypage.pagesize
	
	'����Recordset
	set rs=mypage.getrs()
	page=mypage.pagesize
	while not rs.eof and page>0
  %>
  <tr>
    <td align="center"><%=i%></td>
    <td align="center"><a href="javascript:void(0)" onclick="openwin('<%=rs("uid")%>')"><%=rs("lgname")%></a></td>
    <td align="center"><a href="javascript:void(0)" onclick="openwin('<%=rs("uid")%>')"><%=rs("uname")%></a></td>
    <td align="center"><%=rs("sex")%></td>
    <td align="center"><%=rs("dname")%></td>
    <td align="center"><%=rs("mb")%></td>
    <td align="center"><a href="javascript:void(0)" onclick="{if(confirm('��ʾ��ȷ��Ҫ��ʼ�����û�������?')){openwin2('<%=rs("uid")%>',1)}return false;}">��ʼ��</a></td>
    <td align="center"><a href="u_baseinfo.asp?uid=<%=rs("uid")%>">�༭</a> <a href="admin_u_del.asp?uid=<%=rs("uid")%>" onClick="{if(confirm('���棺ȷ��ɾ�����û���?ɾ�����û���ͬʱɾ���û��ı�����������Ϣ��')){return true;}return false;}">ɾ��</a></td>
  </tr>
  <%
  	i=i+1
	rs.movenext
	page=page-1
	wend            
  %>
  <tr>
    <td colspan="8" align="center"><%mypage.showpage()%></td>
  </tr>
</table>
<% 
'rs.close
set rs=nothing
%>
<script language="javascript">
showtable("tbulist");
function openwin(uid)
{
	temppage="d_uview.asp?uid="+uid;
	temptit="�û��������";
	//temppage="admin_t_test.asp?tid="+tid;
	var dlg = new J.dialog({ title:temptit,rang:true,page:temppage,autoSize:true,cover:true,btns: false,maxBtn:false,btnBar:false,bgcolor:'#000',iconTitle:false}); 
	dlg.ShowDialog();
}
function openwin2(uid,utype)
{
	temppage="d_inipsw.asp?uid="+uid+"&utype="+utype;
	temptit="��ʼ������";
	//temppage="admin_t_test.asp?tid="+tid;
	var dlg = new J.dialog({ title:temptit,rang:true,page:temppage,autoSize:true,cover:true,btns: false,maxBtn:false,btnBar:false,bgcolor:'#000',iconTitle:false}); 
	dlg.ShowDialog();
}
</script>
</body>
</html>
