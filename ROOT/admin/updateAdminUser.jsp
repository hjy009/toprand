<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	List typeList = (List)request.getAttribute("typeList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>修改用户信息</title>
</head>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script>
	function updateAdminUser(){
		var form = findById("form");
		form.action = "updateAdminUser.do";
		form.submit();	
	}
	
	function init(){
		doSelect("type","<ww:property value='adminUser.type'/>");
	}
</script>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">修改用户信息</div></td></tr></table>
<table width="98%" border="0" align="center" cellspacing="0" cellpadding="0" class="actiontable">
<form id="form" action="updateAdminUser.do" method="POST">
  <ww:hidden id="id" name="'id'"/>
  <tr>
    <th>用户名：</th>
    <td>&nbsp;<ww:property value='adminUser.userName'/></td>
  </tr>
  <tr>
    <th><font color="#FF0000">*</font>姓名：</th>
    <td>&nbsp;<input id="name" name="adminUser.name" value="<ww:property value='adminUser.name'/>"></td>
  </tr>
  <tr>
  	<th><font color="#FF0000">*</font>类型：</th>
	<td>&nbsp;<select id="type" name="adminUser.type">
							<%if(typeList!=null&&typeList.size()>0){%>
								<%for(Iterator it = typeList.iterator();it.hasNext();){
								Dictionary dic = (Dictionary)it.next();
						%>
									
									<option value="<%=dic.getCode()%>"><%=dic.getValue()%></option>
								<%}%>
							<%}%>
						 </select></td>
  </tr>
  <tr>
    <th>描述：</th>
    <td>&nbsp;<textarea id="description" name="adminUser.description" cols="30" rows="4"><ww:property value="adminUser.description"/></textarea>
	</td>
  </tr>
</form>
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="关闭窗口"  onclick="window.close();">
		  <input type="button" value="修改"  onclick="updateAdminUser()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>
