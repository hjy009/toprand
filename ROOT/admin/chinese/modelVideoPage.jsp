<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ include file="/WEB-INF/inc/calendar.jsp"%>
<%@ page import="com.newhc.admin.action.user.view.ModelVideoView"%>
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
<title>��Ƶ��Ϣ����</title>
<%@ include file="/WEB-INF/inc/default.jsp"%>
<script language="javascript">
	function go2Page(page){
		var form = findById("form");
		//form.pageNumber.value = page;
		form.action = "modelVideoPage.do";
		form.submit();
	}
	function prepareUpdateModelVideo(id){
	<auth:if test="/admin/prepareUpdateModelVideo.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("prepareUpdateModelVideo.do?id="+id,"�޸���Ƶ��Ϣ",550,300) =="SUCCESS") refresh();
	}
	
	function prepareAddModelVideo(categoryId){
	<auth:if test="/admin/prepareAddModelVideo.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(openDialog("prepareAddModelVideo.do?categoryId="+categoryId,"������Ƶ��Ϣ",550,300)=="SUCCESS")refresh();
	}
	function deleteModelVideo(id,pageId){
	<auth:if test="/admin/deleteModelVideo.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm('�Ƿ�ɾ����ID��['+pageId+']?')==false){
			return ;
		}
		var params = '';
		var url ="deleteModelVideo.do?id="+id;
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	function auditUserGardenNews(id,pageId){
	<auth:if test="/admin/auditModelVideo.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ���˴˶�̬ID��["+pageId+"] ��") == false) return ;
		var params = 'id ='+id;
		var url = 'auditModelVideo.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	
	function reAuditUserGardenNews(id,pageId){
	<auth:if test="/admin/reAuditModelVideo.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
		if(confirm("�Ƿ�����˴˶�̬ID��["+pageId+"] ��") == false) return ;
		var params = 'id ='+id;
		var url = 'reAuditModelVideo.do';
		new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	}
	function downloadVideo(id){
		//var params = '';
		//window.location.href="downloadVideo.do?id="+id;
		top.location="downloadVideo.do?id="+id;
	}
	function init(){
		doSelect('status',"<ww:property value="status"/>");
		highLightInit('row', 'rowover', 'rowselected');
	}
	function refresh(){
		var form = findById("form");
		form.action = "modelVideoPage.do";
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
	   <auth:if test="/admin/updateAllModelVideo.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ����Ƶ��Ϣ�������");
				return;
			}
			
			if(confirm("�Ƿ������������ѡ��ѡ�� ��") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'updateAllModelVideo.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   function  reShenhe(){
	   <auth:if test="/admin/reUpdateAllModelVideo.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ����Ƶ��Ϣ���������");
				return;
			}
			if(confirm("�Ƿ��������������ѡ��ѡ�� ��") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'reUpdateAllModelVideo.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
	   function  deleteAll(){
	   <auth:if test="/admin/deleteAllModelVideo.do" status="false">alert('�Բ������޴�Ȩ�ޣ�����ϵͳ����Ա��ϵ!');return;</auth:if>
	   	var objs=document.getElementsByName("productId");
	   	var ary ="";
		    for(i=0;i<objs.length;i++) {
		        if(objs[i].checked) {
		            ary+=objs[i].value+",";
		       	}
		    }
		    if(ary.length<1) {
				alert("����ѡ��һ����Ƶ��Ϣ����ɾ��");
				return;
			}
			if(confirm("�Ƿ�����ɾ������ѡ��ѡ�� ��") == false) return ;
			var params = 'ShenHeId='+ary;
			var url = 'deleteAllModelVideo.do';
			new Ajax.Request( url, { method: 'get', parameters: params, onComplete: commonReponse });
	   }
</script>
</head>
<body>
<table width="96%" align="center" border="0"><tr><td><div class="title">��Ƶ��Ϣ</div></td></tr></table>
<table width="96%" cellspacing="1" cellpadding="1" align="center">
	<form id='form' action="" method="POST">
	  <ww:hidden name="'categoryId'" />
	  <tr>
		<td style="border:0;" >
			&nbsp;���ڴӣ�<ww:textfield name="'startT'" id="'startT'" size="'9'" maxlength="10"/><img src='/images/admin/calendar.gif' alt='���ѡ������' border='0' align='absmiddle' style="cursor:hand" onClick="return showCalendar('startT');">
			����<ww:textfield name="'endT'" size="'9'" maxlength="10"/><img src='/images/admin/calendar.gif' alt='���ѡ������' border='0' align='absmiddle' style="cursor:hand" onClick="return showCalendar('endT');">
			&nbsp;���ƣ�<input id="name" name="name" size="15" value="<ww:property value='title'/>">
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
			&nbsp;&nbsp;<input type="button" name="addmp" value="������Ƶ��Ϣ..." class="mainoption" onClick="javascript:prepareAddModelVideo(<ww:property value='categoryId'/>);">
			<input type="button" value="�������" class="tjan" onClick="javascript:shenhe();"/>
			<input type="button" value="���������" class="tjan" onClick="javascript:reShenhe();"/>
			<input type="button" value="����ɾ��" class="tjan" onClick="javascript:deleteAll();"/>
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
  	<th>��Ƶ</th>
	<th>״̬</th>
	<th>����ʱ��</th>
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
	  		ModelVideoView sgv = (ModelVideoView)it.next();
	  		String rowClass = (count % 2 == 0)?"roweven":"rowodd";
	  		
	%>
			  <tr class="<%=rowClass%>" align="center" id="row_<%=showCount-1%>">
			   <td width="3%"><input type="checkbox" name="productId" value="<%=sgv.getId()%>"></td>
			  	<td><%=count%></td>
				<td><%=StringHelper.isEmpty(sgv.getName())?"---":sgv.getName()%></td>
				<td><%=StringHelper.isEmpty(sgv.getPath())?"---":sgv.getPath() %><input  type="button" value="����..." onClick="javascript:downloadVideo(<%=sgv.getId()%>);"></td>
				<td><%if(sgv.getStatus().intValue()==0){%>
				<%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,sgv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="���..." class="mainoption" 
				onClick="javascript:auditUserGardenNews(<%=sgv.getId()%>,<%=count%>);"><%}else{%><font 
				color="#FF0000"><%=DictionaryCache.getValueByCode(Dictionary.AUDIT_STATUS,sgv.getStatus()+"")%>
				<input type="button" id="update" name="update" value="�����..." class="mainoption" 
				onClick="javascript:reAuditUserGardenNews(<%=sgv.getId()%>,<%=count%>);"></font><%}%>&nbsp;</td>
				<td><%=sgv.getPubTime()%></td>
				<td><%=sgv.getCreateTime()%></td>
				<td><%=sgv.getCreator()%></td>
				<td align="left">
				<input type="button"value="�޸�..."onClick="javascript:prepareUpdateModelVideo(<%=sgv.getId()%>);">
				<input type="button" value="ɾ��..." onClick="javascript:deleteModelVideo(<%=sgv.getId()%>,<%=count%>);">
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
<table width="98%" border="0" cellspacing="0" style="border:0;">
	<tr align="center" style="border:0;">
		<td style="border:0;" align="center">
	      <br />
		  
	</tr>
</table>
<script language="javascript">resizeWindowHeightToHereTop(500);</script>
</body>
</html>