package com.newhc.web.action.en;

import java.io.File;
import java.util.List;

import cn.com.netmovie.util.Pagination;

import com.newhc.admin.action.JSONPrintAction;
import com.newhc.admin.constants.Constants;
import com.newhc.admin.dao.DaoFactory;
import com.newhc.admin.entity.ModelAdvertise;
import com.newhc.admin.entity.ModelApplyfor;
import com.newhc.admin.entity.ModelEmployess;
import com.newhc.admin.entity.en.ModelAdvertiseEn;
import com.newhc.admin.entity.en.ModelApplyforEn;
import com.newhc.admin.entity.en.ModelEmployessEn;
import com.newhc.admin.helper.FileHelperUtil;
import com.newhc.admin.helper.ImageHelperUtil;

public class EmployessEnWebAction extends JSONPrintAction{
	private Integer imageType = new Integer(5);
	private Integer imageLimit = 1;
	private ModelEmployessEn modelEmployess = new ModelEmployessEn();
	private String name;
	/**
	 * ��Ƹ���� -->Ȩ��������
	 * @return
	 */
	public String processEmployessEnWebAction(){
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		modelEmployess = DaoFactory.getModelEmployessEnDao().queryModelEmployessEnById(new Integer(1));
		return SUCCESS;
	}
	
	/**
	 * ��Ƹ���� -->н���븣��
	 * @return
	 */
	public String processXincEnWebAction(){
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		modelEmployess = DaoFactory.getModelEmployessEnDao().queryModelEmployessEnById(new Integer(2));
		return SUCCESS;
	}
	
	/**
	 * ��Ƹ���� -->������Դ����
	 * @return
	 */
	public String processRenlEnWebAction(){
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		modelEmployess = DaoFactory.getModelEmployessEnDao().queryModelEmployessEnById(new Integer(3));
		return SUCCESS;
	}
	
	
	private int pageMaxSize=6;
	private int pageNumber=1;
	private String company;
	private String adName;
	private String dataName;
	/**
	 * ��Ƹ����-->��Ƹ��Ϣ
	 * @return(String companyName,String name,String dataName,
			Integer type, Integer status, int pageMaxSize, int pageNumber);
	 */
	
	public  String processZhaopEnWebAction(){
	 
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		Pagination pages= DaoFactory.getModelAdvertiseEnDao().queryModelAdvertiseEnWebPage(company,adName,dataName,new Integer(1), new Integer(1), pageMaxSize, pageNumber);
		List nameList=DaoFactory.getModelAdvertiseEnDao().queryAdvertiseEnByName(new Integer(1), new Integer(1));
		super.setRequestAttribute("nameList", nameList);
		super.setRequestAttribute("pages", pages);
		return SUCCESS;
	}

	
	/**
	 * ��Ƹ����-->�й���Ϣ
	 * @return
	 */
	
	public  String processRecruitEnWebAction(){
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		Pagination pages= DaoFactory.getModelAdvertiseEnDao().queryModelAdvertiseEnWebPage(company,adName,dataName,new Integer(2), new Integer(1), pageMaxSize, pageNumber);
		List nameList=DaoFactory.getModelAdvertiseEnDao().queryAdvertiseEnByName(new Integer(2), new Integer(1));
		super.setRequestAttribute("nameList", nameList);
		super.setRequestAttribute("pages", pages);
		return SUCCESS;
	}

	private Integer advertiseId;
	private ModelAdvertiseEn advertise =new ModelAdvertiseEn();
	/**
	 * ��Ƹ��ϸ
	 * @return
	 */
	public  String processAdvertiseDetalEnWebAction(){
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		advertise=DaoFactory.getModelAdvertiseEnDao().queryModelAdvertiseEnById(advertiseId);
		return SUCCESS;
	}
	
	/**
	 * ׼��ӦƸ
	 * @return
	 */
	public  String processParperApplyforEnWebAction(){
		List imageList = DaoFactory.getModelColumnImageEnDao().queryModelColumnImageEnBy(imageType, imageLimit);
		super.setRequestAttribute("imageList", imageList);
		return SUCCESS;
	}
	
	
	
	private ModelApplyforEn applyforEn= new ModelApplyforEn();
	private File fileImage;
	private String fileImageFileName;
	String aSoPath = this.getClass().getResource("").getPath();
	int part = aSoPath.indexOf("WEB-INF");
	String realPath = aSoPath.substring(0, part);
	private String uploadImagePath = realPath +"admin/uploadFile/DownloadEn/";
	private String dataImagePath = "admin/uploadFile/DownloadEn/";
	/**
	 * ��ҪӦƸ
	 * @return
	 */
	public  String processAddApplyforEnWebAction(){
 
//		if(applyfor.getTablePath()!=null&&applyfor.getTablePath()==null){
//			boolean isSuitSize = ImageHelperUtil.isSuitFileSize(fileImage);//�ϴ����鼮���ܴ���10m
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
		
//		�ж��ļ�����
		if(fileImage!=null&&fileImageFileName!=null){
			boolean isSuitType = ImageHelperUtil.isSuitFileType(fileImageFileName);
			if(!isSuitType){
				super.setActionResponse(RESPONSE_FAILURE,Constants.fileTypeString);
	        	return SUCCESS;
			}
		}
		//�ж��ļ���С
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
			FileHelperUtil.writeFile(uploadImagePath, fileImageFileName, content);//Ϊ��ӦLINUX��������ȡ�ļ��������޸�
		}
		
		if(fileImageFileName!=null&&fileImageFileName.length()>0){
//			formDownload.setPath(dataImagePath+fileImageFileName);//Ϊ��ӦLINUX��������ȡ�ļ��������޸�
			applyforEn.setTablePath(dataImagePath+fileImageFileName);
		}
			DaoFactory.getModelApplyforEnDao().addModelApplyforEn(applyforEn);
			super.setActionResponse(RESPONSE_SUCCESS);
			
		return SUCCESS;
	}
	
	/**
	 * ������Ƹ��
	 * @return
	 */
	public String processDownloadEnFiles(){
		
		String path=realPath+"file/OpportunitiesTable.doc";
		String fileName="OpportunitiesTable.doc";
		System.out.println(path+"........................");
		FileHelperUtil.downLoadFile(path, fileName);
		return null;
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

	 
	public Integer getAdvertiseId() {
		return advertiseId;
	}

	public void setAdvertiseId(Integer advertiseId) {
		this.advertiseId = advertiseId;
	}

	 

	 

	public ModelApplyforEn getApplyforEn() {
		return applyforEn;
	}

	public void setApplyforEn(ModelApplyforEn applyforEn) {
		this.applyforEn = applyforEn;
	}

	 

	public ModelAdvertiseEn getAdvertise() {
		return advertise;
	}

	public void setAdvertise(ModelAdvertiseEn advertise) {
		this.advertise = advertise;
	}

	public ModelEmployessEn getModelEmployess() {
		return modelEmployess;
	}

	public void setModelEmployess(ModelEmployessEn modelEmployess) {
		this.modelEmployess = modelEmployess;
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
