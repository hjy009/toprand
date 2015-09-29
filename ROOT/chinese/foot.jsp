<script>
function AddFavorite(sURL, sTitle){
	try{
		window.external.addFavorite(sURL, sTitle);
	}
	catch (e){
		try{
			window.sidebar.addPanel(sTitle, sURL, "");
		}
		catch (e){
			alert("加入收藏失败，请使用Ctrl+D进行添加");
		}
	}
}
</script>

<div class="foot">
  		<div class="footnav"><a href="queryAid.do">法律声明</a> | <a href="queryAid.do?id=9">版权所有</a> | <a href="queryAid.do?id=13">关于网站</a> | <a href="queryAid.do?id=10">站点地图</a> | <a href="/admin">管理入口</a></div>
        <span>Copyright 2014-2016 新华昌集团版权所有  Powered by:<a href="http://www.toprand.com " target="_blank">www.toprand.com</a> </span> 
  
  </div>
