package com.newhc.admin.dao;

import cn.com.netmovie.spring.ApplicationContext;
import cn.com.netmovie.spring.jdbc.JdbcDaoSupport;

import com.newhc.admin.dao.en.AidPartEnDao;
import com.newhc.admin.dao.en.ModelAdvertiseEnDao;
import com.newhc.admin.dao.en.ModelAlbumEnDao;
import com.newhc.admin.dao.en.ModelAlbumTypeEnDao;
import com.newhc.admin.dao.en.ModelApplyforEnDao;
import com.newhc.admin.dao.en.ModelColumnImageEnDao;
import com.newhc.admin.dao.en.ModelColumnsJumpEnDao;
import com.newhc.admin.dao.en.ModelContactEnDao;
import com.newhc.admin.dao.en.ModelCultureEnDao;
import com.newhc.admin.dao.en.ModelEmployessEnDao;
import com.newhc.admin.dao.en.ModelEnterprisesEnDao;
import com.newhc.admin.dao.en.ModelFactoryEnvironmentEnDao;
import com.newhc.admin.dao.en.ModelLinkEnDao;
import com.newhc.admin.dao.en.ModelNewCenterEnDao;
import com.newhc.admin.dao.en.ModelNewsEnDao;
import com.newhc.admin.dao.en.ModelPeriodicalCenterEnDao;
import com.newhc.admin.dao.en.ModelPeriodicalEnDao;
import com.newhc.admin.dao.en.ModelProductCategoryEnDao;
import com.newhc.admin.dao.en.ModelPublicationTypeEnDao;
import com.newhc.admin.dao.en.ModelRemeberTheBigEnDao;
import com.newhc.admin.dao.en.ModelVideoCategoryEnDao;
import com.newhc.admin.dao.en.ModelVideoEnDao;
import com.newhc.admin.dao.impl.BaseDaoImpl;


/**
 * 
 *@author kelvin
 *@email kelvin@toprand.com
 * 2012-2-16
 */
public class DaoFactory {
	public static BaseDaoImpl getBaseDao(){ return (BaseDaoImpl)ApplicationContext.lookup("baseDao");}
	
	public static JdbcDaoSupport getJdbcDao(){ return (JdbcDaoSupport)ApplicationContext.lookup("jdbcDao");}
	
	public static AdminUserDao getAdminUserDao(){ return(AdminUserDao)ApplicationContext.lookup("adminUserDao");}
	
	public static RoleDao getRoleDao(){ return(RoleDao)ApplicationContext.lookup("roleDao");}
	
	public static GroupRoleDao getGroupRoleDao(){ return(GroupRoleDao)ApplicationContext.lookup("groupRoleDao");}
	
	public static AdminGroupDao getAdminGroupDao(){ return(AdminGroupDao)ApplicationContext.lookup("adminGroupDao");}
	
	public static AdminUserGroupDao getAdminUserGroupDao(){ return(AdminUserGroupDao)ApplicationContext.lookup("adminUserGroupDao");}
	
	public static MenuDao getMenuDao(){ return(MenuDao)ApplicationContext.lookup("menuDao");}
	
	public static AdminUserMenuDao getAdminUserMenuDao(){ return(AdminUserMenuDao)ApplicationContext.lookup("adminUserMenuDao");}
	
	public static AdminUserLogDao getAdminUserLogDao(){ return(AdminUserLogDao)ApplicationContext.lookup("adminUserLogDao");}
	
	/**
	 * ÖÐÎÄ°æ
	 */
	public static ModelNewsDao getModelNewsDao(){ return(ModelNewsDao)ApplicationContext.lookup("modelNewsDao");}
	
	public static ModelNewCenterDao getModelNewsCenterDao(){ return(ModelNewCenterDao)ApplicationContext.lookup("modelNewsCenterDao");}
	
	public static ModelProductCategoryDao getModelProductCategoryDao(){ return(ModelProductCategoryDao)ApplicationContext.lookup("modelProductCategoryDao");}
	
	public static ModelLinkDao getModelLinkDao(){return(ModelLinkDao)ApplicationContext.lookup("modelLinkDao");}
	
	public static ModelContactDao getModelContactDao(){return(ModelContactDao)ApplicationContext.lookup("modelContactDao");}
	
	
	public static ModelAdvertiseDao getModelAdvertiseDao(){return(ModelAdvertiseDao)ApplicationContext.lookup("modelAdvertiseDao");}
	
	
	
	public static ModelCultureDao getModelCultureDao(){return (ModelCultureDao)ApplicationContext.lookup("modelCultureDao");}
	
	public static ModelColumnsJumpDao getModelColumnsJumpDao(){return(ModelColumnsJumpDao)ApplicationContext.lookup("modelColumnsJumpDao");}

	public static ModelEmployessDao getModelEmployessDao(){return (ModelEmployessDao)ApplicationContext.lookup("modelEmployessDao");}

	public static ModelColumnImageDao getModelColumnImageDao(){return(ModelColumnImageDao)ApplicationContext.lookup("modelColumnImageDao");}

	public static ModelRemeberTheBigDao getModelRemeberTheBigDao(){return(ModelRemeberTheBigDao)ApplicationContext.lookup("modelRemeberTheBigDao");}
	
	public static ModelFactoryEnvironmentDao getModelFactoryEnvironmentDao(){return(ModelFactoryEnvironmentDao)ApplicationContext.lookup("modelFactoryEnvironmentDao");}
	
	public static ModelEnterprisesDao getModelEnterprisesDao(){return (ModelEnterprisesDao)ApplicationContext.lookup("modelEnterprisesDao");}
	
	public static ModelApplyforDao getModelApplyforDao(){return (ModelApplyforDao)ApplicationContext.lookup("modelApplyforDao");}
	
	public static ModelPeriodicalDao getModelPeriodicalDao(){return (ModelPeriodicalDao)ApplicationContext.lookup("modelPeriodicalDao");}
	
	public static ModelVideoDao getModelVideoDao(){return (ModelVideoDao)ApplicationContext.lookup("modelVideoDao");}
	
	public static ModelVideoCategoryDao getModelVideoCategoryDao(){return (ModelVideoCategoryDao)ApplicationContext.lookup("modelVideoCategoryDao");}
	
	public static ModelPeriodicalCenterDao getModelPeriodicalCenterDao(){return (ModelPeriodicalCenterDao)ApplicationContext.lookup("modelPeriodicalCenterDao");}
	
	public static ModelPublicationTypeDao getModelPublicationTypeDao(){return (ModelPublicationTypeDao)ApplicationContext.lookup("modelPublicationTypeDao");}
	
	public static AidPartDao getAidPartDao(){return (AidPartDao)ApplicationContext.lookup("aidPartDao");}
	
	public static ModelAlbumDao getModelAlbumDao(){return (ModelAlbumDao)ApplicationContext.lookup("modelAlbumDao");}
	
	public static ModelAlbumTypeDao getModelAlbumTypeDao(){return (ModelAlbumTypeDao)ApplicationContext.lookup("modelAlbumTypeDao");}
	
	
	
	
	/**
	 * Ó¢ÎÄ°æ
	 */
	public static ModelNewsEnDao getModelNewsEnDao(){ return(ModelNewsEnDao)ApplicationContext.lookup("modelNewsEnDao");}
	
	public static ModelNewCenterEnDao getModelNewsCenterEnDao(){ return(ModelNewCenterEnDao)ApplicationContext.lookup("modelNewsCenterEnDao");}
	
	public static ModelProductCategoryEnDao getModelProductCategoryEnDao(){ return(ModelProductCategoryEnDao)ApplicationContext.lookup("modelProductCategoryEnDao");}
	
	public static ModelLinkEnDao getModelLinkEnDao(){return(ModelLinkEnDao)ApplicationContext.lookup("modelLinkEnDao");}
	
	public static ModelContactEnDao getModelContactEnDao(){return(ModelContactEnDao)ApplicationContext.lookup("modelContactEnDao");}
	
	
	public static ModelAdvertiseEnDao getModelAdvertiseEnDao(){return(ModelAdvertiseEnDao)ApplicationContext.lookup("modelAdvertiseEnDao");}
	
	public static ModelColumnsJumpEnDao getModelColumnsJumpEnDao(){return(ModelColumnsJumpEnDao)ApplicationContext.lookup("modelColumnsJumpEnDao");}
	
	public static ModelCultureEnDao getModelCultureEnDao(){return (ModelCultureEnDao)ApplicationContext.lookup("modelCultureEnDao");}
	

	public static ModelEmployessEnDao getModelEmployessEnDao(){return (ModelEmployessEnDao)ApplicationContext.lookup("modelEmployessEnDao");}

	public static ModelColumnImageEnDao getModelColumnImageEnDao(){return(ModelColumnImageEnDao)ApplicationContext.lookup("modelColumnImageEnDao");}

	public static ModelRemeberTheBigEnDao getModelRemeberTheBigEnDao(){return(ModelRemeberTheBigEnDao)ApplicationContext.lookup("modelRemeberTheBigEnDao");}
	
	public static ModelFactoryEnvironmentEnDao getModelFactoryEnvironmentEnDao(){return(ModelFactoryEnvironmentEnDao)ApplicationContext.lookup("modelFactoryEnvironmentEnDao");}
	
	public static ModelEnterprisesEnDao getModelEnterprisesEnDao(){return (ModelEnterprisesEnDao)ApplicationContext.lookup("modelEnterprisesEnDao");}
	
	public static ModelApplyforEnDao getModelApplyforEnDao(){return (ModelApplyforEnDao)ApplicationContext.lookup("modelApplyforEnDao");}
	
	public static ModelPeriodicalEnDao getModelPeriodicalEnDao(){return (ModelPeriodicalEnDao)ApplicationContext.lookup("modelPeriodicalEnDao");}
	
	public static ModelVideoEnDao getModelVideoEnDao(){return (ModelVideoEnDao)ApplicationContext.lookup("modelVideoEnDao");}
	
	public static ModelVideoCategoryEnDao getModelVideoCategoryEnDao(){return (ModelVideoCategoryEnDao)ApplicationContext.lookup("modelVideoCategoryEnDao");}
	
	public static ModelPeriodicalCenterEnDao getModelPeriodicalCenterEnDao(){return (ModelPeriodicalCenterEnDao)ApplicationContext.lookup("modelPeriodicalCenterEnDao");}
	
	public static ModelPublicationTypeEnDao getModelPublicationTypeEnDao(){return (ModelPublicationTypeEnDao)ApplicationContext.lookup("modelPublicationTypeEnDao");}
	
	public static AidPartEnDao getAidPartEnDao(){return (AidPartEnDao)ApplicationContext.lookup("aidPartEnDao");}
	
	public static ModelAlbumEnDao getModelAlbumEnDao(){return (ModelAlbumEnDao)ApplicationContext.lookup("modelAlbumEnDao");}
	
	public static ModelAlbumTypeEnDao getModelAlbumTypeEnDao(){return (ModelAlbumTypeEnDao)ApplicationContext.lookup("modelAlbumTypeEnDao");}
}
