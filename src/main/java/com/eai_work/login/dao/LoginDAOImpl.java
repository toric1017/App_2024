package com.eai_work.login.dao;

import java.util.Map;

import org.springframework.stereotype.Component;

import com.eai_work.common.CommonDAO;
import com.eai_work.common.vo.UserVO;

@Component
public class LoginDAOImpl extends CommonDAO implements LoginDAO{

	@Override
	public Map<String, Object> selectUserExist(UserVO vo) {
		return sqlSession.selectOne("LoginMapper.selectUserExist", vo);
	}
	@Override
	public UserVO selectUserInfoByUserId(UserVO vo) {
		return sqlSession.selectOne("LoginMapper.selectUserInfoByUserId", vo);
	}
	@Override
	public UserVO selectUserInfoByUserToken(UserVO vo) {
		return sqlSession.selectOne("LoginMapper.selectUserInfoByUserToken", vo);
	}
	
}
