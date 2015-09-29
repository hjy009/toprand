package com.newhc.admin.helper;

import java.io.File;
import java.io.FileInputStream;
import java.util.Date;

import com.newhc.admin.constants.Constants;

import cn.com.netmovie.helper.DateHelper;

public class ImageHelperUtil {
	
	public static String getNameFromTime(String fileName){
		String timeName = "";
		if(fileName!=null&&fileName.length()>0){
			int dot = fileName.indexOf(".");
			if(dot>0){
				timeName = fileName.substring(dot);
				timeName = DateHelper.toString(new Date(), "yyyyMMddHHmmss")+timeName;
				return timeName;
			}else{
				return timeName;
			}
		}else{
			return timeName;
		}
	}
	
	public static boolean isSuitType(String fileName){
		if(fileName!=null&&fileName.length()>0){
			int dot = fileName.indexOf(".");
			if(dot>0){
				String imageType = fileName.substring(dot);
				if(imageType.indexOf("jpg")>0||imageType.indexOf("gif")>0||imageType.indexOf("bmp")>0){
					return true;
				}else{
					return false;
				}
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
	
	public static boolean isSuitFlashType(String fileName){
		if(fileName!=null&&fileName.length()>0){
			int dot = fileName.indexOf(".");
			if(dot>0){
				String imageType = fileName.substring(dot);
				if(imageType.indexOf("swf")>0){
					return true;
				}else{
					return false;
				}
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
	
	//判断文件类型
	public static boolean isSuitFileType(String fileName){
		if(fileName!=null&&fileName.length()>0){
			int dot = fileName.indexOf(".");
			if(dot>0){
				String imageType = fileName.substring(dot);
				if(imageType.indexOf("rar")>0||imageType.indexOf("zip")>0||imageType.indexOf("doc")>0||imageType.indexOf("docx")>0||imageType.indexOf("xlsx")>0||imageType.indexOf("xls")>0||imageType.indexOf("txt")>0||imageType.indexOf("pdf")>0){
					return true;
				}else{
					return false;
				}
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
	public static boolean isSuitVideoType(String fileName){
		if(fileName!=null&&fileName.length()>0){
			int dot = fileName.indexOf(".");
			if(dot>0){
				String imageType = fileName.substring(dot);
				if(imageType.indexOf("flv")>0||imageType.indexOf("mp3")>0||imageType.indexOf("mp4")>0||imageType.indexOf("swf")>0){
					return true;
				}else{
					return false;
				}
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
	
	public static boolean isSuitSize(File fileImage){
		if(fileImage!=null){
			try{
				FileInputStream fileIn = new FileInputStream(fileImage);
		        int filesize = fileIn.available();
		        if(filesize>Constants.imageSize){
		        	return false;
		        }else{
		        	return true;
		        }
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return false;
	}
	
	public static boolean isSuitFlashSize(File file){
		if(file!=null){
			try{
				FileInputStream fileIn = new FileInputStream(file);
		        int filesize = fileIn.available();
		        if(filesize>Constants.flashSize){
		        	return false;
		        }else{
		        	return true;
		        }
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return false;
	}
	//判断文件大小
	public static boolean isSuitFileSize(File file){
		if(file!=null){
			try{
				FileInputStream fileIn = new FileInputStream(file);
		        int filesize = fileIn.available();
		        if(filesize>Constants.fileSize){
		        	return false;
		        }else{
		        	return true;
		        }
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return false;
	}
	public static boolean isSuitVideoSize(File file){
		if(file!=null){
			try{
				FileInputStream fileIn = new FileInputStream(file);
		        int filesize = fileIn.available();
		        if(filesize>Constants.videoSize){
		        	return false;
		        }else{
		        	return true;
		        }
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return false;
	}
}
