<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*"%>
<%@ page isELIgnored="false" %>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="com.newhc.admin.helper.NewStringHelper"%>
<%@ taglib prefix="ww" uri="webwork" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%
	List imageList = (List)request.getAttribute("imageList");
	Pagination pageUtil = (Pagination)request.getAttribute("pages");
	List list = (List)pageUtil.getList();
	List nameList = (List)request.getAttribute("nameList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="�»����������޹�˾" />
<meta name="description" content="�»����������޹�˾" />
<meta name="author" content="xiaohe" />
<title>�»����������޹�˾-Ա������Ƹ</title>
<link rel="stylesheet" type="text/css" href="/chinese/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/chinese/js/tab.js" type="text/javascript"></SCRIPT>
<script type="text/javascript" src="/js/default.js"></script>
<script type="text/javascript" src="/js/prototype.js"></script>
<script language="javascript">
	function gotoPage(pno){
		url = "/chinese/queryRecruit.do?pageNumber="+pno+"&company=<ww:property value="company"/>&adName=<ww:property value="adName"/>&dataName=<ww:property value="dataName"/>";
		window.location.href=url;
	}
	
</script>

<script language="javascript">
	function addAdvertiseInfo(){
		var sfrom = findById("sfrom");
		sfrom.action = "queryRecruit.do";
		sfrom.submit();
		findById("button").disabled = true;
	}
</script>
</head>
<body>
<div class="footbg">
<div class="wrap">
  <%@ include file="/chinese/head.jsp"%>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
        <li style="width:80px;" ><a href="/chinese/index.do" class="ahome">��ҳ</a></li>
      <li ><a href="/chinese/introWeb.do">�»������</a></li>
      <li ><a href="/chinese/cultureByVisionWeb.do?id=36">��ҵ�Ļ�</a></li>
      <li><a href="/chinese/queryQiyeNews.do">��������</a></li>
      <li class="hover"><a href="/chinese/queryEmployess.do">Ա������Ƹ</a></li>
      <li><a href="/chinese/queryProduct.do?categoryId=1">��Ʒ��ͻ�</a></li>
      <li class="nobg" ><a href="/chinese/queryModelContact.do">��ϵ����</a></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
  <a href="/chinese/queryEmployess.do">Ȩ��������</a>      
    <a href="/chinese/queryXinc.do">н���븣��</a>   
    <a href="/chinese/queryRenl.do">������Դ����</a>      
    <a href="/chinese/queryZhaop.do">��Ƹ��Ϣ</a>   
    <a href="/chinese/queryRecruit.do">�й���Ϣ</a>      
    
  
    </div>
    
  
 
      <jsp:include flush="true" page="/chinese/time.jsp"></jsp:include>
  </div>
  <!-- nav end -->
  
  <div class="mban">
    <%if(imageList!=null&&imageList.size()>0){
				Map imageMap = (Map)imageList.get(0);
			%> 
				 <img src="/<%=imageMap.get("path")%>" width="990" height="245" />
				 <%if(imageMap.get("link")!=null&&((String)imageMap.get("link")).length()>0){%>
	  				<a href="<%=imageMap.get("link")%>" target="_blank"><img src="/chinese/images/columnLink.gif" width="990" height="245" /></a>
					<%}%>
			<%}%></div>
  
  
  <!-- main -->
  <div class="mmain">
  		<div class="mleft">
            <h2>
            	<span class="sp_t1" >Ա������Ƹ</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	<li ><a href="/chinese/queryEmployess.do">Ȩ��������</a></li>
                        <li><a href="/chinese/queryXinc.do">н���븣��</a></li>
                        <li><a href="/chinese/queryRenl.do">������Դ����</a></li>
                        <li><a href="/chinese/queryZhaop.do">��Ƹ��Ϣ</a></li>
                        <li class="hover"><a href="/chinese/queryRecruit.do">�й���Ϣ</a></li>
                           
                
                </ul>

            
            
            
            
            </div>
         
           <jsp:include flush="true" page="/chinese/left.jsp"></jsp:include>
        
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	����λ��-<a href="/chinese/queryEmployess.do">Ա������Ƹ</a>-�й���Ϣ
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2>�й���Ϣ</h2>
                 </div>
                 
             
                 
                 <div class="mcon3">
                   <p><strong>��ְλ������</strong></p>
                   
                    <form id="sfrom"  name="sfrom" method="post">
                 <div class="search2">
                 		<select name="company" id="company" class="sltshen">
                 		
                 				<option value="">��ѡ��ֹ�˾</option>
		                 		<option value="�����»������ʼ�װ�����޹�˾">�����»������ʼ�װ�����޹�˾</option>
		                 		<option value="�����»��������豸���޹�˾">�����»��������豸���޹�˾</option>
		                 		<option value="�����»��������豸���޹�˾">�����»��������豸���޹�˾</option>
		                 		<option value="����»��������豸���޹�˾">����»��������豸���޹�˾</option>
		                 		<option value="������¡���ֻ������޹�˾">������¡���ֻ������޹�˾</option>
		                 		<option value="�����»�����װ�����޹�˾">�����»�����װ�����޹�˾</option>
		                 		<option value="�����»���ľҵ���޹�˾">�����»���ľҵ���޹�˾</option>
		                 		<option value="�ൺ�����»�����װ�����޹�˾">�ൺ�����»�����װ�����޹�˾</option>
                 				</select>
                 		<script language="JavaScript"> 
        					 document.getElementById("company").value="<ww:property value="company"/>";
						</script>
                 		
                        <select name="adName" id="adName" class="sltshen">
                        	 <option value="">��ѡ��ְλ����</option>
                        	 <%if(nameList!=null&&nameList.size()>0){%>
				  				<%for(int i=0;i<nameList.size();i++){
									Map map = (Map)nameList.get(i);
								%>
		                    	  <option value="<%=map.get("name")%>"><%=map.get("name")%></option>
								<%}%>
				  			<%}else{%>
				  			<%}%>
                        	
                        </select>
                         <script language="JavaScript"> 
        					 document.getElementById("adName").value="<ww:property value="adName"/>";
						</script>
                        
                        <select  name="dataName" id="dataName" class="sltshen">
                        <option value="">��ѡ��ʱ�䷶Χ</option>
                        <option value="����ʱ��">����ʱ��</option>
                        <option value="����">����</option>
                        <option value="�������">�������</option>
                         <option value="���һ��">���һ��</option>
                          <option value="���һ����">���һ����</option>
                        </select>
                          <script language="JavaScript"> 
        					 document.getElementById("dataName").value="<ww:property value="dataName"/>";
						</script>
                        <input name="" type="button" value=""  onclick="addAdvertiseInfo()" class="btn_search2" />
                 </div>
                
                  </form>
                  <div class="hrtitle">
                    
                  	<h2>����ְλ</h2>
                  </div>
                  <div class="cls"></div>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="hrtable">
  <tr>
    <th width="36%">ְλ����</th>
    <th width="31%">��˾</th>
    <th width="17%">�����ص�</th>
    <th width="16%">����ʱ��</th>
  </tr>
 	   <%if(list!=null&&list.size()>0){%>
		  				<%for(int i=0;i<list.size();i++){
							Map map = (Map)list.get(i);
						%>
                    	  <tr>
						    <td class="td1">��<a href="queryAdvertiseDetail.do?advertiseId=<%=map.get("id")%>""><%=map.get("name")%></a></td>
						    <td><%=map.get("company")%></td>
						    <td><%=map.get("working_place")%></td>
						    <td><%=DateHelper.toString(DateHelper.toDate((Timestamp)map.get("pub_time")),"yyyy-MM-dd")%></td>
						  </tr>
						<%}%>
		  			<%}else{%>
		  			<%}%>
</table>

                  <div class="cls"></div>
                   
                   <div class="pages" style="margin-top:15px;">
                      
                      <%if(pageUtil.getPageNumber()<2){%><a class="fanye fyover">��һҳ</a><%}else{%><a  class="fanye fyover" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-1%>)" >��һҳ</a><%}%>
	 						<%if((pageUtil.getPageNumber()-2)>=1){%><a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-2%>)"><%=pageUtil.getPageNumber()-2%></a><%}%><%if((pageUtil.getPageNumber()-1)>=1){%><a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-1%>)"><%=pageUtil.getPageNumber()-1%></a><%}%>
							<span><%=pageUtil.getPageNumber()%></span>
							<%if((pageUtil.getPageNumber()+1)<=pageUtil.getPageCount()){%><a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+1%>)"><%=pageUtil.getPageNumber()+1%></a><%}%><%if((pageUtil.getPageNumber()+2)<=pageUtil.getPageCount()){%><a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+2%>)"><%=pageUtil.getPageNumber()+2%></a><%}%>
                                
                                <!--��һҳ-->	
	 					<%if(pageUtil.getPageCount()<pageUtil.getPageNumber()+1){%><a class="fanye fyover" >��һҳ</a><%}else{%><a  class="fanye fyover" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+1%>)" >��һҳ</a><%}%> ��<%=pageUtil.getTotalCount()%>��  ��ǰ<%=pageUtil.getPageNumber()%>/<%=pageUtil.getPageCount()%>ҳ
                      
                      
                      </div>
                   
                   
                   
                   
                   
                   
                </div>
        
        </div>
    <!-- mright end -->
    
    
  </div>
  <!-- main end -->
  <!-- foot -->
 <%@ include file="/chinese/foot.jsp"%>
  <!-- foot end -->
  
  
</div>
</div>
</body>
</html>
