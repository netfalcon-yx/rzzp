window.onload=function(){
	document.getElementsByTagName("body")[0].onkeydown =function(){
		
		//��ȡ�¼�����
		var elem = event.relatedTarget || event.srcElement || event.target ||event.currentTarget; 
		
		if(event.keyCode==8){//�жϰ���ΪbackSpace��
		
				//��ȡ��������ʱ�����ָ���element
				var elem = event.srcElement || event.currentTarget; 
				
				//�ж��Ƿ���Ҫ��ֹ���¼��̵��¼�Ĭ�ϴ���
				var name = elem.nodeName;
				
				if(name!='INPUT' && name!='TEXTAREA'){
					return _stopIt(event);
				}
				var type_e = elem.type.toUpperCase();
				if(name=='INPUT' && (type_e!='TEXT' && type_e!='TEXTAREA' && type_e!='PASSWORD' && type_e!='FILE')){
						return _stopIt(event);
				}
				if(name=='INPUT' && (elem.readOnly==true || elem.disabled ==true)){
						return _stopIt(event);
				}
			}
		}
	}
function _stopIt(e){
		if(e.returnValue){
			e.returnValue = false ;
		}
		if(e.preventDefault ){
			e.preventDefault();
		}				

		return false;
}// JavaScript Document