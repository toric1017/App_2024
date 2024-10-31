package com.eai_work.eaiInterface.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eai_work.common.util.ResponseUtil;
import com.eai_work.common.vo.ResponseVO;
import com.eai_work.eaiInterface.service.EaiInterfaceMappingService;
import com.eai_work.eaiInterface.service.EaiInterfaceService;
import com.eai_work.eaiInterface.vo.MappingVO;

@SuppressWarnings("rawtypes")
@RequestMapping(value= {"/eaiInterface/mapping"})
@Controller
public class EaiInterfaceMappingController {
	
	@SuppressWarnings("unused")
	private final static Logger log = LoggerFactory.getLogger(EaiInterfaceMappingController.class);

	@Autowired
	private EaiInterfaceService eaiInterfaceService;
	
	@Autowired
	private EaiInterfaceMappingService eaiInterfaceMappingService;
	
	@GetMapping({"/", "/view"})
	public String mapping(Model model, @RequestParam int eai_seq, Map<String, Object>reqMap)throws Exception{
		model.addAttribute("eai_seq", eai_seq);
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
			
			int eaiSeq = vo.getEai_seq();
			//Mapping master 조회
			HashMap<String, Object> eaiInterfaceMasterMap = eaiInterfaceService.selectMaster(eaiSeq);
			//Mapping Detail 조회
			HashMap<String, Object> eaiInterfaceMappingDetailMap = eaiInterfaceMappingService.selectMappingDetail(request, vo);
			
			data.put("interfaceMaster" , eaiInterfaceMasterMap);
			data.put("mappingDetail"   , eaiInterfaceMappingDetailMap);

			//Mapping master 조회
			//HashMap<String, Object> eaiInterfaceMappingMasterMap = eaiInterfaceMappingService.selectMappingMaster(request, vo);
			//data.put("mappingMaster"   , eaiInterfaceMappingMasterMap);
			
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
			//eaiInterfaceMappingService.updateMappingMaster(request, vo);
			//Mapping Detail 수정		
			eaiInterfaceMappingService.updateMappingDetail(request, vo);
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseUtil.responseErrorEntity(e.getMessage());
		}
		
		return ResponseUtil.responseSuccessEntity();
	}
	
	/**
	 * Mapping 삭제
	 * @param request
	 * @param vo
	 * @return
	 */
	@PostMapping(value="/deleteMapping")
	public ResponseEntity<ResponseVO> deleteMappingDetail(HttpServletRequest request, @RequestBody MappingVO vo){
		
		try {
			//Mapping master 수정
			//eaiInterfaceMappingService.updateMappingMaster(request, vo);
			//Mapping Detail 수정		
			eaiInterfaceMappingService.deleteMappingDetail(request, vo);
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseUtil.responseErrorEntity(e.getMessage());
		}
		
		return ResponseUtil.responseSuccessEntity();
	}
	
}
