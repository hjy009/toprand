<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>����<ww:property value='categoryName'/></title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<script>
	function addModelProduct(){
		var name = findById("name").value;
		if(name==""){
			alert('����������');
			return ;
		}
		if(name.length>80){
			alert("���ⲻ�ܳ���80����");
			return;
		}
		var fileImage = findById("fileSmallImage").value;
		if(fileImage==""){
			alert('ͼƬ����Ϊ��');
			return ;
		}
		<ww:if test="columnsType==1">
		var content = FCKeditorAPI.GetInstance('FCKeditor1').GetXHTML(true);
		if(content==""||content.replace (/\s+/g,"")=="<html><head><title></title></head><body><p></p></body></html>"){
			alert('����������');
			return ;
		}else{
			findById("content").value = content;
		}
		</ww:if>
		/**
		var initPrice = findById("initPrice").value;
		if(initPrice==""){
			alert("�������ʼ�۸�");
			return;
		}
		if(isNaN(initPrice)){
			alert("����ȷ�����ʼ�۸�");
			return ;
		}
		var nowPrice = findById("nowPrice").value;
		if(nowPrice==""){
			alert("���������ڼ۸�");
			return;
		}
		if(isNaN(nowPrice)){
			alert("����ȷ�������ڼ۸�");
			return ;
		}
		var discount = findById("discount").value;
		if(discount==""){
			alert("�������ۿ�");
			return;
		}
		if(isNaN(discount)){
			alert("����ȷ�����ۿ�");
			return ;
		}
		var pubTime = findById("pubTime").value;
		if(pubTime==""){
			alert('��ѡ�񷢲�ʱ��');
			return ;
		}*/
		var sequence=findById("sequence").value;
		if(sequence==""){
			alert("������˳��");
			return;
		}
		if(isNaN(sequence)){
			alert("����ȷ����˳��");
			return ;
		}
		var form = findById("form");
		form.action = "addModelProduct.do";
		form.submit();	
		findById("submitButton").disabled = true;
	}
	
	function init(){

	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">����<ww:property value='categoryName'/></div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST" enctype="multipart/form-data">
  <ww:hidden name="'categoryId'"/>
  <ww:hidden name="'categoryName'"/>
  <input type="hidden" id="content" name="modelProduct.content">
  <tr>
    <th width="15%"><font color="#FF0000">*</font>���ƣ�</th>
    <td>&nbsp;<input id="name" name="modelProduct.name" value="<ww:property value='modelProduct.name'/>" size="50">&nbsp;<font color="#FF0000">(���ⲻ�ܳ���80������)</font></td>
  </tr>
  <tr>
    <th>СͼƬ��</th>
    <td>&nbsp;<input type="file" id="fileSmallImage" name="fileSmallImage" value="<ww:property value='modelProduct.smallImage'/>" size="30">
	<br><font color="#FF0000">(�ϴ���ͼƬֻ֧��jpg,gif,bmp��ʽ,��С���ܳ���500k)</font></td>
  </tr>
  <ww:if test="columnsType==1">
  
  <tr>
    <th><font color="#FF0000">*</font>���ݣ�</th>
    <td>&nbsp;
		<script type="text/javascript">
			var sBasePath = "/fckeditor/" ;
			var oFCKeditor = new FCKeditor( 'FCKeditor1' ) ;
			oFCKeditor.BasePath	= sBasePath ;
			oFCKeditor.Height	= 200 ;
			oFCKeditor.Value = "<ww:property value="modelProduct.content"/>";
			oFCKeditor.Create() ;
		</script>
	</td>
  </tr>
  </ww:if>
  <%-- 
  <tr>
    <th>��ͼƬ��</th>
    <td>&nbsp;<input type="file" id="fileBigImage" name="fileBigImage" value="<ww:property value='modelProduct.bigImage'/>" size="30">
	<br><font color="#FF0000">(�ϴ���ͼƬֻ֧��jpg,gif,bmp��ʽ,��С���ܳ���500k)</font></td>
  </tr>
  <tr>
    <th width="15%"><font color="#FF0000">*</font>��ʼ�۸�</th>
    <td>&nbsp;<input id="initPrice" name="modelProduct.initPrice" value="<ww:if test='modelProduct.initPrice==null'>0.00</ww:if><ww:elseif test='modelProduct.initPrice!=null'><ww:property value='modelProduct.initPrice'/></ww:elseif>" size="50">&nbsp;<font color="#FF0000">Ԫ</font></td>
  </tr>
  <tr>
    <th width="15%"><font color="#FF0000">*</font>���ڼ۸�</th>
    <td>&nbsp;<input id="nowPrice" name="modelProduct.nowPrice" value="<ww:if test='modelProduct.nowPrice==null'>0.00</ww:if><ww:elseif test='modelProduct.nowPrice!=null'><ww:property value='modelProduct.nowPrice'/></ww:elseif>" size="50">&nbsp;<font color="#FF0000">Ԫ</font></td>
  </tr>
  <tr>
    <th width="15%"><font color="#FF0000">*</font>�ۿۣ�</th>
    <td>&nbsp;<input id="discount" name="modelProduct.discount" value="<ww:if test='modelProduct.discount==null'>0</ww:if><ww:elseif test='modelProduct.discount!=null'><ww:property value='modelProduct.discount'/></ww:elseif>" size="50">&nbsp;<font color="#FF0000">%</font></td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>����ʱ�䣺</th>
    <td>&nbsp;<ww:textfield name="'pubTime'" id="'pubTime'" size="'11'" maxlength="10"/><img src='/images/admin/calendar.gif' alt='���ѡ������' border='0' align='absmiddle' style="cursor:hand" onClick="return showCalendar('pubTime');">&nbsp;<font color="#FF0000">(���ڵ������ʽΪ��yyyy-MM-dd ����:2012-01-01)</font></td>
  </tr>
  <tr>
    <th>��ע��</th>
    <td>&nbsp;<textarea id="remark" name="modelProduct.remark" cols="50" rows="6"><ww:property value="modelProduct.remark"/></textarea>
	</td>
  </tr>
  --%>
  <tr>
  	<th><font color="#FF0000">*</font>˳��</th>
  	<td>&nbsp;<input id="sequence" name="modelProduct.sequence" value="<ww:if test='modelProduct.sequence==null'>1</ww:if><ww:elseif test='modelProduct.sequence!=null'><ww:property value='modelProduct.sequence'/></ww:elseif>" size="30"><font color="#FF0000">*ע��:�˿�ֻ���������֣�˳��Ӧ��1��ʼ������������ͬʱ,����Խ����Խ��</font></td>
  </tr>
  
  
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="�رմ���"  onclick="window.close();">
		  <input id="submitButton" type="button" value="�� ��"  onclick="addModelProduct()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
