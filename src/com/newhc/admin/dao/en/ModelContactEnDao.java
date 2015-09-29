package com.newhc.admin.dao.en;

import java.util.List;

import com.newhc.admin.entity.en.ModelContactEn;

public interface ModelContactEnDao {
	
	public void addModelContactEn(ModelContactEn modelcontactEn);
	
	public void updateModelContactEn(ModelContactEn modelcontactEn);
	
	public ModelContactEn queryModelContactEnById(Integer id);
	
	public List queryModelContactEn();

}
