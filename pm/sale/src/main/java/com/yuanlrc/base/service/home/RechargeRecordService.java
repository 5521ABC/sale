package com.yuanlrc.base.service.home;

import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.dao.home.RechargeRecordDao;
import com.yuanlrc.base.entity.home.RechargeRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;


@Service
public class RechargeRecordService {

    @Autowired
    private RechargeRecordDao rechargeRecordDao;



    /**
     * 根据id查询
     *
     * @param id
     * @return
     */
    public RechargeRecord find(Long id) {
        return rechargeRecordDao.find(id);
    }

    /**
     * 保存
     * @param rechargeRecord
     * @return
     */
    public RechargeRecord save(RechargeRecord rechargeRecord) {
        return rechargeRecordDao.save(rechargeRecord);
    }
    /**
     * 分页查询充值记录列表
     * @param rechargeRecord
     * @param pageBean
     * @return
     */
    public PageBean<RechargeRecord> findList(RechargeRecord rechargeRecord, PageBean<RechargeRecord> pageBean){
        Specification<RechargeRecord> specification = new Specification<RechargeRecord>() {
            @Override
            public Predicate toPredicate(Root root, CriteriaQuery criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Predicate predicate = criteriaBuilder.equal(root.get("account"), rechargeRecord.getAccount().getId());
                return predicate;
            }
        };
        Sort sort = Sort.by(Sort.Direction.DESC, "createTime");
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize(),sort);
        Page<RechargeRecord> findAll = rechargeRecordDao.findAll(specification, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }

    /**
     * 根据用户查询充值记录
     * @param accountId
     * @return
     */
    public List<RechargeRecord> findByAccountId(Long accountId){
        return rechargeRecordDao.findByAccountId(accountId);
    }
}
