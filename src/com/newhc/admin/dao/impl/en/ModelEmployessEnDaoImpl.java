package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;

import com.newhc.admin.dao.en.ModelEmployessEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;
import com.newhc.admin.entity.en.ModelEmployessEn;

public class ModelEmployessEnDaoImpl extends BaseDaoImpl implements
		ModelEmployessEnDao {

	public void addModelEmployessEn(ModelEmployessEn modelempEn) {
		super.getHibernateTemplate().save(modelempEn);
	}

	public ModelEmployessEn queryModelEmployessEnById(Integer id) {
		return (ModelEmployessEn)super.getHibernateTemplate().load(ModelEmployessEn.class, id);
	}

	public void updateModelEmployessEn(ModelEmployessEn modelempEn) {
		super.getHibernateTemplate().update(modelempEn);
	}

	public List queryModelEmployessEnPage() {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,content FROM model_employess_en ");

		return super.getJdbcDao().getJdbcTemplate().query(query.toString(),new MapObjectRowMapper());
	}
	
	
}
