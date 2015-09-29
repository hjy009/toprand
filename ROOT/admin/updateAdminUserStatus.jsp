<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	List statusList = (List)request.getAttribute("statusList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>修改用户状态</title>
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script>
	function updateAdminUserStatus(){
		var form = findById("form");
		form.action = "updateAdminUserStatus.do";
		form.submit();	
	}
	
	function init(){
		doSelect("status","<ww:property value='adminUser.status'/>");
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">修改用户状态</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="updateAdminUserStatus.do" method="POST">
  <ww:hidden id="id" name="'id'"/>
  <tr>
    <th>用户名：</th>
    <td>&nbsp;<ww:property value='adminUser.userName'/></td>
  </tr>
  <tr>
    <th>姓名：</th>
    <td>&nbsp;<ww:property value='adminUser.name'/></td>
  </tr>
  <tr>
  	<th><font color="#FF0000">*</font>状态：</th>
	<td>&nbsp;<select id="status" name="adminUser.status">
							<%if(statusList!=null&&statusList.size()>0){%>
								<%for(Iterator it = statusList.iterator();it.hasNext();){
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
		  <input type="button" value="关闭窗口"  onclick="window.close();">
		  <input type="button" value="修改"  onclick="updateAdminUserStatus()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
