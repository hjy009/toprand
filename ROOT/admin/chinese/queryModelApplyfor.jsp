<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>查看应聘信息</title>
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script>
	
	function init(){
		highLightInit('row', 'rowover', 'rowselected');
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">查看应聘信息</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="" method="POST">
  <ww:hidden id="id" name="'id'"/>
   <tr>
    <th>姓名：</th>
    <td>&nbsp;<ww:property value="modelApplyfor.name"/></td>
  <tr>
  <tr>
    <th>应聘职位：</th>
    <td>&nbsp;<ww:property value="modelApplyfor.appliedPosition"/></td>
  </tr>
    <tr>
    <th>成员企业：</th>
    <td>&nbsp;<ww:property value="modelApplyfor.memberEnterprises"/></td>
    </tr>
  <tr>
    <th>性别：</th>
    <td>&nbsp; <ww:if test="modelApplyfor.sex==1">男</ww:if><ww:else>女</ww:else></td>
  </tr>
   <tr>
  	<th>出生日期：</th>
  	<td>&nbsp;<ww:property value="modelApplyfor.dateOfBirth"/></a></td>
  </tr>

  <tr>
  	<th>身份证：</th>
  	<td>&nbsp;<ww:property value="modelApplyfor.certificate"/></a></td>
  </tr>
    <tr>
  	<th>现住地址：</th>
  	<td>&nbsp;<ww:property value="modelApplyfor.address"/></td>
  </tr>
  <tr>
  	<th>籍   贯：</th>
  	<td>&nbsp;<ww:property value="modelApplyfor.nativePlace"/></textarea></td>
  </tr>
 
   <tr>
  	<th>联系电话：</th>
  	<td>&nbsp;<ww:property value="modelApplyfor.phone"/></td>
  </tr>
  <tr>
  	<th>E - mail：</th>
  	<td>&nbsp;<ww:property value="modelApplyfor.email"/></td>
  </tr>
  <tr>
  	<th>工作年限：</th>
  	<td>&nbsp;<ww:property value="modelApplyfor.workLife"/></td>
  </tr>
  <tr>
    <th>学    历：</th>
    <td>&nbsp;<ww:property value="modelApplyfor.degree" /></td>
  </tr>
  <tr>
    <th>专    业：</th>
    <td>&nbsp;<ww:property value="modelApplyfor.professional" /></td>
  </tr>
  <tr>
    <th>外    语：</th>
    <td>&nbsp;<ww:property value="modelApplyfor.english" /></td>
  </tr>
  <tr>
    <th>教育经历：</th>
    <td>&nbsp;<textarea rows="4" cols="84" readonly="readonly"><ww:property value="modelApplyfor.educationExperience" /></textarea></td>
  </tr>
  <tr>
    <th>工作经历：</th>
    <td>&nbsp;<textarea rows="4" cols="84" readonly="readonly"><ww:property value="modelApplyfor.workExperience" /></textarea></td>
  </tr>
  <tr>
    <th>自我评价：</th>
    <td>&nbsp;<textarea rows="4" cols="84" readonly="readonly"><ww:property value="modelApplyfor.selfEvaluation" /></textarea></td>
  </tr>

</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="关闭窗口"  onclick="window.close();">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
