package com.eai_work.dashboard;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DashboardServiceImpl implements DashboardService{

	@Autowired
	public DashboardDAO dashboardDAO;
	
	@Override
	public List<Map<String, Object>> getDashBoardList(Map<String, Object> reqMap) throws Exception {
		return dashboardDAO.getDashBoardList(reqMap);
	}

}
