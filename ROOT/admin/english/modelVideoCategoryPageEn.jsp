<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="com.newhc.admin.action.user.view.en.ModelVideoCategoryEnView"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	Pagination pages = (Pagination)request.getAttribute("pages");
	List status = (List)request.getAttribute("status");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>��Ƶ�������</title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function go2Page(page){
		var form = findById("form");
		form.pageNumber.value = page;
		form.action = "modelVideoCategoryPageEn.do";
		form.submit();
	}
	function modelVideoPage(id){
		<auth:if test="/admin/modelVideoPageEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("modelVideoPageEn.do?categoryId="+id,"��Ƶ��Ϣ",1050,300)=="SUCCESS")refresh();
	}
	
	function prepareUpdateModelVideoCategory(id){
	<auth:if test="/admin/prepareUpdateModelVideoCategoryEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("prepareUpdateModelVideoCategoryEn.do?id="+id,"�޸���Ƶ����",550,300) =="SUCCESS") refresh();
	}
	
	function prepareAddModelVideoCategory(){
	<auth:if test="/admin/prepareAddModelVideoCategoryEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("prepareAddModelVideoCategoryEn.do","������Ƶ����",550,300)=="SUCCESS")refresh();
	}
	function deleteModelVideoCategory(id,pageId){
	<auth:if test="/admin/deleteModelVideoCategoryEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm('�Ƿ�ɾ����ID��['+pageId+']?')==false){
			return ;
		}
		var params = '';
		var url ="deleteModelVideoCategoryEn.do?id="+id;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	function auditModelVideoCategory(id,pageId){
	<auth:if test="/admin/auditModelVideoCategoryEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ���˴˶�̬ID��["+pageId+"] ��") == false) return ;
		var params = 'id='+id;
		var url = 'auditModelVideoCategoryEn.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	function reAuditModelVideoCategory(id,pageId){
	<auth:if test="/admin/reAuditModelVideoCategoryEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ�����˴˶�̬ID��["+pageId+"] ��") == false) return ;
		var params = 'id='+id;
		var url = 'reAuditModelVideoCategoryEn.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	function init(){
		doSelect('status',"<ww:property value="status"/>");
		highLightInit('row', 'rowover', 'rowselected');
	}
	function refresh(){
		var form = findById("form");
		form.action = "modelVideoCategoryPageEn.do";
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
	   <auth:if test="/admin/updateAllModelVideoCategoryEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ����Ƶ����������");
				return;
			}
			if(confirm("�Ƿ������������ѡ��ѡ�� ��") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'updateAllModelVideoCategoryEn.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   function  reShenhe(){
	   <auth:if test="/admin/reUpdateAllModelVideoCategoryEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ����Ƶ������������");
				return;
			}
			if(confirm("�Ƿ��������������ѡ��ѡ�� ��") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'reUpdateAllModelVideoCategoryEn.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">��Ƶ�������</div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	  <ww:hidden name="'pageNumber'" />
	  <tr>
		<td style="border:0;" >
			&nbsp;���ƣ�<input id="name" name="name" size="15" value="<ww:property value='name'/>">
			&nbsp;״̬��<select id="status" name="status">
							<%if(status!=null&&status.size()>0){%>
							<option value="">ȫ��</option>
								<%for(Iterator it = status.iterator();it.hasNext();){
									Dictionary dic = (Dictionary)it.next();
								%>
									<option value="<%=dic.getCode()%>"><%=dic.getValue()%></option>
								<%}%>
							<%}%>
						 </select>

			&nbsp;&nbsp;<input type="button" name="search" value=" �� ѯ " class="mainoption" onClick="javascript:go2Page(1);">
			&nbsp;&nbsp;<input type="button" name="addmp" value="������Ƶ����..." class="mainoption" onClick="javascript:prepareAddModelVideoCategory();">
			&nbsp;&nbsp; <input type="button" value="�������" class="tjan" onClick="javascript:shenhe();"/>
			&nbsp;&nbsp; <input type="button" value="���������" class="tjan" onClick="javascript:reShenhe();"/>
		</td>
	  </tr>
	</form>
</table>
<table width="96%"  class="tborder" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr class="theader" align="center">
  <th> 
  	 	<input type="checkbox"      onclick="javascript:SelectAll();">
  	 </th>
  	<th>���</th>
  	<th>����</th>
  	<th>��Ƶ��</th>
	<th>״̬</th>
	<th>����ʱ��</th>
	<th>������</th>
	<th>����</th>
  </tr>
  <!-- ================ ��ʾ�������� ================ -->
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
	  		ModelVideoCategoryEnView videoCategory = (ModelVideoCategoryEnView)it.next();
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	  		
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=showCount-1%>">
			     <td width="3%"><input type="checkbox" name="productId" value="<%=videoCategory.getId()%>"></td>
			  	<td><%=count%></td>
				<td><%=StringHelper.isEmpty(videoCategory.getName())?"---":videoCategory.getName() %></td>
				<td><%=videoCategory.getVolumnCount() %></td>
				<td><%if(videoCategory.getStatus().intValue()==0){%>
				<%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,videoCategory.getStatus()+"")%>
				<input type="button" id="update" name="update" value="���..." class="mainoption" 
				onClick="javascript:auditModelVideoCategory(<%=videoCategory.getId()%>,<%=count%>);"><%}else{%><font 
				color="#FF0000"><%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,videoCategory.getStatus()+"")%>
				<input type="button" id="update" name="update" value="�����..." class="mainoption" 
				onClick="javascript:reAuditModelVideoCategory(<%=videoCategory.getId()%>,<%=count%>);"></font><%}%>&nbsp;</td>
				<td><%=videoCategory.getCreateTime()%></td>
				<td><%=videoCategory.getCreator()%></td>
				<td align="left">
				<input type="button" value="�޸�..." onClick="javascript:prepareUpdateModelVideoCategory(<%=videoCategory.getId()%>);">
				<input type="button" value="ɾ��..." onClick="javascript:deleteModelVideoCategory(<%=videoCategory.getId()%>,<%=count%>);">
				<input type="button" value="��Ƶ��Ϣ..." onclick="javascript:modelVideoPage(<%=videoCategory.getId()%>);" />
				</td>
				
			  </tr>
	<%
	  	}
	%>
  <%
	  }else{
  %>
			  <tr class="rowodd" align="center">
			    <td colspan="9" height="50">���������</td>
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