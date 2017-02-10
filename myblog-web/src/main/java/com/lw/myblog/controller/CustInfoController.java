package com.lw.myblog.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lw.myblog.common.exception.BlogException;
import com.lw.myblog.model.custInfo.LoginBean;
import com.lw.myblog.service.custInfo.CustInfoService;

@Controller
@RequestMapping("/custInfo")
public class CustInfoController {
	static String EMAIL_REGEX = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
	static String MOBILE_REGEX = "^[1][3578]\\d{9}$";

	@Autowired
	CustInfoService custInfoService;

	@RequestMapping("/hello")
	public String hello() {
		System.out.println("hello world");
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(LoginBean bean,HttpServletRequest request) {
		if (null == bean || StringUtils.isBlank(bean.getParams()) || StringUtils.isBlank(bean.getPassword())) {
			// 返回错误信息
			System.out.println("参数错误");
			return null;
		}
		String params = bean.getParams();
		try {
			if (params.matches(EMAIL_REGEX)) {	//邮箱登陆
				custInfoService.emailLogin(bean,request);
			} else if (params.matches(MOBILE_REGEX)) {	// 手机号登陆
				custInfoService.mobileLogin(bean,request);
			}
		} catch (BlogException e) {
			e.printStackTrace();
		}
		
		return "index";
	}
	
	public static void main(String[] args) {
		String params = "lanwei@163.com";
		
		System.out.println(params.matches(MOBILE_REGEX));
	}
}
