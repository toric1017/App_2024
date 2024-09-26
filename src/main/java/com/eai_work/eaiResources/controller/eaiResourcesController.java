package com.eai_work.eaiResources.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value= {"/eaiResources"})
@Controller
public class eaiResourcesController {
    
	@SuppressWarnings("unused")
	private final static Logger log = LoggerFactory.getLogger(eaiResourcesController.class);

    @GetMapping({"/", "/index"})
	public String index(Map<String, Object>reqMap)throws Exception{
		return "/eaiResources/index";
	}

	@GetMapping({"/create"})
	public String create(Map<String, Object>reqMap)throws Exception{
		return "/eaiResources/create";
	}

	@GetMapping({"/detail"})
	public String detailString(Map<String, Object>reqMap)throws Exception{
		return "/eaiResources/detail";
	}
}
