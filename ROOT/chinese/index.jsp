
<jsp:directive.page import="com.newhc.admin.helper.NewStringHelper"/><%@ taglib prefix="ww" uri="webwork" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="cn.com.netmovie.helper.*"%>

<%
	List columnFlashList = (List) request.getAttribute("columnFlashList");
	List qiyeList = (List) request.getAttribute("qiyeList");
	List hyeList = (List) request.getAttribute("hyeList");
	List gjList = (List) request.getAttribute("gjList");
	List tzList = (List) request.getAttribute("tzList");
	List gsList = (List) request.getAttribute("gsList");
	List enterpriseList = (List) request.getAttribute("enterpriseList");
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<meta name="keywords" content="�»����������޹�˾" />
<meta name="description" content="�»����������޹�˾" />
<meta name="author" content="xiaohe" />
<title>�»����������޹�˾-��ҳ</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />


<!--[if lte IE 6]>
<SCRIPT src="js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="js/tab.js" type="text/javascript"></SCRIPT>
</head>
<script language="javascript">
	function showDiv(n){
		document.getElementById(n).style.display='block';
		document.getElementById('bg').style.display='block';
	}
	
	
	function closeDiv(n){
		document.getElementById(n).style.display='none';
		document.getElementById('bg').style.display='none';
	}
	
 
</script>
<body style=" background:#f8f8f7 url(images/bg_body.jpg) repeat-x;">
<div class="wrap">
  <jsp:include flush="true" page="/chinese/head.jsp"></jsp:include>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
      <li style="width:80px;" class="hover"><a href="/chinese/index.do" class="ahome">��ҳ</a></li>
      <li><a href="/chinese/introWeb.do">�»������</a></li>
      <li><a href="/chinese/cultureByVisionWeb.do?id=36">��ҵ�Ļ�</a></li>
      <li><a href="/chinese/queryQiyeNews.do">��������</a></li>
      <li><a href="/chinese/queryEmployess.do">Ա������Ƹ</a></li>
      <li><a href="/chinese/queryProduct.do?categoryId=1">��Ʒ��ͻ�</a></li>
      <li class="nobg"><a href="/chinese/queryModelContact.do">��ϵ����</a></li>
    </ul>
    <div class="cls"></div>
    <div class="wel">��ӭ�����»����������޹�˾��վ��</div>
   <jsp:include flush="true" page="/chinese/time.jsp"></jsp:include>
  </div>
  <!-- nav end -->
  <div class="ban">
   <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="988" height="366">
              <%if(columnFlashList!=null&&columnFlashList.size()>0){
					Map imageMap = (Map)columnFlashList.get(0);
			%> 
                <param name="movie" value="/<%=imageMap.get("flash")%>" />
                <param name="quality" value="high" />
                <param name="wmode" value="transparent" />
                <embed src="/<%=imageMap.get("flash")%>" width="991"  height="366" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" wmode="transparent" ></embed>
              </object>
            <%}else{%>
            ������ĿͼƬ
			<%
			}%>
  </div>
  <!-- main -->
  <div class="main">
    <div class="left">
      <div class="title">
        <div class="more"><a href="/chinese/queryQiyeNews.do"><img src="images/more.jpg" width="32" height="6" /></a></div>
        <span class="hover" onmouseover="setTab('one',1,2)" id="one1">��ҵ����</span> <i>|</i> <span onmouseover="setTab('one',2,2)" id="one2">��ҵ����</span> </div>
      <div class="leftcon">
        <div id="con_one_1">
          <ul class="list1">
          	
             <%
          		if(null!=qiyeList&qiyeList.size()>0){
          			for(int i=0;i<qiyeList.size();i++){
          				Map map = (Map)qiyeList.get(i);
          	 %>
            <li><span><%=DateHelper.toString((Timestamp)map.get("pub_time"),"yyyy-MM-dd") %></span><a href="queryQiyeNewsDetail.do?newsId=<%=map.get("id")%>"><%=NewStringHelper.truncate((String)map.get("title"),15,"...") %></a></li>
            <%}}else{ %>
            	����
            <%} %>
          </ul>
        </div>
        <div id="con_one_2" style="display:none">
          <ul class="list1">
            <%
          		if(hyeList!=null&hyeList.size()>0){
          			for(int i=0;i<hyeList.size();i++){
          				Map map = (Map)hyeList.get(i);
          	 %>
           <li><span><%=DateHelper.toString((Timestamp)map.get("pub_time"),"yyyy-MM-dd") %></span><a href="queryHyeNewsDetail.do?newsId=<%=map.get("id")%>"><%=NewStringHelper.truncate((String)map.get("title"),15,"...") %></a></li>
            <%}}else{ %>
            	����
            <%} %>
          </ul>
        </div>
      </div>
    </div>
    <div class="middle">
      <div class="title">
        <div class="more"><a href="/chinese/queryProduct.do?categoryId=1"><img src="images/more.jpg" width="32" height="6" /></a></div>
        <span class="hover">��Ʒչʾ</span> <i class="f11 Arial hei9">Product</i> </div>
      <div class="middlecon_t1">
        <ul class="middlelist">
          <li class="hover" onclick="setTab('two',1,3)" id="two1">���ʱ�׼��װ��</li>
          <li onclick="setTab('two',2,3)" id="two2">���ָɻ���װ��</li>
          <li onclick="setTab('two',3,3)" id="two3">��ʽ��װ��</li>
        </ul>
      </div>
      <div class="middlecon_t2">
        <div id="con_two_1">
          <DIV class=scroll>
            <DIV id=arrLeft_01 class=arrLeft></DIV>
            <DIV id=arrCont_01 class=arrCont>
              <ul class="arrlist">
              	   <%
	          		if(gjList!=null&gjList.size()>0){
	          			for(int i=0;i<gjList.size();i++){
	          				Map map = (Map)gjList.get(i);
          		 %>
                <li> <span class="l"><%=map.get("name") %></span> <span class="r"><a href="/chinese/queryProduct.do?categoryId=1"><img src="/<%=map.get("small_image") %>" width="87" height="58" /></a></span> </li>
                  
            	  <%}}else{ %>
            		����
           		 <%} %>
              </ul>
            </DIV>
            <DIV id=arrRright_01 class=arrRright></DIV>
          </DIV>
        </div>
        <div id="con_two_2" style="display:none">
          <DIV class=scroll>
            <DIV id=arrLeft_02 class=arrLeft></DIV>
            <DIV id=arrCont_02 class=arrCont>
              <ul class="arrlist">
                <%
	          		if(tzList!=null&tzList.size()>0){
	          			for(int i=0;i<tzList.size();i++){
	          				Map map = (Map)tzList.get(i);
          		 %>
                <li> <span class="l"><%=map.get("name") %></span> <span class="r"><a href="/chinese/querySpeciaIndex.do?categoryId=4"><img src="/<%=map.get("small_image") %>" width="87" height="58" /></a></span> </li>
            	  <%}}else{ %>
            		����
           		 <%} %>
           		</ul>
            </DIV>
            <DIV id=arrRright_02 class=arrRright></DIV>
          </DIV>
        </div>
        <div id="con_two_3" style="display:none">
          <DIV class=scroll>
            <DIV id=arrLeft_03 class=arrLeft></DIV>
            <DIV id=arrCont_03 class=arrCont>
              <ul class="arrlist">
                <%
	          		if(gsList!=null&gsList.size()>0){
	          			for(int i=0;i<gsList.size();i++){
	          				Map map = (Map)gsList.get(i);
          		 %>
                <li> <span class="l"><%=map.get("name") %></span> <span class="r"><a href="/chinese/queryPottypeIndex.do?categoryId=10"><img src="/<%=map.get("small_image") %>" width="87" height="58" /></a></span> </li>
                  
            	  <%}}else{ %>
            		����
           		 <%} %>
           		 
            
           		</ul>
            </DIV>
            <DIV id=arrRright_03 class=arrRright></DIV>
          </DIV>
        </div>
      </div>
    </div>
    <div class="right">
      <div class="title">
        <div class="more"><a href="/chinese/enterprisesWeb.do"><img src="images/more.jpg" width="32" height="6" /></a></div>
        <span class="hover">��Ա��ҵ</span> <i class="f11 Arial hei9">Member enterprise </i> </div>
      <div class="rightcon">
        <h2>������Ӯ�������ֵ��</h2>
        <img src="images/img01.jpg" width="120" height="83" class="imgcss" />
         <%
	          if(enterpriseList!=null&enterpriseList.size()>0){
	          	for(int i=0;i<enterpriseList.size();i++){
	          	Map map = (Map)enterpriseList.get(i);
         %>
         <%if(i%2==0){%>
         <a href="/chinese/enterprisesDetailWeb.do?enterId=<%=map.get("id")%>"><%=map.get("name")%></a>
         <%}else{ %>
         |<a href="/chinese/enterprisesDetailWeb.do?enterId=<%=map.get("id")%>"><%=map.get("name")%></a>|
        <%} %>
         <%}}else{ %>
          	����
         <%} %>
        </div>
    </div>
  </div>
  <!-- main end -->
  <!-- foot -->
 <jsp:include flush="true" page="/chinese/foot.jsp"></jsp:include>
  <!-- foot end -->
</div>
<SCRIPT language=javascript src="js/common.js"></SCRIPT>
<SCRIPT language=javascript type=text/javascript>
				  <!--//--><![CDATA[//><!--
				  var focusScroll_01 = new ScrollPic();
				  focusScroll_01.scrollContId	= "arrCont_01"; //��������ID
				  focusScroll_01.arrLeftId	  = "arrLeft_01";//���ͷID
				  focusScroll_01.arrRightId	 = "arrRright_01"; //�Ҽ�ͷID
				  focusScroll_01.frameWidth	 = 214;//��ʾ����
				  focusScroll_01.pageWidth	  = 214; //��ҳ���
				  focusScroll_01.upright		= false; //��ֱ����
				  focusScroll_01.speed		  = 20; //�ƶ��ٶ�(��λ���룬ԽСԽ��)
				  focusScroll_01.space		  = 20; //ÿ���ƶ�����(��λpx��Խ��Խ��)
				  focusScroll_01.autoPlay		= true; //�Զ�����
				  focusScroll_01.autoPlayTime	= 5; //�Զ����ż��ʱ��(��)
				  focusScroll_01.initialize(); //��ʼ��

				  //--><!]]>
			</SCRIPT>
<SCRIPT language=javascript type=text/javascript>
				  <!--//--><![CDATA[//><!--
				  var focusScroll_01 = new ScrollPic();
				  focusScroll_01.scrollContId	= "arrCont_02"; //��������ID
				  focusScroll_01.arrLeftId	  = "arrLeft_02";//���ͷID
				  focusScroll_01.arrRightId	 = "arrRright_02"; //�Ҽ�ͷID
				  focusScroll_01.frameWidth	 = 214;//��ʾ����
				  focusScroll_01.pageWidth	  = 214; //��ҳ���
				  focusScroll_01.upright		= false; //��ֱ����
				  focusScroll_01.speed		  = 20; //�ƶ��ٶ�(��λ���룬ԽСԽ��)
				  focusScroll_01.space		  = 20; //ÿ���ƶ�����(��λpx��Խ��Խ��)
				  focusScroll_01.autoPlay		= true; //�Զ�����
				  focusScroll_01.autoPlayTime	= 5; //�Զ����ż��ʱ��(��)
				  focusScroll_01.initialize(); //��ʼ��

				  //--><!]]>
			</SCRIPT>
<SCRIPT language=javascript type=text/javascript>
				  <!--//--><![CDATA[//><!--
				  var focusScroll_01 = new ScrollPic();
				  focusScroll_01.scrollContId	= "arrCont_03"; //��������ID
				  focusScroll_01.arrLeftId	  = "arrLeft_03";//���ͷID
				  focusScroll_01.arrRightId	 = "arrRright_03"; //�Ҽ�ͷID
				  focusScroll_01.frameWidth	 = 214;//��ʾ����
				  focusScroll_01.pageWidth	  = 214; //��ҳ���
				  focusScroll_01.upright		= false; //��ֱ����
				  focusScroll_01.speed		  = 20; //�ƶ��ٶ�(��λ���룬ԽСԽ��)
				  focusScroll_01.space		  = 20; //ÿ���ƶ�����(��λpx��Խ��Խ��)
				  focusScroll_01.autoPlay		= true; //�Զ�����
				  focusScroll_01.autoPlayTime	= 5; //�Զ����ż��ʱ��(��)
				  focusScroll_01.initialize(); //��ʼ��

				  //--><!]]>
			</SCRIPT>
</body>
</html>
