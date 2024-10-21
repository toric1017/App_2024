package com.eai_work.eaiResources.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eai_work.eaiResources.entity.EaiResources;
import com.eai_work.eaiResources.service.eaiResourcesService;
import com.eai_work.eaiResources.dto.ResponseDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RequestMapping(value= {"/eaiResources"})
@Controller
public class eaiResourcesController {

	@Autowired
	private eaiResourcesService eaiResourcesService;

	@SuppressWarnings("unused")
	private final static Logger log = LoggerFactory.getLogger(eaiResourcesController.class);

@GetMapping({"/", "/index"})
public String index(Model model, @PageableDefault(size=5, sort= "resourceSeq", direction = Sort.Direction.DESC ) Pageable pageable,
					@RequestParam(required = false) String searchVal) {
	Page<EaiResources> page = eaiResourcesService.eaiResourcesList(searchVal,pageable);
	model.addAttribute("eaiResources", page);
	model.addAttribute("param", searchVal);

	int startPage = Math.max(1, (pageable.getPageNumber() / 10) * 10 + 1);
	int endPage = Math.min(startPage + 9, page.getTotalPages());
	model.addAttribute("startPageNo", startPage);
	model.addAttribute("endPageNo", endPage);

	return "/eaiResources/index"; //  eaiResources 담아 index로 전송, model은 request 정보
	}

	//eaiResources 등록폼
	@GetMapping("/create")
	public String saveForm() {
		return "/eaiResources/create";
	}

	//eaiResources 상세
	@GetMapping("/detail/{resourceSeq}")
	public String findByid(@PathVariable long resourceSeq, Model model) {
		model.addAttribute("eaiResources", eaiResourcesService.eaiResourcesDetail(resourceSeq));
		return "/eaiResources/detail";
	}

	//eaiResources 수정폼
	@GetMapping("/updateForm/{resourceSeq}")
	public String updateForm(@PathVariable long resourceSeq, Model model) {
		model.addAttribute("eaiResources", eaiResourcesService.eaiResourcesDetail(resourceSeq));
		return "/eaiResources/update";
	}

	@PostMapping("/api/create")
	@ResponseBody  // JSON 응답을 반환할 수 있도록 추가
	public ResponseDto<Long> save(@RequestBody EaiResources eaiResources) {
		// 등록 후 생성된 객체를 반환
		EaiResources savedResource = eaiResourcesService.eaiResourcesCreate(eaiResources);

		// 등록된 객체의 resourceSeq 값을 반환
		return new ResponseDto<Long>(HttpStatus.OK.value(), savedResource.getResourceSeq());
	}

	@PutMapping("/api/delete/{resourceSeq}")
	@ResponseBody  // JSON 응답을 반환할 수 있도록 추가
	public ResponseDto<Integer> deleteById(@PathVariable long resourceSeq){
		eaiResourcesService.eaiResourcesDelete(resourceSeq);
        return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
    }

	@PutMapping("/api/update/{resourceSeq}")
	@ResponseBody  // JSON 응답을 반환할 수 있도록 추가
	public ResponseDto<Long> update(@PathVariable long resourceSeq, @RequestBody EaiResources eaiResources){
		// 등록 후 생성된 객체를 반환
		EaiResources updateResource = eaiResourcesService.eaiResourcesUpdate(resourceSeq, eaiResources);

		// 등록된 객체의 resourceSeq 값을 반환
		return new ResponseDto<Long>(HttpStatus.OK.value(), updateResource.getResourceSeq());
	}





}
