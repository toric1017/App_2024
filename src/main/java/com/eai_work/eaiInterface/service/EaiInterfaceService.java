package com.eai_work.eaiInterface.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.eai_work.eaiInterface.vo.MappingEV;

public interface EaiInterfaceService {
	
	public String updateMaster(HttpServletRequest request, MappingEV vo) throws Exception;

	public String updateDetail(HttpServletRequest request, MappingEV vo) throws Exception;
	
	public String deleteMaster(HttpServletRequest request, MappingEV vo) throws Exception;
		
	public HashMap<String, Object> selectMaster(int eai_seq) throws Exception;
	
}

