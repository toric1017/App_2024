package com.eai_work.common.util;

public enum SessionEnum {
	SESSION_USER_ID("SESSION_USER_ID"),
	SESSION_USER_NAME("SESSION_USER_NAME"),
	SESSION_USER_AUTH_CODE("SESSION_USER_AUTH_CODE"),
	SESSION_API_KEY("SESSION_API_KEY");

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
