package com.eai_work.login.service;

import javax.servlet.http.HttpServletRequest;

import com.eai_work.common.vo.UserVO;

public interface LoginService {

	/**
	 * 
	 * @Method : LoginService.login
	 * @Return : String
	 * @Description : 로그인
	 */
	public String login(HttpServletRequest request, UserVO vo) throws Exception;
	
	/**
	 * 
	 * @Method : LoginService.logout
	 * @Return : void
	 * @Description : 로그아웃
	 */
	public void logout(HttpServletRequest request)throws Exception;
}
