package com.eai_work.eaiInterface.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.eai_work.eaiInterface.vo.MappingVO;

public interface EaiInterfaceMappingService {

	/**
	 * Mapping Master 조회
	 * @Method : EaiInterfaceMappingService.selectMappingMaster
	 * @Return : String
	 * @Description : 인터페이스 Mapping Detail 조회
	 */
	public HashMap<String, Object> selectMappingMaster(HttpServletRequest request, MappingVO vo) throws Exception;
	
	/**
	 * Mapping Master 등록
	 * @Method : EaiInterfaceMappingService.insertMappingMaster
	 * @Return : String
	 * @Description : 인터페이스 Mapping Master 등록
	 */
	public String insertMappingMaster(HttpServletRequest request, MappingVO vo) throws Exception;

	/**
	 * Mapping Master 수정
	 * @Method : EaiInterfaceMappingService.updateMappingMaster
	 * @Return : String
	 * @Description : 인터페이스 Mapping Master 수정
	 */
	public String updateMappingMaster(HttpServletRequest request, MappingVO vo) throws Exception;
	
	/**
	 * Mapping Detail 조회
	 * @Method : EaiInterfaceMappingService.selectMappingDetail
	 * @Return : String
	 * @Description : 인터페이스 Mapping Detail 조회
	 */
	public HashMap<String, Object> selectMappingDetail(HttpServletRequest request, MappingVO vo) throws Exception;
	
	/**
	 * Mapping Detail 등록
	 * @Method : EaiInterfaceMappingService.insertMappingDetail
	 * @Return : String
	 * @Description : 인터페이스 Mapping Detail 등록
	 */
	public String insertMappingDetail(HttpServletRequest request, MappingVO vo) throws Exception;
	
	/**
	 * Mapping Detail 수정
	 * @Method : EaiInterfaceMappingService.updateMappingDetail
	 * @Return : String
	 * @Description : 인터페이스 Mapping Detail 수정
	 */
	public String updateMappingDetail(HttpServletRequest request, MappingVO vo) throws Exception;
	
	/**
	 * Mapping Detail 삭제
	 * @Method : EaiInterfaceMappingService.deleteMappingDetail
	 * @Return : String
	 * @Description : 인터페이스 Mapping Detail 수정
	 */
	public String deleteMappingDetail(HttpServletRequest request, MappingVO vo) throws Exception;
	
}
