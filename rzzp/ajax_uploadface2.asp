<!--#include file="conn.asp"-->
<%
function decodeBase64(base64)  
   dim DM, EL  
   Set DM = CreateObject("Microsoft.XMLDOM")  
   Set EL = DM.createElement("tmp")  
   EL.DataType = "bin.base64" 
   EL.Text = base64  
   decodeBase64 = EL.NodeTypedValue  
end function 

face=request.Form("face")
uid=request.Form("uid")

if face="" or uid="" then
	response.Write("0")
else
	uid=intsql(uid)
	dim data
	'dim str
	'str=face
	'str=left(1,len(str)-1)
	'str=right(1,len(str)-1)
	data=decodeBase64(face)
	newfacename="face_"&uid&"_"&hour(now())&minute(now())&second(now())&".jpg"
	'rw data
	'data=str
	set stm=Server.CreateObject("ADODB.Stream")
	'stm.Mode=adSaveCreateOverWrite 'adModeReadWrite
	stm.type=1 
	'stm.Mode=3
	stm.open
	stm.write data 
	stm.SaveToFile Server.MapPath("./") & "/photo/"&newfacename,2 
	stm.flush
	stm.Close 
	set stm=nothing 
	
	sql="update tb_user set uface='"&newfacename&"' where uid="&uid
	conn.execute(sql)
	
	'sql="select * from tb_user where id=0"
'	set rs=server.createobject("ADODB.recordset") 
'	rs.open sql,conn,1,3
'	rs.addnew
'		rs("uid")=uid
'		rs("face")=face
'		rs.update
'		newid=rs("id")
'
'	rs.close
'	set rs=nothing
	'dim content,user_serial,path
'	Dim xml:Set xml=Server.CreateObject("MSXML2.DOMDocument")  
'	Dim stm:Set stm=Server.CreateObject("ADODB.Stream") 
'	xml.resolveExternals=False  
'	path="photo/"&uid&"_temp.jpg"'ͼƬ����·��
'	xml.loadXML("<?xmlversion=""1.0""encoding=""gb2312""?><data>"&face&"</data>")'    ����xml�ļ��е����ݣ�ʹ��xml������
'	xml.documentElement.setAttribute"xmlns:dt","urn:schemas-microsoft-com:datatypes"  
'	xml.documentElement.dataType ="bin.base64"  
'	stm.Type=1 'adTypeBinary  
'	stm.Open  
'	stm.Write xml.documentElement.nodeTypedValue 
'	stm.SaveToFile Server.MapPath(path)'   �����������ļ����浽ָ��·��
'	'response.Write(path) 
'	stm.Close  
'	Set xml=Nothing  
'	Set stm=Nothing 
	if err then
		response.Write(err.description)
	else
		response.Write(1)
	end if 
end if
%>