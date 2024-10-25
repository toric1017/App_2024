package com.eai_work.common.util;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonUtil {

	private final static JSONParser JSON_PARSER = new JSONParser();
	
	/**
	 * json -> map 변환
	 * @param json
	 * @return
	 * @throws Exception
	 */
	public static HashMap<String, Object> jsonToMap(String json) throws Exception
	{
	    ObjectMapper objectMapper = new ObjectMapper();
	    TypeReference<HashMap<String, Object>> typeReference = new TypeReference<HashMap<String,Object>>() {};
	    
	    return objectMapper.readValue(json, typeReference);
	}

	/**
	 * map -> json 변환
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public static String mapToJson(HashMap<String, Object> map) throws Exception
	{
	    ObjectMapper mapper = new ObjectMapper();
	    
	    return mapper.writeValueAsString(map);
	}
	
	/**
	 * jsonArray -> List 변환
	 * @param json
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static ArrayList<HashMap<String, Object>> jsonArrayToList(String json) throws ParseException
	{
	    ArrayList<HashMap<String, Object>> jsonList = new ArrayList<>();
	    
	    JSONArray jsonArray = (JSONArray) JSON_PARSER.parse(json);
	    
	    for(Object item : jsonArray) {
	    	jsonList.add((JSONObject)item);
        }
	    
	    return jsonList;
	}
	
	/**
	 * List -> jsonArray 변환
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public static String ListToJsonArray(HashMap<String, Object> map) throws Exception
	{
	    ObjectMapper mapper = new ObjectMapper();
	    
	    return mapper.writeValueAsString(map);
	}
}
