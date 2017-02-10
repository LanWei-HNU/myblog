package com.lw.myblog.service.custInfo;

import javax.servlet.http.HttpServletRequest;

import com.lw.myblog.common.exception.BlogException;
import com.lw.myblog.model.CustInfo;
import com.lw.myblog.model.custInfo.LoginBean;


public interface CustInfoService {
	
	/**
	 * 检查邮箱是否已注册
	 * @param email
	 * @return
	 */
	CustInfo checkEmail(String email);
	
	/**
	 * 检查电话是否已注册
	 * @param email
	 * @return
	 */
	CustInfo checkMobilePhone(String mobile);
	/**
	 * 邮箱登陆
	 * @param bean
	 * @param request
	 * @throws BlogException
	 */
	void emailLogin(LoginBean bean,HttpServletRequest request) throws BlogException;
	/**
	 * 手机登陆
	 * @param bean
	 * @param request
	 * @throws BlogException
	 */
	void mobileLogin(LoginBean bean,HttpServletRequest request) throws BlogException;
}
