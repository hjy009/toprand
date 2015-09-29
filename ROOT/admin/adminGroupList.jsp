<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	List groupList = (List)request.getAttribute("groupList");
	List userGroupList = (List)request.getAttribute("userGroupList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>角色分配</title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function updateAdminGroup(){
		var groupValue = "";
		var group = document.all.group;
		for(var i=0;i<group.length;i++){
			if(group[i].checked){
				groupValue = group[i].value;
			}
		}
		if(groupValue==""){
			alert("请选择一个角色!");
			return;
		}
		var form = findById("form");
		form.action = "updateAdminGroup.do?groupId="+groupValue;
		form.submit();	
	}
	
	function refresh(){
		var form = findById("form");
		form.action = "adminGroupList.do"
		form.submit();
	}
	
	function init(){
		highLightInit('row', 'rowover', 'rowselected');
	}
</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">角色分配</div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	<ww:hidden name="'uId'"/>
	<tr>
		<input type="button" value="修改角色" onClick="javascript:updateAdminGroup();">
		</td>
	  </tr>
	</form>
</table>
<table width="96%"  class="tborder" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr class="theader" align="center">
  	<th>选择</th>
  	<th>角色名称</th>
	<th>说明</th>
  </tr>
  <!-- ================ 显示各行数据 ================ -->
  <%
  	if( groupList!= null && groupList.size() > 0){
  		int count = 0;
	  	for(int i=0;i<groupList.size();i++){
	  		count++;
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=count-1%>">
			    <td><input type="radio" id="group" name="group" value="<%=((Map)groupList.get(i)).get("id")%>" <%if(userGroupList!=null&&userGroupList.size()>0){%><%if(((Integer)((Map)groupList.get(i)).get("id")).intValue()==((Integer)((Map)userGroupList.get(0)).get("group_id")).intValue()){%> checked="checked"<%}%><%}%>></td>
				<td><%=(String)((Map)groupList.get(i)).get("name")%></td>
				<td><%=(String)((Map)groupList.get(i)).get("remark")%></td>
			  </tr>
	<%
	  	}
	%>
  <%
	  }else{
  %>
			  <tr class="rowodd" align="center">
			    <td colspan="3" height="50">无相关数据</td>
			  </tr>
  <%	  	
	  }
  %>
  <!-- ================================================ -->
</table>
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  <input type="button" value="关闭窗口"  onclick="window.close();">
		  <input type="button" value="修改角色"  onclick="updateAdminGroup()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>