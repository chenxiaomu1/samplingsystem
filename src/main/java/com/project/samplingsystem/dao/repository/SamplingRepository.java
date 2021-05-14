package com.project.samplingsystem.dao.repository;

import com.project.samplingsystem.model.entity.Sample;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

/**
 * created by chen on 2021/05/11 at 13:15
 *
 * @author chen
 */
public interface SamplingRepository extends JpaSpecificationExecutor<Sample> , JpaRepository<Sample, Long> {

    List<Sample> findByUserId(String userId);
}
