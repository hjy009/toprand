<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="com.newhc.admin.action.user.view.en.ModelRemeberTheBigEnView"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="com.newhc.admin.helper.*"%>
<%@ page import="java.util.*"%>
<%
	Pagination pages = (Pagination)request.getAttribute("pages");
	List statusList = (List)request.getAttribute("status");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title></title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function go2Page(page){
		var form = findById("form");
		form.pageNumber.value = page;
		form.action = "modelRemeberTheBigEnPage.do?columnsType=<ww:property value='columnsType' />&typeName=<ww:property value='typeName' />";
		form.submit();
	}
	
	function prepareAddColumnImage(){
		<auth:if test="/admin/prepareAddModelRemeberTheBigEn.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(openDialog("prepareAddModelRemeberTheBigEn.do?columnsType=<ww:property value='columnsType' />&typeName=<ww:property value='typeName' />","新增<ww:property value='typeName' />",950,300) =="SUCCESS") refresh();
	}
	
	function prepareEditColumnImage(id){
	<auth:if test="/admin/prepareUpdateModelRemeberTheBigEn.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(openDialog("prepareUpdateModelRemeberTheBigEn.do?id="+id+"&typeName=<ww:property value='typeName' />","修改<ww:property value='typeName' />",950,300) =="SUCCESS") refresh();
	}
	
	function auditModelRemeberTheBig(id,count){
	<auth:if test="/admin/auditModelRemeberTheBigEn.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(confirm("是否审核此动态id：["+count+"] ？") == false) return ;
		var params = 'id='+id;
		var url = 'auditModelRemeberTheBigEn.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function reAuditModelRemeberTheBig(id,count){
	<auth:if test="/admin/reAuditModelRemeberTheBigEn.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(confirm("是否重审核此动态id：["+count+"] ？") == false) return ;
		var params = 'id='+id;
		var url = 'reAuditModelRemeberTheBigEn.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	
	function deleteModelRemeberTheBig(id,count){
		<auth:if test="/admin/deleteModelRemeberTheBigEn.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
		if(confirm('是否删除此动态[id:'+count+']?')==false){
			return ;
		}
		var params = '';
		var url ="deleteModelRemeberTheBigEn.do?id="+id;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function refresh(){
		var form = findById("form");
		form.action = "modelRemeberTheBigEnPage.do?columnsType=<ww:property value='columnsType' />&typeName=<ww:property value='typeName' />"
		form.submit();
	}
	
	function init(){
		doSelect('status',"<ww:property value="status"/>");
		highLightInit('row', 'rowover', 'rowselected');
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
	   <auth:if test="/admin/auditAllModelRemeberTheBigEn.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("至少选择一个内容进行审核");
				return;
			}
			
			if(confirm("是否批量审核您所选的选项 ？") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'auditAllModelRemeberTheBigEn.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
	  function  reShenhe(){
	   <auth:if test="/admin/reAuditAllModelRemeberTheBigEn.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
	  	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("至少选择一个内容进行重审核");
				return;
			}
			
			if(confirm("是否批量重审核您所选的选项 ？") == false) return ;
			var params = '';
			var url = 'reAuditAllModelRemeberTheBigEn.do?ShenHeId='+ary;
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
	   function  deleteAll(){
	   <auth:if test="/admin/deleteAllModelRemeberTheBigEn.do" status="false">alert('对不起，您无此权限，请与系统管理员联系!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("至少选择一个内容进行删除");
				return;
			}
			
			if(confirm("是否批量删除您所选的选项 ？") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'deleteAllModelRemeberTheBigEn.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
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
			&nbsp;状态：<select id="status" name="status">
							<%
							if(statusList!=null&&statusList.size()>0){
							%>
							<option value="">全部</option>
								<%
											for(Iterator it = statusList.iterator();it.hasNext();){
											Dictionary dic = (Dictionary)it.next();
								%>
									<option value="<%=dic.getCode()%>"><%=dic.getValue()%></option>
								<%
								}
								%>
							<%
							}
							%>
						 </select>

			&nbsp;&nbsp;<input type="button" name="search" value=" 查 询 " class="mainoption" onClick="javascript:go2Page(1);">
			&nbsp;&nbsp;<input type="button" id="add" name="add" value="新增<ww:property value="typeName" />..." class="mainoption" onClick="prepareAddColumnImage();">
			&nbsp;&nbsp; <input type="button" value="批量审核" class="tjan" onClick="javascript:shenhe();"/>
			&nbsp;&nbsp; <input type="button" value="批量重审核" class="tjan" onClick="javascript:reShenhe();"/>
			&nbsp;&nbsp; <input type="button" value="批量删除" class="tjan" onClick="javascript:deleteAll();"/>
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
  	<th>年数</th>
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
  	  		ModelRemeberTheBigEnView tdv = (ModelRemeberTheBigEnView)it.next();
  	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
  %>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=showCount-1%>">
			     <td width="3%"><input type="checkbox" name="productId" value="<%=tdv.getId()%>"></td>
			  	<td><%=count%></td>
				<td><%=tdv.getYear()%></td>
				<td><%if(tdv.getStatus().intValue()==0){%><%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,tdv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="审核..." class="mainoption" onClick="javascript:auditModelRemeberTheBig(<%=tdv.getId()%>,<%=count%>);"><%}else{%><font color="#FF0000"><%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,tdv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="重审核..." class="mainoption" onClick="javascript:reAuditModelRemeberTheBig(<%=tdv.getId()%>,<%=count%>);"></font><%}%>&nbsp;</td>
				<td><%=tdv.getCreateTime()%></td>
				<td><%=tdv.getCreator()%></td>
				<td align="left">
			 	<input type="button" value="修改..."
				 onClick="javascript:prepareEditColumnImage(<%=tdv.getId()%>);"> 
				<input type="button" value="删除..." onClick="javascript:deleteModelRemeberTheBig(<%=tdv.getId()%>,<%=count%>);">
				</td>
			  </tr>
	<%
	  	}
	%>
  <%
	  }else{
  %>
			  <tr class="rowodd" align="center">
			    <td colspan="11" height="50">无相关数据</td>
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