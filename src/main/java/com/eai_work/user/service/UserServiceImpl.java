package com.eai_work.user.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.eai_work.common.util.SessionEnum;
import com.eai_work.user.dao.UserDAO;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;
    @Override
    public Map<String, Object> getUserInfo(Map<String, Object> reqMap) {
        return userDAO.getUserInfo(reqMap);
    }
    
    @Override
    public int updateUserInfo(HttpSession session, Map<String, Object> reqMap) {

        String notiYn = String.valueOf( reqMap.get("notiYn") );
        if(StringUtils.hasText(notiYn)){
            session.setAttribute(SessionEnum.SESSION_NOTI_YN.getSessionId(), notiYn);
        }

        return userDAO.updateUserInfo(reqMap);
    }
}
