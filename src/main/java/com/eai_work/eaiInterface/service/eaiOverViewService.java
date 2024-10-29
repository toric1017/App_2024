package com.eai_work.eaiInterface.service;

import com.eai_work.eaiInterface.entity.EaiOverView;
import com.eai_work.eaiInterface.repository.eaiOverViewRepository;
import com.eai_work.eaiResources.entity.EaiResources;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;
@Service
public class eaiOverViewService {
    @Autowired
    private eaiOverViewRepository eaiOverViewRepository;

    @Transactional(readOnly = true)
    public Page<EaiOverView> eaiOverViewList(String searchVal, Pageable pageable) {
        if (searchVal != null && !searchVal.isEmpty()) {
            return eaiOverViewRepository.findByEaiNmContainingIgnoreCase(searchVal, pageable);
        } else {
            return eaiOverViewRepository.findByDelYn("N", pageable);
        }
    }

    @Transactional
    public EaiOverView eaiOverViewCreate(EaiOverView eaiOverView) { // title, content
        return eaiOverViewRepository.save(eaiOverView);
    }



    @Transactional
    public EaiOverView eaiOverViewDelete(long eaiSeq) {
        EaiOverView eaiOverView = eaiOverViewRepository.findById(eaiSeq).orElseThrow(() -> {
            return new IllegalArgumentException("OverView번호를 찾을 수 없습니다");
        });

        eaiOverView.setUseYn("N");
        //eaiResourceRepository.deleteById(resourceSeq);

        // 함수 종료시(service 종료시) 트랜잭션이 종료된다. 이때 더티체킹이 일어나면서 자동 업데이트가 된다.
        return eaiOverViewRepository.save(eaiOverView);
    }



}
