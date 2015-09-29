<%@ taglib prefix="ww" uri="webwork" %>
<%@ page import="java.util.*"%>
<%
	List imageList = (List)request.getAttribute("imageList");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="CXIC GROUP CONTAINERS COMPANY LIMITED-Products and Customers" />
<meta name="description" content="CXIC GROUP CONTAINERS COMPANY LIMITED-Products and Customers" />
<meta name="author" content="xiaohe" />
<title>CXIC GROUP CONTAINERS COMPANY LIMITED-Products and Customers</title>
<link rel="stylesheet" type="text/css" href="/english/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/english/js/tab.js" type="text/javascript"></SCRIPT>
  <script type="text/javascript" src="/english/box/shadowbox-2.js"></script>
<script type="text/javascript" src="/english/box/shadowbox-en.js"></script>
<script type="text/javascript" src="/english/box/skin.js"></script>
<link rel="stylesheet" href="/english/box/skin.css" type="text/css" media="screen">
<link rel="stylesheet" href="/english/box/extras.css" type="text/css" media="screen">
<style>

</style>
</head>
<body>

    
    <!-- mright -->
    	<div class="box">

                 
                 <div class="mtitle">
                 	<h2><ww:property value="modelProduct.name"/></h2>
                 </div>
                 
                 
                 <div class="mcon2">
                   	<p align="center"><img src="/<ww:property value="modelProduct.smallImage"/>" width="363" height="321" /></p>  
                    <p align="center" style=" margin-top:18px;">
                   	 <ww:property value="modelProduct.content"/>
                    
                    </p>   
                   
                      
                 </div>
        
        </div>
    <!-- mright end -->
    

</div>
</body>
</html>
