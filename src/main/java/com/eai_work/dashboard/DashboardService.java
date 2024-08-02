package com.eai_work.dashboard;

import java.util.List;
import java.util.Map;

public interface DashboardService {
	public List<Map<String, Object>> getDashBoardList(Map<String, Object> reqMap)throws Exception;
}
