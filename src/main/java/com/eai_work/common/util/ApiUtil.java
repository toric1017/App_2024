package com.eai_work.common.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ApiUtil {

	private static final Logger log = LoggerFactory.getLogger(ApiUtil.class);
	
	public static Map<String, Object> sendPost(String targetUrl, JSONObject jsonObj) throws Exception {

		Map<String, Object> resStr = new HashMap<>();
		
		if(String.valueOf( targetUrl ).isEmpty()) {
			throw new Exception(">>>>>>>>> [Exception] : ApiUtil.sendPost - targetUrl is empty");
		}
		
		log.info( ">>> targetUrl : " + targetUrl );
		
		if(jsonObj == null) {
			throw new Exception(">>>>>>>>> [Exception] : ApiUtil.sendPost - jsonObj is empty");
		}
		
		log.info( ">>> jsonObj : " + jsonObj.toJSONString() );
		
		URL url = new URL(targetUrl);
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		
		connection.setRequestMethod("POST");
		connection.setDoOutput(true);
		connection.setRequestProperty("Content-Type", "application/json");
		
		OutputStream os = connection.getOutputStream();
		byte[] input = jsonObj.toString().getBytes("utf-8");
		os.write(input, 0, input.length);
		
		int responseCode = connection.getResponseCode();
		
		BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();
		
		while((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		
		connection.disconnect();

		resStr.put("resCode", responseCode == 200 ? "Y" : "N");
		resStr.put("resMeg", response.toString());
		log.info(">>>>>>>>> [info] : ApiUtil.sendPost - " + resStr);
		
		return resStr;
		
	}
	
	public static Map<String, Object> sendGet(String authorization, String targetUrl, String params) throws Exception {

		Map<String, Object> resStr = new HashMap<>();
		
		if(String.valueOf( targetUrl ).isEmpty()) {
			throw new Exception(">>>>>>>>> [Exception] : ApiUtil.sendGet - targetUrl is empty");
		}
		
		// uft-8 인코딩 반드시 필요!
		String encodedUrl =  encodingUrlParams( inputParamsByblankSocket(targetUrl, params) ) ;
		log.info(" >>> encodedUrl : " + encodedUrl);
		
		URL url = new URL( encodedUrl );
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestMethod("GET");
		connection.setDoOutput(true);
		
		// log.info( ">>> authorization : " + authorization );
		
		if(!"null".equals(String.valueOf( authorization ))) {
			connection.setRequestProperty("Authorization", authorization);
		}
		
		
		int responseCode = connection.getResponseCode();
		
		BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();
		
		while((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		
		connection.disconnect();
		
		resStr.put("resCode", responseCode == 200 ? "Y" : "N");
		resStr.put("resMeg", response.toString());
		log.info(">>>>>>>>> [info] : ApiUtil.sendGet - " + resStr);
		
		return resStr;
		
	}
	
	// url 문자열에 {} 빈문자열 공간이 있으면 param 에 맞추어 추가
	public static String inputParamsByblankSocket(String url, String param) throws Exception{
		String resStr = url;
		String[] paramArray = param.split(",");
		 
		for(int i=0; i<paramArray.length; i++) {
			String redex = "{" + i + "}";
			resStr = resStr.replace(redex, paramArray[i]);
		}
		return resStr;
	}
	
	// url 문자열을 utf-8 인코딩
	public static String encodingUrlParams(String urlString) throws Exception{
		URI uri = new URI(urlString);
        String query = uri.getRawQuery();
       
        if (query != null) {
            String[] queryParams = query.split("&");
            StringBuilder encodedQuery = new StringBuilder();

            for (String param : queryParams) {
                String[] keyValue = param.split("=");
                String encodedKey = URLEncoder.encode(keyValue[0], StandardCharsets.UTF_8.toString());
                String encodedValue = URLEncoder.encode(keyValue[1], StandardCharsets.UTF_8.toString());

                if (encodedQuery.length() > 0) {
                    encodedQuery.append("&");
                }

                encodedQuery.append(encodedKey).append("=").append(encodedValue);
            }

            int port = uri.getPort();
            if(port > 1) {
            	return uri.getScheme() + "://" + uri.getHost() + ":" + port + uri.getPath() + "?" + encodedQuery.toString();
            }else {
            	return uri.getScheme() + "://" + uri.getHost() + uri.getPath() + "?" + encodedQuery.toString();
            }
            
        } else {
            return urlString;
        }
	}
	
}
