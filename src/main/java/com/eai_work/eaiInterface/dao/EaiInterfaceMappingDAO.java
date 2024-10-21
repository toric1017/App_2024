package com.eai_work.eaiInterface.dao;

import java.util.HashMap;

import com.eai_work.eaiInterface.vo.MappingVO;

public interface EaiInterfaceMappingDAO {

	HashMap<String, Object> selectMappingMaster(MappingVO vo);
	
	MappingVO insertMappingMaster(MappingVO vo);
	
	MappingVO updateMappingMaster(MappingVO vo);
	
	HashMap<String, Object> selectMappingDetail(MappingVO vo);

	MappingVO insertMappingDetail(MappingVO vo);
	
	MappingVO updateMappingDetail(MappingVO vo);
	
}
