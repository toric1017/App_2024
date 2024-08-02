package com.eai_work.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@SuppressWarnings("unused")
	private final static Logger log = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value= {"/", "index"})
	public String index(HttpServletRequest request) {

		HttpSession session = null;
		session = request.getSession();
		
		if(session != null) {
			session.invalidate();
		}
		
		return "/index";
	}
	
}
