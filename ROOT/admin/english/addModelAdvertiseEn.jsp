<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="java.util.*"%>
<%
	List typeList = (List)request.getAttribute("typeList");
	List degreeTypeList = (List)request.getAttribute("degreeTypeList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>新增招聘信息</title>
<link href="/fckeditor/_samples/sample.css" rel="stylesheet" type="text/css" />
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script type="text/javascript" src="/fckeditor/fckeditor.js"></script>
<script>
	function addModelAdvertise(){
		var name = findById("name").value;
		if(name==""){
			alert('请输入名称');
			return ;
		}
		if(name.length>30){
			alert("名称不能超过30个字");
			return;
		}
		var description = FCKeditorAPI.GetInstance('FCKeditor1').GetXHTML(true);
		if(description==""){
			alert('请输入内容');
			return ;
		}else{
			findById("description").value = description;
		}
		var requires = FCKeditorAPI.GetInstance('FCKeditor2').GetXHTML(true);
		if(requires==""){
			alert('请输入内容');
			return ;
		}else{
			findById("requires").value = requires;
		}
		
		var pubTime = findById("pubTime").value;
		if(pubTime==""){
			alert('请选择发布时间');
			return ;
		}
		<%--
		var startTime = findById("startTime").value;
		if(startTime==""){
			alert('请选择开始时间');
			return ;
		}
		var endTime = findById("endTime").value;
		if(endTime==""){
			alert('请选择结束时间');
			return ;
		}
		--%>
		var form = findById("form");
		form.action = "addModelAdvertiseEn.do";
		form.submit();	
		findById("submitButton").disabled = true;
	}
	
	function init(){
		doSelect('degree',"<ww:property value='modelAdvertiseEn.degree'/>");
		highLightInit('row', 'rowover', 'rowselected');
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">新增招聘信息</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST" enctype="multipart/form-data">
  <input type="hidden" id="description" name="modelAdvertiseEn.description">
  <input type="hidden" id="requires" name="modelAdvertiseEn.requires">
  <tr>
    <th><font color="#FF0000">*</font>职位名称：</th>
    <td>&nbsp;<input id="name" name="modelAdvertiseEn.name" value="<ww:property value='modelAdvertiseEn.name'/>" size="50">
     &nbsp;<font color="#FF0000">(职位名称不能超过30个文字)</font>
    </td>
  </tr>
   <tr>
    <th><font color="#FF0000"></font>公司名称：</th>
    <td>&nbsp;
     	<select id="adPerson" name="modelAdvertiseEn.company" style="width: 340px"  >					
		                 		<option value="CHANGZHOU XINHUACHANG INT’L CONTAINERS CO.,LTD">CHANGZHOU XINHUACHANG INT’L CONTAINERS CO.,LTD</option>
		                 		<option value="NINGBO XINHUACHANG INT'L CONTAINERS CO.,LTD">NINGBO XINHUACHANG INT'L CONTAINERS CO.,LTD</option>
		                 		<option value="HUIZHOU XINHUACHANG INT'L CONTTAINERS CO.,LTD">HUIZHOU XINHUACHANG INT'L CONTTAINERS CO.,LTD</option>
		                 		<option value="TIANJIN XINHUACHANG INT'L CONTAINERS CO.,LTD">TIANJIN XINHUACHANG INT'L CONTAINERS CO.,LTD</option>
		                 		<option value="CXIC GROUP CONTAINERS COMPANY LIMITED">CXIC GROUP CONTAINERS COMPANY LIMITED</option>
		                 		<option value="JIASHAN XINHUACHANG INTERNATIONAL CONTAINERS CO.,LTD">JIASHAN XINHUACHANG INTERNATIONAL CONTAINERS CO.,LTD</option>
		                 		<option value="CXIC JIASHAN TIMBER PRODUCTS CO.,LTD">CXIC JIASHAN TIMBER PRODUCTS CO.,LTD</option>
		                 		<option value="QINGDAO XINHUACHANG INTERNATIONAL CONTAINERS CO., LTD">QINGDAO XINHUACHANG INTERNATIONAL CONTAINERS CO., LTD</option>
         </select>
    </td>
  </tr>
   <tr>
    <th><font color="#FF0000"></font>工作地点：</th>
    <td>&nbsp;<input id="adPerson" name="modelAdvertiseEn.workingPlace" value="<ww:property value='modelAdvertiseEn.workingPlace'/>" size="30"></td>
  </tr>
  <tr>
    <th><font color="#FF0000"></font>招聘人数：</th>
    <td>&nbsp;<input id="adPerson" name="modelAdvertiseEn.adPerson" value="<ww:property value='modelAdvertiseEn.adPerson'/>" size="30"></td>
  </tr>
  <tr>
   <th>基本要求：</th>
  	 <td>
  	  &nbsp;<input id="adPerson" name="modelAdvertiseEn.degree" value="<ww:property value='modelAdvertiseEn.degree'/>" size="30"></td>
	</td>
	</tr>
	<%-- <tr>
    <th><font color="#FF0000">*</font>开始时间：</th>
    <td>&nbsp;<ww:textfield name="'startTime'" id="'startTime'" size="'11'" maxlength="10"/><img src='/images/admin/calendar.gif' alt='点击选择日期' border='0' align='absmiddle' style="cursor:hand" onClick="return showCalendar('startTime');">
     &nbsp;<font color="#FF0000">(日期的输入格式为：yyyy-MM-dd 例如:2012-01-01)</font>
    </td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>结束时间：</th>
    <td>&nbsp;<ww:textfield name="'endTime'" id="'endTime'" size="'11'" maxlength="10"/><img src='/images/admin/calendar.gif' alt='点击选择日期' border='0' align='absmiddle' style="cursor:hand" onClick="return showCalendar('endTime');">
     &nbsp;<font color="#FF0000">(日期的输入格式为：yyyy-MM-dd 例如:2012-01-01)</font>
    </td>
  </tr>
    --%>
    <tr>
	    <th><font color="#FF0000">*</font>发布时间：</th>
	    <td>&nbsp;<ww:textfield name="'pubTime'" id="'pubTime'" size="'11'" maxlength="10"/><img src='/images/admin/calendar.gif' alt='点击选择日期' border='0' align='absmiddle' style="cursor:hand" onClick="return showCalendar('pubTime');">
	     &nbsp;<font color="#FF0000">(日期的输入格式为：yyyy-MM-dd 例如:2012-01-01)</font>
	    </td>
 	 </tr>
    <tr>
    <th><font color="#FF0000"><%--*--%></font>其他说明：</th>
    <td>&nbsp;
		<script type="text/javascript">
			var sBasePath = "/fckeditor/" ;
			var oFCKeditor = new FCKeditor( 'FCKeditor1' ) ;
			oFCKeditor.BasePath	= sBasePath ;
			oFCKeditor.Height	= 200 ;
			oFCKeditor.Value = "<ww:property value="modelAdvertiseEn.description"/>";
			oFCKeditor.Create() ;
		</script>
	</td>
  </tr>
    <tr>
    <th><font color="#FF0000"><%--*--%></font>专业要求：</th>
    <td>&nbsp;
		<script type="text/javascript">
			var sBasePath = "/fckeditor/" ;
			var oFCKeditor = new FCKeditor( 'FCKeditor2' ) ;
			oFCKeditor.BasePath	= sBasePath ;
			oFCKeditor.Height	= 200 ;
			oFCKeditor.Value = "<ww:property value="modelAdvertiseEn.requires"/>";
			oFCKeditor.Create() ;
		</script>
	</td>
  </tr>
  <tr>
    <th><font color="#FF0000"></font>联系人：</th>
    <td>&nbsp;<input id="linkman" name="modelAdvertiseEn.linkman" value="<ww:property value='modelAdvertiseEn.linkman'/>" size="30"></td>
  	</tr>
   <tr>
    <th><font color="#FF0000"></font>电话：</th>
    <td>&nbsp;<input id="telephone" name="modelAdvertiseEn.telephone" value="<ww:property value='modelAdvertiseEn.telephone'/>" size="30"></td>
  </tr>
      <tr>
    <th><font color="#FF0000"></font>邮箱：</th>
    <td>&nbsp;<input id="email" name="modelAdvertiseEn.email" value="<ww:property value='modelAdvertiseEn.email'/>" size="30"></td>
  </tr>


</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="关闭窗口"  onclick="window.close();">
		  <input id="submitButton" type="button" value="新 增"  onclick="addModelAdvertise()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
