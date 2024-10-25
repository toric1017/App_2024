package com.eai_work.eaiInterface.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eai_work.common.util.JsonUtil;
import com.eai_work.common.util.StringUtil;
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
		
		return mappingMaster;
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
		
		ArrayList<HashMap<String, Object>> source_input_data   = JsonUtil.jsonArrayToList(StringUtil.stringNvl(mappingDetail.get("source_input_data"),""));
		ArrayList<HashMap<String, Object>> source_mapping_data = JsonUtil.jsonArrayToList(StringUtil.stringNvl(mappingDetail.get("source_mapping_data"),""));
		ArrayList<HashMap<String, Object>> target_input_data   = JsonUtil.jsonArrayToList(StringUtil.stringNvl(mappingDetail.get("target_input_data"),""));
		ArrayList<HashMap<String, Object>> target_mapping_data = JsonUtil.jsonArrayToList(StringUtil.stringNvl(mappingDetail.get("target_mapping_data"),""));
		
		mappingDetail.put("source_input_data"     , source_input_data);
		mappingDetail.put("source_mapping_data"   , source_mapping_data);
		mappingDetail.put("target_input_data"     , target_input_data);
		mappingDetail.put("target_mapping_data"   , target_mapping_data);
		
		/*
		HashMap<String, Object> source_procedure_data = JsonUtil.jsonToMap(StringUtil.stringNvl(mappingDetail.get("source_procedure_data"),""));
		HashMap<String, Object> source_output_data    = JsonUtil.jsonToMap(StringUtil.stringNvl(mappingDetail.get("source_output_data"),""));
		HashMap<String, Object> target_procedure_data = JsonUtil.jsonToMap(StringUtil.stringNvl(mappingDetail.get("target_procedure_data"),""));
		HashMap<String, Object> target_output_data    = JsonUtil.jsonToMap(StringUtil.stringNvl(mappingDetail.get("target_output_data"),""));
		
		mappingDetail.put("source_procedure_data" , source_procedure_data);
		mappingDetail.put("source_output_data"    , source_output_data);
		mappingDetail.put("target_procedure_data" , target_procedure_data);
		mappingDetail.put("target_output_data"    , target_output_data);
		*/
		

		
		return mappingDetail;
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
