package com.eai_work.common.vo;

public class SearchVO extends PaginationVO{

	private String api_id;
	private String api_meg;
	private String start_dtm;
	private String end_dtm;
	private int search_day = 0;
	private String job_id;
	private String job_meg;
	
	public int getSearch_day() {
		return search_day;
	}
	public void setSearch_day(int search_day) {
		this.search_day = search_day;
	}
	public String getJob_id() {
		return job_id;
	}
	public void setJob_id(String job_id) {
		this.job_id = job_id;
	}
	public String getJob_meg() {
		return job_meg;
	}
	public void setJob_meg(String job_meg) {
		this.job_meg = job_meg;
	}
	public String getApi_id() {
		return api_id;
	}
	public void setApi_id(String api_id) {
		this.api_id = api_id;
	}
	public String getApi_meg() {
		return api_meg;
	}
	public void setApi_meg(String api_meg) {
		this.api_meg = api_meg;
	}
	public String getStart_dtm() {
		return start_dtm;
	}
	public void setStart_dtm(String start_dtm) {
		this.start_dtm = start_dtm;
	}
	public String getEnd_dtm() {
		return end_dtm;
	}
	public void setEnd_dtm(String end_dtm) {
		this.end_dtm = end_dtm;
	}
	
}
