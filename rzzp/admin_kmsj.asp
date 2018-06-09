<!--#Include File="conn.Asp"-->
<%chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>考试科目时间</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="calendar.js"></script>
<script language="javascript" src="chkfm.js"></script>
</head>
<%
set rs=server.CreateObject("adodb.recordset")
sql="select * from tb_gtype where tid='a1'"
rs.open sql,conn,1,1
if not rs.eof then
	ak1=rs("kskm")
	ak1sj=rs("kssj")
	if ak1sj<>"" then
		as1=left(ak1sj,10)
		as11=trim(mid(ak1sj,11))
	end if
end if
rs.close

sql="select * from tb_gtype where tid='a2'"
rs.open sql,conn,1,1
if not rs.eof then
	ak2=rs("kskm")
	ak2sj=rs("kssj")
	if ak2sj<>"" then
		as2=left(ak2sj,10)
		as21=trim(mid(ak2sj,11))
	end if
end if
rs.close

sql="select * from tb_gtype where tid='a3'"
rs.open sql,conn,1,1
if not rs.eof then
	ak3=rs("kskm")
	ak3sj=rs("kssj")
	if ak3sj<>"" then
		as3=left(ak3sj,10)
		as31=trim(mid(ak3sj,11))
	end if
end if
rs.close

sql="select * from tb_gtype where tid='b1'"
rs.open sql,conn,1,1
if not rs.eof then
	bk1=rs("kskm")
	bk1sj=rs("kssj")
	if bk1sj<>"" then
		bs1=left(bk1sj,10)
		bs11=trim(mid(bk1sj,11))
	end if
end if
rs.close

sql="select * from tb_gtype where tid='b2'"
rs.open sql,conn,1,1
if not rs.eof then
	bk2=rs("kskm")
	bk2sj=rs("kssj")
	if bk2sj<>"" then
		bs2=left(bk2sj,10)
		bs21=trim(mid(bk2sj,11))
	end if
end if
rs.close

sql="select * from tb_gtype where tid='b3'"
rs.open sql,conn,1,1
if not rs.eof then
	bk3=rs("kskm")
	bk3sj=rs("kssj")
	if bk3sj<>"" then
		bs3=left(bk3sj,10)
		bs31=trim(mid(bk3sj,11))
	end if
end if
rs.close
%>
<body>
<form id="form1" name="form1" method="post" action="admin_kmsj_save.asp" onSubmit="return Validator.Validate(this,1)">
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="mytable" style="width:500px;line-height:30px">
    <tr>
      <th width="14%">类别</th>
      <th width="40%">考试科目</th>
      <th>考试时间</th>
    </tr>
    <tr>
      <td rowspan="3" align="center" bgcolor="#FFFFDD">A类</td>
      <td align="center"><label>
        <input name="ak1" type="text" id="ak1" require="true" msg="请输入A类科目1名称!" value="<%=ak1%>" />
      </label></td>
      <td align="center"><label>
        <input name="as1" type="text" id="as1" size="12" onClick="new Calendar().show(this);" require="true" msg="请输入A类科目1考试日期！"  value="<%=as1%>" readonly />
        &nbsp;
        <input name="as11" type="text" id="as11" size="15" require="true" msg="请输入A类科目1考试起止时间！" value="<%=as11%>" />
      </label></td>
    </tr>
    <tr>
      <td align="center"><label>
        <input name="ak2" type="text" id="ak2" require="true" msg="请输入A类科目2名称!" value="<%=ak2%>" />
      </label></td>
      <td align="center"><label>
        <input name="as2" type="text" id="as2" size="12" onClick="new Calendar().show(this);" require="true" msg="请输入A类科目2考试日期！" value="<%=as2%>" readonly />
        &nbsp;
        <input name="as21" type="text" id="as21" size="15" require="true" msg="请输入A类科目2考试起止时间！" value="<%=as21%>" />
</label></td>
    </tr>
    <tr>
      <td align="center"><label>
        <input name="ak3" type="text" id="ak3" require="true" msg="请输入A类科目3名称!" value="<%=ak3%>" />
      </label></td>
      <td align="center"><label>
        <input name="as3" type="text" id="as3" size="12" onClick="new Calendar().show(this);" require="true" msg="请输入A类科目3考试日期！" value="<%=as3%>" readonly />
        &nbsp;
        <input name="as31" type="text" id="as31" size="15" require="true" msg="请输入A类科目3考试起止时间！" value="<%=as31%>" />
</label></td>
    </tr>
    <tr>
      <td rowspan="3" align="center" bgcolor="#F2FDDB">B类</td>
      <td align="center"><label>
        <input name="bk1" type="text" id="bk1" require="true" msg="请输入B类科目1名称!" value="<%=bk1%>" />
      </label></td>
      <td align="center"><label>
        <input name="bs1" type="text" id="bs1" size="12" onClick="new Calendar().show(this);" require="true" msg="请输入B类科目1考试日期！" value="<%=bs1%>" readonly />
        &nbsp;
        <input name="bs11" type="text" id="bs11" size="15" require="true" msg="请输入B类科目1考试起止时间！" value="<%=bs11%>" />
</label></td>
    </tr>
    <tr>
      <td align="center"><label>
        <input name="bk2" type="text" id="bk2" require="true" msg="请输入B类科目2名称!" value="<%=bk2%>" />
      </label></td>
      <td align="center"><label>
        <input name="bs2" type="text" id="bs2" size="12" onClick="new Calendar().show(this);" require="true" msg="请输入B类科目2考试日期！" value="<%=bs2%>"readonly />
        &nbsp;
        <input name="bs21" type="text" id="bs21" size="15" require="true" msg="请输入B类科目2考试起止时间！" value="<%=bs21%>" />
</label></td>
    </tr>
    <tr>
      <td align="center"><label>
        <input name="bk3" type="text" id="bk3" require="true" msg="请输入B类科目3名称!"value="<%=bk3%>"  />
      </label></td>
      <td align="center"><label>
        <input name="bs3" type="text" id="bs3" size="12" onClick="new Calendar().show(this);" require="true" msg="请输入B类科目3考试日期！" value="<%=bs3%>" readonly />
        &nbsp;
        <input name="bs31" type="text" id="bs31" size="15" require="true" msg="请输入B类科目3考试起止时间！" value="<%=bs31%>" />
</label></td>
    </tr>
    <tr>
      <td colspan="3" align="center"><label>
        <input name="kssave" type="submit" class="but2" id="kssave" value="保 存" />
      </label></td>
    </tr>
  </table>
</form>
</body>
</html>
