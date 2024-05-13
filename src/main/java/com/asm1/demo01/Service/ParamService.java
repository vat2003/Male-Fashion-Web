package com.asm1.demo01.Service;

import java.io.File;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class ParamService {

  @Autowired
  HttpServletRequest request;

  public String getString(String name, String defaultValue){
    return request.getParameter(name) != null ? request.getParameter(name) : defaultValue;
  }
  
  public int getInt(String name, int defaultValue){
    return request.getParameter(name) != null ? Integer.parseInt(request.getParameter(name)) : defaultValue; 
  }

  public double getDouble(String name, double defaultValue){
    return request.getParameter(name) != null ? Double.parseDouble(request.getParameter(name)) : defaultValue;
  }

  public boolean getBoolean(String name, boolean defaultValue){
    return request.getParameter(name) != null ? Boolean.parseBoolean(request.getParameter(name)) : defaultValue;
  }  

  public Date getDate(String name, String pattern) {
    try {
      return request.getParameter(name) != null ? new SimpleDateFormat(pattern).parse(request.getParameter(name)) : null;
    } catch (ParseException e) {
      throw new RuntimeException(e);
    }
  }

  public File save(MultipartFile file, String path) {
		try {
			String 	fullPath = request.getServletContext().getRealPath(path);
			File dir = new File(fullPath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			String fileName =  file.getOriginalFilename();
			File destFile = new File(dir, fileName);
			file.transferTo(destFile);
			return destFile;
		} catch (Exception e) {
			 throw new RuntimeException("Lỗi lưu file");
		}
	}

}