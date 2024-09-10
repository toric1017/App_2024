package com.eai_work.eaiPm.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value= {"/eaiPm"})
@Controller
public class eaiPmController {
    
	@SuppressWarnings("unused")
	private final static Logger log = LoggerFactory.getLogger(eaiPmController.class);

    @GetMapping({"/","/index"})
	public String index(Map<String, Object>reqMap)throws Exception{
		return "/eaiPm/index";
	}
}
