package com.newhc.admin.dao.impl;

import cn.com.netmovie.spring.hibernate.HibernateDaoSupport;
import cn.com.netmovie.spring.jdbc.JdbcDaoSupport;

/**
 * 
 *@author kelvin
 *@email kelvin@toprand.com
 * 2012-2-16
 */
public class BaseDaoImpl extends HibernateDaoSupport{
	private JdbcDaoSupport jdbcDao = null;
	public void setJdbcDao(JdbcDaoSupport jdbcDao){
		this.jdbcDao = jdbcDao;
	}
	public JdbcDaoSupport getJdbcDao(){
		return this.jdbcDao;
	}
}
