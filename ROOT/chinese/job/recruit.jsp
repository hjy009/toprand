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
<meta name="keywords" content="新华昌集团有限公司" />
<meta name="description" content="新华昌集团有限公司" />
<meta name="author" content="xiaohe" />
<title>新华昌集团有限公司-员工与招聘</title>
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
        <li style="width:80px;" ><a href="/chinese/index.do" class="ahome">首页</a></li>
      <li ><a href="/chinese/introWeb.do">新华昌简介</a></li>
      <li ><a href="/chinese/cultureByVisionWeb.do?id=36">企业文化</a></li>
      <li><a href="/chinese/queryQiyeNews.do">新闻中心</a></li>
      <li class="hover"><a href="/chinese/queryEmployess.do">员工与招聘</a></li>
      <li><a href="/chinese/queryProduct.do?categoryId=1">产品与客户</a></li>
      <li class="nobg" ><a href="/chinese/queryModelContact.do">联系我们</a></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
  <a href="/chinese/queryEmployess.do">权力与义务</a>      
    <a href="/chinese/queryXinc.do">薪酬与福利</a>   
    <a href="/chinese/queryRenl.do">人力资源策略</a>      
    <a href="/chinese/queryZhaop.do">招聘信息</a>   
    <a href="/chinese/queryRecruit.do">招工信息</a>      
    
  
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
            	<span class="sp_t1" >员工与招聘</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	<li ><a href="/chinese/queryEmployess.do">权力与义务</a></li>
                        <li><a href="/chinese/queryXinc.do">薪酬与福利</a></li>
                        <li><a href="/chinese/queryRenl.do">人力资源策略</a></li>
                        <li><a href="/chinese/queryZhaop.do">招聘信息</a></li>
                        <li class="hover"><a href="/chinese/queryRecruit.do">招工信息</a></li>
                           
                
                </ul>

            
            
            
            
            </div>
         
           <jsp:include flush="true" page="/chinese/left.jsp"></jsp:include>
        
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	您的位置-<a href="/chinese/queryEmployess.do">员工与招聘</a>-招工信息
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2>招工信息</h2>
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
		                 		<option value="嘉善新华昌集装箱有限公司">嘉善新华昌集装箱有限公司</option>
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
						    <td class="td1">·<a href="queryAdvertiseDetail.do?advertiseId=<%=map.get("id")%>""><%=map.get("name")%></a></td>
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
                      
                      <%if(pageUtil.getPageNumber()<2){%><a class="fanye fyover">上一页</a><%}else{%><a  class="fanye fyover" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-1%>)" >上一页</a><%}%>
	 						<%if((pageUtil.getPageNumber()-2)>=1){%><a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-2%>)"><%=pageUtil.getPageNumber()-2%></a><%}%><%if((pageUtil.getPageNumber()-1)>=1){%><a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-1%>)"><%=pageUtil.getPageNumber()-1%></a><%}%>
							<span><%=pageUtil.getPageNumber()%></span>
							<%if((pageUtil.getPageNumber()+1)<=pageUtil.getPageCount()){%><a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+1%>)"><%=pageUtil.getPageNumber()+1%></a><%}%><%if((pageUtil.getPageNumber()+2)<=pageUtil.getPageCount()){%><a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+2%>)"><%=pageUtil.getPageNumber()+2%></a><%}%>
                                
                                <!--下一页-->	
	 					<%if(pageUtil.getPageCount()<pageUtil.getPageNumber()+1){%><a class="fanye fyover" >下一页</a><%}else{%><a  class="fanye fyover" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+1%>)" >下一页</a><%}%> 总<%=pageUtil.getTotalCount()%>条  当前<%=pageUtil.getPageNumber()%>/<%=pageUtil.getPageCount()%>页
                      
                      
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
