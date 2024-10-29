package com.eai_work.eaiInterface.entity;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@Table(name = "tb_interface_view")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class EaiOverView {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "eai_seq")
    private long eaiSeq;

    /*개요*/
    @Column(name = "eai_id")
    private String eaiId;

    @Column(name = "eai_nm")
    private String eaiNm;

    @Column(name = "eai_div_cd")
    private String eaiDivCd;

    @Column(name = "eai_desc")
    private String eaiDesc;

    @Column(name = "use_yn")
    private String useYn;

    @Column(name = "del_yn")
    private String delYn;

    @Column(name = "regr_id")
    private String regrId;

    /*시스템연결*/
    @Column(name = "reqResourcesSeq")
    private Integer reqResourcesSeq;

    @Column(name = "resResourcesSeq")
    private Integer resResourcesSeq;


    /*요청*/
    @Column(name = "req_adaptor")
    private String reqAdaptor;

    @Column(name = "req_rfc")
    private String reqRfc;

    @Column(name = "req_if_way_cd")
    private String reqIfWayCd;

    @Column(name = "req_rfc_id")
    private String reqRfcId;

    @Column(name = "req_rfc_type_cd")
    private String reqRfcTypeCd;

    @Column(name = "req_dev_db_user_id")
    private String reqDevDbUserId;

    @Column(name = "req_dev_db_user_pass")
    private String reqDevDbUserPass;

    @Column(name = "req_real_db_user_id")
    private String reqRealDbUserId;

    @Column(name = "req_real_db_user_pass")
    private String reqRealDbUserPass;

    @Column(name = "req_api_chl_nm")
    private String reqApiChlNm;

    @Column(name = "req_api_add")
    private String reqApiAdd;

    @Column(name = "req_operation")
    private String reqOperation;


    /*응답*/
    @Column(name = "res_adaptor")
    private String resAdaptor;

    @Column(name = "res_rfc")
    private String resRfc;

    @Column(name = "res_if_way_cd")
    private String resIfWayCd;

    @Column(name = "res_rfc_id")
    private String resRfcId;

    @Column(name = "res_rfc_type_cd")
    private String resRfcTypeCd;

    @Column(name = "res_dev_db_user_id")
    private String resDevDbUserId;

    @Column(name = "res_dev_db_user_pass")
    private String resDevDbUserPass;

    @Column(name = "res_real_db_user_id")
    private String resRealDbUserId;

    @Column(name = "res_real_db_user_pass")
    private String resRealDbUserPass;

    @Column(name = "res_api_chl_nm")
    private String resApiChlNm;

    @Column(name = "res_api_add")
    private String resApiAdd;

    @Column(name = "res_operation")
    private String resOperation;


    /*공통*/
    @Column(name = "eai_if_real_time_yn")
    private String eaiIfRealTimeYn;

    @Column(name = "eai_sync_yn")
    private String eaiSyncYn;

    @Column(name = "eai_cycle")
    private String eaiCycle;

    @Column(name = "eai_occurs_cnt")
    private String eaiOccursCnt;

    @Column(name = "eai_event_way")
    private String eaiEventWay;

    @Column(name = "procedure_call_yn")
    private String procedureCallYn;


    @Column(name = "reg_dtm")
    private LocalDateTime regDtm;

    @Column(name = "updr_id")
    private String updrId;

    @Column(name = "upd_dtm")
    private LocalDateTime  updDtm;

    @PrePersist
    protected void onCreate() {
        regDtm = LocalDateTime.now();
        updDtm = LocalDateTime.now();
    }


}
