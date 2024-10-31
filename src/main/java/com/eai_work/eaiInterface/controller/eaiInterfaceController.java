package com.eai_work.eaiInterface.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eai_work.common.util.ResponseUtil;
import com.eai_work.common.vo.ResponseVO;
import com.eai_work.eaiInterface.service.EaiInterfaceService;
import com.eai_work.eaiInterface.vo.MappingEV;
import com.eai_work.eaiResources.entity.EaiResources;
import com.eai_work.eaiResources.service.eaiResourcesService;

@RequestMapping(value= {"/eaiInterface_"})
@Controller
public class eaiInterfaceController {
    

	@Autowired
	private EaiInterfaceService eaiInterfaceService;

	@Autowired
	private eaiResourcesService eaiResourcesService;

	@SuppressWarnings("unused")
	private final static Logger log = LoggerFactory.getLogger(eaiInterfaceController.class);

    @GetMapping({"/", "/index"})
	public String index(Map<String, Object>reqMap)throws Exception{
		return "/eaiInterface/index";
	}

	@GetMapping({"/create"})
	public String create(Map<String, Object>reqMap)throws Exception{
		return "/eaiInterface/create";
	}

	@GetMapping({"/detail"})
	public String detailString(Map<String, Object>reqMap)throws Exception{
		return "/eaiInterface/detail";
	}

	/**
	@GetMapping({"/modify"})
	public String modify(Map<String, Object>reqMap)throws Exception{
		return "/eaiInterface/modify";
	}
*/
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
	// 상세
	@GetMapping("/modifyView")
	public String modifyView(@RequestParam int eai_seq, Model model) {
		try {

			model.addAttribute("eaiInterface", eaiInterfaceService.selectMaster(eai_seq));
			System.out.println("view eai_seq: " + eai_seq);
			System.out.println("view eaiInterface: " + eaiInterfaceService.selectMaster(eai_seq));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/eaiInterface/modifyView";
	}

	@GetMapping("/modify")
	public String modify(@RequestParam int eai_seq, Model model, Pageable pageable) {
		try {

			Page<EaiResources> eaiDivCds = eaiResourcesService.eaiResourcesList(null,pageable);
			model.addAttribute("eaiResources", eaiDivCds);

			System.out.println("modify interface : " + eaiDivCds);

			model.addAttribute("eaiInterface", eaiInterfaceService.selectMaster(eai_seq));
			System.out.println("eai_seq: " + eai_seq);
			System.out.println("eaiInterface: " + eaiInterfaceService.selectMaster(eai_seq));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/eaiInterface/modify";
	}
}
