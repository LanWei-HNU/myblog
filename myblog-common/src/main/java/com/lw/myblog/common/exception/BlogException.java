package com.lw.myblog.common.exception;

import org.apache.commons.lang3.StringUtils;

import com.lw.myblog.common.enums.ResponseCodeEnum;

public class BlogException extends Exception {
	private static final long serialVersionUID = 1L;
	
	private int errorCode;
	private String errorDesc;

	public BlogException() {
		super();
	}
	
	public BlogException(String msg) {
		super(msg);
		this.errorCode = ResponseCodeEnum.FAIL.getCode();
		this.errorDesc=msg;
	}
	
	public BlogException(Throwable cause) {
		super(cause);
		this.errorCode = ResponseCodeEnum.FAIL.getCode();
		this.errorDesc=cause.getLocalizedMessage();
	}
	
	public BlogException(String message, Throwable cause) {
		super(message,cause);
		this.errorDesc=message;
	}
	
	public BlogException(ResponseCodeEnum enums){
		super(enums.getDesc());
		this.errorCode = enums.getCode();
		this.errorDesc = enums.getDesc();
	}
	public int getErrorCode() {
		return errorCode;
	}

	public String getErrorDesc() {
		return StringUtils.isBlank(errorDesc) ? getLocalizedMessage() : errorDesc;
	}
}
