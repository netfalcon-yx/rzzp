<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���������޸�</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="chkfm.js"></script>
<script language="javascript" src="comm.js"></script>
<script language="javascript" src="js/noback.js"></script>
<script type="text/javascript" src="lhgdialog/lhgcore.min.js"></script> 
<script type="text/javascript" src="lhgdialog/lhgdialog.min.js"></script>
<script language="javascript" src="laydate/laydate.js"></script>
</head>
<%
chku 2
id=request.QueryString("id")
uid=request.QueryString("uid")

if id<>"" then
	id=intsql(id)
else
	msg "��������","-1"
end if


set rs=server.createobject("adodb.recordset")
sql="select uname,(select dname from tb_duser where uid=a.did)as dwname from tb_user a where uid="&uid&" and did="&session("duid")
rs.open sql,conn,1,1
if not rs.eof then
	uname=rs(0)
	dwname=rs("dwname")
else
	msg "�û���������","-1"
end if
rs.close

if id<>"" then
	sql="select * from tb_bm where id="&id&" and uid="&uid&" and gzdw="&session("duid")
	rs.open sql,conn,1,1
	if rs.eof then
		msg "��������","-1"
	else
		hg2=rs("hg2")
		if hg2 then msg "�ϼ����ʲ��������ͨ�������ٱ༭��","-1"
		jid=rs("jid")
		gid=rs("gid")
		xl=rs("xl")
		xw=rs("xw")
		byyxzy=rs("byyxzy")
		bysj=rs("bysj")
		
		xl2=rs("xl2")
		byyxzy2=rs("byyxzy2")
		bysj2=rs("bysj2")
		
		gzdw=rs("gzdw")
		gzzw=rs("gzzw")
		gzsj=rs("gzsj")
		zyjszw=rs("zyjszw")
		zyjszwmc=rs("zyjszwmc")
		if zyjszw="����" then zyjszw2=rs("zyjszw2")
		qdsj=rs("qdsj")
		zyzgz=rs("zyzgz")
		zysj2=rs("zysj2")
		
		'����������������Ϣ
		wyjcd=rs("wyjcd")
		byzy=rs("byzy")
		byzy2=rs("byzy2")
		snjxkh=rs("snjxkh")
		j3njxkh=rs("j3njxkh")
		rzsj=rs("xrzsj")
		xgwfl=rs("xgwfl")
		
		xcszy=rs("xcszy")
		zynx=rs("zynx")
		
		zzmm=rs("zzmm")
		zzsj=rs("zzsj")
		xxjl=rs("xxjl")
		gzjl=rs("gzjl")
		jcqk=rs("jcqk")
		gzyj=rs("gzyj")
		jtcy=rs("jtcy")
		bz=rs("bz")
		fgwid=rs("fgwid")
		fgwid2=rs("fgwid2")
		
		jgbs=rs("jgbs")
		jxdj=rs("jxdj")'��Ч�ȼ�
		yxnx=rs("yxnx")'һ�������Ƿ����
		'zjs=rs("udoc")
		'udoc2=rs("udoc2")
		'udoc3=rs("udoc3")
	end if
	rs.close
end if
%>
<body>
<div class="unav">��ǰλ�ã�<b><%=uname%></b> ���������޸�</div>
<form id="form1" name="form1" method="post" action="d_save_baom.asp" onSubmit="return Validator.Validate(this,1)">
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:95%">
    <tr>
      <td align="right" bgcolor="#F7F7FF" style="width:18%">������λ��</td>
      <td colspan="2" bgcolor="#F7F7FF"><label>
        <select name="gid" size="1" id="gid">
		<%
		'sql="select * from tb_gw where jid="&jid&" and gid in(7,8,9) order by gid"
		sql="select * from tb_gw where jid="&jid
		rs.open sql,conn,1,1
		while not rs.eof
			tempgwbm=""
			if rs("gid")=gid then tempgwbm="selected"
			rw "<option value='"&rs("gid")&"' "&tempgwbm&">"&rs("zpdw")&":"&rs("bm")&":"&rs("gwmc")&"</option>"&chr(13)
			rs.movenext
		wend
		rs.close
		%>
        </select>
        <span class="redfont">*</span></label></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7FF">ȫ����ѧ����</td>
      <td colspan="2" bgcolor="#F7F7FF"><label>
        <select  name='xl' id="xl" dataType="Require" msg="��ѡ��ѧ��">
		<option value="">--ѡ��ѧ��--</option>
        <option value="Сѧ">Сѧ</option>
        <option value="����">����</option>
        <option value="����">����</option>
        <option value="��ר">��ר</option>
		<option value="��ר">��ר</option>
		<option value="����">����</option>
		<option value="˶ʿ�о���">˶ʿ�о���</option>
		<option value="��ʿ�о���">��ʿ�о���</option>
		</select>
        </label><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7FF">ȫ����ѧλ��</td>
      <td colspan="2" bgcolor="#F7F7FF"><label>
        <input name="xw" type="text" id="xw" value="<%=xw%>" />
      �磺����ѧѧʿ,��ѧλ�����</label></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7FF">��ҵԺУ��</td>
      <td colspan="2" bgcolor="#F7F7FF"><label>
        <input name="byyxzy" type="text" id="byyxzy" size="40" dataType="Require" msg="�������ҵԺУ���ƣ�" value="<%=byyxzy%>" />
      </label>
        <span class="redfont">*</span>�磺���пƼ���ѧ�����</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7FF">��ѧרҵ��</td>
      <td colspan="2" bgcolor="#F7F7FF"><input name="byzy" type="text" id="byzy" value="<%=byzy%>" dataType="Require" msg="��������ѧרҵ��"  />
      <span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7FF">��ҵʱ�䣺</td>
      <td colspan="2" bgcolor="#F7F7FF"><label>
        <input name="bysj" type="text" id="bysj" dataType="Require" msg="�������ҵʱ�䣡" onclick="laydate()"  value="<%=bysj%>" readonly />
      </label><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFCC">��ְѧ����</td>
      <td colspan="2" bgcolor="#FFFFCC">
	  <select  name='xl2' id="xl2">
		<option value="">--ѡ��ѧ��--</option>
		<option value='��ר'>��ר</option>
		<option value='����'>����</option>
		<option value="˶ʿ�о���">˶ʿ�о���</option>
		<option value="��ʿ�о���">��ʿ�о���</option>
		</select></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFCC">��ҵԺУ��</td>
      <td colspan="2" bgcolor="#FFFFCC"><label>
        <input name="byyxzy2" type="text" id="byyxzy2" value="<%=byyxzy2%>" size="40" />
      (��ְ)</label></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFCC">��ѧרҵ��</td>
      <td colspan="2" bgcolor="#FFFFCC"><input name="byzy2" type="text" id="byzy2" value="<%=byzy2%>" />
      (��ְ)</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFCC">��ҵʱ�䣺</td>
      <td colspan="2" bgcolor="#FFFFCC"><input name="bysj2" type="text" id="bysj2"  onclick="laydate()" value="<%=bysj2%>" readonly="readonly" />
      (��ְ)</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">�ֹ�����λ��</td>
      <td colspan="2" bgcolor="#FFFFF7"><%=dwname%>
      <label>
      <input name="jgbs" type="text" id="jgbs" value="<%=jgbs%>" size="50" dataType="Require" msg="���������ڻ��ز��һ�������λ��" />
      </label>
      <span class="redfont">*</span>������λ�����ţ�����)�磺���޷ֹ�˾����˼��������ް࣬�����й��繫˾��ڹ�����</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">�ֹ�����λ��</td>
      <td colspan="2" bgcolor="#FFFFF7"><label>
        <input name="gzzw" type="text" id="gzzw" value="<%=gzzw%>"  dataType="Require" msg="�����빤����λ/ְ��" />
      </label>
      <span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">���θ�λ���ࣺ</td>
      <td colspan="2" bgcolor="#FFFFF7"><select name="xgwfl" size="1" id="xgwfl" dataType="Require" msg="��ѡ�����θ�λ���࣡">
        <option value="">ѡ���λ����</option>
        <option value="������">������</option>
        <option value="������">������</option>
        <option value="������">������</option>
      </select>
      <span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">�μӹ���ʱ�䣺</td>
      <td colspan="2" bgcolor="#FFFFF7"><label>
        <input name="gzsj" type="text" id="gzsj" dataType="Require" msg="������μӹ���ʱ�䣡" onclick="laydate()" readonly value="<%=gzsj%>" />
      </label><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">רҵ�����ʸ�</td>
      <td colspan="2" bgcolor="#FFFFF7"><label>
        
        <select name="zyjszw" size="1" id="zyjszw" dataType="Require" msg="��ѡ��רҵ�����ʸ�" >
          <option value="">--ѡ���ʸ�ȼ�--</option>
          <option value="���߼�">���߼�</option>
          <option value="���߼�">���߼�</option>
          <option value="�м�">�м�</option>
          <option value="����">����</option>
          <option value="�޵ȼ��ʸ�">�޵ȼ��ʸ�</option>
        </select>
        <input type="text" name="zyjszwmc" id="zyjszwmc" value="<%=zyjszwmc%>" />
        (�ʸ�����)
        <span class="redfont">*</span>
      </label></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">ȡ��ʱ�䣺</td>
      <td colspan="2" bgcolor="#FFFFF7"><label>
        <input name="qdsj" type="text" id="qdsj" onclick="laydate()" readonly value="<%=qdsj%>" />
      </label></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">ְҵ�ʸ�֤�飺</td>
      <td colspan="2" bgcolor="#FFFFF7"><label>
        <input name="zyzgz" type="text" id="zyzgz" value="<%=zyzgz%>" />
      �磺��Ŀ����ʦ</label></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">ȡ��ʱ�䣺</td>
      <td colspan="2" bgcolor="#FFFFF7"><input name="zysj2" type="text" id="zysj2"  onclick="laydate()" value="<%=zysj2%>" readonly="readonly" /></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFDD">������ò��</td>
      <td colspan="2" bgcolor="#FFFFDD"><label>
        <select name="zzmm" size="1" id="zzmm" dataType="Require" msg="��ѡ��������ò��">
		<option value="">--ѡ��������ò--</option>
          <option value="�й���Ա">�й���Ա</option>
          <option value="������Ա">������Ա</option>
		  <option value="����">����</option>
          <option value="Ⱥ��">Ⱥ��</option>
        </select>
      </label><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFDD">�뵳(��)ʱ�䣺</td>
      <td colspan="2" bgcolor="#FFFFDD"><label>
        <input name="zzsj" type="text" id="zzsj" onclick="laydate()" readonly value="<%=zzsj%>" />
      </label></td>
    </tr>
     <tr>
      <td align="right" >�����꼨Ч�ȼ���</td>
      <td colspan="2"><input name="jxdj" type="text" id="jxdj" value="<%=jxdj%>" dataType="Require" msg="�����뼨Ч�ȼ���"  />
      <span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" >&quot;358&quot;һ�߹������ޣ�</td>
      <td colspan="2"><input name="yxnx" type="checkbox" class="radio" id="yxnx" value="1"  <%if yxnx then rw " checked"%> />
        ����</td>
    </tr>
    <tr>
      <td align="right" style="height:200px"><span class="redfont">*</span>��������<br></td>
      <td colspan="2"><label>
        ��ʽ����ֹʱ�� ���ڵ�λ �������ż�ְλ<br />
<textarea name="gzjl" cols="80" rows="15" id="gzjl" dataType="Require" msg="������ѧϰ������" ><%=gzjl%> </textarea>
      </label></td>
    </tr>
    
    <tr>
      <td align="right" style="height:200px">��Ҫ����ҵ��</td>
      <td colspan="2"><textarea name="gzyj" cols="80" rows="15" id="gzyj" onKeyDown="gbcount(this,800);" onKeyUp="gbcount(this,800);"><%=gzyj%></textarea></td>
    </tr>
    <tr>
      <td align="right" style="height:200px">�����</td>
      <td colspan="2"><label>
        <textarea name="jcqk" cols="80" rows="15" id="jcqk"><%=jcqk%></textarea>
      </label></td>
    </tr>
   
    <tr>
      <td align="right"><span class="redfont">*</span>��ͥ��Ա�����</td>
      <td colspan="2"><label>
        ��ʽ����ν ���� �������� ������ò ������λ(����)��ְ��(��λ)<br />
<textarea name="jtcy" cols="80" rows="10" id="jtcy" dataType="Require" msg="�������ͥ��Ա������ϵ��"><%=jtcy%></textarea>
<br />
      ��д��Χ����ż����Ů����ĸ</label></td>
    </tr>
    <tr>
      <td align="right">��ע��</td>
      <td colspan="2"><label>
        <textarea name="bz" cols="80" rows="3" id="bz"><%=bz%></textarea>
      </label></td>
    </tr>
    <tr>
      <td align="right">�����ϴ���</td>
      <td colspan="2"><select name="ftype" size="1" id="ftype">
        <option value="" selected="selected">��������</option>
       <%selectuftype%>
      </select>
        (�������ϴ�������Ϊ��Word��wps��pdf��ͼƬ��ʽ)
        <input name="button" type="button" class="but1" id="button" value="ѡ���ļ�"  onclick="openwin(<%=jid%>,<%=uid%>)" /></td>
    </tr>
    <tr>
      <td align="right">���ϴ�������</td>
      <td colspan="2">
      <iframe id="fmufile" frameborder="0" height="100%" src="ufilelist.asp?uid=<%=uid%>" scrolling="no" width="100%" onload="SetCwinHeight(this);"></iframe>
      </td>
    </tr>
    <tr>
      <td align="right">&nbsp;</td>
      <td colspan="2"><label>
        <input name="Submit" type="submit" class="but2" value="�ύ" <%if uchkflag then rw "disabled" %> />
      </label>
        <input name="hdjid" type="hidden" id="hdjid" value="<%=jid%>" />
        <input name="hdbmid" type="hidden" id="hdbmid" value="<%=id%>" />
        ��ע��<span class="redfont">*</span> Ϊ������</td>
    </tr>
  </table>
</form>
<script language="javascript">
$("xl").value="<%=xl%>";
$("xl2").value="<%=xl2%>";
$("xgwfl").value="<%=xgwfl%>";
$("zyjszw").value="<%=zyjszw%>";
if($("zyjszw").value=="����")
{
$("zyjszw2").value="<%=zyjszw2%>";
$('zyjszw2').style.display='';
}
$("zzmm").value="<%=zzmm%>";
function openwin(jid,uid)
{
	var uftype=$("ftype").value;
	if(uftype!=""){
		temppage="u_zjsup.asp?jid="+jid+"&id="+uftype+"&uid="+uid;
		temptit="�����ϴ�";
		var dlg = new J.dialog({ title:temptit,rang:true,page:temppage,cover:true,btns: false, autoSize:true,maxBtn:false,btnBar:false,bgcolor:'#000',iconTitle:false}); 
		dlg.ShowDialog();
	}
	else{
		alert("��ѡ�񸽼����ͣ�");
		return false;
	}
}
</script>
</body>
</html>
