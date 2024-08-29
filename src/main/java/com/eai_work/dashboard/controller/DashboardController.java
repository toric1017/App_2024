package com.eai_work.dashboard.controller;

import java.util.Map;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eai_work.common.util.ResponseUtil;
import com.eai_work.common.vo.ResponseVO;
import com.eai_work.dashboard.service.DashboardService;

@RequestMapping(value= {"/dashboard"})
@SuppressWarnings({"rawtypes", "unchecked"})
@Controller
public class DashboardController {
	
	@Autowired
	public DashboardService dashboardService;
	
	@SuppressWarnings("unused")
	private final static Logger log = LoggerFactory.getLogger(DashboardController.class);
	
	@GetMapping("/index")
	public String index(Map<String, Object>reqMap)throws Exception{
		return "/dashboard/index";
	}
	
	@PostMapping("/getDashBoardList")
	@ResponseBody
	public ResponseEntity<ResponseVO> getDashBoardList(@RequestBody Map<String, Object> reqMap)throws Exception{
		
		try {
			JSONObject jobj = new JSONObject();
			jobj.put("list", dashboardService.getDashBoardList(reqMap));
			
			return ResponseUtil.responseSuccessEntity(jobj);
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseUtil.responseErrorEntity(e.getMessage());
		}
		
	}
	
}
