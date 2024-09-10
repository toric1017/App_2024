package com.eai_work.eaiInterface.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value= {"/eaiInterface"})
@Controller
public class eaiInterfaceController {
    
	@SuppressWarnings("unused")
	private final static Logger log = LoggerFactory.getLogger(eaiInterfaceController.class);

    @GetMapping({"/", "/index"})
	public String index(Map<String, Object>reqMap)throws Exception{
		return "/eaiInterface/index";
	}
}
