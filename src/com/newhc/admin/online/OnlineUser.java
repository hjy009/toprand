package com.newhc.admin.online;

import java.util.Date;

import com.newhc.admin.constants.Constants;

import cn.com.netmovie.helper.BeanHelper;
import cn.com.netmovie.helper.DESHelper;
import cn.com.netmovie.helper.DateHelper;
import cn.com.netmovie.helper.MD5Helper;
import cn.com.netmovie.helper.StringHelper;

/**
 * 
 * @author kelvin
 * email:panweihui@vv8.com
 * 2011-11-29
 */
public class OnlineUser {
	private Integer id = new Integer(0);
	public void setId(Integer id){
		this.id = id;
	}
	public Integer getId(){
		return this.id;
	}
	//
	private String username = null;
	public void setUsername(String username){
		this.username = username;
	}
	public String getUsername(){
		return this.username;
	}
	private String name = null;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public static Integer SUPER = new Integer(1);//��������Ա
	public static Integer NORMAL = new Integer(0);//��ͨ����Ա
	private Integer type = NORMAL;
	public void setType(Integer type){
		this.type = type;
	}
	public Integer getType(){
		return this.type;
	}
	public boolean isSuperUser(){
		return SUPER.equals(getType());
	}
	//
	private Date signInTime = null;
	public void setSignInTime(Date signInTime){
		this.signInTime = signInTime;
	}
	public Date getSignInTime(){
		return this.signInTime;
	}
	public String getSignInTime(String format){
		return DateHelper.toString(getSignInTime(), format);
	}
	public String toString(){
		return BeanHelper.toString(this);
	}
	public static String encode(OnlineUser onlineUser){
		StringBuffer text = new StringBuffer();
		text.append(onlineUser.getId());//�û�ID
		text.append(";").append(onlineUser.getUsername());//�û���
		text.append(";").append(onlineUser.getName());//�û�����
		text.append(";").append(onlineUser.getType());//�û�����
		text.append(";").append(onlineUser.getSignInTime("yyyy-MM-dd HH:mm:ss"));//��½ʱ��
		text.append(";");
		//��ʱ��������
		String key = MD5Helper.encode(DateHelper.getSystemTime("yyyyMMdd")+Constants.DES_KEY);
		String desKey = key.substring(0,8);
		return DESHelper.encode(text.toString(),DESHelper.createSecretKey(desKey));
	}
	public static OnlineUser decode(String in){
		//��ʱ��������
		String key = MD5Helper.encode(DateHelper.getSystemTime("yyyyMMdd")+Constants.DES_KEY);
		String desKey = key.substring(0,8);		
		String text = DESHelper.decode(in, DESHelper.createSecretKey(desKey));
		if(text == null) return null;
		
		String[] properties = text.split(";");
		if(properties == null || properties[0] == null) return null;
		OnlineUser onlineUser = new OnlineUser();
		onlineUser.setId(new Integer(StringHelper.parseInt(properties[0], 0)));
		onlineUser.setUsername(properties[1]);
		onlineUser.setName(properties[2]);
		onlineUser.setType(new Integer(StringHelper.parseInt(properties[3], -1)));
		onlineUser.setSignInTime(DateHelper.toDate(properties[4],"yyyy-MM-dd HH:mm:ss"));
		return onlineUser;
	}
}
