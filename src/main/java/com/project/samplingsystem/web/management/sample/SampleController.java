package com.project.samplingsystem.web.management.sample;

import com.project.samplingsystem.config.permission.NBAuth;
import com.project.samplingsystem.dao.repository.SamplingRepository;
import com.project.samplingsystem.model.entity.Sample;
import com.project.samplingsystem.model.entity.permission.NBSysResource;
import com.project.samplingsystem.model.pojo.framework.LayuiTable;
import com.project.samplingsystem.model.pojo.framework.Pagination;
import com.project.samplingsystem.web.BaseController;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

/**
 * created by chen on 2021/05/11 at 13:15
 *
 * @author chen
 */
@Controller
@RequestMapping("/management/sample")
public class SampleController extends BaseController {

    private final SamplingRepository samplingRepository;

    @Autowired
    public SampleController(SamplingRepository samplingRepository) {
        this.samplingRepository = samplingRepository;
    }


    @RequestMapping
    @NBAuth(value = "management:sample:page", remark = "采样页面列表", group = NBAuth.Group.ROUTER, type = NBSysResource.ResType.NAV_LINK)
    public String Sample() {
        return "management/sample/sample";
    }

    @RequestMapping("/list")
    @ResponseBody
    @NBAuth(value = "management:sampling:list", remark = "采样页面分页数据", group = NBAuth.Group.AJAX)
    public LayuiTable<Sample> listSample(Pagination<Sample> catePage, String clearComment) {
        Pageable pageable = PageRequest.of(catePage.getPage() - 1, catePage.getLimit());
        Page<Sample> samples = samplingRepository.findAll(new Specification<Sample>() {
            @Override
            public Predicate toPredicate(Root<Sample> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicates = new ArrayList<>();
                if (StringUtils.isNotBlank(clearComment)) {
                    predicates.add(cb.like(root.get("sampleName"), clearComment));
                }
                return query.where(predicates.toArray(new Predicate[predicates.size()])).getRestriction();
            }
        },pageable);

        return layuiTable(samples, pageable);
    }

}
