<!--#include file="conn.asp"-->
<%'chku 9%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<title>׼��֤����</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script> 
<script src="webcam.js"></script>
<script language="javascript">
$(document).ready(function() {
     $("#zkzface").height($("#zkztable").height());
	 Webcam.attach( '#my_camera' );
});
var shutter = new Audio();
shutter.autoplay = false;
shutter.src = navigator.userAgent.match(/Firefox/) ? 'shutter.ogg' : 'shutter.mp3';

Webcam.set({
			width: 240,
			height: 320,
			image_format: 'jpeg',
			jpeg_quality: 100
		});
		//Webcam.getCamera(1);
  
function take_snapshot() {
	// take snapshot and get image data
	var tmpuid=$("#hd_uid").val();
	if(tmpuid==""){alert("����ˢ���֤��Ϣ��");return false;}
	try { shutter.currentTime = 0; } catch(e) {;} // fails in IE
	shutter.play();
	Webcam.snap( function(data_uri) {
		// display results in page
		
		$('#xcphoto').html( '<img src="'+data_uri+'" class="uphoto2" />');
		var raw_image_data = data_uri.replace(/^data\:image\/\w+\;base64\,/, '');
		//var raw_image_data = data_uri;
		$.ajax({
			type: "POST",
			timeout:10000,//10���¼��ʱ 
  			url: "ajax_uploadface2.asp?t="+Math.random(),
			datatype: "html",
			cache: false,
			data:{face:raw_image_data,uid:tmpuid},
			beforeSend:function(){$("#but_shot").html("�ύ��...");},
			success: function(msg){
				if(msg=="1")
				{
     				$("#xcfacesta").html("�ɼ��ϴ��ɹ���");
					//$("#uface").attr("src","showface.asp?id="+msg+"&t="+Math.random());
					//$("#uface").attr("src","photo/"+msg+".jpg");
				}
				else
					$("#xcfacesta").html( "�ֳ���Ƭ�ϴ�ʧ�ܡ�"+escape(msg));
				$("#but_shot").html("�����ϴ�");
   			},
			error:function(XMLHttpRequest, textStatus, errorThrown){
				$("#xcfacesta").html(textStatus);	
			}

		});
	} );
}
function gozkz(jid){
	var uid=$("#hd_uid").val();
	if(uid!="")
		$("#pzkz").attr("href","admin_zkz.asp?jid="+jid+"&uid="+uid+"&r="+Math.random());
	else{
		alert("����ˢ���֤��");	
		return false;
	}
}
</script>
<style>
.printtable{BORDER-COLLAPSE: collapse;font-size:14px;}
.printtable TBODY TR TD{BORDER:#000000 1px solid;line-height:50px;}
.zkzdiv{width:900px;margin:10px auto;}
.zkzinfo{width:50%;float:left;}
.zkzface{width:48%;float:right;border:1px solid #333;}
.zkztxt{padding-left:10px;}
.dsta{background:#FAFCFD}
</style>
</head>
<body>
<%
sql="select top 1 jid from tb_job order by jid desc"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
if not rs.eof then
jid=rs(0)
end if
rs.close

%>
<object classid="clsid:5EB842AE-5C49-4FD8-8CE9-77D4AF9FD4FF" id="IdrControl1" width="0" height="0" codebase="idr.cab"></object>
<h4><span class="redfont">׼��֤��ӡʱ��ʹ��A4ֽ�ź����ӡ</span> ��<a href="#" id="pzkz" onclick="gozkz(<%=jid%>)" target="_blank">��ӡ׼��֤</a>�� </h4>
<div class="zkzdiv">
	<div class="zkzinfo">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="printtable"  id="zkztable">
      <tr>
        <td colspan="4" class="dsta">���֤���룺
        <input name="sfz" type="text" id="sfz" style="height:30px;line-height:30px;font-size:16px;font-weight:bold" size="22" maxlength="18" />
          <input name="button" type="button" class="but2" id="button" value="ȷ��" onclick="window.clearInterval(t);getksinfo($('#sfz').val())" />
          <input name="hd_jid" type="hidden" id="hd_jid" value="<%=jid%>" />
        <input type="hidden" name="hd_uid" id="hd_uid" /></td>
        </tr>
      <tr>
        <td colspan="4" bgcolor="#FFFFFF" class="dsta">�� �� �� ״ ̬��<span id="dinfo">׼����ȡ���֤...</span></td>
      </tr>
      <tr>
        <td colspan="4" bgcolor="#FFFFFF" class="dsta">��Ƭ�ɼ�״̬��<span id="xcfacesta"></span></td>
      </tr>
      <tr>
        <td width="28%" align="center" bgcolor="#FFFFFF">�� &nbsp;&nbsp;&nbsp;����</td>
        <td colspan="2" bgcolor="#FFFFFF" class="zkztxt"><span id="uname"></span></td>
        <td width="32%" rowspan="3" align="center" bgcolor="#FFFFFF"><img src="doc/nophoto.jpg" width="110" height="140" id="uphoto" /></td>
      </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">�� &nbsp;&nbsp;&nbsp;��</td>
        <td colspan="2" bgcolor="#FFFFFF" class="zkztxt"><span id="usex"></span></td>
      </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">�� �� ֤ �ţ�</td>
        <td colspan="2" bgcolor="#FFFFFF" class="zkztxt"><span id="ucard"></span></td>
        </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">�� �� �� λ��</td>
        <td colspan="3" bgcolor="#FFFFFF" class="zkztxt"><span id="ugzdw"></span></td>
        </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">ӦƸ��λ���룺</td>
        <td width="20%" bgcolor="#FFFFFF" class="zkztxt"><span id="gid"></span></td>
        <td width="20%" align="center" bgcolor="#FFFFFF">�������</td>
        <td bgcolor="#FFFFFF" class="zkztxt"><span id="ktype"></span></td>
      </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">׼ �� ֤ �ţ�</td>
        <td bgcolor="#FFFFFF" class="zkztxt"><span id="kh"></span></td>
        <td align="center" bgcolor="#FFFFFF">�� �� �ţ�</td>
        <td bgcolor="#FFFFFF" class="zkztxt"><span id="kc"></span></td>
        </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">�� �� �� �ң�</td>
        <td bgcolor="#FFFFFF" class="zkztxt"><span id="kcjs"></span></td>
        <td align="center" bgcolor="#FFFFFF">�� λ �ţ�</td>
        <td bgcolor="#FFFFFF" class="zkztxt"><span id="zwh"></span></td>
      </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">�� �� ʱ �䣺<br /></td>
        <td colspan="3" bgcolor="#FFFFFF" class="zkztxt"><span id="bssj"></span></td>
      </tr>
      <tr>
        <td align="center" bgcolor="#FFFFFF">�� �� �� �㣺</td>
        <td colspan="3" bgcolor="#FFFFFF" class="zkztxt"><span id="ksdz"></span></td>
      </tr>
    </table>
    </div>
  <div class="zkzface" id="zkzface">
   <div id="my_camera" style="width:240px;height:320px;margin:10px auto;"></div>
        <div id="but_shot" style="height:35px;width:240px;margin:10px auto;line-height:35px;font-weight:bold;background:#FFC;border:1px solid #FC0;text-align:center;cursor:pointer" onClick="take_snapshot()">�����ϴ�</div>
        <div id="xcphoto" style="width:120px;height:150px;margin:10px auto;background:#ccc;border:1px solid #999">
    	</div> 
  </div>
</div>
<script language=javascript>
function Idcard(){
	var result;
	var cardid;
	result=IdrControl1.ReadCard("1001","d:\\test\\test.jpg");
	if (result==1){
		//$("#xm").html(IdrControl1.GetName());
		cardid=IdrControl1.GetCode();
		$("#sfz").val(cardid);
		window.clearInterval(t);
		getksinfo(cardid);
	}else{
		if (result==-1)
			$("#dinfo").innerText="�˿ڳ�ʼ��ʧ�ܣ�";
		if (result==-2)
			$("#dinfo").innerText="�����½���Ƭ�ŵ��������ϣ�";
		if (result==-3)
			$("#dinfo").innerText="��ȡ����ʧ�ܣ�";
	}
}
function getksinfo(cid)
{
$.ajax({
	url:"admin_getksinfo.asp?cid="+cid+"&t="+Math.random(),
	type:"get",
	cache:false, 
	dataType:"json",
	success: function (jsdata){
	if(jsdata=="" || jsdata==null)
	{
		wclear();
		$("#dinfo").html("�޸ÿ�������...");
		alert("�޸ÿ�������...");
	}
	else
	{
		for(var key in jsdata){
				if(key!="photo" && key!="uid")$("#"+key).html(jsdata[key]);  
            }
		$("#uphoto").attr("src","doc/"+jsdata["photo"]+"?"+Math.random());	
		$("#hd_uid").val(jsdata["uid"]);
		$("#dinfo").html("��ȡ�ɹ���");
		
	}
	t=setInterval("Idcard()",2000);
	},
	error:function(){$("#dinfo").html("��ȡ������Ϣ����...");t=setInterval("Idcard()",2000);}
	})
}
function printks()
{
	var sfzid=$("#sfz").val();
	if(sfzid!="" && sfzid!=null)
	{
	//���ô�ӡ����
	  var fm=document.getElementById("wprint").contentWindow;
	  fm.document.getElementById("xm").innerText=$("#xm").html();
	  fm.document.getElementById("sfz").innerText=sfzid;	
	  fm.document.getElementById("xh").innerText=$("#xh").html();	
	  fm.document.getElementById("kc").innerText=$("#kc").html();	
	  fm.document.getElementById("zkz").innerText=$("#zkz").html();	
	  fm.document.getElementById("hks").innerText=$("#hks").html();
	  fm.document.execCommand("print");
	}
	else
	{		
		alert("û�п�����Ϣ���ܴ�ӡ��");	
	}
}
function wclear()
{
$("#zkztable span").html("");
$("#hd_uid").val("");
$("#uphoto").attr("src","doc/nophoto.jpg");	
$("#winfo").html("׼����ȡ���֤...");
}
var t=setInterval("Idcard()",2000);
</script>
</body>
</html>
