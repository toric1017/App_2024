package com.eai_work.dashboard;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.eai_work.common.CommonDAO;

@Component
public class DashboardDAO extends CommonDAO {

	List<Map<String, Object>> getDashBoardList(Map<String, Object> reqMap)throws Exception{
		return sqlSession.selectList("DashboardMapper.getDashBoardList", reqMap);
	}
	
}
