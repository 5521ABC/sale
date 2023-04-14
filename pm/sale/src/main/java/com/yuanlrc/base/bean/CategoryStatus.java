package com.yuanlrc.base.bean;

public enum CategoryStatus {

    AVAILABLE(0,"可用"),
    NO_AVAILABLE(1,"不可用");
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


    CategoryStatus(Integer code, String value) {
        this.code = code;
        this.value = value;
    }



}
