package com.yuanlrc.base.bean;

public enum HomeProjectStatus {
    RELEASE(1,"发布中"),
    INPUBLIC(3,"公示中"),
    BIDDING(4,"竞价中"),
    REGISTERING(10,"报名中"),
    ENDBIDDING(6,"竞价结束"),
    AUCTIONSOON(11,"即将开始竞拍");
    public Integer code;

    public String value;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }


    HomeProjectStatus(Integer code, String value) {
        this.code = code;
        this.value = value;
    }



}
