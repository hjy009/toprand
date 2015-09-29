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
<script src="js/sh_scripts1.js" type="text/javascript"></script>
  <script language="JavaScript" type="text/javascript">
var sh_ShowImg = "images/icon_jia.jpg";
var sh_HideImg = "images/icon_jian.jpg";
    </script>
</head>

<body>

<table width="255" height="100%" border="0" cellspacing="0" cellpadding="0" class="lefttable">
<tr>
<td valign="top" width="254"><img src="images/navigation.jpg" width="254" height="44" /></td>
<td width="1">&nbsp;</td>
</tr>

<%if(menuChList!=null&&menuChList.size()>0){%>
<tr>
<td background="images/td_bg.jpg" height="40"><span><img src="images/icon_jia.jpg" width="14" height="14" onclick="sh_ShowHide('a1',0); return false;"  id="a1img" />资料管理(中文)</span></td>
<td width="1">&nbsp;</td>
</tr>
<%}%>
<%if(menuChList!=null&&menuChList.size()>0){%>
<tr id="a1" style="display: none">
<td style=" padding:5px 0;padding-left:60px;">
<ul class="list3">
<%for(int i=0;i<menuChList.size();i++){
			Map map = (Map)menuChList.get(i);
	%>
<li><a href="<%=map.get("code")%>" target="mainFrame"><%=map.get("name")%></a></li>
<%}%>
</ul>
</td>
</tr>
<%}%>

<%if(menuEnList!=null&&menuEnList.size()>0){%>
<tr>
<td background="images/td_bg.jpg" height="40"><span><img src="images/icon_jia.jpg" width="14" height="14" onclick="sh_ShowHide('a2',0); return false;"  id="a2img" />资料管理(英文)</span></td>
<td width="1">&nbsp;</td>
</tr>
<%}%>
<%if(menuEnList!=null&&menuEnList.size()>0){%>
<tr id="a2" style="display: none">
<td style=" padding:5px 0;padding-left:60px;">
<ul class="list3">
<%for(int i=0;i<menuEnList.size();i++){
			Map map = (Map)menuEnList.get(i);
	%>
<li><a href="<%=map.get("code")%>" target="mainFrame"><%=map.get("name")%></a></li>
<%}%>
</ul>
</td>
</tr>
<%}%>

<%if(menuJpList!=null&&menuJpList.size()>0){%>
<tr>
<td background="images/td_bg.jpg" height="40"><span><img src="images/icon_jia.jpg" width="14" height="14" onclick="sh_ShowHide('a3',0); return false;"  id="a3img" />资料管理(日文)</span></td>
<td width="1">&nbsp;</td>
</tr>
<%}%>
<%if(menuJpList!=null&&menuJpList.size()>0){%>
<tr id="a3" style="display: none">
<td style=" padding:5px 0;padding-left:60px;">
<ul class="list3">
<%for(int i=0;i<menuJpList.size();i++){
			Map map = (Map)menuJpList.get(i);
	%>
<li><a href="<%=map.get("code")%>" target="mainFrame"><%=map.get("name")%></a></li>
<%}%>
</ul>
</td>
</tr>
<%}%>




<%if(type.intValue()==1){%>
<tr>
<td background="images/td_bg.jpg" height="40"><span><img src="images/icon_jia.jpg" width="14" height="14" onclick="sh_ShowHide('a4',0); return false;"  id="a4img" />用户管理</span></td>
<td width="1">&nbsp;</td>
</tr>
<tr id="a4" style="display: none">
<td style=" padding:5px 0;padding-left:60px;">
<ul class="list3">
<li><A href="/admin/adminUserPage.do" target="mainFrame">用户管理</A></li>
<li><A href="/admin/rolePage.do" target="mainFrame">权限管理</A></li>
<li><A href="/admin/adminGroupPage.do" target="mainFrame">角色管理</A></li>
<li><A href="/admin/menuPage.do" target="mainFrame">菜单管理</A></li>
<li><A href="/admin/adminUserLogPage.do" target="mainFrame">日志管理</A></li>
</ul>
</td>
</tr>
<%}%>

</table>
	 
	
</body>
</html>
