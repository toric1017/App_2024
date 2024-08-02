package com.eai_work.common.vo;

public class ResponseVO<T> {

	private T data;
	private String resCode;
	private String resMeg;
	

	public ResponseVO(String resCode, String resMeg) {
		this.resCode = resCode;
		this.resMeg = resMeg;
	}

	public ResponseVO(T data, String resCode, String resMeg) {
		this.data = data;
		this.resCode = resCode;
		this.resMeg = resMeg;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public String getResCode() {
		return resCode;
	}

	public void setResCode(String resCode) {
		this.resCode = resCode;
	}

	public String getResMeg() {
		return resMeg;
	}

	public void setResMeg(String resMeg) {
		this.resMeg = resMeg;
	}
}
