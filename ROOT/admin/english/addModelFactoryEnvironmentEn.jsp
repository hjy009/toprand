<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>������������</title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
 <link rel="stylesheet" type="text/css" href="/css/default.css">
<script type="text/javascript" src="/js/default.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script>

	function addColumnImage(){
		var title = findById("title").value;
		if(title==""){
			alert('���������');
			return ;
		}
		if(title.length>30){
			alert("���ⲻ�ܳ���30����");
			return;
		}
		<%--
		var fileMaxImage= findById("fileMaxImage").value;
		if(fileMaxImage==""){
			alert("������ͼƬ");
			return;
		}
		--%>
		var fileMinImage= findById("fileMinImage").value;
		if(fileMinImage==""){
			alert("������ͼƬ");
			return;
		}
		var form = findById("form");
		form.action = "addFactoryEnvironmentEn.do";
		form.submit();	
		findById("submitButton").disabled = true;
	}
	
	function init(){
	
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">������������</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST" enctype="multipart/form-data">
  <tr>
    <th><font color="#FF0000">*</font>���ƣ�</th>
    <td>&nbsp;<input id="title" name=modelFactoryEnvironmentEn.name value="<ww:property value='modelFactoryEnvironmentEn.name'/>" size="50">&nbsp;<font color="#FF0000">(���ⲻ�ܳ���30������)</font></td>
  </tr><%--
 
  <tr id="imageTr">
    <th><font color="#FF0000">*</font>�Ŵ�ͼƬ��</th>
    <td>&nbsp;<input type="file" id="fileMaxImage" name="fileMaxImage" value="<ww:property value='modelFactoryEnvironment.maxImage'/>" size="30">
	<br><font color="#FF0000">(�ϴ���ͼƬֻ֧��jpg,gif,bmp��ʽ,��С���ܳ���1M)</font></td>
  </tr>
  --%><tr id="imageTr">
    <th><font color="#FF0000">*</font>ͼƬ��</th>
    <td>&nbsp;<input type="file" id="fileMinImage" name="fileMinImage" value="<ww:property value='modelFactoryEnvironmentEn.minImage'/>" size="30">
	<br><font color="#FF0000">(�ϴ���ͼƬֻ֧��jpg,gif,bmp��ʽ,��С���ܳ���1M)</font></td>
  </tr>
 <tr>
  	<th><font color="#FF0000">*</font>˳��</th>
  	<td>&nbsp;<input id="sequence" name="modelFactoryEnvironmentEn.sequence" value="<ww:if test='modelFactoryEnvironmentEn.sequence==null'>1</ww:if><ww:elseif test='modelFactoryEnvironmentEn.sequence!=null'><ww:property value='modelFactoryEnvironmentEn.sequence'/></ww:elseif>" size="30"><font color="#FF0000">*ע��:�˿�ֻ���������֣�˳��Ӧ��1��ʼ������������ͬʱ,����Խ����Խ��</font></td>
  </tr>
  
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="�رմ���"  onclick="parent.window.close();">
		  <input id="submitButton" type="button" value="����"  onclick="addColumnImage()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
