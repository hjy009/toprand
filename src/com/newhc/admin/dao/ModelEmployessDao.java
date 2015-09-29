package com.newhc.admin.dao;

import java.util.List;

import com.newhc.admin.entity.ModelEmployess;

public interface ModelEmployessDao {
	public void addModelEmployess(ModelEmployess modelemp);
	public void updateModelEmployess(ModelEmployess modelemp);
	public ModelEmployess queryModelEmployessById(Integer id);
	public List queryModelEmployessPage();
}
