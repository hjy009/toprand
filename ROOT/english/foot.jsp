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
    <div class="footnav"><a href="/english/queryAidEn.do">Legal Statement </a>| <a href="/english/queryAidEn.do?id=9">Copyright Reserved </a>| <a href="/english/queryAidEn.do?id=13">About site</a>| <a href="/english/queryAidEn.do?id=10">Site Map </a>| <a href="/admin">Administration</a></div>
    <span>Copyright Reserved by CXIC GROUP 苏ICP备05002018号-1  Powered by:<a href="http://www.toprand.com " target="_blank">www.toprand.com</a> </span> </div>