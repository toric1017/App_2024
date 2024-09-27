package com.eai_work.noti.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.eai_work.common.util.ResponseUtil;
import com.eai_work.common.util.SessionEnum;
import com.eai_work.common.vo.ResponseVO;
import com.eai_work.noti.service.NotiService;

@RestController
@RequestMapping("/api/noti")

@SuppressWarnings("rawtypes")
public class NotiAPIController {
    @SuppressWarnings("unused")
	private final static Logger log = LoggerFactory.getLogger(NotiAPIController.class);

    @Autowired
    private NotiService notiService;

    @PostMapping(value="/getNotiListAjax")
	public ResponseEntity<ResponseVO> getNotiList(HttpServletRequest request, @RequestBody Map<String, Object> reqMap){
        HttpSession session = request.getSession();
		try {
            reqMap.put("sessionUserId", session.getAttribute(SessionEnum.SESSION_USER_ID.getSessionId()));
			return ResponseUtil.responseSuccessEntity(notiService.getNotiList(reqMap));
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseUtil.responseErrorEntity(e.getMessage());
		}
	}

    @PostMapping(value="/saveNotiItemAjax")
    public ResponseEntity<ResponseVO> saveNotiItem(HttpServletRequest request, @RequestBody Map<String, Object> reqMap){
        HttpSession session = request.getSession();
        try {
            reqMap.put("sessionUserId", session.getAttribute(SessionEnum.SESSION_USER_ID.getSessionId()));
            return ResponseUtil.responseSuccessEntity(notiService.saveNotiItem(reqMap));
        }catch(Exception e) {
            e.printStackTrace();
            return ResponseUtil.responseErrorEntity(e.getMessage());
        }
    }
}
