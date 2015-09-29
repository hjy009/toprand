<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="com.newhc.admin.action.user.view.en.ModelEnterprisesEnView"%>
<%@ page import="com.newhc.admin.entity.Dictionary"%>
<%@ page import="com.newhc.admin.cache.DictionaryCache"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="com.newhc.admin.helper.*"%>
<%@ page import="java.util.*"%>
<%
	Pagination pages = (Pagination)request.getAttribute("pages");
	List statusList = (List)request.getAttribute("status");
	List typeList = (List)request.getAttribute("typeList");

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
		form.action = "modelEnterprisesEnPage.do?columnsType=<ww:property value='columnsType' />&typeName=<ww:property value='typeName' />";
		form.submit();
	}
	
	function prepareAddColumnImage(){
		<auth:if test="/admin/prepareAddModelEnterprisesEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("prepareAddModelEnterprisesEn.do?columnsType=<ww:property value='columnsType' />&typeName=<ww:property value='typeName' />","����<ww:property value='typeName' />",950,300) =="SUCCESS") refresh();
	}
	
	function prepareEditColumnImage(id){
	<auth:if test="/admin/prepareUpdateModelEnterprisesEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("prepareUpdateModelEnterprisesEn.do?id="+id+"&typeName=<ww:property value='typeName' />","�޸�<ww:property value='typeName' />",950,300) =="SUCCESS") refresh();
	}
	
	function auditModelEnterprises(id,count){
	<auth:if test="/admin/auditModelEnterprisesEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ���˴˶�̬id��["+count+"] ��") == false) return ;
		var params = 'id='+id;
		var url = 'auditModelEnterprisesEn.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function reAuditModelEnterprises(id,count){
	<auth:if test="/admin/reAuditModelEnterprisesEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ�����˴˶�̬id��["+count+"] ��") == false) return ;
		var params = 'id='+id;
		var url = 'reAuditModelEnterprisesEn.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	
	function deleteModelEnterprises(id,count){
		<auth:if test="/admin/deleteModelEnterprisesEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm('�Ƿ�ɾ���˶�̬[id:'+count+']?')==false){
			return ;
		}
		var params = '';
		var url ="deleteModelEnterprisesEn.do?id="+id;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function refresh(){
		var form = findById("form");
		form.action = "modelEnterprisesEnPage.do?columnsType=<ww:property value='columnsType' />&typeName=<ww:property value='typeName' />"
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
	   <auth:if test="/admin/auditAllModelEnterprisesEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ�����ݽ������");
				return;
			}
			
			if(confirm("�Ƿ������������ѡ��ѡ�� ��") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'auditAllModelEnterprisesEn.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
	  function  reShenhe(){
	   <auth:if test="/admin/reAuditAllModelEnterprisesEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	  	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ�����ݽ��������");
				return;
			}
			
			if(confirm("�Ƿ��������������ѡ��ѡ�� ��") == false) return ;
			var params = '';
			var url = 'reAuditAllModelEnterprisesEn.do?ShenHeId='+ary;
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   
	   function  deleteAll(){
	   <auth:if test="/admin/deleteAllModelEnterprisesEn.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ�����ݽ���ɾ��");
				return;
			}
			
			if(confirm("�Ƿ�����ɾ������ѡ��ѡ�� ��") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'deleteAllModelEnterprisesEn.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	
</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title"><ww:property value="typeName" />����</div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	  <ww:hidden name="'pageNumber'" />
	  <tr>
		<td style="border:0;" >
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
			&nbsp;&nbsp;<input type="button" id="add" name="add" value="����<ww:property value="typeName" />..." class="mainoption" onClick="prepareAddColumnImage();">
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
	<th>״̬</th>
	<th>����</th>
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
  	  		ModelEnterprisesEnView tdv = (ModelEnterprisesEnView)it.next();
  	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
  %>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=showCount-1%>">
			     <td width="3%"><input type="checkbox" name="productId" value="<%=tdv.getId()%>"></td>
			  	<td><%=count%></td>
				<td><%=tdv.getName()%></td>
				<td><%if(tdv.getStatus().intValue()==0){%><%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,tdv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="���..." class="mainoption" onClick="javascript:auditModelEnterprises(<%=tdv.getId()%>,<%=count%>);"><%}else{%><font color="#FF0000"><%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,tdv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="�����..." class="mainoption" onClick="javascript:reAuditModelEnterprises(<%=tdv.getId()%>,<%=count%>);"></font><%}%>&nbsp;</td>
				<td><%=DictionaryCache.getValueByCode(Dictionary.ENTERPRISES_TYPE,tdv.getType() +"")%></td>
				<td><%=tdv.getCreateTime()%></td>
				<td><%=tdv.getCreator()%></td>
				<td align="left">
			 	<input type="button" value="�޸�..."
				 onClick="javascript:prepareEditColumnImage(<%=tdv.getId()%>);"> 
				<input type="button" value="ɾ��..." onClick="javascript:deleteModelEnterprises(<%=tdv.getId()%>,<%=count%>);">
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