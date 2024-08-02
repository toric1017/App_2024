package com.eai_work.login.dao;

import java.util.Map;

import com.eai_work.common.vo.UserVO;

public interface LoginDAO {

	Map<String, Object> selectUserExist(UserVO vo);

	UserVO selectUserInfoByUserId(UserVO vo);

	UserVO selectUserInfoByUserToken(UserVO vo);

}
