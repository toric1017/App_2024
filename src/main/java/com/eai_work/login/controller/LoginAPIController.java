package com.eai_work.login.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eai_work.common.util.ResponseUtil;
import com.eai_work.common.vo.ResponseVO;
import com.eai_work.common.vo.UserVO;
import com.eai_work.login.service.LoginService;

@RestController
@RequestMapping("/api/login")

@SuppressWarnings("rawtypes")
public class LoginAPIController {

	@SuppressWarnings("unused")
	private final static Logger log = LoggerFactory.getLogger(LoginAPIController.class);
	
	@Autowired
	private LoginService loginService;

	@PostMapping(value="/loginAjax")
	public ResponseEntity<ResponseVO> login(HttpServletRequest request, @RequestBody UserVO vo){
		
		try {
			loginService.login(request, vo);
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseUtil.responseErrorEntity(e.getMessage());
		}
		
		return ResponseUtil.responseSuccessEntity();
	}
	
	@PostMapping(value="/logoutAjax")
	public ResponseEntity<ResponseVO> logout(HttpServletRequest request){
		
		try {
			loginService.logout(request);
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseUtil.responseErrorEntity(e.getMessage());
		}
		
		return ResponseUtil.responseSuccessEntity();
	}
	
}
