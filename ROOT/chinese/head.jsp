
<script language="javascript">
function SetHome(obj,vrl){
	try{
		obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl);
	}
	catch(e){
		if(window.netscape) {
			try {
				netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
			} 
			catch (e) { 
				alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将[signed.applets.codebase_principal_support]设置为'true'"); 
			}
				var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
				prefs.setCharPref('browser.startup.homepage',vrl);
	   }
	}
}

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
function Search(){		
		var name = document.getElementById("name").value;
		var type = document.getElementById("type").value;
				var form = document.getElementById("form");
				if(name==""||name=="请输入关键字"){
					alert('请输入关键字');
					return ;
				}
				if(type==0)
					form.action="/chinese/searchNews.do";
				if(type==1)
					form.action="/chinese/searchProduct.do";
				form.submit();		
}

   document.onkeydown = function(){
   if(event.keyCode==13){
    Search();
   }
  }
</script>

<div class="head">
    <div class="head_nav"> <a onclick="SetHome(this,window.location)" style="cursor:hand">设为首页</a> <a href="/chinese/queryAid.do?id=10" style="cursor:hand">网站地图</a> <a href="/english/indexEn.do">English</a> </div>
    <div class="logo"><a href="/chinese/index.do"><img src="images/logo.png" width="290" height="69" /></a></div>
    <div class="search">
  	  <form name="form" id="form" action="">
  	  	<select id="type"  class="slt_tyle slt_tyle2">
  	  		<option value="0">新闻</option>
  	  		<option value="1">产品</option>
  	  	</select>
      	<div class="sese"><input name="name" id="name" type="text" class="txt_search" value="请输入关键字" onmousedown="this.value='';" /></div>
      	<input name="" type="button" value="" id="btnSearch" class="btn_search" onclick="javascript:Search();"/>
      </form>
    </div>
  </div>