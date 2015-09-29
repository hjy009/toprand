package com.newhc.admin.helper;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * @author pwh
 *
 * 创建时间2008-9-4 上午11:14:56
 * 
 */

public class DatabaseBakHtmlUtil {
	//根据url抓取内容
	public static String fromURLGetContent(String url ,String method,OutputStream out)throws Exception{
		String result = "";
		StringBuffer buf = new StringBuffer();
		URL locatorUrl = new URL(url);
		HttpURLConnection conn = (HttpURLConnection)locatorUrl.openConnection();
		conn.setRequestMethod(method);
		conn.setDoInput(true);
		conn.setDoOutput(true);
		if(conn.getResponseCode()==200){
			InputStream in = conn.getInputStream();
			if(out == null){
				for(int c = -1;((c=in.read())!=-1);){
					buf.append((char)c);
				}
			}else{
				int size = in.available();
				byte bytes[] = new byte[size];
				for(int l =-1;(in.read(bytes, 0, size))!=-1;){
					out.write(bytes,0,l);
				}
				out.close();
			}
			in.close();
		}
		result = buf.toString();
		return result;
	}
	//根据抓取的内容写入所需文件
	public static void writeContentToFile(String filePath,String fileName,String content,String encode){
		File file = new File(filePath);
		if(!file.exists()){
			file.mkdirs();
		}
		if(!filePath.endsWith("/")){
			filePath = filePath+"/";
		}
		file = new File(filePath+fileName);
		FileWriter fw = null;
		BufferedWriter bw = null;
		try{
			bw=new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), encode));
			if(!file.exists()){
				file.createNewFile();
			}
//			fw = new FileWriter(file);
//			bw = new BufferedWriter(fw);
			bw.write(content);
		}catch(IOException ioe){
			ioe.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(bw!=null){
					bw.close();
				}
				if(fw!=null){
					fw.close();
				}
			}catch(Exception e){
				
			}
		}
	}
}
