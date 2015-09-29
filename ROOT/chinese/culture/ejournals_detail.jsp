<%@ taglib prefix="ww" uri="webwork"%>
<%@ page import="java.util.*"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%
	List list = (List)request.getAttribute("list");

 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="xiaohe" />
<title>新华昌集团有限公司</title>
<link rel="stylesheet" type="text/css" href="/chinese/css/style.css" />

</head>
<body class="ebookbg">
<div class="wrap4">


  <div class="ebookcon">
  <h2>新华昌简报</h2>
  <span></span>
  </div>
  <div class="cls"></div>
    <div class="main_pbox">
        <DIV class=scroll4>
                <DIV id=arrLeft_02 class=arrLeft><a class="prev3"></a></DIV>
                <DIV id=arrRright_02 class=arrRright><a class="next3"></a></DIV>
                <p class="cls"></p>
                <DIV id=arrCont_02 class=arrCont>
    <ul class="arrlist ip_ns_ul">
    
    	<%
									if (list != null && list.size() > 0) {
									for (int i = 0; i < list.size(); i++) {
										Map map = (Map) list.get(i);
							%>
							<li>
								<img src="/<%=map.get("image_path")%>" width="847" height="1370" />
							</li>
							<%}%>
							<%} else {%>
							暂无
							<%}%>
							
    </ul>
     </DIV>
     </DIV>
     <script type="text/javascript" src="/chinese/js/jquery-1.7.min.js"></script>
     <script type="text/javascript" src="/chinese/js/jquery.SuperSlide.js" language="javascript"></script>
           <script type="text/javascript" language="javascript">
	jQuery('.main_pbox').slide({mainCell:".ip_ns_ul",effect:"leftLoop",prevCell:".prev3",nextCell:".next3"});

</script>
    
    
    
  </div>
</div>
</body>
</html>
