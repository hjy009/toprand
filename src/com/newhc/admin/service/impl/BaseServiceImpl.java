package com.newhc.admin.service.impl;

import com.newhc.admin.dao.impl.BaseDaoImpl;

public class BaseServiceImpl {
	private BaseDaoImpl baseDao = null;
	public void setBaseDao(BaseDaoImpl baseDao){
		this.baseDao = baseDao;
	}
	public BaseDaoImpl getBaseDao(){
		return this.baseDao;
	}
}
