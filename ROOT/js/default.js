//����ID����ҳ��Ԫ��
function findById(id){
	return document.getElementById(id);
}
//�������Ʋ���ҳ��Ԫ��
function findByName(name){
	return document.getElementsByName(name);	
}

//�滻�ַ�������str�����е�str1�滻Ϊstr2
function replaceString(str,str1,str2){
	if(str == "") return "";
	var i = str.indexOf(str1);
	var in2 = str;
	while(i >= 0){
		in2 = in2.substring(0,i)+str2+in2.substring(i+str2.length,in2.length);
		i = in2.indexOf(str1);
	}
	return in2;
}
//�ж�ֵ�Ƿ�Ϊ��
function isEmpty(value){
	if(value == undefined || value == "") return true;
	return false;	
}


//�õ�ָ�����Ƶ�checkbox����ѡ��ֵ��ƴ�մ�����splitter�ָ��������κ�ѡ�е�ֵ������defaultValue
function getCheckValues(name,splitter,defaultValue){
	var checkboxs = findByName(name);
	if(checkboxs == undefined) return;
	var rets = "";
	for(var i=0;i < checkboxs.length;i++){
		if(checkboxs[i].checked == true){
			rets=rets+checkboxs[i].value+splitter;
		}		
	}
	return (rets.length == 0)?defaultValue:rets.substring(0,rets.length-1);
}
//�õ�ָ��id��select����ѡ��ֵ��ƴ�մ�����splitter�ָ��������κ�ѡ�е�ֵ������defaultValue
function getSelectValues(id,splitter,defaultValue){
	var selects = findById(id);
	if(selects == undefined) return "";
	var rets = "";
	for(var i=0;i < selects.options.length;i++){
		if(selects.options[i].selected == true){
			rets=rets+selects.options[i].value+splitter;
		}		
	}
	return (rets.length == 0)?defaultValue:rets.substring(0,rets.length-1);	
}
//����checkbox��radioֵѡ��ĳcheckbox��radio
function doCheck(name,value,enable){
	var elements = findByName(name);
	if(elements == undefined) return;
	if(enable == undefined) enable = true;
	for(var i=0;i < elements.length;i++){
		if(elements[i].value == value){
			elements[i].checked = true;	
			elements[i].disabled = !enable;
		}		
	}
}
//����valuesѡ��name�еļ���ֵ
function doInitCheck(values,name){
	var values2 = values.split(",");
	if(values2.length > 0){
		for(var i=0;i<values2.length;i++){
			doCheck(name,values2[i]);	
		}
	}
}
//����ֵѡ���������ĳһ��
function doSelect(id,value){
	var select = findById(id);
	if(select == undefined) return;
	for(var i=0; i< select.options.length;i++){
		if(select.options[i].value == value){
			select.options[i].selected = true;
			return;	
		}	
	}
	return;
}
//����ҳ���ȫѡname:��ѡ���checkbox��name
function selectAll(checkAll,name){
	var selects = document.getElementsByName(name);
	if(selects){
		if(checkAll.checked==true){
			for(var i=0;i<selects.length;i++){
				selects[i].checked = true;
			}
		}if(checkAll.checked==false){
			for(var i=0;i<selects.length;i++){
				selects[i].checked = false;
			}
		}
	}
}

//�ж��Ƿ�Ϊ�Ϸ���email��ַ
function isEmail(value){
	if(isEmpty(value)) return false;
	var at = value.indexOf("@");
	var dot = value.indexOf(".");
	if(at < 0 || dot < 0) return false;
	if((at + 1) >= dot) return false;
	if((dot + 1) >= value.length) return false;
	return true;
}


//�ж��ַ������Ƿ��зǷ��ַ�(illegalΪ�Ƿ��ַ����)
function isIllegalString(value,illegal){
	if(isEmpty(illegal)) return false;
	if(isEmpty(value)) return false;
	for(var i=0;i<illegal.length;i++){
		var c = illegal.charAt(i);	
		if(value.indexOf(c) >= 0) return true;
	}
	return false;
}

//�ж��ַ������Ƿ�ȫ�ǺϷ��ַ�(legalΪ���кϷ��ַ����)
function isLegalString(value,legal){
	if(isEmpty(legal)) return false;
	if(isEmpty(value)) return true;
	for(var i=0;i<value.length();i++){
		var c = value.charAt(i);
		if(legal.indexOf(c) < 0) return false;			
	}
	return true;
}
//�����Ի����ڣ����ݾɰ汾
function doShowModalDialog(dialogURL,dialogTitle,dialogStyle){	
	return window.showModalDialog("iframe.jsp",new Array(dialogURL,dialogTitle),dialogStyle);	
}

//�����Ի�����
function openDialog(dialogURL,dialogTitle,dialogWidth,dialogHeight){
	//return openCustomerDialog(dialogURL,dialogTitle,dialogWidth,dialogHeight,"about:blank",0,"");
	
	if(dialogWidth == undefined) dialogWidth = 700;
	if(dialogHeight == undefined) dialogHeight = 450;
	var dialogStyle = "dialogWidth="+dialogWidth+"px;dialogHeight="+dialogHeight+"px;status=off;help=off;";	
	return window.showModalDialog("iframe.jsp",new Array(dialogURL,dialogTitle),dialogStyle);	
}
//����������
function openArgDialog(dialogURL,dialogTitle,dialogWidth,dialogHeight,dialogArg){
	//return openCustomerDialog(dialogURL,dialogTitle,dialogWidth,dialogHeight,"about:blank",0,dialogArg);	
	if(dialogWidth == undefined) dialogWidth = 700;
	if(dialogHeight == undefined) dialogHeight = 450;
	var dialogStyle = "dialogWidth="+dialogWidth+"px;dialogHeight="+dialogHeight+"px;status=off;help=off;";	
	return window.showModalDialog("iframe.jsp",new Array(dialogURL,dialogTitle,dialogArg),dialogStyle);	
}

function openBarDialog(dialogURL,dialogTitle,dialogWidth,dialogHeight,dialogBarURL){
	return openCustomerDialog(dialogURL,dialogTitle,dialogWidth,dialogHeight,dialogBarURL,20,"");
}

function openCustomerDialog(dialogURL,dialogTitle,dialogWidth,dialogHeight,dialogBarURL,dialogBarHeight,dialogArg){
	if(dialogTitle == undefined) dialogTitle = "���������ļ��������޹�˾";
	if(dialogWidth == undefined) dialogWidth = 700;
	if(dialogHeight == undefined) dialogHeight = 450;	
	if(dialogBarURL == undefined) dialogBarURL = "about:blank";
	if(dialogBarHeight == undefined) dialogBarHeight = 0;
	var dialogStyle = "dialogWidth="+dialogWidth+"px;dialogHeight="+dialogHeight+"px;status=off;help=off;";	
	return window.showModalDialog("iframe.jsp",new Array(dialogURL,dialogTitle,dialogBarURL,dialogBarHeight,dialogArg),dialogStyle);			
}




function getDialogArg(){
		var args = window.dialogArguments;
		if(args.length > 4){
			return args[4];
		}
}

//��������
function openWindow(dialogURL,dialogTitle,dialogWidth,dialogHeight){
	if(dialogWidth == undefined) dialogWidth = 700;
	if(dialogHeight == undefined) dialogHeight = 450;
	var dialogStyle = "dialogWidth="+dialogWidth+"px;dialogHeight="+dialogHeight+"px;status=off;help=off;";	
	window.showModelessDialog("iframe.jsp",new Array(dialogURL,dialogTitle),dialogStyle);		
	
}

//�Զ����������ڵĸ߶ȵ��������ʺϸ߶�
function resizeWindowHeightToHereTop(maxHeight){
	document.write("<img id=\"_buttom\" width=\"0\" height=\"0\" border=\"0\" src=\"http://auth.netmovie.com.cn/images/spacer.gif\" onload=\"resizeWindowHeightTo('_buttom',"+maxHeight+")\" />");
}
function resizeWindowHeightTo(id,maxHeight){
	var dheight = 60;
	var ele= findById(id);
	if(ele == undefined) return;
	if(maxHeight == undefined){
		window.dialogHeight=(ele.offsetTop+dheight)+"px";
	}else{
		if(ele.offsetTop+ dheight <=maxHeight){
			window.dialogHeight=(ele.offsetTop+dheight)+"px";
		}else{
			window.dialogHeight=maxHeight+"px";	
		}		
	}	
}

//��������������궯������
var _high_light_over_class;
var _high_light_selected_class;
var _high_light_selected_obj;
var _high_light_callback;

function highLightInit(str_line_name, class_name_over, class_name_selected, callback)
{
    _high_light_over_class = class_name_over;
    _high_light_selected_class = class_name_selected;
    if(callback == undefined){}else{ _high_light_callback = callback;}
    var int_count = 0;
    var obj;
    //IE�²�֧�ֶ�table,div����document.getElementsByName()ȡ�ö�������
    while(obj = document.getElementById(str_line_name+"_"+int_count)){
        obj['onmouseover'] = _high_light_mouse_over;
        obj['onmouseout'] = _high_light_mouse_out;
        obj['onclick'] = _high_light_mouse_click;
        obj.org_class = obj.className;
        int_count ++;   
    }
}

function _high_light_mouse_over(evt)
{
    var obj = document.all ? event.srcElement : evt.target;
    while(obj.tagName != 'TR') obj = obj.parentNode;
    if(obj.className != _high_light_selected_class) obj.className = _high_light_over_class;
}

function _high_light_mouse_out(evt)
{
    var obj = document.all ? event.srcElement : evt.target;
    while(obj.tagName != 'TR') obj = obj.parentNode;
    if(obj.className != _high_light_selected_class) obj.className = obj.org_class;
}

function _high_light_mouse_click(evt)
{
    var obj = document.all ? event.srcElement : evt.target;
    while(obj.tagName != 'TR') obj = obj.parentNode;
    if(_high_light_selected_obj != undefined) _high_light_selected_obj.className = _high_light_selected_obj.org_class;
    if(obj.className == _high_light_selected_class){
    	obj.className = obj.org_class;
    }else{
    	 obj.className = _high_light_selected_class;
    }
    _high_light_selected_obj=obj;
    if(_high_light_callback != undefined){
    		_high_light_callback.call();
    }
}
