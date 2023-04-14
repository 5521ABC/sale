package com.yuanlrc.base.dao.admin;

import com.yuanlrc.base.entity.common.Organization;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface OrganizationDao extends JpaRepository<Organization, Long>, JpaSpecificationExecutor<Organization> {

    @Query("select o from Organization o where o.id = :id")
    Organization find(@Param("id") Long id);

    Organization findByEmail(String email);

    Organization findByMobile(String phone);

    Organization findByName(String name);

    /**
     *忘记密码 更新操作
     * @param organization
     * @return
     */
    @Transactional
    @Modifying(clearAutomatically=true)
    @Query("update Organization o set o.password=:#{#organization.password} where o.id=:#{#organization.id}")
    int updatePassword(@Param("organization")Organization organization);

    /**
     * 更新信用分
     * @param organization
     * @return
     */
    @Transactional
    @Modifying(clearAutomatically=true)
    @Query("update Organization o set o.rate=:#{#organization.rate} where o.id=:#{#organization.id}")
    int updateRate(@Param("organization")Organization organization);
}
