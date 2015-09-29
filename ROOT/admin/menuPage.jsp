<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="com.newhc.admin.action.user.view.MenuView"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	Pagination pages = (Pagination)request.getAttribute("pages");
	List typeList = (List)request.getAttribute("typeList");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>菜单管理</title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function go2Page(page){
		var form = findById("form");
		form.pageNumber.value = page;
		form.action = "menuPage.do";
		form.submit();
	}
	
	function prepareAddMenu(){
		if(openDialog("prepareAddMenu.do","新增菜单",500,300) =="SUCCESS") refresh();
	}
	
	function prepareUpdateMenu(id){
		if(openDialog("prepareUpdateMenu.do?id="+id,"修改菜单",450,300) =="SUCCESS") refresh();
	}
	
	function deleteMenu(id,name){
		if(confirm('是否删除此菜单[菜单:'+name+']?')==false){
			return ;
		}
		var params = '';
		var url ="deleteMenu.do?id="+id;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function refresh(){
		var form = findById("form");
		form.action = "menuPage.do?pageNumber=<ww:property value='pageNumber'/>"
		form.submit();
	}
	
	function init(){
		doSelect('type',"<ww:property value="type"/>");
		doSelect('order',"<ww:property value="order"/>");
		highLightInit('row', 'rowover', 'rowselected');
	}
</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">菜单管理</div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	  <ww:hidden name="'pageNumber'" />
	  <tr>
		<td style="border:0;" >
			&nbsp;菜单名称：<input id="name" name="name" size="11" value="<ww:property value='name'/>">
			&nbsp;代码：<input id="code" name="code" size="11" value="<ww:property value='code'/>">
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
			&nbsp;排序：<select id="order" name="order">
							<option value="">不排序</option>
							<option value="1">顺序排序</option>
							<option value="2">降序排序</option>
						</select>
			&nbsp;&nbsp;<input type="button" name="search" value=" 查 询 " class="mainoption" onClick="javascript:go2Page(1);">
			&nbsp;&nbsp;<input type="button" id="add" name="add" value="新增菜单..." class="mainoption" onClick="prepareAddMenu();">
		</td>
	  </tr>
	</form>
</table>
<table width="96%"  class="tborder" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr class="theader" align="center">
  	<th>编号</th>
  	<th>菜单名称</th>
	<th>代码</th>
	<th>类型</th>
	<th>序列</th>
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
	  		MenuView mv = (MenuView)it.next();
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=showCount-1%>">
			  	<td><%=count%></td>
				<td><%=StringHelper.isEmpty(mv.getName())?"---":mv.getName()%></td>
				<td><%=StringHelper.isEmpty(mv.getCode())?"---":mv.getCode()%></td>
				<td><%=DictionaryCache.getValueByCode(Dictionary.MENU_TYPE,mv.getType()+"")%></td>
				<td><%=mv.getSequence()%></td>
				<td><%=mv.getCreateTime()%></td>
				<td><%=mv.getCreator()%></td>
				<td align="left"><input type="button" value="修改信息..." onClick="javascript:prepareUpdateMenu(<%=mv.getId()%>);">
				<input type="button" value="删除..." onClick="javascript:deleteMenu(<%=mv.getId()%>,'<%=mv.getName()%>');"></td>
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