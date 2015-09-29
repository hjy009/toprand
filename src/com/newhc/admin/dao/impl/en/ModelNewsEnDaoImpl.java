package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import cn.com.netmovie.helper.DateHelper;
import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.en.ModelNewsEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;
import com.newhc.admin.entity.en.ModelNewsCenterEn;
import com.newhc.admin.entity.en.ModelNewsEn;
import com.newhc.admin.entity.mapper.ModelNewsHistoryRowMapper;

public class ModelNewsEnDaoImpl extends BaseDaoImpl implements ModelNewsEnDao {

	public void addModelNewsEn(ModelNewsEn modelNewsEn) {
		super.getHibernateTemplate().save(modelNewsEn);
	}

	public void deleteModelNewsEn(ModelNewsEn modelNewsEn) {
		super.getHibernateTemplate().delete(modelNewsEn);

	}

	public ModelNewsEn queryModelNewsEnById(Integer id) {
		return (ModelNewsEn) super.getHibernateTemplate().load(ModelNewsEn.class,id);
	}

	public Pagination queryModelNewsEnPage(String title,Integer centerId,Integer year,Integer status,Integer sequence,Date startTime,Date endTime,
			Integer pageMaxSize, Integer pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,title,click,content,path,sy_path,pub_time,status,sequence,creator,updator,create_time,update_time ");
		query.append("FROM model_news_en WHERE 1 = 1 ");
		
		

		if(NumbericHelper.getIntValue(centerId, -1)>-1){
			query.append("AND center_id = ? ");
			values.add(centerId);
		}
		
		if(!StringHelper.isEmpty(title)){
			query.append("AND title LIKE ? ");
			values.add("%"+title+"%");
		}
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("AND status = ? ");
			values.add(status);
		}
		
		if(NumbericHelper.getIntValue(year, -1)>-1){
			query.append("AND year = ? ");
			values.add(year);
		}
		
		if (startTime != null) {
			query.append("and pub_time >= ? ");
			values.add(startTime);
		}
		if (endTime != null) {
			query.append("and pub_time < ? ");
			values.add(DateHelper.add(endTime, DateHelper.DAY, +1));
		}
		query.append("order by pub_time desc,sequence asc,create_time desc ");
		
		return super.getJdbcDao().createPagination(query.toString(),values.toArray(),new MapObjectRowMapper(), pageMaxSize,pageNumber);
	}

	public void updateModelNewsEn(ModelNewsEn modelNewsEn) {
		super.getHibernateTemplate().update(modelNewsEn);
	}
	
	
	public void addModelNewsHistoryEn(ModelNewsCenterEn mnh){
		super.getHibernateTemplate().save(mnh);
	}
	
	public Pagination queryModelNewsHistoryEnPage(Integer newsId,String title,Integer status,Date startTime,Date endTime,Integer pageMaxSize,Integer pageNumber){
		StringBuffer query = new StringBuffer();
		List<Object> values = new ArrayList<Object>();
		query.append("select id,title,type,pub_time,status,sequence,creator,create_time ");
		query.append("from model_news_history_en where news_id = ? ");
		values.add(newsId);
		if(!StringHelper.isEmpty(title)){
			query.append("and title like ? ");
			values.add("%"+title+"%");
		}
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("and status = ? ");
			values.add(status);
		}
		
		if (startTime != null) {
			query.append("and pub_time >= ? ");
			values.add(startTime);
		}
		if (endTime != null) {
			query.append("and pub_time < ? ");
			values.add(DateHelper.add(endTime, DateHelper.DAY, +1));
		}
//		query.append("order by pub_time desc,sequence asc,create_time desc ");
		query.append("order by id desc ");
		return super.getJdbcDao().createPagination(query.toString(),values.toArray(),new ModelNewsHistoryRowMapper(), pageMaxSize,pageNumber);
	}
	
	public ModelNewsCenterEn queryModelNewsHistoryEnById(Integer id){
		return (ModelNewsCenterEn)super.getHibernateTemplate().load(ModelNewsCenterEn.class, id);
	}
	
	public void deleteModelNewsHistoryEn(ModelNewsCenterEn mnh){
		super.getHibernateTemplate().delete(mnh);
	}
	
	public void deleteModelNewsHistoryEnByNewsId(Integer newsId){
		StringBuffer query = new StringBuffer();
		List<Object> values = new ArrayList<Object>();
		query.append("delete from model_news_history_en where news_id = ? ");
		values.add(newsId);
		super.getJdbcDao().getJdbcTemplate().update(query.toString(), values.toArray());
	}

	public void updateNewsEnClick(Integer id, Integer click) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("update model_news_en set click = ? where id = ? ");
		values.add(click);
		values.add(id);
		super.getJdbcDao().getJdbcTemplate().update(query.toString(), values.toArray());
		
	}

	public List<ModelNewsEn> queryNewsEn(ModelNewsEn modelNewsEn) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,title,sequence,create_time FROM model_news_en  ");
		if(modelNewsEn.getCenterId()!=null){
			query.append("WHERE center_id = ? ");
			values.add(modelNewsEn.getCenterId());
		}
		query.append(" order by sequence asc,create_time desc ");

		return super.getJdbcDao().getJdbcTemplate().query(query.toString(),values.toArray(),new MapObjectRowMapper());
	}

	public List queryNewsEnByDistinct(Integer centerId) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT  distinct year FROM model_news_en where status = 1 AND center_id =? ");
		values.add(centerId);
		query.append(" order by year asc");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(),values.toArray(),new MapObjectRowMapper());
	}

	public List queryNewsEnByLimit(Integer centerId) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,title,pub_time FROM model_news_en WHERE status = 1 AND center_id = ? ");
		values.add(centerId);
		query.append("order by pub_time desc,sequence asc,create_time desc  ");
		query.append("LIMIT 5 ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}

	public Pagination queryModelNewsEnWebPage(String title, Integer pageMaxSize, Integer pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("SELECT id,center_id,title,click,pub_time ");
		query.append("FROM model_news_en WHERE status = 1 ");
		
		
		if(!StringHelper.isEmpty(title)){
			query.append("AND title LIKE ? ");
			values.add("%"+title+"%");
		}
		
		query.append("order by pub_time desc,sequence asc,create_time desc ");
		
		return super.getJdbcDao().createPagination(query.toString(),values.toArray(),new MapObjectRowMapper(), pageMaxSize,pageNumber);
	}
	
	
}
