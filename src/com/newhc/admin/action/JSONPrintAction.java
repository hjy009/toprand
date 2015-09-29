package com.newhc.admin.action;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;
import cn.com.netmovie.util.ContentType;

public class JSONPrintAction extends BasePrintAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Map datas = new HashMap();
	public String execJSONAction(){
		JSONObject data = JSONObject.fromBean(datas);
		super.setContentText(data.toString());
		super.setContentType(ContentType.HTML);
		return SUCCESS;
	}
	public void addData(String name,Object data){
		datas.put(name, data);
	}
	public String execJSONReponseAction(){
		addData("status", super.isSuccess()?"SUCCESS":"FAILURE");
		addData("message",super.getResponseMessage());
		return execJSONAction();
	}
}
