package com.newhc.admin.helper;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import com.opensymphony.webwork.ServletActionContext;

/**
 * @author pwh
 *
 * 创建时间2008-8-27 下午04:18:41
 * 
 */

public class FileHelperUtil {
	/**
	 * 读取文件信息
	 * @author kelvin
	 * @time 2008-8-27
	 * @param path
	 * @param file
	 * @return
	 */
	public static byte[] readFile(String path,String file){
		File f = new File(path,file);
		byte[] result = null;
		try{
			FileInputStream fs = new FileInputStream(f);
			result = new byte[fs.available()];
			fs.read(result);
			fs.close();
		}catch(FileNotFoundException e){
			e.printStackTrace();
			throw new RuntimeException(e);
		}catch(IOException e){
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		return result;
	}
	
	/**
	 * 读取文件信息
	 * @author kelvin
	 * @time 2008-8-27
	 * @param path
	 * @return
	 */
	public static byte[] readFile(String path){
		File f = new File(path);
		byte[] result = null;
		try{
			FileInputStream fs = new FileInputStream(f);
			result = new byte[fs.available()];
			fs.read(result);
			fs.close();
		}catch(FileNotFoundException e){
			e.printStackTrace();
			throw new RuntimeException(e);
		}catch(IOException e){
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		return result;
	}
	/**
	 * 写文件信息
	 * @author kelvin
	 * @time 2008-8-27
	 * @param path
	 * @param file
	 * @param content
	 */
	public static void writeFile(String path,String file,byte[] content){
		File f = new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		if(!path.endsWith("/")){
			path = path+"/";
		}
		f = new File(path+file);
		if(!f.exists()){
			try{
				f.createNewFile();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		try{
			FileOutputStream fos = new FileOutputStream(f);
			fos.write(content);
			fos.close();
		}catch(FileNotFoundException e){
			e.printStackTrace();
			throw new RuntimeException(e);
		}catch(IOException e){
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	/**
	 * 写文件信息
	 * @author kelvin
	 * @time 2008-8-27
	 * @param path
	 * @param content
	 */
	public static void writeFile(String path,byte[] content){
		File f = new File(path);
		if(!f.exists()){
			try{
				f.createNewFile();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		try{
			FileOutputStream fos = new FileOutputStream(f);
			fos.write(content);
			fos.close();
		}catch(FileNotFoundException e){
			e.printStackTrace();
			throw new RuntimeException(e);
		}catch(IOException e){
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 下载文件信息
	 * @param path
	 * @param fileName
	 * @param length
	 */
	public  static void downLoadFile(String path,String fileName,int length){
		HttpServletResponse response = ServletActionContext.getResponse();
		File attFile = new File(path); 
		if (attFile.exists()){		
				BufferedInputStream bis = null;
		        OutputStream fos = null;
		        InputStream fis = null;
		        try{
					fis = new FileInputStream(attFile);
			        bis = new BufferedInputStream(fis);
			        fos = response.getOutputStream();
			        if(fileName!=null&&fileName.length()>0){
			        	fileName = fileName.substring(length,fileName.length());
					}
			        response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "utf-8"));
			        response.setContentType("application/x-download");//设置为下载application/x-download
			        int bytesRead = 0;
			        byte[] buffer = new byte[8192];
			        while ((bytesRead = bis.read(buffer, 0, 8192)) != -1) {
			        	fos.write(buffer, 0, bytesRead);
			        }
			        response.setContentType("text/html; charset=UTF-8"); 
					response.setHeader("Cache-Control","no-cache"); 
			        response.setHeader("Cache-Control","no-store"); 
			        response.setDateHeader("Expires", 0); 
			        response.setHeader("Pragma","no-cache"); 
		        
		        }catch (Exception e) {
		        	String simplename = e.getClass().getSimpleName();
		        	if(!"ClientAbortException".equals(simplename)){
	        	        e.printStackTrace();
		        	}else{
		        	}
				}finally{
					if (fis != null) {
						try {
							fis.close();
						}catch(IOException e){
							e.printStackTrace();
						}
					}
					if(bis != null){
						try {
							 bis.close();
						}catch(IOException e){
							e.printStackTrace();
						}
					}
				}
		} 
	}
	
	
	/**
	 * 下载文件信息
	 * @param path
	 * @param fileName
	 * @param length
	 */
	public  static void downLoadFile(String path,String fileName){
		HttpServletResponse response = ServletActionContext.getResponse();
		File attFile = new File(path); 
		if (attFile.exists()){		
				BufferedInputStream bis = null;
		        OutputStream fos = null;
		        InputStream fis = null;
		        try{
					fis = new FileInputStream(attFile);
			        bis = new BufferedInputStream(fis);
			        fos = response.getOutputStream();
			        
			        response.setHeader("Content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "utf-8"));
			        response.setContentType("application/x-download");//设置为下载application/x-download
			        int bytesRead = 0;
			        byte[] buffer = new byte[8192];
			        while ((bytesRead = bis.read(buffer, 0, 8192)) != -1) {
			        	fos.write(buffer, 0, bytesRead);
			        }
			        response.setContentType("text/html; charset=UTF-8"); 
					response.setHeader("Cache-Control","no-cache"); 
			        response.setHeader("Cache-Control","no-store"); 
			        response.setDateHeader("Expires", 0); 
			        response.setHeader("Pragma","no-cache"); 
		        
		        }catch (Exception e) {
		        	String simplename = e.getClass().getSimpleName();
		        	if(!"ClientAbortException".equals(simplename)){
	        	        e.printStackTrace();
		        	}else{
		        	}
				}finally{
					if (fis != null) {
						try {
							fis.close();
						}catch(IOException e){
							e.printStackTrace();
						}
					}
					if(bis != null){
						try {
							 bis.close();
						}catch(IOException e){
							e.printStackTrace();
						}
					}
				}
		} 
	}
	
	
	
	
	
	
	
	
	public static void deleteFile(String path){
		new File(path).delete();
	}
}
