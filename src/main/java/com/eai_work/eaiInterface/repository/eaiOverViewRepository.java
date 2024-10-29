package com.eai_work.eaiInterface.repository;

import com.eai_work.eaiInterface.entity.EaiOverView;
import com.eai_work.eaiResources.entity.EaiResources;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface eaiOverViewRepository extends JpaRepository<EaiOverView, Long> {
    Page<EaiOverView> findByDelYn(String delYn, Pageable pageable);
    Page<EaiOverView> findByEaiNmContainingIgnoreCase(String eaiNm, Pageable pageable);
}
