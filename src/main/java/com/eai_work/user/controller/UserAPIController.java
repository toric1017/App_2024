package com.eai_work.user.controller;

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
import com.eai_work.noti.controller.NotiAPIController;
import com.eai_work.user.service.UserService;

@RestController
@RequestMapping("/api/user")

@SuppressWarnings("rawtypes")
public class UserAPIController {
    @SuppressWarnings("unused")
	private final static Logger log = LoggerFactory.getLogger(NotiAPIController.class);

    @Autowired
    private UserService userService;

    @PostMapping("/getUserInfoAjax")
    public ResponseEntity<ResponseVO> getUserInfo(HttpServletRequest request, @RequestBody Map<String, Object> reqMap) {
        HttpSession session = request.getSession();
        try {
            reqMap.put("sessionUserId", session.getAttribute(SessionEnum.SESSION_USER_ID.getSessionId()));
            return ResponseUtil.responseSuccessEntity(userService.getUserInfo(reqMap));
        }catch(Exception e) {
            e.printStackTrace();
            return ResponseUtil.responseErrorEntity(e.getMessage());
        }
    }

    @PostMapping("/updateUserInfoAjax")
    public ResponseEntity<ResponseVO> updateUserInfo(HttpServletRequest request, @RequestBody Map<String, Object> reqMap) {
        HttpSession session = request.getSession();
        try {
            reqMap.put("sessionUserId", session.getAttribute(SessionEnum.SESSION_USER_ID.getSessionId()));
            return ResponseUtil.responseSuccessEntity(userService.updateUserInfo(session, reqMap));
        }catch(Exception e) {
            e.printStackTrace();
            return ResponseUtil.responseErrorEntity(e.getMessage());
        }
    }
}
