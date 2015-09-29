package com.newhc.admin.dao.en;

import java.util.List;

import com.newhc.admin.entity.en.ModelEmployessEn;

public interface ModelEmployessEnDao {
	public void addModelEmployessEn(ModelEmployessEn modelempEn);
	public void updateModelEmployessEn(ModelEmployessEn modelempEn);
	public ModelEmployessEn queryModelEmployessEnById(Integer id);
	public List queryModelEmployessEnPage();
}
