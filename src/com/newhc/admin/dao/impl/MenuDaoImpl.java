package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.newhc.admin.dao.MenuDao;
import com.newhc.admin.entity.Menu;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

public class MenuDaoImpl extends BaseDaoImpl implements MenuDao{
	
	public Pagination queryMenuPage(String name,String code,Integer type,Integer order,int pageMaxSize,int pageNumber){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,code,type,sequence,description,create_time,creator from menu where 1 = 1 ");
		if(!StringHelper.isEmpty(code)){
			query.append("and name like ? ");
			values.add("%"+name+"%");
		}
		if(!StringHelper.isEmpty(code)){
			query.append("and code like ? ");
			values.add("%"+code+"%");
		}
		if(NumbericHelper.getIntValue(type, 0)>0){
			query.append("and type = ? ");
			values.add(type);
		}
		if(NumbericHelper.getIntValue(order, 0)>0){
			if(order.intValue()==1){
				query.append("order by sequence asc ");
			}else{
				query.append("order by sequence desc ");
			}
		}
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new MapObjectRowMapper(), pageMaxSize, pageNumber);
	}
	
	public void addMenu(Menu menu){
		super.getHibernateTemplate().save(menu);
	}
	
	public Menu loadMenuById(Integer id){
		return (Menu)super.getHibernateTemplate().load(Menu.class, id);
	}
	
	public void updateMenu(Menu menu){
		super.getHibernateTemplate().update(menu);
	}
	
	public void deleteMenu(Menu menu){
		super.getHibernateTemplate().delete(menu);
	}
	
	public List queryMenuList(Integer type){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,code,description from menu where type = ? ");
		values.add(type);
		query.append("order by sequence asc ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}
}
