<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import=" com.newhc.admin.action.user.view.en.ModelNewsCenterEnView"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.entity.ModelNewsCenter"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	Pagination pages = (Pagination)request.getAttribute("pages");
	List modelNewsStatus = (List)request.getAttribute("modelNewsStatus");
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>新闻中心管理</title> 
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function go2Page(page){
		var form = findById("form");
		form.pageNumber.value = page;
		form.action = "modelNewsCenterPageEn.do";
		form.submit();
	}
	
	function newsPage(name,centerId){
	//<auth:if test="/admin/prepareUpdateNewsCenter.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(openDialog("modelNewsPageEn.do?centerId="+centerId+"&centerName="+name,name,1050,400) =="SUCCESS") refresh();
	}
	function prepareUpdateNewsCenter(id){
	<auth:if test="/admin/prepareUpdateModelNewsCenterEn.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(openDialog("prepareUpdateModelNewsCenterEn.do?id="+id,"修改新闻中心",850,300) =="SUCCESS") refresh();
	}
	
	function prepareAddNewsCenter(){
	<auth:if test="/admin/prepareAddModelNewsCenterEn.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(openDialog("prepareAddModelNewsCenterEn.do","新增新闻中心",850,300)=="SUCCESS")refresh();
	}
	
	function deleteNewsCenter(id,pageId){
	<auth:if test="/admin/deleteModelNewsCenterEn.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(confirm("是否删除此动态id：["+pageId+"] ？")==false){
			return ;
		}
		var params = '';
		var url ="deleteModelNewsCenterEn.do?id="+id;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}

	function auditNewsCenter(id,pageId){
	<auth:if test="/admin/auditModelNewsCenterEn.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(confirm("是否审核此动态id：["+pageId+"] ？") == false) return ;
		var params = 'id='+id;
		var url = 'auditModelNewsCenterEn.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function reAuditNewsCenter(id,pageId){
	<auth:if test="/admin/reAuditModelNewsCenterEn.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(confirm("是否重审核此动态id：["+pageId+"] ？") == false) return ;
		var params = 'id='+id;
		var url = 'reAuditModelNewsCenterEn.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function init(){
		doSelect('status',"<ww:property value="status"/>");
		highLightInit('row', 'rowover', 'rowselected');
	}
	function refresh(){
		var form = findById("form");
		form.action = "modelNewsCenterPageEn.do";
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
	   <auth:if test="/admin/auditAllModelNewsCenterEn.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("至少选择一个新闻中心进行审核");
				return;
			}
			
			if(confirm("是否批量审核您所选的选项 ？") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'auditAllModelNewsCenterEn.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
	   function reShenhe(){
		<auth:if test="/admin/reAuditAllModelNewsCenterEn.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
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
			var url = 'reAuditAllModelNewsCenterEn.do?ShenHeId='+ary;
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
	   function  deleteAll(){
	   <auth:if test="/admin/deleteAllNewsCenterEn.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
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
			var url = 'deleteAllNewsCenterEn.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
  /**
	*前台预览
	*/
	function queryWeb(path,id){
	if(openDialog("/english/news/newsWebPagesEn.do?centerId="+id,"预览前台页面",1250,700)=="SUCCESS")refresh();
	  	//window.location.href = path+"/chinese/newsCenterWeb.do?id="+id;
	  }
</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">新闻中心管理</div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	  <ww:hidden name="'pageNumber'" />
	  <tr>
		<%--<td style="border:0;" >
			名称：<input id="name" name="name" size="11" value="<ww:property value='name'/>">
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
			&nbsp;&nbsp;<input type="button" name="search" value=" 查 询 " class="mainoption" onClick="javascript:go2Page(1);">
		
			&nbsp;&nbsp;<input type="button" name="addmp" value="新增新闻中心..." class="mainoption" onClick="javascript:prepareAddNewsCenter();">
			&nbsp;&nbsp; <input type="button" value="批量审核" class="tjan" onClick="javascript:shenhe();"/>
			&nbsp;&nbsp;<input type="button" value="批量重审核" class="tjan" onClick="javascript:reShenhe();"/>
			&nbsp;&nbsp; <input type="button" value="批量删除" class="tjan" onClick="javascript:deleteAll();"/>
		--%></td>
	  </tr>
	</form>
</table>
<table width="96%"  class="tborder" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr class="theader" align="center">
  	 <th> 
  	 	<input type="checkbox"      onclick="javascript:SelectAll();">
  	 </th>
  	<th>编号</th>
  	<th>名称</th>
	<th>顺序</th>
	<%--<th>状态</th>--%>
	<th>创建时间</th>
	<th>创建者</th>
	<th>操作</th>
  </tr>
  <!-- ================ 显示各行数据 ================
 
   -->
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
	  		ModelNewsCenterEnView mnv = (ModelNewsCenterEnView)it.next();
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	  		
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=showCount-1%>">
			    <td width="3%"><input type="checkbox" name="productId" value="<%=mnv.getId()%>"></td>
			  	<td><%=count%></td>
				<td><%=StringHelper.isEmpty(mnv.getName())?"---":mnv.getName()%></td>
				<td><%=mnv.getSequence()%></td>
				<%--<td><%if(mnv.getStatus().intValue()==0){%>
				<%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,mnv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="审核..." class="mainoption" 
				onClick="javascript:auditNewsCenter(<%=mnv.getId()%>,<%=count %>);"><%}else{%><font 
				color="#FF0000"><%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,mnv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="重审核..." class="mainoption" 
				onClick="javascript:reAuditNewsCenter(<%=mnv.getId()%>,<%=count %>);"></font><%}%>&nbsp;</td>
				--%>
				<td><%=mnv.getCreateTime()%></td>
				<td><%=mnv.getCreator()%></td>
				<td align="left">
				<input type="button" value="<%=mnv.getName()%>..." onclick="newsPage('<%=mnv.getName()%>',<%=mnv.getId() %>)" />
				
				<%--<input id="answerButton" type="button" value="删除..." onClick="javascript:deleteNewsCenter(<%=mnv.getId()%>,<%=count %>);">

				<input type="button" value="修改..." onClick="javascript:prepareUpdateNewsCenter(<%=mnv.getId()%>);">

				--%>
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