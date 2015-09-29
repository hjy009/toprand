<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="com.newhc.admin.action.user.view.AdminUserView"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	Pagination pages = (Pagination)request.getAttribute("pages");
	List typeList = (List)request.getAttribute("typeList");
	List statusList = (List)request.getAttribute("statusList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>用户管理</title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function go2Page(page){
		var form = findById("form");
		form.pageNumber.value = page;
		form.action = "adminUserPage.do";
		form.submit();
	}
	
	function prepareAddAdminUser(){
		<auth:if test="prepareAddAdminUser.do" status="false">alert('对不起，您没有此权限!');return;</auth:if>
		if(openDialog("prepareAddAdminUser.do","新增用户",450,300) =="SUCCESS") refresh();
	}
	
	function prepareUpdateAdminUserStatus(id){
		if(openDialog("prepareUpdateAdminUserStatus.do?id="+id,"修改用户状态",350,300) =="SUCCESS") refresh();
	}
	
	
	function prepareUpdateAdminUser(id){
		if(openDialog("prepareUpdateAdminUser.do?id="+id,"修改用户信息",450,300) =="SUCCESS") refresh();
	}
	
	function prepareUpdateAdminUserPassword(id){
		if(openDialog("prepareUpdateAdminUserPassword.do?id="+id,"修改用户密码",450,300) =="SUCCESS") refresh();
	}
	
	function adminGroupList(userId){
		if(openDialog("adminGroupList.do?uId="+userId,"角色分配",650,300) =="SUCCESS") refresh();
	}
	
	function adminUserMenuList(userId){
		if(openDialog("adminUserMenuList.do?userId="+userId,"分配菜单",650,300) =="SUCCESS") refresh();
	}
	
	function deleteAdminUser(id,userName){
		if(confirm('是否删除此用户[用户:'+userName+']?')==false){
			return ;
		}
		var params = '';
		var url ="deleteAdminUser.do?id="+id;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function refresh(){
		var form = findById("form");
		form.action = "adminUserPage.do?pageNumber=<ww:property value='pageNumber'/>"
		form.submit();
	}
	
	function init(){
		doSelect('type',"<ww:property value="type"/>");
		doSelect('status',"<ww:property value="status"/>");
		highLightInit('row', 'rowover', 'rowselected');
	}
</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">用户管理</div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="adminUserPage.do" method="POST">
	  <ww:hidden name="'pageNumber'" />
	  <tr>
		<td style="border:0;" >
			&nbsp;姓名：<input id="name" name="name" size="11" value="<ww:property value='name'/>">
			&nbsp;类型：<select id="type" name="type">
							<%if(typeList!=null&&typeList.size()>0){%>
							<option value="">全部</option>
						<%for(Iterator it = typeList.iterator();it.hasNext();){
								Dictionary dic = (Dictionary)it.next();
						%>
									
									<option value="<%=dic.getCode()%>"><%=dic.getValue()%></option>
								<%}%>
							<%}%>
						 </select>
			&nbsp;状态：<select id="status" name="status">
							<%if(statusList!=null&&statusList.size()>0){%>
							<option value="">全部</option>
								<%for(Iterator it = statusList.iterator();it.hasNext();){
									Dictionary dic = (Dictionary)it.next();
								%>
									<option value="<%=dic.getCode()%>"><%=dic.getValue()%></option>
								<%}%>
							<%}%>
						 </select>
			&nbsp;&nbsp;<input type="button" name="search" value=" 查 询 " class="mainoption" onClick="javascript:go2Page(1);">
			&nbsp;&nbsp;<input type="button" id="add" name="add" value="新增用户..." class="mainoption" onClick="prepareAddAdminUser();">
		</td>
	  </tr>
	</form>
</table>
<table width="96%"  class="tborder" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr class="theader" align="center">
  	<th>编号</th>
  	<th>用户名</th>
	<th>姓名</th>
	<th>类型</th>
	<th>状态</th>
	<th>创建时间</th>
	<th>创建者</th>
	<th>操作</th>
  </tr>
  <!-- ================ 显示各行数据 ================ -->
  <%
  	if(pages != null && pages.getTotalCount() > 0){
  		int pageNumber = pages.getPageNumber();int pageMaxSize = pages.getPageMaxSize();
  		int count = 0;
  		int showCount = 0;
  		if(pageNumber>1){
			if(pages.getPageCount()>1&&pages.getPageCount()>=pageNumber){
				count = (pageNumber-1)*pageMaxSize;
			}else{
				count = (pageNumber-2)*pageMaxSize;
			}
		}
	  	for(Iterator it = pages.iterator();it.hasNext();){
	  		count++;
			showCount++;
	  		AdminUserView auv = (AdminUserView)it.next();
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=showCount-1%>">
			  	<td><%=count%></td>
				<td><%=StringHelper.isEmpty(auv.getUserName())?"---":auv.getUserName()%></td>
				<td><%=StringHelper.isEmpty(auv.getName())?"---":auv.getName()%></td>
				<td><%=DictionaryCache.getValueByCode(Dictionary.ADMIN_USER_TYPE,auv.getType()+"")%></td>
				<td><%if(auv.getStatus().intValue()==0){%><%=DictionaryCache.getValueByCode(Dictionary.ADMIN_USER_STATUS,auv.getStatus()+"")%><%}else{%><font color="#FF0000"><%=DictionaryCache.getValueByCode(Dictionary.ADMIN_USER_STATUS,auv.getStatus()+"")%></font><%}%>&nbsp;<input type="button" id="update" name="update" value="修改..." class="mainoption" onClick="javascript:prepareUpdateAdminUserStatus(<%=auv.getId()%>);"></td>
				<td><%=auv.getCreateTime()%></td>
				<td><%=auv.getCreator()%></td>
				<td align="left"><%if(auv.getType().intValue()==0){%><input type="button" value="角色分配..." onClick="javascript:adminGroupList(<%=auv.getId()%>);"><%}%>
				<%if(auv.getType().intValue()==0){%><input type="button" value="菜单分配..." onClick="javascript:adminUserMenuList(<%=auv.getId()%>);"><%}%>
				<input type="button" value="修改信息..." onClick="javascript:prepareUpdateAdminUser(<%=auv.getId()%>);">
				<input type="button" value="修改密码..." onClick="javascript:prepareUpdateAdminUserPassword(<%=auv.getId()%>);">
				<input type="button" value="删除..." onClick="javascript:deleteAdminUser(<%=auv.getId()%>,'<%=auv.getUserName()%>');"></td>
			  </tr>
	<%
	  	}
	%>
  <%
	  }else{
  %>
			  <tr class="rowodd" align="center">
			    <td colspan="8" height="50">无相关数据</td>
			  </tr>
  <%	  	
	  }
  %>
  <!-- ================================================ -->
</table>
<table width="96%" border="0" align="center"><tr><td><%@include file="/WEB-INF/inc/page.jsp"%></td></tr></table>
<%@include file="/WEB-INF/inc/response.jsp"%>
</body>
</html>