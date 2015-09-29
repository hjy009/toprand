package com.newhc.web.action;

import java.io.File;
import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.constants.Constants;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.ModelAdvertise;
import com.newhc.admin.entity.ModelApplyfor;
import com.newhc.admin.entity.ModelEmployess;
import com.newhc.admin.helper.FileHelperUtil;
import com.newhc.admin.helper.ImageHelperUtil;

public class EmployessWebAction extends JSONPrintAction{
	private Integer imageType = new Integer(5);
	private Integer imageLimit = 1;
	private ModelEmployess modelEmployess = new ModelEmployess();
	private String name;
	/**
	 * 招聘管理 -->权利与义务
	 * @return
	 */
	public String processEmployessWebAction(){
		List imageList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		modelEmployess = DaoFactory.getModelEmployessDao().queryModelEmployessById(new Integer(1));
		return SUCCESS;
	}
	
	/**
	 * 招聘管理 -->薪酬与福利
	 * @return
	 */
	public String processXincWebAction(){
		List imageList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		modelEmployess = DaoFactory.getModelEmployessDao().queryModelEmployessById(new Integer(9));
		return SUCCESS;
	}
	
	/**
	 * 招聘管理 -->人力资源策略
	 * @return
	 */
	public String processRenlWebAction(){
		List imageList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		modelEmployess = DaoFactory.getModelEmployessDao().queryModelEmployessById(new Integer(10));
		return SUCCESS;
	}
	
	
	private int pageMaxSize=6;
	private int pageNumber=1;
	private String company;
	private String adName;
	private String dataName;
	/**
	 * 招聘管理-->招聘信息
	 * @return(String companyName,String name,String dataName,
			Integer type, Integer status, int pageMaxSize, int pageNumber);
	 */
	
	public  String processZhaopWebAction(){
	 
		List imageList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		Pagination pages= DaoFactory.getModelAdvertiseDao().queryModelAdvertiseWebPage(company,adName,dataName,new Integer(1), new Integer(1), pageMaxSize, pageNumber);
		List nameList=DaoFactory.getModelAdvertiseDao().queryAdvertiseByName(new Integer(1), new Integer(1));
		super.setRequestAttribute("nameList", nameList);
		super.setRequestAttribute("pages", pages);
		return SUCCESS;
	}

	
	/**
	 * 招聘管理-->招工信息
	 * @return
	 */
	
	public  String processRecruitWebAction(){
		List imageList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		Pagination pages= DaoFactory.getModelAdvertiseDao().queryModelAdvertiseWebPage(company,adName,dataName,new Integer(2), new Integer(1), pageMaxSize, pageNumber);
		List nameList=DaoFactory.getModelAdvertiseDao().queryAdvertiseByName(new Integer(2), new Integer(1));
		super.setRequestAttribute("nameList", nameList);
		super.setRequestAttribute("pages", pages);
		return SUCCESS;
	}

	private Integer advertiseId;
	private ModelAdvertise advertise =new ModelAdvertise();
	/**
	 * 招聘详细
	 * @return
	 */
	public  String processAdvertiseDetalWebAction(){
		List imageList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		advertise=DaoFactory.getModelAdvertiseDao().queryModelAdvertiseById(advertiseId);
		return SUCCESS;
	}
	
	/**
	 * 准备应聘
	 * @return
	 */
	public  String processParperApplyforWebAction(){
		List imageList = DaoFactory.getModelColumnImageDao().queryModelColumnImageBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		return SUCCESS;
	}
	
	
	
	private ModelApplyfor applyfor= new ModelApplyfor();
	private File fileImage;
	private String fileImageFileName;
	String aSoPath = this.getClass().getResource("").getPath();
	int part = aSoPath.indexOf("WEB-INF");
	String realPath = aSoPath.substring(0, part);
	private String uploadImagePath = realPath +"admin/uploadFile/Download/";
	private String dataImagePath = "admin/uploadFile/Download/";
	/**
	 * 我要应聘
	 * @return
	 */
	public  String processAddApplyforWebAction(){
 
//		if(applyfor.getTablePath()!=null&&applyfor.getTablePath()==null){
//			boolean isSuitSize = ImageHelperUtil.isSuitFileSize(fileImage);//上传的书籍不能大于10m
//			if(!isSuitSize){
//				super.setActionResponse(RESPONSE_FAILURE,Constants.imageSizeString);
//	        	return SUCCESS;
//			}
//			
//			
//			String timeFileSyImageFileName ="";
//			if(fileImage!=null&&fileImageFileName!=null){
//				timeFileSyImageFileName = ImageHelperUtil.getNameFromTime(fileImageFileName);
//			}
//			if(fileImage!=null&&fileImageFileName!=null){
//				byte[] content = FileHelperUtil.readFile(fileImage.getAbsolutePath());
//				FileHelperUtil.writeFile(uploadImagePath, timeFileSyImageFileName, content);
//			}
//			if(fileImageFileName!=null&&fileImageFileName.length()>0){
//				applyfor.setTablePath(dataImagePath+timeFileSyImageFileName);
//			}
//		}
		
//		判断文件类型
		if(fileImage!=null&&fileImageFileName!=null){
			boolean isSuitType = ImageHelperUtil.isSuitFileType(fileImageFileName);
			if(!isSuitType){
				super.setActionResponse(RESPONSE_FAILURE,Constants.fileTypeString);
	        	return SUCCESS;
			}
		}
		//判断文件大小
		if(fileImage!=null&&fileImageFileName!=null){
			boolean isSuitSize = ImageHelperUtil.isSuitFileSize(fileImage);
			if(!isSuitSize){
				super.setActionResponse(RESPONSE_FAILURE,Constants.fileSizeString);
	        	return SUCCESS;
			}
		}
		
		//int dot = fileImageFileName.indexOf(".");
		//String realName = applyfor.getName()+fileImageFileName.substring(dot, fileImageFileName.length());
		if(fileImage!=null&&fileImageFileName!=null){
			byte[] content = FileHelperUtil.readFile(fileImage.getAbsolutePath());
//			FileHelperUtil.writeFile(uploadImagePath, fileImageFileName, content);
			FileHelperUtil.writeFile(uploadImagePath, fileImageFileName, content);//为适应LINUX拦截器获取文件名乱码修改
		}
		
		if(fileImageFileName!=null&&fileImageFileName.length()>0){
//			formDownload.setPath(dataImagePath+fileImageFileName);//为适应LINUX拦截器获取文件名乱码修改
			applyfor.setTablePath(dataImagePath+fileImageFileName);
		}
			DaoFactory.getModelApplyforDao().addModelApplyfor(applyfor);
			super.setActionResponse(RESPONSE_SUCCESS);
			
		return SUCCESS;
	}
	
	/**
	 * 下载招聘表
	 * @return
	 */
	public String processDownloadFiles(){
		
		String path=realPath+"file/OpportunitiesTable.doc";
		String fileName="OpportunitiesTable.doc";
		System.out.println(path+"........................");
		FileHelperUtil.downLoadFile(path, fileName);
		return null;
	}
	
	
	public ModelEmployess getModelEmployess() {
		return modelEmployess;
	}
	public void setModelEmployess(ModelEmployess modelEmployess) {
		this.modelEmployess = modelEmployess;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getDataName() {
		return dataName;
	}

	public void setDataName(String dataName) {
		this.dataName = dataName;
	}

	public String getAdName() {
		return adName;
	}

	public void setAdName(String adName) {
		this.adName = adName;
	}

	public ModelAdvertise getAdvertise() {
		return advertise;
	}

	public void setAdvertise(ModelAdvertise advertise) {
		this.advertise = advertise;
	}

	public Integer getAdvertiseId() {
		return advertiseId;
	}

	public void setAdvertiseId(Integer advertiseId) {
		this.advertiseId = advertiseId;
	}

	public ModelApplyfor getApplyfor() {
		return applyfor;
	}

	public void setApplyfor(ModelApplyfor applyfor) {
		this.applyfor = applyfor;
	}

	public File getFileImage() {
		return fileImage;
	}

	public void setFileImage(File fileImage) {
		this.fileImage = fileImage;
	}

	public String getFileImageFileName() {
		return fileImageFileName;
	}

	public void setFileImageFileName(String fileImageFileName) {
		this.fileImageFileName = fileImageFileName;
	}

	public int getPart() {
		return part;
	}

	public void setPart(int part) {
		this.part = part;
	}

	public String getRealPath() {
		return realPath;
	}

	public void setRealPath(String realPath) {
		this.realPath = realPath;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
 

}
