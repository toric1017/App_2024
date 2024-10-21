package com.eai_work.eaiResources.entity;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@Table(name = "tb_resource")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class EaiResources {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "resource_seq")
    private long resourceSeq;

    @Column(name = "manager_company")
    private String managerCompany;

    @Column(name = "manager_dept")
    private String managerDept;

    @Column(name = "manager_name")
    private String managerName;

    @Column(name = "manager_phone")
    private String managerPhone;

    @Column(name = "resource_name")
    private String resourceName;

    @Column(name = "resource_was_kind")
    private String resourceWasKind;

    @Column(name = "resource_was_dev")
    private String resourceWasDev;

    @Column(name = "resource_was_prd")
    private String resourceWasPrd;

    @Column(name = "resource_db_kind")
    private String resourceDbKind;

    @Column(name = "resource_db_dev")
    private String resourceDbDev;

    @Column(name = "resource_db_prd")
    private String resourceDbPrd;

    @Column(name = "resource_etc_kind")
    private String resourceEtcKind;

    @Column(name = "resource_etc_dev")
    private String resourceEtcDev;

    @Column(name = "resource_etc_prd")
    private String resourceEtcPrd;

    @Column(name = "resource_detail")
    private String resourceDetail;

    @Column(name = "use_yn")
    private String useYn;

    @Column(name = "reg_id")
    private String regId;

    @Column(name = "reg_dtm")
    private LocalDateTime regDtm;

    @Column(name = "upd_id")
    private String updId;

    @Column(name = "upd_dtm")
    private LocalDateTime  updDtm;

    @PrePersist
    protected void onCreate() {
        regDtm = LocalDateTime.now();
        updDtm = LocalDateTime.now();
    }


}
