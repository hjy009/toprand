<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<%@ page import="com.newhc.admin.action.user.view.ModelPublicationTypeView"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>

<%
	Pagination pages = (Pagination)request.getAttribute("pages");
	List modelProductCategoryStatus = (List)request.getAttribute("modelProductCategoryStatus");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title><ww:property value="typeName" />管理</title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function go2Page(page){
		var form = findById("form");
		form.pageNumber.value = page;
		form.action = "modelPublicationTypePage.do";
		form.submit();
	}
	function prepareUpdateModelPublicationType(id){
		<auth:if test="/admin/prepareUpdateModelPublicationType.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(openDialog("prepareUpdateModelPublicationType.do?id="+id+"&typeName=<ww:property value='typeName' />","修改<ww:property value='typeName' />分类",650,300) =="SUCCESS") refresh();
	}
	
	function prepareAddModelPeriodica(){
		<auth:if test="/admin/prepareAddModelPublicationType.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(openDialog("prepareAddModelPublicationType.do","新增<ww:property value='typeName' />分类",650,200)=="SUCCESS")refresh();
	}
	
	function deleteModelPublicationType(id,pageId){
		<auth:if test="/admin/deleteModelPublicationType.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(confirm('是否删除此ID：['+pageId+']?')==false){
			return ;
		}
		var params = '';
		var url ="deleteModelPublicationType.do?id="+id;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}

	function auditModelPublicationType(id,pageId){
		<auth:if test="/admin/auditModelPublicationType.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(confirm("是否审核此动态ID：["+pageId+"] ？") == false) return ;
		var params = 'id='+id;
		var url = 'auditModelPublicationType.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function reAuditModelPublicationType(id,pageId){
		<auth:if test="/admin/reAuditModelPublicationType.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(confirm("是否重审核此动态ID：["+pageId+"] ？") == false) return ;
		var params = 'id='+id;
		var url = 'reAuditModelPublicationType.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function init(){
		doSelect('status',"<ww:property value="status"/>");
		highLightInit('row', 'rowover', 'rowselected');
	}
	function refresh(){
		var form = findById("form");
		form.action = "modelPublicationTypePage.do";
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
	   <auth:if test="/admin/auditAllModelPublicationType.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("至少选择一个产品分类进行审核");
				return;
			}
			
			if(confirm("是否批量审核您所选的选项 ？") == false) return ;
			var params = '';
			var url = 'auditAllModelPublicationType.do?ShenHeId='+ary;
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
	   function  reShenhe(){
	   <auth:if test="/admin/reAuditAllModelPublicationType.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("至少选择一个产品分类进行重审核");
				return;
			}
			
			if(confirm("是否批量重审核您所选的选项 ？") == false) return ;
			var params = '';
			var url = 'reAuditAllModelPublicationType.do?ShenHeId='+ary;
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	    function  deleteAll(){
	   <auth:if test="/admin/deleteAllModelPublicationType.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("至少选择一个新闻中心进行删除");
				return;
			}
			
			if(confirm("是否批量删除您所选的选项 ？") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'deleteAllModelPublicationType.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   function modelProductPage(categoryId){
		<auth:if test="/admin/modelPeriodicalPage.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(openDialog("modelPeriodicalPage.do?typeId="+categoryId,"电子期刊内容管理",950,300) =="SUCCESS") refresh();
	}
</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title"><ww:property value="typeName" />管理</div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	  <ww:hidden name="'pageNumber'" />
	 
	  <tr>
		<td style="border:0;" >
			&nbsp;名称：<input id="name" name="name" size="30" value="<ww:property value='name'/>">
			&nbsp;状态：<select id="status" name="status">
							<%if(modelProductCategoryStatus!=null&&modelProductCategoryStatus.size()>0){%>
							<option value="">全部</option>
								<%for(Iterator it = modelProductCategoryStatus.iterator();it.hasNext();){
									Dictionary dic = (Dictionary)it.next();
								%>
									<option value="<%=dic.getCode()%>"><%=dic.getValue()%></option>
								<%}%>
							<%}%>
						 </select>	
			&nbsp;&nbsp;<input type="button" name="search" value=" 查 询 " class="mainoption" onClick="javascript:go2Page(1);">
			&nbsp;&nbsp;<input type="button" name="addmp" value="新增电子期刊" class="mainoption" onClick='javascript:prepareAddModelPeriodica()'>
			&nbsp;&nbsp;<input type="button" value="批量审核" class="tjan" onClick="javascript:shenhe();"/>
			&nbsp;&nbsp;<input type="button" value="批量重审核" class="tjan" onClick="javascript:reShenhe();"/>
			&nbsp;&nbsp; <input type="button" value="批量删除" class="tjan" onClick="javascript:deleteAll();"/>
		</td>
	  </tr>
	</form>
</table>
<table width="96%"  class="tborder" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr class="theader" align="center">
  <th><input type="checkbox"      onclick="javascript:SelectAll();"></th>
  	<th>编号</th>
  	<th>名称</th>
	<th>状态</th>
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
	  		ModelPublicationTypeView mpv = (ModelPublicationTypeView)it.next();
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	  		
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=showCount-1%>">
			    <td width="3%"><input type="checkbox" name="productId" value="<%=mpv.getId()%>"></td>
			  	<td><%=count%></td>
				<td><%=StringHelper.isEmpty(mpv.getName())?"---":mpv.getName()%></td>
				<td><%if(mpv.getStatus().intValue()==0){%>
				<%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,mpv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="审核..." class="mainoption" 
				onClick="javascript:auditModelPublicationType(<%=mpv.getId()%>,<%=count%>);"><%}else{%><font 
				color="#FF0000"><%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,mpv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="重审核..." class="mainoption" 
				onClick="javascript:reAuditModelPublicationType(<%=mpv.getId()%>,<%=count%>);"></font><%}%>&nbsp;</td>
				<td><%=mpv.getSequence() %></td>
				<td><%=mpv.getCreateTime()%></td>
				<td><%=mpv.getCreator()%></td>
				<td align="left">
				<input type="button" value="修改..." onClick="javascript:prepareUpdateModelPublicationType(<%=mpv.getId()%>);">
				<input type="button" value="删除..." onClick="javascript:deleteModelPublicationType(<%=mpv.getId()%>,<%=count%>);">
				<input type="button" value="进入编辑..." onClick="javascript:modelProductPage(<%=mpv.getId()%>);">
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