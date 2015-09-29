<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<%@ page import="com.newhc.admin.action.user.view.ModelNewsView"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	Pagination pages = (Pagination)request.getAttribute("pages");
	List modelNewsStatus = (List)request.getAttribute("modelNewsStatus");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>新闻发布管理</title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function go2Page(page){
		var form = findById("form");
		form.pageNumber.value = page;
		form.action = "modelNewsPage.do?centerId=<ww:property value='centerId' />";
		form.submit();
	}
	function prepareUpdateModelNews(id){
	<auth:if test="/admin/prepareUpdateModelNews.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(openDialog("prepareUpdateModelNews.do?id="+id,"修改新闻发布",850,300) =="SUCCESS") refresh();
	}
	
	function prepareAddModelNews(){
	<auth:if test="/admin/prepareAddModelNews.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(openDialog("prepareAddModelNews.do?centerId=<ww:property value='centerId' />","新增新闻发布",850,300)=="SUCCESS")refresh();
	}
	
	function deleteModelNews(id,pageId){
	<auth:if test="/admin/deleteModelNews.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(confirm('是否删除此ID：['+pageId+']？删除后将找不回此新闻关联的历史记录')==false){
			return ;
		}
		var params = '';
		var url ="deleteModelNews.do?id="+id;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}

	function auditModelNews(id,pageId){
	<auth:if test="/admin/auditModelNews.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(confirm("是否审核此动态ID：["+pageId+"] ？") == false) return ;
		var params = 'id='+id;
		var url = 'auditModelNews.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function reAuditModelNews(id,pageId){
	<auth:if test="/admin/reAuditModelNews.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(confirm("是否重审核此动态ID：["+pageId+"] ？") == false) return ;
		var params = 'id='+id;
		var url = 'reAuditModelNews.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function init(){
		doSelect('status',"<ww:property value="status"/>");
		doSelect('sequence',"<ww:property value="sequence"/>");
		highLightInit('row', 'rowover', 'rowselected');
	}
	function refresh(){
		var form = findById("form");
		form.action = "modelNewsPage.do?centerId=<ww:property value='centerId' />";
		form.submit();
	}
	
	checkit = true;
	function   SelectAll(){      
	 var  aa = document.getElementsByName("productId");      
	    if(checkit){      
	     for(i=0;i<aa.length;i++)      
	        aa.item(i).checked=true;      
	        checkit   =   false;      
	     }      
	     else{for   (i=0;i<aa.length;i++)      
	       aa.item(i).checked=false;      
	        checkit   =   true;      
	      }      
	  }
	  
	   function  shenhe(){
	   <auth:if test="/admin/auditAllModelNews.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("至少选择一个新闻进行审核");
				return;
			}
			
			if(confirm("是否批量审核您所选的选项？") == false) return ;
			var params = '';
			var url = 'auditAllModelNews.do?ShenHeId='+ary;
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
	   function  reShenhe(){
	   <auth:if test="/admin/reAuditAllModelNews.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("至少选择一个新闻进行重审核");
				return;
			}
			
			if(confirm("是否批量重审核您所选的选项 ？") == false) return ;
			var params = '';
			var url = 'reAuditAllModelNews.do?ShenHeId='+ary;
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
	   function  deleteAll(){
	   <auth:if test="/admin/deleteAllModelNews.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("至少选择一个新闻进行删除");
				return;
			}
			
			if(confirm("是否批量删除您所选的选项？删除后将找不回新闻关联的历史记录") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'deleteAllModelNews.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
	function modelNewsHistoryPage(newsId,newsTitle){
		<auth:if test="/admin/modelNewsHistoryPage.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(openDialog("modelNewsHistoryPage.do?newsId="+newsId+"&newsTitle="+newsTitle,"新闻历史管理",950,300)=="SUCCESS")refresh();
	}
</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">新闻发布管理</div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	  <ww:hidden name="'pageNumber'" />
	  <tr>
		<td style="border:0;" >
			&nbsp;日期从：<ww:textfield name="'startTime'" id="'startTime'" size="'9'" maxlength="10"/><img src='/images/admin/calendar.gif' alt='点击选择日期' border='0' align='absmiddle' style="cursor:hand" onClick="return showCalendar('startTime');">
			到：<ww:textfield name="'endTime'" size="'9'" maxlength="10"/><img src='/images/admin/calendar.gif' alt='点击选择日期' border='0' align='absmiddle' style="cursor:hand" onClick="return showCalendar('endTime');">
			&nbsp;标题：<input id="title" name="title" size="15" value="<ww:property value='title'/>">
			&nbsp;状态：<select id="status" name="status">
							<%if(modelNewsStatus!=null&&modelNewsStatus.size()>0){%>
							<option value="">全部</option>
								<%for(Iterator it = modelNewsStatus.iterator();it.hasNext();){
									Dictionary dic = (Dictionary)it.next();
								%>
									<option value="<%=dic.getCode()%>"><%=dic.getValue()%></option>
								<%}%>
							<%}%>
						 </select>	
			<!-- &nbsp;排序：<select id="sequence" name="sequence">
							<option value="">不排序</option>
							<option value="0">顺序排序</option>
							<option value="1">降序排序</option>
						</select>-->
			&nbsp;&nbsp;<input type="button" name="search" value=" 查 询 " class="mainoption" onClick="javascript:go2Page(1);">
			&nbsp;&nbsp;<input type="button" name="addmp" value="新增新闻发布..." class="mainoption" onClick="javascript:prepareAddModelNews();">
			<input type="button" value="批量审核" class="tjan" onClick="javascript:shenhe();"/>
			<input type="button" value="批量重审核" class="tjan" onClick="javascript:reShenhe();"/>
			<input type="button" value="批量删除" class="tjan" onClick="javascript:deleteAll();"/>
		</td>
	  </tr>
	</form>
</table>
<table width="96%"  class="tborder" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr class="theader" align="center">
  <th> 
  	 	<input type="checkbox"      onclick="javascript:SelectAll();">
  	 </th>
  	<th>编号</th>
  	<th>标题</th>
	<th>状态</th>
	<th>发布时间</th>
	<th>顺序</th>
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
	  		ModelNewsView sgv = (ModelNewsView)it.next();
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	  		
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=showCount-1%>">
			    <td width="3%"><input type="checkbox" name="productId" value="<%=sgv.getId()%>"></td>
			  	<td><%=count%></td>
				<td><%=StringHelper.isEmpty(sgv.getTitle())?"---":sgv.getTitle()%></td>
				<td><%if(sgv.getStatus().intValue()==0){%>
				<%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,sgv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="审核..." class="mainoption" 
				onClick="javascript:auditModelNews(<%=sgv.getId()%>,<%=count%>);"><%}else{%><font 
				color="#FF0000"><%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,sgv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="重审核..." class="mainoption" 
				onClick="javascript:reAuditModelNews(<%=sgv.getId()%>,<%=count%>);"></font><%}%>&nbsp;</td>
				<td><%=sgv.getPubTime()%></td>
				<td><%=sgv.getSequence()%></td>
				<td><%=sgv.getCreateTime()%></td>
				<td><%=sgv.getCreator()%></td>
				<td align="left">
				<input type="button" value="修改..." onClick="javascript:prepareUpdateModelNews(<%=sgv.getId()%>);">
				<input type="button" value="删除..." onClick="javascript:deleteModelNews(<%=sgv.getId()%>,<%=count%>);">
			<!-- 	<input type="button" value="历史..." onClick="javascript:modelNewsHistoryPage(<%=sgv.getId()%>,'<%=sgv.getTitle()%>');"> -->
				</td>
				
			  </tr>
	<%
	  	}
	%>
  <%
	  }else{
  %>
			  <tr class="rowodd" align="center">
			    <td colspan="9" height="50">无相关数据</td>
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