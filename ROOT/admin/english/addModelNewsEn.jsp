<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>�������ŷ���</title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<script>
	function addModelNews(){
		var title = findById("title").value;
		if(title==""){
			alert('���������');
			return ;
		}
		 
		var content = FCKeditorAPI.GetInstance('FCKeditor1').GetXHTML(true);
		if(content==""||content.replace (/\s+/g,"")=="<html><head><title></title></head><body><p></p></body></html>"){
			alert('����������');
			return ;
		}else{
			findById("content").value = content;
		}
		var pubTime = findById("pubTime").value;
		if(pubTime==""){
			alert('��ѡ�񷢲�ʱ��');
			return ;
		}
		
		var click=findById("click").value;
		if(click==""){
			alert("����ȷ��������");
			return;
		}
		if(isNaN(click)){
			alert("����ȷ��������");
			return ;
		}
		var sequence=findById("sequence").value;
		if(sequence==""){
			alert("������˳��");
			return;
		}
		if(isNaN(sequence)){
			alert("����ȷ����˳��");
			return ;
		}
		var year = findById("year").value;
		if(year==""){
			alert('���������');
			return ;
		}
		if(isNaN(year)){
			alert('��ݸ�ʽ����ȷ');
			return ;
		}
		
		var form = findById("form");
		form.action = "addModelNewsEn.do";
		form.submit();	
		findById("submitButton").disabled = true;
	}
	
	function init(){

	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">�������ŷ���</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST" enctype="multipart/form-data">
  <input type="hidden" id="content" name="modelNewsEn.content">
  <input type="hidden" id="content" name="centerId" value='<ww:property value="centerId" />' >
  <tr>
    <th width="15%"><font color="#FF0000">*</font>���⣺</th>
    <td>&nbsp;<input id="title" name="modelNewsEn.title" value="<ww:property value='modelNewsEn.title'/>" size="50">&nbsp; </td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>���ݣ�</th>
    <td>&nbsp;
		<script type="text/javascript">
			var sBasePath = "/fckeditor/" ;
			var oFCKeditor = new FCKeditor( 'FCKeditor1' ) ;
			oFCKeditor.BasePath	= sBasePath ;
			oFCKeditor.Height	= 200 ;
			oFCKeditor.Value = "<ww:property value="modelNewsEn.content"/>";
			oFCKeditor.Create() ;
		</script>
	</td>
  </tr>
  <tr>
    <th>����ͼƬ��</th>
    <td>&nbsp;<input type="file" id="fileImage" name="fileImage" value="<ww:property value='modelNewsEn.path'/>" size="30">
	<br><font color="#FF0000">(�ϴ���ͼƬֻ֧��jpg,gif,bmp��ʽ,��С���ܳ���500k)</font></td>
  </tr>
  <tr>
    <th>��ҳ��̬ͼƬ��</th>
    <td>&nbsp;<input type="file" id="fileSyImage" name="fileSyImage" value="<ww:property value='modelNewsEn.syPath'/>" size="30">
	<br><font color="#FF0000">(�ϴ���ͼƬֻ֧��jpg,gif,bmp��ʽ,��С���ܳ���500k)</font></td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>����ʱ�䣺</th>
    <td>&nbsp;<ww:textfield name="'pubTime'" id="'pubTime'" size="'11'" maxlength="10"/><img src='/images/admin/calendar.gif' alt='���ѡ������' border='0' align='absmiddle' style="cursor:hand" onClick="return showCalendar('pubTime');">&nbsp;<font color="#FF0000">(���ڵ������ʽΪ��yyyy-MM-dd ����:2012-01-01)</font></td>
  </tr>
  <tr>
    <th width="15%">��Դ��</th>
    <td>&nbsp;<input id="source" name="modelNewsEn.source" value="<ww:property value='modelNewsEn.source'/>" size="30"></td>
  </tr>
  <tr>
    <th width="15%">ͨѶԱ��</th>
    <td>&nbsp;<input id="reporter" name="modelNewsEn.reporter" value="<ww:property value='modelNewsEn.reporter'/>" size="30"></td>
  </tr>
  <tr>
    <th width="15%"><font color="#FF0000">*</font>�������</th>
    <td>&nbsp;<input id="click" name="modelNewsEn.click" value="<ww:property value='modelNewsEn.click'/>" size="30"></td>
  </tr>
   <tr>
 	 <th width="15%"><font color="#FF0000">*</font>��ݣ�</th>
     <td>&nbsp;<input id="year" name="modelNewsEn.year" value="<ww:if test='modelNewsEn.year==null'><ww:property value='dateFormat'/></ww:if><ww:elseif test='modelNewsEn.year!=null'><ww:property value='modelNewsEn.year'/></ww:elseif>" size="10" maxlength="4">&nbsp;<font color="#FF0000"></font></td>
  </tr>
<tr>
  	<th><font color="#FF0000">*</font>˳��</th>
  	<td>&nbsp;<input id="sequence" name="modelNewsEn.sequence" value="<ww:if test='modelNewsEn.sequence==null'>1</ww:if><ww:elseif test='modelNewsEn.sequence!=null'><ww:property value='modelNewsEn.sequence'/></ww:elseif>" size="30"><font color="#FF0000">*ע��:�˿�ֻ���������֣�˳��Ӧ��1��ʼ������������ͬʱ,����Խ����Խ��</font></td>
  </tr>
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="�رմ���"  onclick="window.close();">
		  <input id="submitButton" type="button" value="�� ��"  onclick="addModelNews()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
