package com.eai_work.user.dao;

import java.util.Map;

import org.springframework.stereotype.Component;

import com.eai_work.common.CommonDAO;

@Component
public class UserDAO extends CommonDAO {

    public Map<String, Object> getUserInfo(Map<String, Object> reqMap) {
        return sqlSession.selectOne("UserMapper.getUserInfo", reqMap);
    }

    public int updateUserInfo(Map<String, Object> reqMap) {
        return sqlSession.update("UserMapper.updateUserInfo", reqMap);
    }   
}
