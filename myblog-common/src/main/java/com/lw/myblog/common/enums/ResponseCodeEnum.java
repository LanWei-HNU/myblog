package com.lw.myblog.common.enums;

public enum ResponseCodeEnum {
	SUCCESS(0,"操作成功"),
	FAIL(1,"失败[异常]");
	
	
	private int code;
	private String desc;
	
	ResponseCodeEnum(int code,String desc){
		this.code = code;
		this.desc = desc;
	}

	public int getCode() {
		return code;
	}

	public String getDesc() {
		return desc;
	}
}
