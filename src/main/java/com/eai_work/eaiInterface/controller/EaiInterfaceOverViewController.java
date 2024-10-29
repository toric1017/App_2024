package com.eai_work.eaiInterface.controller;

import com.eai_work.common.util.ResponseUtil;
import com.eai_work.common.vo.ResponseVO;
import com.eai_work.eaiInterface.dto.OverViewDto;
import com.eai_work.eaiInterface.entity.EaiOverView;
import com.eai_work.eaiInterface.service.EaiInterfaceService;
import com.eai_work.eaiInterface.service.eaiOverViewService;
import com.eai_work.eaiInterface.vo.MappingEV;
import com.eai_work.eaiResources.service.eaiResourcesService;
import com.eai_work.eaiInterface.vo.MappingVO;
import com.eai_work.eaiResources.dto.ResponseDto;
import com.eai_work.eaiResources.entity.EaiResources;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@SuppressWarnings("rawtypes")
@RequestMapping(value= {"/eaiInterface"})
@Controller
public class EaiInterfaceOverViewController {
	
	@SuppressWarnings("unused")
	private final static Logger log = LoggerFactory.getLogger(EaiInterfaceOverViewController.class);
	
	@Autowired
	private eaiOverViewService eaiOverViewService;

	@Autowired
	private EaiInterfaceService eaiInterfaceService;
	
	@Autowired
	private eaiResourcesService eaiResourcesService;

	@GetMapping({"/", "/index"})
	public String index(Model model, @PageableDefault(size=5, sort= "eaiSeq", direction = Sort.Direction.DESC ) Pageable pageable,
						@RequestParam(required = false) String searchVal) {
		Page<EaiOverView> page = eaiOverViewService.eaiOverViewList(searchVal,pageable);

		model.addAttribute("eaiOverView", page);
		model.addAttribute("param", searchVal);


		int startPage = Math.max(1, (pageable.getPageNumber() / 10) * 10 + 1);
		int endPage = Math.min(startPage + 9, page.getTotalPages());
		model.addAttribute("startPageNo", startPage);
		model.addAttribute("endPageNo", endPage);

		return "/eaiInterface/index"; //  eaiOverView 담아 index로 전송, model은 request 정보
	}



	@GetMapping("/create")
	public String saveForm(Model model, @PageableDefault(size=5, sort= "resourceSeq", direction = Sort.Direction.DESC ) Pageable pageable) {
		//Pageable pageableSt = PageRequest.of(5, 100, Sort.by(Sort.Direction.DESC, "eaiSeq"));
		Page<EaiResources> eaiDivCds = eaiResourcesService.eaiResourcesList(null,pageable);
		model.addAttribute("eaiResources", eaiDivCds);

		return "/eaiInterface/create";
	}


	@PostMapping("/api/create")
	@ResponseBody  // JSON 응답을 반환할 수 있도록 추가
	public ResponseDto<Long> save(@RequestBody EaiOverView eaiResources) {
		// 등록 후 생성된 객체를 반환
		EaiOverView savedOverView = eaiOverViewService.eaiOverViewCreate(eaiResources);

		// 등록된 객체의 resourceSeq 값을 반환
		return new ResponseDto<Long>(HttpStatus.OK.value(), savedOverView.getEaiSeq());
	}



	/**
	 *  수정
	 * @param request
	 * @param ev
	 * @return
	 */
	@PostMapping(value="/update")
	public ResponseEntity<ResponseVO> update(HttpServletRequest request, @RequestBody MappingEV ev){

		try {
			//Mapping master 수정
			eaiInterfaceService.updateMaster(request, ev);
			//Mapping Detail 수정 삭제
			//eaiInterfaceService.updateDetail(request, ev);
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseUtil.responseErrorEntity(e.getMessage());
		}

		return ResponseUtil.responseSuccessEntity();
	}


	/**
	 * 삭제
	 * @param request
	 * @param ev
	 * @return
	 */
	@PostMapping(value="/delete")
	public ResponseEntity<ResponseVO> delete(HttpServletRequest request, @RequestBody MappingEV ev){

		try {
			eaiInterfaceService.deleteMaster(request, ev);
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseUtil.responseErrorEntity(e.getMessage());
		}

		return ResponseUtil.responseSuccessEntity();
	}

	// 상세
	@GetMapping("/modify")
	public String findByid(@RequestParam int eai_seq, Model model) {
		try {

			model.addAttribute("eaiInterface", eaiInterfaceService.selectMaster(eai_seq));
			System.out.println("eai_seq: " + eai_seq);
			System.out.println("eaiInterface: " + eaiInterfaceService.selectMaster(eai_seq));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/eaiInterface/modify";
	}
	
}
