<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="java.util.*"%>
<%
	List list = (List)request.getAttribute("list");
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>员工与招聘管理</title> 
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function goEdit(programCode,name){
	
		window.location.href=programCode+"&typeName="+name;
	
	}
	   
 
</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">员工与招聘管理</div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	  <ww:hidden name="'pageNumber'" />
	  <tr>
		<td style="border:0;" >

		</td>
	  </tr>
	</form>
</table>
<table width="96%"  class="tborder" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr class="theader" align="center">
  	 
  	<th>编号</th>
  	<th>栏目名称</th>
	<th>操作</th>
  </tr>
  <!-- ================ 显示各行数据 ================
 
   -->
  <%
      		if(list != null && list.size() > 0){
      		for(int i=0;i<list.size();i++){
      		Map map = (Map)list.get(i);
      		String rowClass = (i % 2 == 0)?"roweven":"rowodd";
      		
  %>
			  <tr class="<%=rowClass %>" align="center" id="">
			   
			  	<td><%=i+1 %></td>
				<td><%=map.get("name") %></td>
				<td align="center">				
				<input id="answerButton" type="button" value="进入编辑..." onClick="javascript:goEdit('<%=map.get("program_code") %>','<%=map.get("name") %>');">
				</td>
			  </tr>
			  <%} %>

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

<%@include file="/WEB-INF/inc/response.jsp"%>
</body>
</html>