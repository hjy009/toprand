package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.en.AidPartEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;
import com.newhc.admin.entity.en.AidPartEn;

public class AidPartEnDaoImpl extends BaseDaoImpl implements AidPartEnDao {

	public void addAidPartEn(AidPartEn aidPartEn) {		
		super.getHibernateTemplate().save(aidPartEn);
	}

	public void deleteAidPartEn(AidPartEn aidPartEn) {		
		super.getHibernateTemplate().delete(aidPartEn);
	}

	public AidPartEn queryAidPartEnById(Integer id) {		
		return (AidPartEn)super.getHibernateTemplate().load(AidPartEn.class, id);
	}

	public Pagination queryAidPartEnPage(String name, Integer status,
			int pageMaxSize, int pageNumber) {
		StringBuffer query=new StringBuffer();
		List value=new ArrayList();
		query.append("select id,name,status,sequence,content,create_time,creator ");
		query.append("from aid_part_en where 1=1 ");
		if(!StringHelper.isEmpty(name)){
			query.append("and name like ? ");
			value.add("%"+name+"%");
		}
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("and status = ? ");
			value.add(status);
		}
		query.append("order by sequence,create_time desc ");
		return super.getJdbcDao().createPagination(query.toString(), value.toArray(), new MapObjectRowMapper(),pageMaxSize,pageNumber);
	}

	public void updatgeAidPartEn(AidPartEn aidPartEn) {
		super.getHibernateTemplate().update(aidPartEn);
	}

	public List queryAidPartEnList() {
		StringBuffer query=new StringBuffer();
		query.append("select id,name,content from aid_part_en where status = 1 ");
		query.append("order by sequence");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), new MapObjectRowMapper());
	}

	
}
