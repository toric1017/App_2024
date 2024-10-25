package com.eai_work.eaiInterface.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eai_work.common.util.JsonUtil;
import com.eai_work.common.util.ResponseUtil;
import com.eai_work.common.vo.ResponseVO;
import com.eai_work.eaiInterface.service.EaiInterfaceMappingService;
import com.eai_work.eaiInterface.vo.MappingVO;

@SuppressWarnings("rawtypes")
@RequestMapping(value= {"/eaiInterface/mapping"})
@Controller
public class EaiInterfaceMappingController {
	
	@SuppressWarnings("unused")
	private final static Logger log = LoggerFactory.getLogger(EaiInterfaceMappingController.class);
	
	@Autowired
	private EaiInterfaceMappingService eaiInterfaceMappingService;
	
	@GetMapping({"/", "/mapping"})
	public String mapping(Map<String, Object>reqMap)throws Exception{
		return "/eaiInterface/mapping";
	}
	
	/**
	 * Mapping 조회
	 * @param request
	 * @param vo
	 * @return
	 */
	@PostMapping(value="/selectMapping")
	public ResponseEntity<ResponseVO> selectMappingDetail(HttpServletRequest request, @RequestBody MappingVO vo){

		HashMap<String, Object> data = new HashMap<String, Object>();

		try {
			//Mapping master 조회
			HashMap<String, Object> eaiInterfaceMappingMasterMap = eaiInterfaceMappingService.selectMappingMaster(request, vo);
			//Mapping Detail 조회
			HashMap<String, Object> eaiInterfaceMappingDetailMap = eaiInterfaceMappingService.selectMappingDetail(request, vo);
			
			data.put("mappingMaster", eaiInterfaceMappingMasterMap);
			data.put("mappingDetail", eaiInterfaceMappingDetailMap);
			
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseUtil.responseErrorEntity(e.getMessage());
		}
		
		return ResponseUtil.responseSuccessEntity(data);
	}
	
	/**
	 * Mapping 등록
	 * @param request
	 * @param vo
	 * @return
	 */
	@PostMapping(value="/insertMapping")
	public ResponseEntity<ResponseVO> insertMappingDetail(HttpServletRequest request, @RequestBody MappingVO vo){
		
		try {
			//Mapping master 등록
			//eaiInterfaceMappingService.insertMappingMaster(request, vo);
			//Mapping Detail 등록
			eaiInterfaceMappingService.insertMappingDetail(request, vo);
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseUtil.responseErrorEntity(e.getMessage());
		}
		
		return ResponseUtil.responseSuccessEntity();
	}
	
	/**
	 * Mapping 수정
	 * @param request
	 * @param vo
	 * @return
	 */
	@PostMapping(value="/updateMapping")
	public ResponseEntity<ResponseVO> updateMappingDetail(HttpServletRequest request, @RequestBody MappingVO vo){
		
		try {
			//Mapping master 수정
			eaiInterfaceMappingService.updateMappingMaster(request, vo);
			//Mapping Detail 수정		
			eaiInterfaceMappingService.updateMappingDetail(request, vo);
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseUtil.responseErrorEntity(e.getMessage());
		}
		
		return ResponseUtil.responseSuccessEntity();
	}
	
}
