package com.newhc.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import cn.com.netmovie.helper.NumbericHelper;
import cn.com.netmovie.helper.StringHelper;
import cn.com.netmovie.spring.jdbc.MapObjectRowMapper;
import cn.com.netmovie.util.Pagination;

import com.newhc.admin.dao.ModelProductCategoryDao;
import com.newhc.admin.entity.ModelProduct;
import com.newhc.admin.entity.ModelProductCategory;
import com.newhc.admin.entity.ModelProductHistory;
import com.newhc.admin.entity.mapper.ModelProductCategoryRowMapper;
import com.newhc.admin.entity.mapper.ModelProductRowMapper;

public class ModelProductCategoryDaoImpl extends BaseDaoImpl implements ModelProductCategoryDao{

	public Pagination queryModelProductCategoryPage(String name,Integer type,Integer status,int pageMaxSize,int pageNumber){
		StringBuffer query = new StringBuffer();
		List<Object> values = new ArrayList<Object>();
		query.append("select id,name,type,status,sequence,creator,create_time from model_product_category where 1 = 1 ");
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
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new ModelProductCategoryRowMapper(), pageMaxSize, pageNumber);
	}
	
	public void addModelProductCategory(ModelProductCategory mpc){
		super.getHibernateTemplate().save(mpc);
	}
	
	public ModelProductCategory queryModelProductCategoryById(Integer id){
		return (ModelProductCategory)super.getHibernateTemplate().load(ModelProductCategory.class, id);
	}
	
	public void updateModelProductCategory(ModelProductCategory mpc){
		super.getHibernateTemplate().update(mpc);
	}
	
	public void deleteModelProductCategory(ModelProductCategory mpc){
		super.getHibernateTemplate().delete(mpc);
	}
	
	
	public int queryModelProductByCategoryId(Integer categoryId){
		StringBuffer query = new StringBuffer();
		List<Object> values = new ArrayList<Object>();
		query.append("select count(id) from model_product where category_id = ? ");
		values.add(categoryId);
		return super.getJdbcDao().getJdbcTemplate().queryForInt(query.toString(), values.toArray());
	}
	
	public Pagination queryModelProductPage(Integer categoryId,String name,Integer status,Integer sequence,int pageMaxSize,int pageNumber){
		StringBuffer query = new StringBuffer();
		List<Object> values = new ArrayList<Object>();
		query.append("select id,name,now_price,sequence,status,creator,create_time,pub_time from model_product where category_id = ? ");
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
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new ModelProductRowMapper(), pageMaxSize, pageNumber);
	}
	
	public void addModelProduct(ModelProduct modelProduct){
		super.getHibernateTemplate().save(modelProduct);
	}
	
	public ModelProduct queryModelProductById(Integer id){
		return (ModelProduct)super.getHibernateTemplate().load(ModelProduct.class, id);
	}
	
	public void updateModelProduct(ModelProduct mp){
		super.getHibernateTemplate().update(mp);
	}
	
	public void deleteModelProduct(ModelProduct mp){
		super.getHibernateTemplate().delete(mp);
	}
	
	public List queryModelProductHistoryByProductId(Integer id){
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id from model_product_history where product_id = ? ");
		values.add(id);
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}
	
	//	产品历史
	public void addModelProductHistory(ModelProductHistory modelProductHistory) {
		
		super.getHibernateTemplate().save(modelProductHistory);
	}

	public ModelProductHistory queryModelProductHistoryById(Integer id) {
		
		return (ModelProductHistory) super.getHibernateTemplate().load(ModelProductHistory.class,id);
	}


	public Pagination queryModelProductHistoryPage(Integer productId, String name, Integer status, Integer sequence, int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List<Object> values = new ArrayList<Object>();
		query.append("select id,name,now_price,sequence,status,creator,create_time,pub_time from model_product_history where product_id = ? ");
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
		return super.getJdbcDao().createPagination(query.toString(), values.toArray(), new ModelProductRowMapper(), pageMaxSize, pageNumber);
	}

	public void deleteModelProductHistory(ModelProductHistory mp) {
		super.getHibernateTemplate().delete(mp);
		
	}
	
	//web
	
	public Pagination queryModelProductWebPage(String name,Integer productId, int pageMaxSize, int pageNumber) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,category_id,name,content,small_image from model_product where status = 1  ");
		
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

	public List queryModelProductWebList(Integer categoryId) {
		StringBuffer query = new StringBuffer();
		List values = new ArrayList();
		query.append("select id,name,small_image,content from model_product where status = 1 and category_id = ? ");
		values.add(categoryId);
		query.append("order by sequence,create_time desc ");
		return super.getJdbcDao().getJdbcTemplate().query(query.toString(), values.toArray(), new MapObjectRowMapper());
	}
	
	
	
	
	
}
