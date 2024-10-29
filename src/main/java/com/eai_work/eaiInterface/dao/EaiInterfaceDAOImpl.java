package com.eai_work.eaiInterface.dao;

import java.util.HashMap;

import org.springframework.stereotype.Component;

import com.eai_work.common.CommonDAO;
import com.eai_work.eaiInterface.vo.MappingEV;

@Component
public class EaiInterfaceDAOImpl extends CommonDAO implements EaiInterfaceDAO{
	
	public MappingEV deleteMaster(MappingEV ev) {
		sqlSession.insert("EaiInterfaceMapper.deleteMaster", ev);
		return null;
	}

	public MappingEV updateMaster(MappingEV ev) {
		sqlSession.insert("EaiInterfaceMapper.updateMaster", ev);
		return null;
	}

	public MappingEV updateDetail(MappingEV ev) {
		sqlSession.insert("EaiInterfaceMapper.updateDetail", ev);
		return null;
	}
	public HashMap<String, Object> selectMaster(int eai_seq) {
		return sqlSession.selectOne("EaiInterfaceMapper.selectMaster", eai_seq);
	}
}
