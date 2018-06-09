function $(str)
{
return document.getElementById(str);
}


//获取radio值
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

//获取chkbox长度
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
//chkbox全选全不选
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
        alert(inTbl + "不存在 !");
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
	//xlsWin.document.writeln("<%Response.AddHeader \"Content-Disposition\", \"attachment;filename=单位报名统计表.xls\"%>");
	//xlsWin.document.writeln("<%Response.ContentType = \"application/vnd.ms-excel\"%>");
	xlsWin.document.write(outStr);
    xlsWin.document.close();
    xlsWin.document.execCommand('Saveas',true,"导出数据.xls");
    xlsWin.close();
}
//处理键盘事件 禁止后退键（Backspace）密码或单行、多行文本框除外  
function banBackSpace(e){     
    var ev = e || window.event;//获取event对象     
    var obj = ev.target || ev.srcElement;//获取事件源     
      
    var t = obj.type || obj.getAttribute('type');//获取事件源类型    
      
    //获取作为判断条件的事件类型  
    var vReadOnly = obj.getAttribute('readonly');  
    var vEnabled = obj.getAttribute('enabled');  
    //处理null值情况  
    vReadOnly = (vReadOnly == null) ? false : vReadOnly;  
    vEnabled = (vEnabled == null) ? true : vEnabled;  
      
    //当敲Backspace键时，事件源类型为密码或单行、多行文本的，  
    //并且readonly属性为true或enabled属性为false的，则退格键失效  
    var flag1=(ev.keyCode == 8 && (t=="password" || t=="text" || t=="textarea")&& (vReadOnly==true || vEnabled!=true))?true:false;  
     
    //当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效  
    var flag2=(ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea")?true:false;          
      
    //判断  
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