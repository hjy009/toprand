package com.newhc.admin.dao;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.AidPart;

public interface AidPartDao {
	public Pagination queryAidPartPage(String name,Integer status,int pageMaxSize,int pageNumber);
	public AidPart queryAidPartById(Integer id);
	public void addAidPart(AidPart aidPart);
	public void deleteAidPart(AidPart aidPart);
	public void updatgeAidPart(AidPart aidPart);
	public List queryAidPartList();
}
