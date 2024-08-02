package com.eai_work.common.vo;

import com.eai_work.common.util.CredentialUtil;

public class UserVO {

	String user_id;
	String user_name;
	String user_pw;
	String user_login_token;
	String user_auth;
	String user_dept;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_id, String reg_dtm) {
		this.user_pw = CredentialUtil.encryptSHA256(this.user_pw);
	}
	public String getUser_login_token() {
		return user_login_token;
	}
	public void setUser_login_token(String user_login_token) {
		this.user_login_token = user_login_token;
	}
	public String getUser_auth() {
		return user_auth;
	}
	public void setUser_auth(String user_auth) {
		this.user_auth = user_auth;
	}
	public String getUser_dept() {
		return user_dept;
	}
	public void setUser_dept(String user_dept) {
		this.user_dept = user_dept;
	}
	
}
