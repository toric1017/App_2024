package com.eai_work.login.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.eai_work.common.util.SessionEnum;
import com.eai_work.common.vo.UserVO;
import com.eai_work.login.dao.LoginDAO;

@Service
public class LoginServiceImpl implements LoginService{

	@SuppressWarnings("unused")
	private final static Logger log = LoggerFactory.getLogger(LoginServiceImpl.class);

	@Value("${server.api.key}")
	private String serverApiKey;
	
	@Autowired
	private LoginDAO loginDAO;
	
	@Override
	public String login(HttpServletRequest request, UserVO vo) throws Exception {

		HttpSession session = null;
		Map<String, Object> userExist = loginDAO.selectUserExist(vo);
		UserVO userInfo = null;
		String resMeg = "";
		
		if(userExist == null || userExist.isEmpty()) {
			throw new Exception( "[LoginService] : 유저아이디가 없거나 비밀번호가 틀립니다." );
		}
		
		// log.info(">> user_id : " + vo.getUser_id());
		// log.info(">> user_pw : " + vo.getUser_pw());
		// log.info(">> reg_dtm : " + String.valueOf( userExist.get("reg_dtm")));
		
		vo.setUser_pw( vo.getUser_id(), String.valueOf( userExist.get("reg_dtm") ) );
		
		userInfo = loginDAO.selectUserInfoByUserId(vo);
		
		if(userInfo == null) {
			throw new Exception( "[LoginService] : 유저아이디가 없거나 비밀번호가 틀립니다." );
		}
		
		session = request.getSession();
		session.setAttribute(SessionEnum.SESSION_USER_ID.getSessionId(), userInfo.getUser_id());
		session.setAttribute(SessionEnum.SESSION_USER_AUTH.getSessionId(), userInfo.getUser_auth());
		session.setAttribute(SessionEnum.SESSION_API_KEY.getSessionId(), serverApiKey);
		
		return resMeg;
	}
	
	@Override
	public void logout(HttpServletRequest request)throws Exception {
		
		HttpSession session = null;
		session = request.getSession();
		
		if(session != null) {
			session.invalidate();
		}
	}
	
}
