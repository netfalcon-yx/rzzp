<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�û���¼</title>
<style>
*{font-size:14px;}
body{margin:0;overflow:hidden;background:url(imgs/body.jpg) repeat-x}
a:link,a:visited{color:#000; text-decoration:none;}
a:hover{color:#000;}
form{margin:0px;padding:0px;}
img{border:0px;}
.clear{clear:both;}
.maintop{height:160px;line-height:160px;background:url(imgs/index_titbk2.jpg) top right no-repeat;}
.maintop #logotxt{width:946px;height:160px;float:left;background:url(imgs/index_tittxt.png) no-repeat}

ul{padding:0; margin:0; list-style:none;}
.lg{width:850px;height:500px;margin:100px auto;background:url(imgs/lgbk22.gif) no-repeat}
.lgnews{width:370px;margin-left:30px;float:left;margin-top:150px;text-align:left}
.lgu{width:370px;margin-right:40px;float:right;margin-top:150px;text-align:left}

.lgnews ul{padding-left:5px}
.lgnews ul li{height:25px;line-height:25px;border-bottom:1px dotted #009999;background:url(icon/icon.gif) left 12px no-repeat;padding-left:8px;}
input{border:1px solid #AAAAAA;line-height:25px;padding:0 3px;height:25px;background:#fff;}
.button{border:1px solid #FFDD99;background:#FFF9ED;width:60px;line-height:24px;height:24px;margin:4px auto;}
</style>
<script language="javascript" src="chkfm.js"></script>
<script language="javascript" src="comm.js"></script>
<script language="javascript" src="getduser.asp"></script>
<script language="javascript">var pswmsg="����ϵ�û�������λ��Ƹ�����˽������ʼ��!";</script>
<%
function getsub(tempstr,leftn)
	If IsNull(tempstr) Or tempstr = "" Then
        getsub = ""
    Else
        Dim i, n, k, chrA
        k = 0
        n = Len(tempstr)
        For i = 1 To n
            chrA = Mid(tempstr, i, 1)
            If Asc(chrA) >= 0 And Asc(chrA) <= 255 Then
                k = k + 1
            Else
                k = k + 2
            End If
			if k>=leftn*2 then
				getsub=left(tempstr,i)
				Exit Function
			end if
        Next
		getsub=tempstr
	end if
end function
%>
</head>
<body>
<div class="lg">
<div class="lgnews">
<ul>
<%
sql="select top 7 id,title,tfont,tcolor,infotime from tb_news where ntype=1 and ishow=true order by istop,infotime desc,id desc"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,1,1
while not rs.eof
    temptitle=rs("title")
    if rs("tfont") then
        temptitle="<strong>"&getsub(temptitle,20)&"</strong>"
    else
        temptitle=getsub(temptitle,20)
    end if
    if rs("tcolor")<>"" then temptitle="<font color="&rs("tcolor")&">"&temptitle&"</font>"
    rw "<li><a href='news_view.asp?id="&rs("id")&"' target='_blank' alt='����ʱ�䣺"&rs("infotime")&"'>"&temptitle&"</a></li>"&chr(13)
    rs.movenext
wend
rs.close
set rs=nothing
set conn=nothing
%>	
</ul>
</div>
<div class="lgu">
		  <form name="form1" method="post" action="chklg.asp"  onSubmit="return Validator.Validate(this,1)">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top:5px">
  <tr>
    <td width="30%" height="30" align="right">�û����ͣ�</td>
    <td><label>
      <select name="utype" size="1" id="utype" onChange="getutype(this.value)" style="height:25px;line-height:25px">
        <option value="1">������Ա</option>
        <option value="2">���㵥λ���²���</option>
        <option value="9">�ϼ����ʲ���</option>
      </select>
    </label></td>
  </tr>
  <tr>
    <td height="30" align="right"><span id="ulgtype">���֤��</span>��</td>
    <td><label id="ulist">
      <input name="uname" type="text" id="uname" maxlength="18" dataType="Require" msg="�������û�����" >
    </label>     </td>
  </tr>
  <tr>
    <td height="30" align="right">��¼���룺</td>
    <td><label>
      <input name="upsw" type="password" id="upsw" dataType="Require" msg="���������룡" >
    </label></td>
  </tr>
  <tr>
    <td height="30">&nbsp;</td>
    <td><label><input name="Submit" type="submit" class="button" value="�� ¼" style="background:#CFF;border:1px solid #099;height:30px;line-height:30px;">      
    </label><input name="SubmitRg" type="button" class="button" id="SubmitRg" style="background:#FFC;border:1px solid #ADCD3C;height:30px;line-height:30px;" onClick="location.href='u_reg1.asp'" value="ע ��"></td>
  </tr>
  <tr>
    <td height="30">&nbsp;</td>
    <td>������Ա��<span style="color:#F30;font-weight:bold">���֤��</span>ע���¼</td>
  </tr>
  <tr>
    <td height="30">&nbsp;</td>
    <td><a href="javascript:alert(pswmsg)">�������룿</a></td>
  </tr>
</table>

          </form>
		</div>
</div>
<script language="javascript">
function getutype(utype)
{
	if(utype!="1")
		{
		$("SubmitRg").disabled=true;
		$("ulgtype").innerText="�� �� ��";
		pswmsg="����ϵ���ʲ�:027-88566446";
		}
	else
		{
		$("SubmitRg").disabled=false;
		$("ulgtype").innerText="���֤��";
		pswmsg="����ϵ�û�������λ���²��Ž������ʼ��!";
		}
	if(utype=="2")
	{
	$("ulist").innerHTML="<select name='uname' size='1' id='uname' style='height:25px;line-height:25px'>"+tempdept+"</select>";
	}
	else
	{
	$("ulist").innerHTML="<input name='uname' type='text' id='uname' dataType='Require' maxlength='18'  msg='�������û�����'>";
	}
}
</script>
</body>
</html>
