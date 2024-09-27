package com.eai_work.user.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

public interface UserService {
    public Map<String, Object> getUserInfo(Map<String, Object> reqMap);
    public int updateUserInfo(HttpSession session, Map<String, Object> reqMap);
}
