package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.en.ModelPeriodicalCenterEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;
import com.newhc.admin.entity.en.ModelPeriodicalCenterEn;

public class ModelPeriodicalCenterEnDaoImpl extends BaseDaoImpl implements
		ModelPeriodicalCenterEnDao {

	public void addModelPeriodicalCenterEn(ModelPeriodicalCenterEn mpc) {
		super.getHibernateTemplate().save(mpc);
	}

	public void deleteModelPeriodicalCenterEn(ModelPeriodicalCenterEn mpc) {
		super.getHibernateTemplate().delete(mpc);
	}

	public ModelPeriodicalCenterEn queryModelPeriodicalCenterEnById(Integer id) {
		return (ModelPeriodicalCenterEn)super.getHibernateTemplate().load(ModelPeriodicalCenterEn.class, id);
	}

	public Pagination queryModelPeriodicalCenterEnPage(Integer periodicalId,String name,
			Integer status, int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,image_path,status,sequence,creator,create_time from model_periodical_center_en where 1 = 1 ");
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

	public List queryModelPeriodicalCenterEnWebList(Integer periodicalId) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,image_path from model_periodical_center_en where status = 1 AND periodical_Id = ? ");
		values.add(periodicalId);
		query.append("order by sequence ,create_time desc ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}

	public void updateModelPeriodicalCenterEn(ModelPeriodicalCenterEn mpc) {
		super.getHibernateTemplate().update(mpc);
	}

}
