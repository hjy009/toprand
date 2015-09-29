<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="com.newhc.admin.action.user.view.ModelCultureView"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.entity.ModelCulture"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%
	Pagination pages = (Pagination)request.getAttribute("pages");
	List statusList = (List)request.getAttribute("statusList");
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>��ҵ�Ļ�����</title> 
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function go2Page(page){
		var form = findById("form");
		form.pageNumber.value = page;
		form.action = "modelCulturePage.do";
		form.submit();
	}
	function prepareUpdateModelCulture(id){
	<auth:if test="/admin/prepareUpdateModelCulture.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("prepareUpdateModelCulture.do?id="+id,"�޸���ҵ�Ļ�",850,300) =="SUCCESS") refresh();
	}
	
	function prepareAddModelCulture(){
	<auth:if test="/admin/prepareAddModelCulture.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("prepareAddModelCulture.do","������ҵ�Ļ�",850,300)=="SUCCESS")refresh();
	}
	
	function deleteModelCulture(id,pageId){
	<auth:if test="/admin/deleteModelCulture.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ�ɾ���˶�̬id��["+pageId+"] ��")==false){
			return ;
		}
		var params = '';
		var url ="deleteModelCulture.do?id="+id;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}

	function auditModelCulture(id,pageId){
	<auth:if test="/admin/auditModelCulture.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ���˴˶�̬id��["+pageId+"] ��") == false) return ;
		var params = 'id='+id;
		var url = 'auditModelCulture.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function reAuditModelCulture(id,pageId){
	<auth:if test="/admin/reAuditModelCulture.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ�����˴˶�̬id��["+pageId+"] ��") == false) return ;
		var params = 'id='+id;
		var url = 'reAuditModelCulture.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function init(){
		doSelect('status',"<ww:property value="status"/>");
		highLightInit('row', 'rowover', 'rowselected');
	}
	function refresh(){
		var form = findById("form");
		form.action = "modelCulturePage.do";
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
	   <auth:if test="/admin/updateAllModelCulture.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ����ҵ�Ļ��������");
				return;
			}	
			if(confirm("�Ƿ������������ѡ��ѡ�� ��") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'updateAllModelCulture.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   function reShenhe(){
	    <auth:if test="/admin/reUpdateAllModelCulture.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	    var objs = document.getElementsByName("productId");
	    var ary = "";
	    for(i=0;i<objs.length;i++){
		    if(objs[i].checked){
		    	ary+=objs[i].value+",";
		    }
		 }
	    if(ary.length<1){
	  		alert("����ѡ��һ����ҵ�Ļ����������");
			return;
		}
		if(confirm("�Ƿ��������������ѡ��ѡ�� ��") == false) return ;
		var params = 'ShenHeId='+ary;
		var url = 'reUpdateAllModelCulture.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
	   
	   function  deleteAll(){
	   <auth:if test="/admin/deleteAllModelCulture.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ����ҵ�Ļ�����ɾ��");
				return;
			}
			
			if(confirm("�Ƿ�����ɾ������ѡ��ѡ�� ��") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'deleteAllModelCulture.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
 
</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">��ҵ�Ļ�����</div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	  <ww:hidden name="'pageNumber'" />
	  <tr>
		<td style="border:0;" >
			���ƣ�<input id="name" name="name" size="11" value="<ww:property value='name'/>">
			&nbsp;״̬��<select id="status" name="status">
							<%if(statusList!=null&&statusList.size()>0){%>
							<option value="">ȫ��</option>
								<%for(Iterator it = statusList.iterator();it.hasNext();){
									Dictionary dic = (Dictionary)it.next();
								%>
									<option value="<%=dic.getCode()%>"><%=dic.getValue()%></option>
								<%}%>
							<%}%>
						 </select>
			&nbsp;&nbsp;<input type="button" name="search" value=" �� ѯ " class="mainoption" onClick="javascript:go2Page(1);">
			&nbsp;&nbsp;<input type="button" name="addmp" value="������ҵ�Ļ�..." class="mainoption" onClick="javascript:prepareAddModelCulture();">
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
  	<th>����</th>
	<th>˳��</th>
	<th>״̬</th>
	<th>����ʱ��</th>
	<th>������</th>
	<th>����</th>
  </tr>
  <!-- ================ ��ʾ�������� ================
 
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
    	  		ModelCultureView miv = (ModelCultureView)it.next();
    	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
  %>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=showCount-1%>">
			    <td width="3%"><input type="checkbox" name="productId" value="<%=miv.getId()%>"></td>
			  	<td><%=count%></td>
				<td><%=StringHelper.isEmpty(miv.getName())?"---":miv.getName()%></td>
				<td><%=miv.getContent() %></td>
				<td><%=miv.getSequence()%></td>
				<td><%if(miv.getStatus().intValue()==0){%>
				<%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,miv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="���..." class="mainoption" 
				onClick="javascript:auditModelCulture(<%=miv.getId()%>,<%=count %>);"><%}else{%><font 
				color="#FF0000"><%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,miv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="�����..." class="mainoption" 
				onClick="javascript:reAuditModelCulture(<%=miv.getId()%>,<%=count %>);"></font><%}%>&nbsp;</td>
				<td><%=miv.getCreateTime()%></td>
				<td><%=miv.getCreator()%></td>
				<td align="left">
				<input type="button" value="�޸�..." onClick="javascript:prepareUpdateModelCulture(<%=miv.getId()%>);">
				<input id="answerButton" type="button" value="ɾ��..." onClick="javascript:deleteModelCulture(<%=miv.getId()%>,<%=count %>);">
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