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
		<meta name="keywords" content="�»����������޹�˾" />
		<meta name="description" content="�»����������޹�˾" />
		<meta name="author" content="xiaohe" />
		<title>�»����������޹�˾</title>
		<link rel="stylesheet" type="text/css" href="/chinese/css/style.css" />
		<script type="text/javascript" src="../js/jquery.js"></script>
	</head>
		<script>
				var i = 1;
				function arrLeft(){
							var span = document.getElementById("span");
							var s = span.innerHTML;
							var len = s.split("/");
							var i = s.substring(0,1);
							i--;
							if(i<=0){
								span.innerHTML=<%=list.size()%>+"/"+<%=list.size() %>;
							}else{								
								span.innerHTML=i+"/"+<%=list.size() %>;
							}
						}
				function arrRight(){
					var span = document.getElementById("span");
					var s = span.innerHTML;
					var len = s.split("/");			
					i++;
					if(i><%=list.size() %>){
					i=1;			
					}
					if(i<=<%=list.size() %>){
					span.innerHTML=i+"/"+<%=list.size() %>;
					}else{
						span.innerHTML=1+"/"+<%=list.size() %>;
					}
				}
			</script>
	<body class="ebookbg">
		<div class="wrap4">
			<div class="ebookcon">
				<h2>
					<ww:property value="periodicalName"/>
				</h2>
				<span id = "span">
					<!-- 1/<%=list.size()%> -->
				</span>
			</div>
			<div class="cls"></div>
			<div class="main_pbox">
				<DIV class=scroll4>
				<div class="cls" ></div>
					<!-- <DIV id=arrLeft_02 class=arrLeft onclick="arrLeft()"></DIV> -->
					<DIV id=arrLeft_02 class=arrLeft></DIV>
					<div class="cls" ></div>
					<DIV id=arrCont_02 class=arrCont >
				
						<ul class="arrlist">
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
							����
							<%}%>
						</ul>
					</DIV>
					<div class="cls" ></div>
					<DIV id=arrRright_02 class=arrRright></DIV>
					<!-- <DIV id=arrRright_02 class=arrRright onclick="arrRight()"></DIV> -->
					<div class="cls" ></div>
				</DIV>
				<SCRIPT language=javascript src="/chinese/js/common.js"></SCRIPT>
				<SCRIPT language=javascript type=text/javascript>
				
				  <!--//--><![CDATA[//><!--
				  var focusScroll_01 = new ScrollPic();
				  focusScroll_01.scrollContId	= "arrCont_02"; //��������ID
				  focusScroll_01.arrLeftId	  = "arrLeft_02";//���ͷID
				  focusScroll_01.arrRightId	 = "arrRright_02"; //�Ҽ�ͷID
				  focusScroll_01.frameWidth	 = 847;//��ʾ����
				  focusScroll_01.pageWidth	  = 847; //��ҳ���
				  focusScroll_01.upright		= false; //��ֱ����
				  focusScroll_01.speed		  = 2; //�ƶ��ٶ�(��λ���룬ԽСԽ��)
				  focusScroll_01.space		  = 50; //ÿ���ƶ�����(��λpx��Խ��Խ��)
				  focusScroll_01.autoPlay		= false; //�Զ�����
				  focusScroll_01.autoPlayTime	= 5; //�Զ����ż��ʱ��(��)
				  focusScroll_01.initialize(); //��ʼ��
				
				  //--><!]]>
			</SCRIPT>
			</div>
		</div>
	</body>
</html>
