<%@ include file="/WEB-INF/inc/common.jsp"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%@ page import="cn.com.netmovie.helper.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.newhc.admin.online.*"%>
<%
	List menuChList = (List)request.getAttribute("menuChList");
	List menuEnList = (List)request.getAttribute("menuEnList");
	List menuJpList = (List)request.getAttribute("menuJpList");
%>
<%
	OnlineManager manager = new OnlineManager(request,response);
	String userName = "";
	String name = "";
	Integer userId = new Integer(0);
	Integer type = new Integer(0);
	OnlineUser onlineUser = manager.getOnlineUser();
	if(onlineUser!=null){
		userName = onlineUser.getUsername();
		name = onlineUser.getName();
		userId = onlineUser.getId();
		type = onlineUser.getType();
	}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="xiaohe" />
<title></title>
<link rel="stylesheet" type="text/css" href="css/style.css" />


</head>

<body>
<%if(menuChList!=null&&menuChList.size()>0){%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tablenotice">
     <tr>
     <td width="18">&nbsp;</td>
      <td style="border:1px solid #b8cadb; background:#f8f8fa; padding:15px; line-height:21px;">
      	<h2 style=" margin-bottom:15px;"><img src="images/can1.jpg" /> 中文资料管理：</h2>
       	<ul class="list2">
       	<%for(int i=0;i<menuChList.size();i++){
			Map map = (Map)menuChList.get(i);
		%>
        	<li>
        	  <div class="l"><img src="images/aa.jpg" width="67" height="62" /></div><div class="r"><a href="<%=map.get("code")%>"><%=map.get("name")%></a></div>
            </li>
            <%}%>
            
        
        </ul>
      </td>
     <td width="18">&nbsp;</td>
     </tr>
    
    </table>
    <%}%>
    
   <%if(menuEnList!=null&&menuEnList.size()>0){%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tablenotice">
     <tr>
     <td width="18">&nbsp;</td>
      <td style="border:1px solid #b8cadb; background:#f8f8fa; padding:15px; line-height:21px;">
      	<h2 style=" margin-bottom:15px;"><img src="images/can1.jpg" /> 英文资料管理：</h2>
       	<ul class="list2">
       	<%for(int i=0;i<menuEnList.size();i++){
			Map map = (Map)menuEnList.get(i);
		%>
        	<li>
        	  <div class="l"><img src="images/aa.jpg" width="67" height="62" /></div><div class="r"><a href="<%=map.get("code")%>"><%=map.get("name")%></a></div>
            </li>
            <%}%>
            
        
        </ul>
      </td>
     <td width="18">&nbsp;</td>
     </tr>
    
    </table>
    <%}%> 
    <%if(type.intValue()==1){%>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tablenotice">
     <tr>
     <td width="18">&nbsp;</td>
      <td style="border:1px solid #b8cadb; background:#f8f8fa; padding:15px; line-height:21px;">
      	<h2 style=" margin-bottom:15px;"><img src="images/can1.jpg" /> 用户管理：</h2>
       	<ul class="list2">
            <li>
        	  <div class="l"><img src="images/fun5.jpg" width="67" height="62" /></div><div class="r"><a href="/admin/adminUserPage.do">用户管理</a></div>
            </li>
        	<li>
        	  <div class="l"><img src="images/fun1.jpg" width="67" height="62" /></div><div class="r"><a href="/admin/rolePage.do">权限管理</a></div>
            </li>
            <li>
        	  <div class="l"><img src="images/fun12.jpg" width="67" height="62" /></div><div class="r"><a href="/admin/adminGroupPage.do">角色管理</a></div>
            </li>
            <li>
        	  <div class="l"><img src="images/fun8.jpg" width="67" height="62" /></div><div class="r"><a href="/admin/menuPage.do">菜单管理</a></div>
            </li>
            <li>
        	  <div class="l"><img src="images/fun9.jpg" width="67" height="62" /></div><div class="r"><a href="/admin/adminUserLogPage.do">日志管理</a></div>
            </li>
            
            
        
        </ul>
      </td>
     <td width="18">&nbsp;</td>
     </tr>
    
    </table> 
	<%}%>
</body>
</html>
