package com.eai_work.common.util;

public enum SessionEnum {
	SESSION_USER_ID("SESSION_USER_ID"),
	SESSION_USER_NAME("SESSION_USER_NAME"),
	SESSION_USER_AUTH_CODE("SESSION_USER_AUTH_CODE"),
	SESSION_API_KEY("SESSION_API_KEY"),
	SESSION_WEBSOCKETURL("SESSION_WEBSOCKETURL"),
	SESSION_NOTI_YN("SESSION_NOTI_YN");

	private String SessionId;

	SessionEnum(String SessionId) {
		this.SessionId = SessionId;
	}

	public String getSessionId() {
		return SessionId;
	}

	public void setSessionId(String sessionId) {
		SessionId = sessionId;
	}

}
