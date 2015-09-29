package com.newhc.admin.dao;

import java.util.List;

import com.newhc.admin.entity.ModelContact;

public interface ModelContactDao {
	
	public void addModelContact(ModelContact modelcontact);
	
	public void updateModelContact(ModelContact modelcontact);
	
	public ModelContact queryModelContactById(Integer id);
	
	public List queryModelContact();

}
