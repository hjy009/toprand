<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="com.newhc.admin.action.user.view.en.ModelColumnImageEnView"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="com.newhc.admin.helper.*"%>
<%@ page import="java.util.*"%>
<%
	Pagination pages = (Pagination)request.getAttribute("pages");
	List typeList = (List)request.getAttribute("modelColumnImageType");
	List parentTypeList = (List)request.getAttribute("modelColumnImageParentType");
	List statusList = (List)request.getAttribute("modelColumnImageStatus");
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
		form.action = "modelColumnImageEnPage.do";
		form.submit();
	}
	
	function prepareAddColumnImage(){
		<auth:if test="/admin/prepareAddModelColumnImageEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("prepareAddModelColumnImageEn.do","������ĿͼƬ",600,300) =="SUCCESS") refresh();
	}
	
	function prepareEditColumnImage(id){
	<auth:if test="/admin/prepareUpdateModelColumnImageEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("prepareUpdateModelColumnImageEn.do?id="+id,"�޸���ĿͼƬ",600,300) =="SUCCESS") refresh();
	}
	
	function auditColumnImage(id,count){
	<auth:if test="/admin/auditModelColumnImageEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ���˴˶�̬id��["+count+"] ��") == false) return ;
		var params = 'id='+id;
		var url = 'auditModelColumnImageEn.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function reAuditColumnImage(id,count){
	<auth:if test="/admin/reAuditModelColumnImageEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ�����˴˶�̬id��["+count+"] ��") == false) return ;
		var params = 'id='+id;
		var url = 'reAuditModelColumnImageEn.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	
	function deleteColumnImage(id,count){
		<auth:if test="/admin/deleteModelColumnImageEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm('�Ƿ�ɾ���˶�̬[id:'+count+']?')==false){
			return ;
		}
		var params = '';
		var url ="deleteModelColumnImageEn.do?id="+id;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function refresh(){
		var form = findById("form");
		form.action = "modelColumnImageEnPage.do"
		form.submit();
	}
	
	function init(){
		doSelect('parentType',"<ww:property value="parentType"/>");
		doSelect('type',"<ww:property value="type"/>");
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
	   <auth:if test="/admin/auditAllModelColumnImageEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ����ĿͼƬ�������");
				return;
			}
			
			if(confirm("�Ƿ������������ѡ��ѡ�� ��") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'auditAllModelColumnImageEn.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
	  function  reShenhe(){
	  <auth:if test="/admin/reAuditAllModelColumnImageEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	  	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ����ĿͼƬ���������");
				return;
			}
			
			if(confirm("�Ƿ��������������ѡ��ѡ�� ��") == false) return ;
			var params = '';
			var url = 'reAuditAllModelColumnImageEn.do?ShenHeId='+ary;
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
	   function  deleteAll(){
	   <auth:if test="/admin/deleteAllColumnImageEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ����ĿͼƬ����ɾ��");
				return;
			}
			
			if(confirm("�Ƿ�����ɾ������ѡ��ѡ�� ��") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'deleteAllColumnImageEn.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	
</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">��ĿͼƬ����</div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	  <ww:hidden name="'pageNumber'" />
	  <tr>
		<td style="border:0;" >
			&nbsp;���⣺<input id="title" name="title" size="15" value="<ww:property value='title'/>">
			 
			&nbsp;���ͣ�<select id="type" name="type">
							<%if(typeList!=null&&typeList.size()>0){%>
							<option value="">ȫ��</option>
						<%for(Iterator it = typeList.iterator();it.hasNext();){
								Dictionary dic = (Dictionary)it.next();
						%>
									
									<option value="<%=dic.getCode()%>"><%=dic.getValue()%></option>
								<%}%>
							<%}%>
						 </select>
			&nbsp;չʾ���ͣ�<select id="parentType" name="parentType">
							<%if(parentTypeList!=null&&parentTypeList.size()>0){%>
							<option value="">ȫ��</option>
						<%for(Iterator it = parentTypeList.iterator();it.hasNext();){
								Dictionary dic = (Dictionary)it.next();
						%>
									<option value="<%=dic.getCode()%>"><%=dic.getValue()%></option>
								<%}%>
							<%}%>
						 </select>
			
			&nbsp;״̬��<select id="status" name="status">
							<%
							if(statusList!=null&&statusList.size()>0){
							%>
							<option value="">ȫ��</option>
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
			&nbsp;&nbsp;<input type="button" name="search" value=" �� ѯ " class="mainoption" onClick="javascript:go2Page(1);">
			&nbsp;&nbsp;<input type="button" id="add" name="add" value="������Ŀ..." class="mainoption" onClick="prepareAddColumnImage();">
			&nbsp;&nbsp; <input type="button" value="�������" class="tjan" onClick="javascript:shenhe();"/>
			&nbsp;&nbsp; <input type="button" value="���������" class="tjan" onClick="javascript:reShenhe();"/>
			&nbsp;&nbsp; <input type="button" value="����ɾ��" class="tjan" onClick="javascript:deleteAll();"/>
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
	<th>չʾ����</th>
	<th>����</th>
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
  	  		ModelColumnImageEnView tdv = (ModelColumnImageEnView)it.next();
  	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
  %>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=showCount-1%>">
			     <td width="3%"><input type="checkbox" name="productId" value="<%=tdv.getId()%>"></td>
			  	<td><%=count%></td>
				<td><%=StringHelper.isEmpty(tdv.getTitle())?"---":NewStringHelper.truncate(tdv.getTitle(),20,"...")%></td>
				<!--<td><%=StringHelper.isEmpty(tdv.getLink())?"---":tdv.getLink()%>-->
				<td><%=StringHelper.isEmpty(DictionaryCache.getValueByCode(Dictionary.PARENT_TYPE,tdv.getParentType()+""))?"---":DictionaryCache.getValueByCode(Dictionary.PARENT_TYPE,tdv.getParentType()+"")%></td>
				<td><%=StringHelper.isEmpty(DictionaryCache.getValueByCode(Dictionary.COLUMN_IMAGE_TYPE,tdv.getType()+""))?"---":DictionaryCache.getValueByCode(Dictionary.COLUMN_IMAGE_TYPE,tdv.getType()+"")%></td>
				<td><%if(tdv.getStatus().intValue()==0){%><%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,tdv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="���..." class="mainoption" onClick="javascript:auditColumnImage(<%=tdv.getId()%>,<%=count%>);"><%}else{%><font color="#FF0000"><%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,tdv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="�����..." class="mainoption" onClick="javascript:reAuditColumnImage(<%=tdv.getId()%>,<%=count%>);"></font><%}%>&nbsp;</td>
				<td><%=tdv.getCreateTime()%></td>
				<td><%=tdv.getCreator()%></td>
				<td align="left">
			 	<input type="button" value="�޸�..."
				 onClick="javascript:prepareEditColumnImage(<%=tdv.getId()%>);"> 
				<input type="button" value="ɾ��..." onClick="javascript:deleteColumnImage(<%=tdv.getId()%>,<%=count%>);">
				</td>
			  </tr>
	<%
	  	}
	%>
  <%
	  }else{
  %>
			  <tr class="rowodd" align="center">
			    <td colspan="11" height="50">���������</td>
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