package com.newhc.admin.dao.en;

import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.entity.en.AidPartEn;

public interface AidPartEnDao {
	public Pagination queryAidPartEnPage(String name,Integer status,int pageMaxSize,int pageNumber);
	public AidPartEn queryAidPartEnById(Integer id);
	public void addAidPartEn(AidPartEn aidPartEn);
	public void deleteAidPartEn(AidPartEn aidPartEn);
	public void updatgeAidPartEn(AidPartEn aidPartEn);
	public List queryAidPartEnList();
}
