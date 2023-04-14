package com.yuanlrc.base.config;

import org.springframework.stereotype.Component;

/**
 * 网站基础信息配置类
 *
 * @author Administrator
 */
@Component
public class SiteConfig {

    private String siteName = "";
    private String siteUrl = "";

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public String getSiteUrl() {
        return siteUrl;
    }

    public void setSiteUrl(String siteUrl) {
        this.siteUrl = siteUrl;
    }


}
