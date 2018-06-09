<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>报名资料修改</title>
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
	msg "参数错误！","-1"
end if


set rs=server.createobject("adodb.recordset")
sql="select uname,(select dname from tb_duser where uid=a.did)as dwname from tb_user a where uid="&uid&" and did="&session("duid")
rs.open sql,conn,1,1
if not rs.eof then
	uname=rs(0)
	dwname=rs("dwname")
else
	msg "用户参数错误！","-1"
end if
rs.close

if id<>"" then
	sql="select * from tb_bm where id="&id&" and uid="&uid&" and gzdw="&session("duid")
	rs.open sql,conn,1,1
	if rs.eof then
		msg "参数错误！","-1"
	else
		hg2=rs("hg2")
		if hg2 then msg "上级人资部门已审核通过不能再编辑！","-1"
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
		if zyjszw="其它" then zyjszw2=rs("zyjszw2")
		qdsj=rs("qdsj")
		zyzgz=rs("zyzgz")
		zysj2=rs("zysj2")
		
		'这下面是新增的信息
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
		jxdj=rs("jxdj")'绩效等级
		yxnx=rs("yxnx")'一线年限是否符合
		'zjs=rs("udoc")
		'udoc2=rs("udoc2")
		'udoc3=rs("udoc3")
	end if
	rs.close
end if
%>
<body>
<div class="unav">当前位置：<b><%=uname%></b> 报名资料修改</div>
<form id="form1" name="form1" method="post" action="d_save_baom.asp" onSubmit="return Validator.Validate(this,1)">
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:95%">
    <tr>
      <td align="right" bgcolor="#F7F7FF" style="width:18%">报名岗位：</td>
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
      <td align="right" bgcolor="#F7F7FF">全日制学历：</td>
      <td colspan="2" bgcolor="#F7F7FF"><label>
        <select  name='xl' id="xl" dataType="Require" msg="请选择学历">
		<option value="">--选择学历--</option>
        <option value="小学">小学</option>
        <option value="初中">初中</option>
        <option value="高中">高中</option>
        <option value="中专">中专</option>
		<option value="大专">大专</option>
		<option value="本科">本科</option>
		<option value="硕士研究生">硕士研究生</option>
		<option value="博士研究生">博士研究生</option>
		</select>
        </label><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7FF">全日制学位：</td>
      <td colspan="2" bgcolor="#F7F7FF"><label>
        <input name="xw" type="text" id="xw" value="<%=xw%>" />
      如：经济学学士,无学位此项不填</label></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7FF">毕业院校：</td>
      <td colspan="2" bgcolor="#F7F7FF"><label>
        <input name="byyxzy" type="text" id="byyxzy" size="40" dataType="Require" msg="请输入毕业院校名称！" value="<%=byyxzy%>" />
      </label>
        <span class="redfont">*</span>如：华中科技大学计算机</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7FF">所学专业：</td>
      <td colspan="2" bgcolor="#F7F7FF"><input name="byzy" type="text" id="byzy" value="<%=byzy%>" dataType="Require" msg="请输入所学专业！"  />
      <span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#F7F7FF">毕业时间：</td>
      <td colspan="2" bgcolor="#F7F7FF"><label>
        <input name="bysj" type="text" id="bysj" dataType="Require" msg="请输入毕业时间！" onclick="laydate()"  value="<%=bysj%>" readonly />
      </label><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFCC">在职学历：</td>
      <td colspan="2" bgcolor="#FFFFCC">
	  <select  name='xl2' id="xl2">
		<option value="">--选择学历--</option>
		<option value='大专'>大专</option>
		<option value='本科'>本科</option>
		<option value="硕士研究生">硕士研究生</option>
		<option value="博士研究生">博士研究生</option>
		</select></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFCC">毕业院校：</td>
      <td colspan="2" bgcolor="#FFFFCC"><label>
        <input name="byyxzy2" type="text" id="byyxzy2" value="<%=byyxzy2%>" size="40" />
      (在职)</label></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFCC">所学专业：</td>
      <td colspan="2" bgcolor="#FFFFCC"><input name="byzy2" type="text" id="byzy2" value="<%=byzy2%>" />
      (在职)</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFCC">毕业时间：</td>
      <td colspan="2" bgcolor="#FFFFCC"><input name="bysj2" type="text" id="bysj2"  onclick="laydate()" value="<%=bysj2%>" readonly="readonly" />
      (在职)</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">现工作单位：</td>
      <td colspan="2" bgcolor="#FFFFF7"><%=dwname%>
      <label>
      <input name="jgbs" type="text" id="jgbs" value="<%=jgbs%>" size="50" dataType="Require" msg="请输入所在机关部室或下属单位！" />
      </label>
      <span class="redfont">*</span>三级单位及部门（班组)如：检修分公司输电运检室输电检修班，汉川市供电公司马口供电所</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">现工作岗位：</td>
      <td colspan="2" bgcolor="#FFFFF7"><label>
        <input name="gzzw" type="text" id="gzzw" value="<%=gzzw%>"  dataType="Require" msg="请输入工作岗位/职务！" />
      </label>
      <span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">现任岗位分类：</td>
      <td colspan="2" bgcolor="#FFFFF7"><select name="xgwfl" size="1" id="xgwfl" dataType="Require" msg="请选择现任岗位分类！">
        <option value="">选择岗位分类</option>
        <option value="管理类">管理类</option>
        <option value="技术类">技术类</option>
        <option value="技能类">技能类</option>
      </select>
      <span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">参加工作时间：</td>
      <td colspan="2" bgcolor="#FFFFF7"><label>
        <input name="gzsj" type="text" id="gzsj" dataType="Require" msg="请输入参加工作时间！" onclick="laydate()" readonly value="<%=gzsj%>" />
      </label><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">专业技术资格：</td>
      <td colspan="2" bgcolor="#FFFFF7"><label>
        
        <select name="zyjszw" size="1" id="zyjszw" dataType="Require" msg="请选择专业技术资格！" >
          <option value="">--选择资格等级--</option>
          <option value="正高级">正高级</option>
          <option value="副高级">副高级</option>
          <option value="中级">中级</option>
          <option value="初级">初级</option>
          <option value="无等级资格">无等级资格</option>
        </select>
        <input type="text" name="zyjszwmc" id="zyjszwmc" value="<%=zyjszwmc%>" />
        (资格名称)
        <span class="redfont">*</span>
      </label></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">取得时间：</td>
      <td colspan="2" bgcolor="#FFFFF7"><label>
        <input name="qdsj" type="text" id="qdsj" onclick="laydate()" readonly value="<%=qdsj%>" />
      </label></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">职业资格证书：</td>
      <td colspan="2" bgcolor="#FFFFF7"><label>
        <input name="zyzgz" type="text" id="zyzgz" value="<%=zyzgz%>" />
      如：项目管理师</label></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFF7">取得时间：</td>
      <td colspan="2" bgcolor="#FFFFF7"><input name="zysj2" type="text" id="zysj2"  onclick="laydate()" value="<%=zysj2%>" readonly="readonly" /></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFDD">政治面貌：</td>
      <td colspan="2" bgcolor="#FFFFDD"><label>
        <select name="zzmm" size="1" id="zzmm" dataType="Require" msg="请选择政治面貌！">
		<option value="">--选择政治面貌--</option>
          <option value="中共党员">中共党员</option>
          <option value="共青团员">共青团员</option>
		  <option value="其它">其它</option>
          <option value="群众">群众</option>
        </select>
      </label><span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFDD">入党(团)时间：</td>
      <td colspan="2" bgcolor="#FFFFDD"><label>
        <input name="zzsj" type="text" id="zzsj" onclick="laydate()" readonly value="<%=zzsj%>" />
      </label></td>
    </tr>
     <tr>
      <td align="right" >近三年绩效等级：</td>
      <td colspan="2"><input name="jxdj" type="text" id="jxdj" value="<%=jxdj%>" dataType="Require" msg="请输入绩效等级！"  />
      <span class="redfont">*</span></td>
    </tr>
    <tr>
      <td align="right" >&quot;358&quot;一线工作年限：</td>
      <td colspan="2"><input name="yxnx" type="checkbox" class="radio" id="yxnx" value="1"  <%if yxnx then rw " checked"%> />
        符合</td>
    </tr>
    <tr>
      <td align="right" style="height:200px"><span class="redfont">*</span>工作经历<br></td>
      <td colspan="2"><label>
        格式：起止时间 所在单位 工作部门及职位<br />
<textarea name="gzjl" cols="80" rows="15" id="gzjl" dataType="Require" msg="请输入学习经历！" ><%=gzjl%> </textarea>
      </label></td>
    </tr>
    
    <tr>
      <td align="right" style="height:200px">主要工作业绩</td>
      <td colspan="2"><textarea name="gzyj" cols="80" rows="15" id="gzyj" onKeyDown="gbcount(this,800);" onKeyUp="gbcount(this,800);"><%=gzyj%></textarea></td>
    </tr>
    <tr>
      <td align="right" style="height:200px">获奖情况</td>
      <td colspan="2"><label>
        <textarea name="jcqk" cols="80" rows="15" id="jcqk"><%=jcqk%></textarea>
      </label></td>
    </tr>
   
    <tr>
      <td align="right"><span class="redfont">*</span>家庭成员情况：</td>
      <td colspan="2"><label>
        格式：称谓 姓名 出生年月 政治面貌 工作单位(部门)及职务(岗位)<br />
<textarea name="jtcy" cols="80" rows="10" id="jtcy" dataType="Require" msg="请输入家庭成员及社会关系！"><%=jtcy%></textarea>
<br />
      填写范围：配偶、子女、父母</label></td>
    </tr>
    <tr>
      <td align="right">备注：</td>
      <td colspan="2"><label>
        <textarea name="bz" cols="80" rows="3" id="bz"><%=bz%></textarea>
      </label></td>
    </tr>
    <tr>
      <td align="right">附件上传：</td>
      <td colspan="2"><select name="ftype" size="1" id="ftype">
        <option value="" selected="selected">附件类型</option>
       <%selectuftype%>
      </select>
        (如有请上传，附件为：Word、wps、pdf及图片格式)
        <input name="button" type="button" class="but1" id="button" value="选择文件"  onclick="openwin(<%=jid%>,<%=uid%>)" /></td>
    </tr>
    <tr>
      <td align="right">已上传附件：</td>
      <td colspan="2">
      <iframe id="fmufile" frameborder="0" height="100%" src="ufilelist.asp?uid=<%=uid%>" scrolling="no" width="100%" onload="SetCwinHeight(this);"></iframe>
      </td>
    </tr>
    <tr>
      <td align="right">&nbsp;</td>
      <td colspan="2"><label>
        <input name="Submit" type="submit" class="but2" value="提交" <%if uchkflag then rw "disabled" %> />
      </label>
        <input name="hdjid" type="hidden" id="hdjid" value="<%=jid%>" />
        <input name="hdbmid" type="hidden" id="hdbmid" value="<%=id%>" />
        备注：<span class="redfont">*</span> 为必填项</td>
    </tr>
  </table>
</form>
<script language="javascript">
$("xl").value="<%=xl%>";
$("xl2").value="<%=xl2%>";
$("xgwfl").value="<%=xgwfl%>";
$("zyjszw").value="<%=zyjszw%>";
if($("zyjszw").value=="其它")
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
		temptit="附件上传";
		var dlg = new J.dialog({ title:temptit,rang:true,page:temppage,cover:true,btns: false, autoSize:true,maxBtn:false,btnBar:false,bgcolor:'#000',iconTitle:false}); 
		dlg.ShowDialog();
	}
	else{
		alert("请选择附件类型！");
		return false;
	}
}
</script>
</body>
</html>
