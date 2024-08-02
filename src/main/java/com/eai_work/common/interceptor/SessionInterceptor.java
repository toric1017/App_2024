package com.eai_work.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;

import com.eai_work.common.util.SessionEnum;

public class SessionInterceptor implements HandlerInterceptor {

	@Value("${server.api.key}")
	private String serverApiKey;
	
	@SuppressWarnings("unused")
	private final static Logger log = LoggerFactory.getLogger(SessionInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
// 		// 로그인 세션체크 
//
//		
//		// 로그아웃 이후 페이지 뒤로가기 방지헤더
//		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
//		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
//		response.setHeader("Expires", "0"); // Proxies.
//		
//		// ajax request 인증키 확인
//		if("application/json".equals(request.getHeader("Content-Type"))) {
//			if(!serverApiKey.equals( request.getHeader("Authorization") )) {
//				response.setStatus(307);
//				response.addHeader("Location", request.getContextPath()+"/api/common/responseUnAuthEntityAjax");
//				return false;
//			}else {
//				return true;
//			}
//		}
//
//		HttpSession session = null;
//		session = request.getSession();
//		String userId = String.valueOf( session.getAttribute( SessionEnum.SESSION_USER_ID.getSessionId() ) );
//		
//		// 세션 로그인 확인
//		if("null".equals( userId )) {
//			response.sendRedirect(request.getContextPath()+"/index");
//			return false;
//		}else {
//			return true;
//		}
		
		
		// 로그인 관련 DB 스키마 세팅 이후 제거
		return true;
	
	}
	
}
