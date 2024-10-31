package com.eai_work.eaiInterface.dao;

import java.util.HashMap;

import org.springframework.stereotype.Component;

import com.eai_work.common.CommonDAO;
import com.eai_work.eaiInterface.vo.MappingVO;

@Component
public class EaiInterfaceMappingDAOImpl extends CommonDAO implements EaiInterfaceMappingDAO{

	public HashMap<String, Object> selectMappingMaster(MappingVO vo) {
		return sqlSession.selectOne("EaiInterfaceMappingMapper.selectMappingMaster", vo);
	}

	public MappingVO insertMappingMaster(MappingVO vo) {
		sqlSession.insert("EaiInterfaceMappingMapper.insertMappingMaster", vo);
		return null;
	}
	
	public MappingVO updateMappingMaster(MappingVO vo) {
		sqlSession.insert("EaiInterfaceMappingMapper.updateMappingMaster", vo);
		return null;
	}
	
	public HashMap<String, Object> selectMappingDetail(MappingVO vo) {
		return sqlSession.selectOne("EaiInterfaceMappingMapper.selectMappingDetail", vo);
	}
	
	public MappingVO insertMappingDetail(MappingVO vo) {
		sqlSession.insert("EaiInterfaceMappingMapper.insertMappingDetail", vo);
		return null;
	}
	
	public MappingVO updateMappingDetail(MappingVO vo) {
		sqlSession.insert("EaiInterfaceMappingMapper.updateMappingDetail", vo);
		return null;
	}
	
	public MappingVO deleteMappingDetail(MappingVO vo) {
		sqlSession.insert("EaiInterfaceMappingMapper.deleteMappingDetail", vo);
		return null;
	}
}
