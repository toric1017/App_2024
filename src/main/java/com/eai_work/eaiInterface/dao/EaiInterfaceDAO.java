package com.eai_work.eaiInterface.dao;

import java.util.HashMap;

import org.springframework.web.bind.annotation.RequestParam;

import com.eai_work.eaiInterface.vo.MappingEV;
import com.eai_work.eaiInterface.vo.MappingVO;

public interface EaiInterfaceDAO {
	
	MappingEV updateMaster(MappingEV ev);

	MappingEV updateDetail(MappingEV ev);

	MappingEV deleteMaster(MappingEV ev);

	HashMap<String, Object> selectMaster(int eai_seq);

	
	
}
