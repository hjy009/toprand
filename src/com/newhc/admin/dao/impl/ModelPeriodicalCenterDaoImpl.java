package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.ModelPeriodicalCenterDao;
import com.newhc.admin.entity.ModelPeriodical;
import com.newhc.admin.entity.ModelPeriodicalCenter;

public class ModelPeriodicalCenterDaoImpl extends BaseDaoImpl implements
		ModelPeriodicalCenterDao {

	public void addModelPeriodicalCenter(ModelPeriodicalCenter mpc) {
		super.getHibernateTemplate().save(mpc);
	}

	public void deleteModelPeriodicalCenter(ModelPeriodicalCenter mpc) {
		super.getHibernateTemplate().delete(mpc);
	}

	public ModelPeriodicalCenter queryModelPeriodicalCenterById(Integer id) {
		return (ModelPeriodicalCenter)super.getHibernateTemplate().load(ModelPeriodicalCenter.class, id);
	}

	public Pagination queryModelPeriodicalCenterPage(Integer periodicalId,String name,
			Integer status, int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,image_path,status,sequence,creator,create_time from model_periodical_center where 1 = 1 ");
		if(NumbericHelper.getIntValue(periodicalId, -1)>-1){
			query.append("AND periodical_Id = ? ");
			values.add(periodicalId);
		}
		if(!StringHelper.isEmpty(name)){
			query.append("and name like ? ");
			values.add("%"+name+"%");
		}
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("and status = ? ");
			values.add(status);
		}
		query.append("order by sequence ,create_time desc ");
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new MapObjectRowMapper(), pageMaxSize, pageNumber);
	}

	public List queryModelPeriodicalCenterWebList(Integer periodicalId) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,image_path from model_periodical_center where status = 1 AND periodical_Id = ? ");
		values.add(periodicalId);
		query.append("order by sequence ,create_time desc ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}

	public void updateModelPeriodicalCenter(ModelPeriodicalCenter mpc) {
		super.getHibernateTemplate().update(mpc);
	}

}
