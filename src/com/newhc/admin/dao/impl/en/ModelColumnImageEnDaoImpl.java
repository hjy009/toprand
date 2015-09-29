package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.en.ModelColumnImageEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;
import com.newhc.admin.entity.en.ModelColumnImageEn;


public class ModelColumnImageEnDaoImpl extends BaseDaoImpl implements ModelColumnImageEnDao {

	public void addModelColumnImageEn(ModelColumnImageEn modelColumnImageEn) {
		super.getHibernateTemplate().save(modelColumnImageEn);
	}

	public void deleteModelColumnImageEn(ModelColumnImageEn modelColumnImageEn) {
		super.getHibernateTemplate().delete(modelColumnImageEn);
	}

	 
	public Pagination queryModelColumnImageEnPage(String title, Integer status, Integer type,Integer parentType, Integer pageMaxSize, Integer pageNumber) {
		StringBuffer query = new StringBuffer();
		List<Object> values = new ArrayList<Object>();
		query.append("select id,title,link,flash,path,parent_type,type,status,create_time,creator from model_column_image_en where 1=1 ");
		 
		if(!StringHelper.isEmpty(title)){
			query.append("and title like ? ");
			values.add("%"+title+"%");
		}
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("and status = ? ");
			values.add(status);
		}
		if(NumbericHelper.getIntValue(type, -1)>-1){
			query.append("and type = ? ");
			values.add(type);
		}
		if(NumbericHelper.getIntValue(parentType, -1)>-1){
			query.append("and parent_type = ? ");
			values.add(parentType);
		}
		query.append("ORDER BY type ");
		return super.getJdbcDao().createPagination(query.toString(),values.toArray(),new MapObjectRowMapper(), pageMaxSize,pageNumber);
	}

	public void updateModelColumnImageEn(ModelColumnImageEn modelColumnImageEn) {
		super.getHibernateTemplate().update(modelColumnImageEn);
	}

	public ModelColumnImageEn queryModelColumnImageEnById(Integer id) {
		return (ModelColumnImageEn)super.getHibernateTemplate().load(ModelColumnImageEn.class,id);
	}

	public List queryModelColumnImageEnBy(Integer type, Integer limit) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
//		query.append("SELECT ee.* FROM (SELECT e.*,rownum rn FROM(SELECT id,link,path,flash FROM model_column_image WHERE status = 1 AND  type = ?)e )ee WHERE  1=1  AND ");
//		query.append("rn >=1 AND rn<=? ");
		query.append("SELECT id,link,path,flash FROM model_column_image_en WHERE status = 1 AND  type = ? LIMIT ?");
		values.add(type);
		values.add(limit);
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}

	public List queryModelColumnImageEnBy(Integer userId) {
		
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,user_id,title,link,path,status from model_column_image_en where parent_type = 2 and user_id = ? ");
		values.add(userId);
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}

}
