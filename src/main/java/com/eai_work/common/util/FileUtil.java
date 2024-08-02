package com.eai_work.common.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import org.springframework.core.io.ClassPathResource;

public class FileUtil {

	public static String readResource(String filePath)throws Exception{

		ClassPathResource resource = new ClassPathResource(filePath);
		if(!resource.exists()) {
			throw new Exception("[FileUtil] : no resource existed!!");
		} 
		
		StringBuffer sb = new StringBuffer();
		BufferedReader br = new BufferedReader(new InputStreamReader(resource.getInputStream()));
		
		String line;
		while((line = br.readLine()) != null) {
			sb.append(line).append("\n");
		}
		
		br.close();
		
		return sb.toString();
	}
}
