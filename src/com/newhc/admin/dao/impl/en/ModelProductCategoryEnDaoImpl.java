package com.newhc.admin.dao.impl.en;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.en.ModelProductCategoryEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;
import com.newhc.admin.entity.en.ModelProductCategoryEn;
import com.newhc.admin.entity.en.ModelProductEn;
import com.newhc.admin.entity.en.ModelProductHistoryEn;
import com.newhc.admin.entity.mapper.ModelProductRowMapper;
import com.newhc.admin.entity.mapper.en.ModelProductCategoryEnRowMapper;
import com.newhc.admin.entity.mapper.en.ModelProductEnRowMapper;

public class ModelProductCategoryEnDaoImpl extends BaseDaoImpl implements ModelProductCategoryEnDao{

	public Pagination queryModelProductCategoryEnPage(String name,Integer type,Integer status,int pageMaxSize,int pageNumber){
		StringBuffer query = new StringBuffer();
		List<Object> values = new ArrayList<Object>();
		query.append("select id,name,type,status,sequence,creator,create_time from model_product_category_en where 1 = 1 ");
		if(!StringHelper.isEmpty(name)){
			query.append("and name like ? ");
			values.add("%"+name+"%");
		}
		if(NumbericHelper.getIntValue(type, -1)>-1){
			query.append("and type = ? ");
			values.add(type);
		}
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("and status = ? ");
			values.add(status);
		}
		query.append("order by sequence ,create_time desc ");
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new ModelProductCategoryEnRowMapper(), pageMaxSize, pageNumber);
	}
	
	public void addModelProductCategoryEn(ModelProductCategoryEn mpc){
		super.getHibernateTemplate().save(mpc);
	}
	
	public ModelProductCategoryEn queryModelProductCategoryEnById(Integer id){
		return (ModelProductCategoryEn)super.getHibernateTemplate().load(ModelProductCategoryEn.class, id);
	}
	
	public void updateModelProductCategoryEn(ModelProductCategoryEn mpc){
		super.getHibernateTemplate().update(mpc);
	}
	
	public void deleteModelProductCategoryEn(ModelProductCategoryEn mpc){
		super.getHibernateTemplate().delete(mpc);
	}
	
	
	public int queryModelProductByCategoryEnId(Integer categoryId){
		StringBuffer query = new StringBuffer();
		List<Object> values = new ArrayList<Object>();
		query.append("select count(id) from model_product_en where category_id = ? ");
		values.add(categoryId);
		return super.getJdbcDao().getJdbcTemplate().queryForInt(query.toString(), values.toArray());
	}
	
	public Pagination queryModelProductEnPage(Integer categoryId,String name,Integer status,Integer sequence,int pageMaxSize,int pageNumber){
		StringBuffer query = new StringBuffer();
		List<Object> values = new ArrayList<Object>();
		query.append("select id,name,now_price,sequence,status,creator,create_time,pub_time from model_product_en where category_id = ? ");
		values.add(categoryId);
		if(!StringHelper.isEmpty(name)){
			query.append("and name like ? ");
			values.add("%"+name+"%");
		}
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("and status = ? ");
			values.add(status);
		}
		
		query.append("order by sequence ,create_time desc ");
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new ModelProductEnRowMapper(), pageMaxSize, pageNumber);
	}
	
	public void addModelProductEn(ModelProductEn modelProductEn){
		super.getHibernateTemplate().save(modelProductEn);
	}
	
	public ModelProductEn queryModelProductEnById(Integer id){
		return (ModelProductEn)super.getHibernateTemplate().load(ModelProductEn.class, id);
	}
	
	public void updateModelProductEn(ModelProductEn mp){
		super.getHibernateTemplate().update(mp);
	}
	
	public void deleteModelProductEn(ModelProductEn mp){
		super.getHibernateTemplate().delete(mp);
	}
	
	public List queryModelProductHistoryEnByProductId(Integer id){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id from model_product_history_en where product_id = ? ");
		values.add(id);
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}
	
	//	产品历史
	public void addModelProductHistoryEn(ModelProductHistoryEn modelProductHistoryEn) {
		
		super.getHibernateTemplate().save(modelProductHistoryEn);
	}

	public ModelProductHistoryEn queryModelProductHistoryEnById(Integer id) {
		
		return (ModelProductHistoryEn) super.getHibernateTemplate().load(ModelProductHistoryEn.class,id);
	}


	public Pagination queryModelProductHistoryEnPage(Integer productId, String name, Integer status, Integer sequence, int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List<Object> values = new ArrayList<Object>();
		query.append("select id,name,now_price,sequence,status,creator,create_time,pub_time from model_product_history_en where product_id = ? ");
		values.add(productId);
		if(!StringHelper.isEmpty(name)){
			query.append("and name like ? ");
			values.add("%"+name+"%");
		}
		if(NumbericHelper.getIntValue(status, -1)>-1){
			query.append("and status = ? ");
			values.add(status);
		}
		if(NumbericHelper.getIntValue(sequence, -1)>-1){
			if(sequence.intValue()==0){
				query.append("order by sequence asc ");
			}else{
				query.append("order by sequence desc ");
			}
		}
		if(NumbericHelper.getIntValue(sequence, -1)==-1){
			query.append("order by sequence ,create_time desc ");
		}
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new ModelProductEnRowMapper(), pageMaxSize, pageNumber);
	}

	public void deleteModelProductHistoryEn(ModelProductHistoryEn mp) {
		super.getHibernateTemplate().delete(mp);
		
	}
	
	//web
	
	public Pagination queryModelProductEnWebPage(String name,Integer productId, int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,category_id,name,content,small_image from model_product_en where status = 1  ");
		
		if(NumbericHelper.getIntValue(productId, -1)>-1){
			query.append("and category_id = ? ");
			values.add(productId);
		}
		if(!StringHelper.isEmpty(name)){
			query.append("and name like ? ");
			values.add("%"+name+"%");
			
			 
		}
		query.append(" and ( category_id = 1 or category_id = 4 or category_id = 10) ");
		query.append("order by sequence,create_time desc ");
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new MapObjectRowMapper(), pageMaxSize, pageNumber);
	}

	public List queryModelProductEnWebList(Integer categoryId) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,small_image,content from model_product_en where status = 1 and category_id = ? ");
		values.add(categoryId);
		query.append("order by sequence,create_time desc ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}
	
	
	
	
	
}
