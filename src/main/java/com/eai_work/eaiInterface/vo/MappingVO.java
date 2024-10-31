package com.eai_work.eaiInterface.vo;

public class MappingVO {

	/* SEQ */
	private int seq;
	/* 사용여부 */
	private String use_yn;
	/* 삭제여부 */
	private String del_yn;
	/* 등록자ID */
	private String reg_id;
	/* 등록일시 */
	private String reg_dtm;
	/* 수정자ID */
	private String upd_id;
	/* 수정일시 */
	private String upd_dtm;
	/* 인터페이스ID */
	private String if_id;
	/* 인터페이스명 */
	private String if_name;
	/* 인터페이스버전 */
	private double if_version;
	/* 인터페이스 상세 SEQ */
	private int if_detail_seq;
	/* 인터페이스 시스템 SEQ */
	private int if_system_seq;
	/* 인터페이스 Mapping SEQ */
	private int if_mapping_seq;
	/* 인터페이스 Mapping 상세 SEQ */
	private int if_mapping_detail_seq;
	/* Source System명 */
	private String source_system_name;
	/* Source Object명 */
	private String source_object_name;
	/* Source Adaptor */
	private String source_adaptor;
	/* Source 방식 */
	private String source_method;
	/* Target System명 */
	private String target_system_name;
	/* Target Object명 */
	private String target_object_name;
	/* Target Adaptor */
	private String target_adaptor;
	/* Target 방식 */
	private String target_method;
	/* Source Input 데이터 */
	private String source_input_data;
	/* Source Mapping 데이터 */
	private String source_mapping_data;
	/* Source 프로시저 데이터 */
	private String source_procedure_data;
	/* Source Output 데이터 */
	private String source_output_data;
	/* Target Input 데이터 */
	private String target_input_data;
	/* Target Mapping 데이터 */
	private String target_mapping_data;
	/* Target 프로시저 데이터 */
	private String target_procedure_data;
	/* Target Output 데이터 */
	private String target_output_data;
	/* eai seq */
	private int eai_seq;
	
	
	public int getEai_seq() {
		return eai_seq;
	}
	public void setEai_seq(int eai_seq) {
		this.eai_seq = eai_seq;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getReg_dtm() {
		return reg_dtm;
	}
	public void setReg_dtm(String reg_dtm) {
		this.reg_dtm = reg_dtm;
	}
	public String getUpd_id() {
		return upd_id;
	}
	public void setUpd_id(String upd_id) {
		this.upd_id = upd_id;
	}
	public String getUpd_dtm() {
		return upd_dtm;
	}
	public void setUpd_dtm(String upd_dtm) {
		this.upd_dtm = upd_dtm;
	}
	public String getIf_id() {
		return if_id;
	}
	public void setIf_id(String if_id) {
		this.if_id = if_id;
	}
	public String getIf_name() {
		return if_name;
	}
	public void setIf_name(String if_name) {
		this.if_name = if_name;
	}
	public double getIf_version() {
		return if_version;
	}
	public void setIf_version(double if_version) {
		this.if_version = if_version;
	}
	public int getIf_detail_seq() {
		return if_detail_seq;
	}
	public void setIf_detail_seq(int if_detail_seq) {
		this.if_detail_seq = if_detail_seq;
	}
	public int getIf_system_seq() {
		return if_system_seq;
	}
	public void setIf_system_seq(int if_system_seq) {
		this.if_system_seq = if_system_seq;
	}
	public int getIf_mapping_seq() {
		return if_mapping_seq;
	}
	public void setIf_mapping_seq(int if_mapping_seq) {
		this.if_mapping_seq = if_mapping_seq;
	}
	public int getIf_mapping_detail_seq() {
		return if_mapping_detail_seq;
	}
	public void setIf_mapping_detail_seq(int if_mapping_detail_seq) {
		this.if_mapping_detail_seq = if_mapping_detail_seq;
	}
	public String getSource_system_name() {
		return source_system_name;
	}
	public void setSource_system_name(String source_system_name) {
		this.source_system_name = source_system_name;
	}
	public String getSource_object_name() {
		return source_object_name;
	}
	public void setSource_object_name(String source_object_name) {
		this.source_object_name = source_object_name;
	}
	public String getSource_adaptor() {
		return source_adaptor;
	}
	public void setSource_adaptor(String source_adaptor) {
		this.source_adaptor = source_adaptor;
	}
	public String getSource_method() {
		return source_method;
	}
	public void setSource_method(String source_method) {
		this.source_method = source_method;
	}
	public String getTarget_system_name() {
		return target_system_name;
	}
	public void setTarget_system_name(String target_system_name) {
		this.target_system_name = target_system_name;
	}
	public String getTarget_object_name() {
		return target_object_name;
	}
	public void setTarget_object_name(String target_object_name) {
		this.target_object_name = target_object_name;
	}
	public String getTarget_adaptor() {
		return target_adaptor;
	}
	public void setTarget_adaptor(String target_adaptor) {
		this.target_adaptor = target_adaptor;
	}
	public String getTarget_method() {
		return target_method;
	}
	public void setTarget_method(String target_method) {
		this.target_method = target_method;
	}
	public String getSource_input_data() {
		return source_input_data;
	}
	public void setSource_input_data(String source_input_data) {
		this.source_input_data = source_input_data;
	}
	public String getSource_mapping_data() {
		return source_mapping_data;
	}
	public void setSource_mapping_data(String source_mapping_data) {
		this.source_mapping_data = source_mapping_data;
	}
	public String getSource_procedure_data() {
		return source_procedure_data;
	}
	public void setSource_procedure_data(String source_procedure_data) {
		this.source_procedure_data = source_procedure_data;
	}
	public String getSource_output_data() {
		return source_output_data;
	}
	public void setSource_output_data(String source_output_data) {
		this.source_output_data = source_output_data;
	}
	public String getTarget_input_data() {
		return target_input_data;
	}
	public void setTarget_input_data(String target_input_data) {
		this.target_input_data = target_input_data;
	}
	public String getTarget_mapping_data() {
		return target_mapping_data;
	}
	public void setTarget_mapping_data(String target_mapping_data) {
		this.target_mapping_data = target_mapping_data;
	}
	public String getTarget_procedure_data() {
		return target_procedure_data;
	}
	public void setTarget_procedure_data(String target_procedure_data) {
		this.target_procedure_data = target_procedure_data;
	}
	public String getTarget_output_data() {
		return target_output_data;
	}
	public void setTarget_output_data(String target_output_data) {
		this.target_output_data = target_output_data;
	}
}
