package com.eai_work.eaiInterface.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eai_work.eaiInterface.dao.EaiInterfaceMappingDAO;
import com.eai_work.eaiInterface.vo.MappingVO;

@Service
public class EaiInterfaceMappingServiceImpl implements EaiInterfaceMappingService {

	@SuppressWarnings("unused")
	private final static Logger LOG = LoggerFactory.getLogger(EaiInterfaceMappingServiceImpl.class);
	
	@Autowired
	private EaiInterfaceMappingDAO eaiInterfaceMappingDAO;
	
	public HashMap<String, Object> selectMappingMaster(HttpServletRequest request, MappingVO vo) throws Exception {
		
		HashMap<String, Object> mappingMaster = eaiInterfaceMappingDAO.selectMappingMaster(vo);
		
		return null;
	}
	
	public String insertMappingMaster(HttpServletRequest request, MappingVO vo) throws Exception {
		
		eaiInterfaceMappingDAO.insertMappingMaster(vo);
		
		return null;
	}	
	
	public String updateMappingMaster(HttpServletRequest request, MappingVO vo) throws Exception {
		
		eaiInterfaceMappingDAO.updateMappingMaster(vo);
		
		return null;
	}
	
	public HashMap<String, Object> selectMappingDetail(HttpServletRequest request, MappingVO vo) throws Exception {
		
		HashMap<String, Object> mappingDetail = eaiInterfaceMappingDAO.selectMappingDetail(vo);
		
		return null;
	}
	
	public String insertMappingDetail(HttpServletRequest request, MappingVO vo) throws Exception {
		
		eaiInterfaceMappingDAO.insertMappingDetail(vo);
		
		return null;
	}
	
	public String updateMappingDetail(HttpServletRequest request, MappingVO vo) throws Exception {
		
		eaiInterfaceMappingDAO.updateMappingDetail(vo);
		
		return null;
	}

}
