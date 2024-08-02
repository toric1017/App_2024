package com.eai_work.common.vo;

public class ErrorVO extends SearchVO{
	private String error_name;
	private String error_description;
	private String error_type;
	
	public ErrorVO(String error_name, String error_description, String error_type){
		this.error_name = error_name;
		this.error_description = error_description;
		this.error_type = error_type;
	}
	
	public String getError_name() {
		return error_name;
	}
	public void setError_name(String error_name) {
		this.error_name = error_name;
	}
	public String getError_description() {
		return error_description;
	}
	public void setError_description(String error_description) {
		this.error_description = error_description;
	}
	public String getError_type() {
		return error_type;
	}
	public void setError_type(String error_type) {
		this.error_type = error_type;
	}
}
