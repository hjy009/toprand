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
<meta name="keywords" content="CXIC GROUP CONTAINERS COMPANY LIMITED-Jobs" />
<meta name="description" content="CXIC GROUP CONTAINERS COMPANY LIMITED-Jobs" />
<meta name="author" content="xiaohe" />
<title>CXIC GROUP CONTAINERS COMPANY LIMITED-Jobs</title>
<link rel="stylesheet" type="text/css" href="/english/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/english/js/tab.js" type="text/javascript"></SCRIPT>
<script type="text/javascript" src="/js/default.js"></script>
<script type="text/javascript" src="/js/prototype.js"></script>
<script language="javascript">
	function gotoPage(pno){
		url = "/english/queryZhaopEn.do?pageNumber="+pno+"&company=<ww:property value="company"/>&adName=<ww:property value="adName"/>&dataName=<ww:property value="dataName"/>";
		window.location.href=url;
	}
	
</script>

<script language="javascript">
	function addAdvertiseInfo(){
		var sfrom = findById("sfrom");
		sfrom.action = "queryRecruitEn.do";
		sfrom.submit();
		findById("button").disabled = true;
	}
</script>
</head>
<body>
<div class="footbg">
<div class="wrap">
  <%@ include file="/english/head.jsp"%>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
        <li ><span><a href="/english/indexEn.do" class="ahome">Home</a></span></li>
      <li class="nlist2" ><span><a href="/english/introWebEn.do">About CXIC</a></span></li>
      <li class="nlist2" ><span><a href="/english/cultureByVisionWebEn.do?id=36">Company Culture</a></span></li>
      <li class="nlist2"><span><a href="/english/queryQiyeNewsEn.do">News Center</a></span></li>
      <li   ><span class="hover" ><a href="/english/queryEmployessEn.do">Join Us</a></span></li>
      <li class="nlist3"><span><a href="/english/queryProductEn.do?categoryId=1">Products & Customers</a></span></li>
       <li class="nobg nlist2" ><span><a href="/english/queryModelContactEn.do">Contact Us</a></span></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
   <a href="/english/queryEmployessEn.do">Rights and Duties</a>      
    <a href="/english/queryXincEn.do">Compensation and Benefits</a>   
    <a href="/english/queryRenlEn.do">HR Strategy</a>      
    <a href="/english/queryZhaopEn.do">Job Opportunities</a>   
    <a href="/english/queryRecruitEn.do">Job Opportunity</a>  
    
  <!-- <a href="/english/queryRecruitEn.do">Job Opportunity</a>  -->
    </div>
    
  
 
      <jsp:include flush="true" page="/english/time.jsp"></jsp:include>
  </div>
  <!-- nav end -->
  
  <div class="mban">
    <%if(imageList!=null&&imageList.size()>0){
				Map imageMap = (Map)imageList.get(0);
			%> 
				 <img src="/<%=imageMap.get("path")%>" width="990" height="245" />
				 <%if(imageMap.get("link")!=null&&((String)imageMap.get("link")).length()>0){%>
	  				<a href="<%=imageMap.get("link")%>" target="_blank"><img src="/english/images/columnLink.gif" width="990" height="245" /></a>
					<%}%>
			<%}%></div>
  
  
  <!-- main -->
  <div class="mmain">
  		<div class="mleft">
            <h2>
            	<span class="sp_t1" >Staffs and Recruitment</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	<li  ><a href="/english/queryEmployessEn.do">Rights and Duties</a></li>
                        <li><a href="/english/queryXincEn.do">Compensation and Benefits</a></li>
                        <li ><a href="/english/queryRenlEn.do">HR Strategy</a></li>
                        <li><a href="/english/queryZhaopEn.do">Job Opportunities</a></li>
                       <!--  <li class="hover"><a href="/english/queryRecruitEn.do">Job Opportunity</a></li> -->
                           
                
                </ul>

            
            
            
            
            </div>
         
           <jsp:include flush="true" page="/english/left.jsp"></jsp:include>
        
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	Your location-<a href="/english/queryEmployessEn.do">Staffs and Recruitment</a>-Job Opportunity
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2>Job Opportunity</h2>
                 </div>
                 
             
                 
                 <div class="mcon3">
                   <p><strong>按职位搜索：</strong></p>
                   
                    <form id="sfrom"  name="sfrom" method="post">
                 <div class="search2">
                 		<select name="company" id="company" class="sltshen">
                 		
                 				<option value="">请选择分公司</option>
		                 		<option value="常州新华昌国际集装箱有限公司">常州新华昌国际集装箱有限公司</option>
		                 		<option value="宁波新华昌运输设备有限公司">宁波新华昌运输设备有限公司</option>
		                 		<option value="惠州新华昌运输设备有限公司">惠州新华昌运输设备有限公司</option>
		                 		<option value="天津新华昌运输设备有限公司">天津新华昌运输设备有限公司</option>
		                 		<option value="江苏万隆特种货柜有限公司">江苏万隆特种货柜有限公司</option>
		                 		<option value="嘉善新华昌运输设备有限公司">嘉善新华昌运输设备有限公司</option>
		                 		<option value="嘉善新华昌木业有限公司">嘉善新华昌木业有限公司</option>
		                 		<option value="青岛交运新华昌集装箱有限公司">青岛交运新华昌集装箱有限公司</option>
                 				</select>
                 		<script language="JavaScript"> 
        					 document.getElementById("company").value="<ww:property value="company"/>";
						</script>
                 		
                        <select name="adName" id="adName" class="sltshen">
                        	 <option value="">请选择职位分类</option>
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
                        <option value="">请选择时间范围</option>
                        <option value="所有时间">所有时间</option>
                        <option value="今天">今天</option>
                        <option value="最近三天">最近三天</option>
                         <option value="最近一周">最近一周</option>
                          <option value="最近一个月">最近一个月</option>
                        </select>
                          <script language="JavaScript"> 
        					 document.getElementById("dataName").value="<ww:property value="dataName"/>";
						</script>
                        <input name="" type="button" value=""  onclick="addAdvertiseInfo()" class="btn_search2" />
                 </div>
                
                  </form>
                  <div class="hrtitle">
                    
                  	<h2>所有职位</h2>
                  </div>
                  <div class="cls"></div>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="hrtable">
  <tr>
    <th width="36%">职位名称</th>
    <th width="31%">公司</th>
    <th width="17%">工作地点</th>
    <th width="16%">发布时间</th>
  </tr>
 	   <%if(list!=null&&list.size()>0){%>
		  				<%for(int i=0;i<list.size();i++){
							Map map = (Map)list.get(i);
						%>
                    	  <tr>
						    <td class="td1">·<a href="queryAdvertiseDetailEn.do?advertiseId=<%=map.get("id")%>""><%=map.get("name")%></a></td>
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
                      
                      <%if(pageUtil.getPageNumber()<2){%><a class="fanye fyover">Page Up</a><%}else{%><a  class="fanye fyover" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-1%>)" >Page Up</a><%}%>
	 						<%if((pageUtil.getPageNumber()-2)>=1){%><a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-2%>)"><%=pageUtil.getPageNumber()-2%></a><%}%><%if((pageUtil.getPageNumber()-1)>=1){%><a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-1%>)"><%=pageUtil.getPageNumber()-1%></a><%}%>
							<span><%=pageUtil.getPageNumber()%></span>
							<%if((pageUtil.getPageNumber()+1)<=pageUtil.getPageCount()){%><a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+1%>)"><%=pageUtil.getPageNumber()+1%></a><%}%><%if((pageUtil.getPageNumber()+2)<=pageUtil.getPageCount()){%><a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+2%>)"><%=pageUtil.getPageNumber()+2%></a><%}%>
                                
                                <!--下一页-->	
	 					<%if(pageUtil.getPageCount()<pageUtil.getPageNumber()+1){%><a class="fanye fyover" >Page Down</a><%}else{%><a  class="fanye fyover" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+1%>)" >Page Down</a><%}%> total<%=pageUtil.getTotalCount()%>strip  current<%=pageUtil.getPageNumber()%>/<%=pageUtil.getPageCount()%>page
                      
                      
                      </div>
                   
                   
                   
                   
                   
                   
                </div>
        
        </div>
    <!-- mright end -->
    
    
  </div>
  <!-- main end -->
  <!-- foot -->
 <%@ include file="/english/foot.jsp"%>
  <!-- foot end -->
  
  
</div>
</div>
</body>
</html>
