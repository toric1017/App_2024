package com.eai_work.common.vo;

public class UserVO {

	private String userId;
	private String userName;
	private String userPw;
	private	String userLoginToken;
	private	String userAuth;
	private	String userDept;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserLoginToken() {
		return userLoginToken;
	}
	public void setUserLoginToken(String userLoginToken) {
		this.userLoginToken = userLoginToken;
	}
	public String getUserAuth() {
		return userAuth;
	}
	public void setUserAuth(String userAuth) {
		this.userAuth = userAuth;
	}
	public String getUserDept() {
		return userDept;
	}
	public void setUserDept(String userDept) {
		this.userDept = userDept;
	}
}
