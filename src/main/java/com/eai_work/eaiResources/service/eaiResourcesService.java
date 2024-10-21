package com.eai_work.eaiResources.service;

import com.eai_work.eaiResources.entity.EaiResources;
import com.eai_work.eaiResources.repository.eaiResourcesRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;

@Service
public class eaiResourcesService {
    @Autowired
    private eaiResourcesRepository eaiResourceRepository;

    @Transactional(readOnly = true)
    public Page<EaiResources> eaiResourcesList(String searchVal, Pageable pageable) {
        if (searchVal != null && !searchVal.isEmpty()) {
            return eaiResourceRepository.findByResourceNameContainingIgnoreCase(searchVal, pageable);
        } else {
            return eaiResourceRepository.findByUseYn("Y", pageable);
        }
    }

    @Transactional
    public EaiResources  eaiResourcesCreate(EaiResources eaiResources) { // title, content
        return eaiResourceRepository.save(eaiResources);
    }

    @Transactional(readOnly = true)
    public EaiResources eaiResourcesDetail(long resourceSeq) {
        return eaiResourceRepository.findById(resourceSeq).orElseThrow(() -> {
            return new IllegalArgumentException("글 상세보기 실패 : 아이디를 찾을 수 없습니다");
        });
    }

    @Transactional
    public EaiResources eaiResourcesDelete(long resourceSeq) {
        EaiResources eaiResources = eaiResourceRepository.findById(resourceSeq).orElseThrow(() -> {
            return new IllegalArgumentException("Resource번호를 찾을 수 없습니다");
        });

        eaiResources.setUseYn("N");
        //eaiResourceRepository.deleteById(resourceSeq);

        // 함수 종료시(service 종료시) 트랜잭션이 종료된다. 이때 더티체킹이 일어나면서 자동 업데이트가 된다.
        return eaiResourceRepository.save(eaiResources);
    }

    @Transactional
    public EaiResources eaiResourcesUpdate(long resourceSeq, EaiResources requesteaiResources) {
         EaiResources eaiResources = eaiResourceRepository.findById(resourceSeq).orElseThrow(() -> {
            return new IllegalArgumentException("Resource번호를 찾을 수 없습니다");
        });

        eaiResources.setManagerCompany(requesteaiResources.getManagerCompany());
        eaiResources.setManagerDept(requesteaiResources.getManagerDept());
        eaiResources.setManagerName(requesteaiResources.getManagerName());
        eaiResources.setManagerPhone(requesteaiResources.getManagerPhone());
        eaiResources.setResourceName(requesteaiResources.getResourceName());
        eaiResources.setResourceWasKind(requesteaiResources.getResourceWasKind());
        eaiResources.setResourceWasDev(requesteaiResources.getResourceWasDev());
        eaiResources.setResourceWasPrd(requesteaiResources.getResourceWasPrd());
        eaiResources.setResourceDbKind(requesteaiResources.getResourceDbKind());
        eaiResources.setResourceDbDev(requesteaiResources.getResourceDbDev());
        eaiResources.setResourceDbPrd(requesteaiResources.getResourceDbPrd());
        eaiResources.setResourceEtcKind(requesteaiResources.getResourceEtcKind());
        eaiResources.setResourceEtcDev(requesteaiResources.getResourceEtcDev());
        eaiResources.setResourceEtcPrd(requesteaiResources.getResourceEtcPrd());
        eaiResources.setResourceDetail(requesteaiResources.getResourceDetail());
        // 함수 종료시(service 종료시) 트랜잭션이 종료된다. 이때 더티체킹이 일어나면서 자동 업데이트가 된다.
        return eaiResourceRepository.save(eaiResources);
    }

}
