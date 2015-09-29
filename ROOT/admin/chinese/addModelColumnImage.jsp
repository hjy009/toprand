<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	List typeList = (List)request.getAttribute("modelColumnImageType");
	List parentTypeList = (List)request.getAttribute("modelColumnImageParentType");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>������Ŀ����</title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
 <link rel="stylesheet" type="text/css" href="/css/default.css">
<script type="text/javascript" src="/js/default.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script>
	function clickChange(){ 
	if($("#parentType").attr("value")=='1'){ 
		$("#imageTr").slideToggle(2000);
		$("#flashTr").hide();
		}
	if($("#parentType").attr("value")=='2'){ 
		$("#flashTr").slideToggle(2000);
		$("#imageTr").hide();
		}
	}
	
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
		var form = findById("form");
		form.action = "addModelColumnImage.do";
		form.submit();	
		findById("submitButton").disabled = true;
	}
	
	function init(){
	 if($("#parentType").attr("value")=='1'){ 
		$("#imageTr").show();
		$("#flashTr").hide();
		}
	if($("#parentType").attr("value")=='2'){ 
		$("#imageTr").hide();
		$("#flashTr").show();
		}

		doSelect("type","<ww:property value='modelColumnImage.type'/>");
	}
	function imageHw(){
		if($("#type").attr("value")!='1'){
			$("#code_1").show();
		}else{
			$("#code_1").hide();
		}
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">������Ŀ����</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST" enctype="multipart/form-data">
  <tr>
    <th><font color="#FF0000">*</font>���⣺</th>
    <td>&nbsp;<input id="title" name="modelColumnImage.title" value="<ww:property value='modelColumnImage.title'/>" size="50">&nbsp;<font color="#FF0000">(���ⲻ�ܳ���30������)</font></td>
  </tr>
  <tr>
    <th>���ӣ�</th>
    <td>&nbsp;<input id="link" name="modelColumnImage.link" value="<ww:property value='modelColumnImage.link'/>" size="30"></td>
  </tr>
   <tr>
  	<th width="15%"><font color="#FF0000">*</font>չʾ���ͣ�</th>
  		<td>
  			&nbsp;<select name="modelColumnImage.parentType" id="parentType" onchange="clickChange();">
  				<option value="1">ͼƬ</option>
  				<option  value="2">Flash</option>
  			</select>
  		</td>
  </tr>
  <tr id="imageTr">
    <th><font color="#FF0000">*</font>ͼƬ��</th>
    <td>&nbsp;<input type="file" id="fileImage" name="fileImage" value="<ww:property value='modelColumnImage.path'/>" size="30">
	<br><font color="#FF0000">�ϴ���ͼƬֻ֧��jpg,gif,bmp��ʽ,��С���ܳ���1M</font>
	<font id="code_1" color="#FF0000" style="display: none;">,����ʺ�990,�߶��ʺ�245</font>
	</td>
  </tr>
  
  <tr style="display:none" id="flashTr">
    <th>Flash��</th>
    <td>&nbsp;<input type="file" id="fileFlash" name="fileFlash" value="<ww:property value='modelColumnImage.flash'/>" size="50"/>
	<br><font color="#FF0000">(�ϴ���ֻ֧��swf,flv��ʽ,��С���ܳ���20m)</font>
	</td>
  </tr>
  
  <tr>
  	<th><font color="#FF0000">*</font>���ͣ�</th>
	<td>&nbsp;<select id="type" name="modelColumnImage.type" onchange="imageHw()">
							<%if(typeList!=null&&typeList.size()>0){%>
								<%for(Iterator it = typeList.iterator();it.hasNext();){
								Dictionary dic = (Dictionary)it.next();
						%>
									
									<option value="<%=dic.getCode()%>"><%=dic.getValue()%></option>
								<%}%>
							<%}%>
						 </select></td>
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
