
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
				alert("�˲�����������ܾ���\n�����������ַ�����롰about:config�����س�\nȻ��[signed.applets.codebase_principal_support]����Ϊ'true'"); 
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
			alert("�����ղ�ʧ�ܣ���ʹ��Ctrl+D�������");
		}
	}
	
}
function Search(){		
		var name = document.getElementById("name").value;
		var type = document.getElementById("type").value;
				var form = document.getElementById("form");
				if(name==""||name=="������ؼ���"){
					alert('������ؼ���');
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
    <div class="head_nav"> <a onclick="SetHome(this,window.location)" style="cursor:hand">��Ϊ��ҳ</a> <a href="/chinese/queryAid.do?id=10" style="cursor:hand">��վ��ͼ</a> <a href="/english/indexEn.do">English</a> </div>
    <div class="logo"><a href="/chinese/index.do"><img src="images/logo.png" width="290" height="69" /></a></div>
    <div class="search">
  	  <form name="form" id="form" action="">
  	  	<select id="type"  class="slt_tyle slt_tyle2">
  	  		<option value="0">����</option>
  	  		<option value="1">��Ʒ</option>
  	  	</select>
      	<div class="sese"><input name="name" id="name" type="text" class="txt_search" value="������ؼ���" onmousedown="this.value='';" /></div>
      	<input name="" type="button" value="" id="btnSearch" class="btn_search" onclick="javascript:Search();"/>
      </form>
    </div>
  </div>