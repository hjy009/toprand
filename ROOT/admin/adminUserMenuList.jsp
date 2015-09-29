<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	List menuChList = (List)request.getAttribute("menuChList");
	List menuEnList = (List)request.getAttribute("menuEnList");
	List menuJpList = (List)request.getAttribute("menuJpList");
	List userMenuList = (List)request.getAttribute("userMenuList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>菜单分配</title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function updateAdminUserMenu(){
		var menuGroup = "";
		var menuSize = 0;
		var userId = <ww:property value='userId'/>;
		<%if(menuChList!=null&&menuChList.size()>0){%>
			menuSize = menuSize+<%=menuChList.size()%>;
		<%}%>
		<%if(menuEnList!=null&&menuEnList.size()>0){%>
			menuSize = menuSize+<%=menuEnList.size()%>;
		<%}%>
		<%if(menuJpList!=null&&menuJpList.size()>0){%>
			menuSize = menuSize+<%=menuJpList.size()%>;
		<%}%>
		<%if(menuChList==null&&menuEnList==null&&menuJpList==null){%>
			alert("没有菜单选择,请返回");
			return false;
		<%}%>
		if(menuSize>0){
			for(var i=0;i<menuSize;i++){
				if(document.getElementById("menu"+i).checked){
					var menuValue = document.getElementById("menu"+i).value;
						menuGroup += menuValue+",";
				}
			}
		}
		if(menuGroup==""){
			alert('请至少选择一个菜单');
			return false;
		}
		var form = findById("form");
		form.action = "updateAdminUserMenu.do?menuGroup="+menuGroup;
		form.submit();	
	}
	
	function checkAll(){ 
		var code_Values = document.all['menu']; 
		if(code_Values.length){ 
			for(var i=0;i<code_Values.length;i++){ 
				code_Values[i].checked = true; 
			} 
		}else{ 
			code_Values.checked = true; 
		} 
	} 
	
	function uncheckAll(){ 
		var code_Values = document.all['menu']; 
		if(code_Values.length){ 
			for(var i=0;i<code_Values.length;i++){ 
				code_Values[i].checked = false; 
			} 
		}else{ 
			code_Values.checked = false; 
		} 
	} 
	
	function refresh(){
		var form = findById("form");
		form.action = "groupRoleList.do"
		form.submit();
	}
	
	function init(){
		highLightInit('row', 'rowover', 'rowselected');
	}
</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">菜单分配</div></td></tr></table>
<table width="96%"  cellspacing="1" cellpadding="1" class="optiontable" align="center">
	<form id="form" action="" method="POST">
	  <ww:hidden name="'userId'"/>
	  <tr>
	  	<input type="button" value="全选" onClick="javascript:checkAll();">
		<input type="button" value="取消全选" onClick="javascript:uncheckAll();">
		<input type="button" value="修改菜单" onClick="javascript:updateAdminUserMenu();">
		</td>
	  </tr>
	</form>
</table>
<table width="96%"  class="tborder" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr class="theader" align="center">
  	<th>选择</th>
  	<th>菜单名称</th>
	<th>代码</th>
	<th>说明</th>
  </tr>
  <tr>
	<td class="rowodd" colspan="4" align="left">中文管理菜单</td>
  </tr>
  <!-- ================ 显示各行数据 ================ -->
  <%
  	if(menuChList != null && menuChList.size() > 0){
  		int count = 0;
	  	for(int i=0;i<menuChList.size();i++){
	  		count++;
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=count-1%>">
			  	<td><input type="checkbox" id="menu<%=count-1%>" name="menu" value='<%=(Integer)((Map)menuChList.get(i)).get("id")%>' 
				<%if(userMenuList!=null&&userMenuList.size()>0){%>
					<%for(int j=0;j<userMenuList.size();j++){%>
						<%if(((Integer)((Map)userMenuList.get(j)).get("menu_id")).intValue()==((Integer)((Map)menuChList.get(i)).get("id")).intValue()){%>
						 checked="checked"
						<%}%>
					<%}%>
				<%}%>
				></td>
			  	<td><%=StringHelper.isEmpty((String)((Map)menuChList.get(i)).get("name"))?"---":(String)((Map)menuChList.get(i)).get("name")%></td>
				<td><%=StringHelper.isEmpty((String)((Map)menuChList.get(i)).get("code"))?"---":(String)((Map)menuChList.get(i)).get("code")%></td>
				<td><%=StringHelper.isEmpty((String)((Map)menuChList.get(i)).get("description"))?"---":(String)((Map)menuChList.get(i)).get("description")%></td>
			  </tr>
	<%
	  	}
	%>
  <%
	  }else{
  %>
			  <tr class="rowodd" align="center">
			    <td colspan="4" height="50">无相关数据</td>
			  </tr>
  <%	  	
	  }
  %>
  <tr>
	<td class="rowodd" colspan="4" align="left">英文管理菜单</td>
	</tr>
   <%
  	if(menuEnList != null && menuEnList.size() > 0){
  		int count = 0;
		if(menuChList!=null&&menuChList.size()>0){
			count = count+menuChList.size();
		}
	  	for(int i=0;i<menuEnList.size();i++){
	  		count++;
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=count-1%>">
			  	<td><input type="checkbox" id="menu<%=count-1%>" name="menu" value='<%=(Integer)((Map)menuEnList.get(i)).get("id")%>' 
				<%if(userMenuList!=null&&userMenuList.size()>0){%>
					<%for(int j=0;j<userMenuList.size();j++){%>
						<%if(((Integer)((Map)userMenuList.get(j)).get("menu_id")).intValue()==((Integer)((Map)menuEnList.get(i)).get("id")).intValue()){%>
						 checked="checked"
						<%}%>
					<%}%>
				<%}%>
				></td>
			  	<td><%=StringHelper.isEmpty((String)((Map)menuEnList.get(i)).get("name"))?"---":(String)((Map)menuEnList.get(i)).get("name")%></td>
				<td><%=StringHelper.isEmpty((String)((Map)menuEnList.get(i)).get("code"))?"---":(String)((Map)menuEnList.get(i)).get("code")%></td>
				<td><%=StringHelper.isEmpty((String)((Map)menuEnList.get(i)).get("description"))?"---":(String)((Map)menuEnList.get(i)).get("description")%></td>
			  </tr>
	<%
	  	}
	%>
  <%
	  }else{
  %>
			  <tr class="rowodd" align="center">
			    <td colspan="4" height="50">无相关数据</td>
			  </tr>
  <%	  	
	  }
  %>
  <tr>
	<td class="rowodd" colspan="4" align="left">日文管理菜单</td>
	</tr>
   <%
  	if(menuJpList != null && menuJpList.size() > 0){
  		int count = 0;
		if(menuChList!=null&&menuChList.size()>0){
			count = count+menuChList.size();
		}
		if(menuEnList!=null&&menuEnList.size()>0){
			count = count+menuEnList.size();
		}
	  	for(int i=0;i<menuJpList.size();i++){
	  		count++;
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=count-1%>">
			  	<td><input type="checkbox" id="menu<%=count-1%>" name="menu" value='<%=(Integer)((Map)menuJpList.get(i)).get("id")%>' 
				<%if(userMenuList!=null&&userMenuList.size()>0){%>
					<%for(int j=0;j<userMenuList.size();j++){%>
						<%if(((Integer)((Map)userMenuList.get(j)).get("menu_id")).intValue()==((Integer)((Map)menuJpList.get(i)).get("id")).intValue()){%>
						 checked="checked"
						<%}%>
					<%}%>
				<%}%>
				></td>
			  	<td><%=StringHelper.isEmpty((String)((Map)menuJpList.get(i)).get("name"))?"---":(String)((Map)menuJpList.get(i)).get("name")%></td>
				<td><%=StringHelper.isEmpty((String)((Map)menuJpList.get(i)).get("code"))?"---":(String)((Map)menuJpList.get(i)).get("code")%></td>
				<td><%=StringHelper.isEmpty((String)((Map)menuJpList.get(i)).get("description"))?"---":(String)((Map)menuJpList.get(i)).get("description")%></td>
			  </tr>
	<%
	  	}
	%>
  <%
	  }else{
  %>
			  <tr class="rowodd" align="center">
			    <td colspan="4" height="50">无相关数据</td>
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
		  <input type="button" value="修改菜单"  onclick="updateAdminUserMenu()">
		</td>
	</tr>
</table>
<%@include file="/WEB-INF/inc/response.jsp"%>
</body>
</html>