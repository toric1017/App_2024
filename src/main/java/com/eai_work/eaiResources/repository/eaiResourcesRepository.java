package com.eai_work.eaiResources.repository;

import com.eai_work.eaiResources.entity.EaiResources;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface eaiResourcesRepository extends JpaRepository<EaiResources, Long> {
    Page<EaiResources> findByUseYn(String useYn, Pageable pageable);
    Page<EaiResources> findByResourceNameContainingIgnoreCase(String resourceName, Pageable pageable);
}
