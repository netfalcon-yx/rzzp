function $(str)
{
return document.getElementById(str);
}


//��ȡradioֵ
function GetRadioValue(rname){
    var obj;    
    obj=document.getElementsByName(rname);
    if(obj!=null)
	{
		var i;
        for(i=0;i<obj.length;i++){
            if(obj[i].checked){
                return obj[i].value;            
            }
        }
    }
    return null;
}

//��ȡchkbox����
function GetChkLen(rname){
    var obj;
	var j=0;
    obj=document.getElementsByName(rname);
    if(obj!=null)
	{
		var i;
        for(i=0;i<obj.length;i++)
		{
            if(obj[i].checked)
			{
                j++;            
            }
        }
    }
    return j;
}
//chkboxȫѡȫ��ѡ
function checkAll(rname,flag) 
{ 
	var code_Values=document.getElementsByName(rname); 
	if(code_Values.length)
	{ 
		for(var i=0;i<code_Values.length;i++) 
		{ 
		code_Values[i].checked=flag; 
		} 
	}
	else
	{ 
		code_Values.checked=flag; 
	} 

} 

function showtable(tbid)
{
var tablename=document.getElementById(tbid);
var li=tablename.getElementsByTagName("tr");
for (var i=0;i<li.length;i++)
	{
		li[i].onmouseover = function()
		{
            this.style.backgroundColor="#FFCC00";
        }
		li[i].onmouseout = function()
		{
            this.style.backgroundColor="#FFFFFF";
        }
	}
}

function setfmdis(fmid)
{
	$(fmid).disabled="true";
	for(var i=0;i<$(fmid).length;i++)
	{
	var element=$(fmid)[i];
	element.disabled="true"; 
    }
	//allhref=document.getElementsByTagName("a");
//
//	for(var i=0;i<allhref.length;i++)
//	{
//	var element=allhref[i];
//	element.removeAttribute("href");
//	element.onclick=null;
//    element.setAttribute("disabled", "disabled");
    //}
}
function getTblData(inTbl) {

    var rows = 0;
    var tblDocument = document;
    var curTbl = tblDocument.getElementById(inTbl);
    var outStr = "";
    if (curTbl != null) {
        for (var j = 0; j < curTbl.rows.length; j++) {
            for (var i = 0; i < curTbl.rows[j].cells.length; i++) {

                if (i == 0 && rows > 0) {
                    outStr += " \t";
                    rows -= 1;
                }

                outStr += curTbl.rows[j].cells[i].innerText + "\t";
                if (curTbl.rows[j].cells[i].colSpan > 1) {
                    for (var k = 0; k < curTbl.rows[j].cells[i].colSpan - 1; k++) {
                        outStr += " \t";
                    }
                }
                if (i == 0) {
                    if (rows == 0 && curTbl.rows[j].cells[i].rowSpan > 1) {
                        rows = curTbl.rows[j].cells[i].rowSpan - 1;
                    }
                }
            }
            outStr += "\r\n";
        }
    }

    else {
        outStr = null;
        alert(inTbl + "������ !");
    }
	
    //return outStr;
	var xlsWin = null;
	var width = 6;
	var height = 4;
	var openPara = "left=" + (window.screen.width / 2 - width / 2)
		+ ",top=" + (window.screen.height / 2 - height / 2)
		+ ",scrollbars=no,width=" + width + ",height=" + height;
	//xlsWin = window.open("test-pop.asp", "_blank", openPara);
	xlsWin = window.open("", "_blank", openPara);
	//xlsWin.document.writeln("<%Response.AddHeader \"Content-Disposition\", \"attachment;filename=��λ����ͳ�Ʊ�.xls\"%>");
	//xlsWin.document.writeln("<%Response.ContentType = \"application/vnd.ms-excel\"%>");
	xlsWin.document.write(outStr);
    xlsWin.document.close();
    xlsWin.document.execCommand('Saveas',true,"��������.xls");
    xlsWin.close();
}
//��������¼� ��ֹ���˼���Backspace��������С������ı������  
function banBackSpace(e){     
    var ev = e || window.event;//��ȡevent����     
    var obj = ev.target || ev.srcElement;//��ȡ�¼�Դ     
      
    var t = obj.type || obj.getAttribute('type');//��ȡ�¼�Դ����    
      
    //��ȡ��Ϊ�ж��������¼�����  
    var vReadOnly = obj.getAttribute('readonly');  
    var vEnabled = obj.getAttribute('enabled');  
    //����nullֵ���  
    vReadOnly = (vReadOnly == null) ? false : vReadOnly;  
    vEnabled = (vEnabled == null) ? true : vEnabled;  
      
    //����Backspace��ʱ���¼�Դ����Ϊ������С������ı��ģ�  
    //����readonly����Ϊtrue��enabled����Ϊfalse�ģ����˸��ʧЧ  
    var flag1=(ev.keyCode == 8 && (t=="password" || t=="text" || t=="textarea")&& (vReadOnly==true || vEnabled!=true))?true:false;  
     
    //����Backspace��ʱ���¼�Դ���ͷ�������С������ı��ģ����˸��ʧЧ  
    var flag2=(ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea")?true:false;          
      
    //�ж�  
    if(flag2){  
        return false;  
    }  
    if(flag1){     
        return false;     
    }     
}  
function SetCwinHeight(obj) 
{ 
var cwin=obj; 
if (document.getElementById) 
{ 
if (cwin && !window.opera) 
{ 
if (cwin.contentDocument && cwin.contentDocument.body.offsetHeight) 
cwin.height = cwin.contentDocument.body.offsetHeight + 20; //FF NS 
else if(cwin.Document && cwin.Document.body.scrollHeight) 
cwin.height = cwin.Document.body.scrollHeight + 10;//IE 
} 
else 
{ 
if(cwin.contentWindow.document && cwin.contentWindow.document.body.scrollHeight) 
cwin.height = cwin.contentWindow.document.body.scrollHeight;//Opera 
} 
} 
} 