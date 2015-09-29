package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import com.newhc.admin.dao.RoleDao;
import com.newhc.admin.entity.Role;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

public class RoleDaoImpl extends BaseDaoImpl implements RoleDao{

	public Pagination queryRolePage(String code,String name,Integer type,Integer order,int pageMaxSize,int pageNumber){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,code,name,type,sequence,create_time,creator,description from role where 1 = 1 ");
		if(!StringHelper.isEmpty(code)){
			query.append("and code like ? ");
			values.add("%"+code+"%");
		}
		if(!StringHelper.isEmpty(name)){
			query.append("and name like ? ");
			values.add("%"+name+"%");
		}
		if(NumbericHelper.getIntValue(type, 0)>0){
			query.append("and type = ? ");
			values.add(type);
		}
		query.append("and show_type = 0 ");
		if(NumbericHelper.getIntValue(order, 0)>0){
			if(order.intValue()==1){
				query.append("order by sequence asc ");
			}else{
				query.append("order by sequence desc ");
			}
		}
		if(NumbericHelper.getIntValue(order, 0)>0){
			query.append(", id asc ");
		}else{
			query.append("order by id asc ");
		}
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new MapObjectRowMapper(), pageMaxSize, pageNumber);
	}
	
	public void addRole(Role role){
		super.getHibernateTemplate().save(role);
	}
	
	public void updateRole(Role role){
		super.getHibernateTemplate().update(role);
	}
	
	public Role loadRoleById(Integer id){
		return (Role)super.getHibernateTemplate().load(Role.class, id);
	}
	
	public void deleteRole(Role role){
		super.getHibernateTemplate().delete(role);
	}
	
	public List queryRoleList(Integer type){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,code,name,description from role where type = ? ");
		values.add(type);
		query.append("and show_type = 0 ");
		query.append("order by sequence asc ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(),new MapObjectRowMapper());
	}
	
	public List queryRoleIdByCode(String code){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id from role where code = ? ");
		values.add(code);
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}
}
