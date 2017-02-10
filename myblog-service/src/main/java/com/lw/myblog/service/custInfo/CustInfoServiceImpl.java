package com.lw.myblog.service.custInfo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lw.myblog.common.exception.BlogException;
import com.lw.myblog.dao.CustInfoMapper;
import com.lw.myblog.model.CustInfo;
import com.lw.myblog.model.CustInfoExample;
import com.lw.myblog.model.custInfo.LoginBean;

@Service
public class CustInfoServiceImpl implements CustInfoService {
	
	@Autowired
	private CustInfoMapper custInfoMapper;

	@Override
	public void emailLogin(LoginBean bean,HttpServletRequest request) throws BlogException{
		CustInfo custInfo = checkEmail(bean.getParams());
		if(custInfo==null){//未注册
			throw new BlogException("邮箱未注册！");
		}
		if(!custInfo.getPassword().equals(bean.getPassword())){
			throw new BlogException("密码错误!");
		}
		System.out.println("用户 "+bean.getParams()+" 登陆成功");
	}

	@Override
	public void mobileLogin(LoginBean bean,HttpServletRequest request) throws BlogException {
		CustInfo custInfo = checkMobilePhone(bean.getParams());
		if(custInfo==null){//未注册
			throw new BlogException("手机号未注册！");
		}
		if(!custInfo.getPassword().equals(bean.getPassword())){
			throw new BlogException("密码错误!");
		}
		System.out.println("用户 "+bean.getParams()+" 登陆成功");
	}
	
	@Override
	public CustInfo checkEmail(String email) {
		CustInfo cust = new CustInfo();
		cust.setEmail(email);
		List<CustInfo> list = custInfoMapper.selectByExample(getLoginExample(cust));
		return (list==null || list.isEmpty())?null:list.get(0);
	}

	@Override
	public CustInfo checkMobilePhone(String mobile) {
		CustInfo cust = new CustInfo();
		cust.setMobilePhone(mobile);
		List<CustInfo> list = custInfoMapper.selectByExample(getLoginExample(cust));
		return (list==null || list.isEmpty())?null:list.get(0);
	}

	private CustInfoExample getLoginExample(CustInfo custInfo){
		CustInfoExample example = new CustInfoExample();
		CustInfoExample.Criteria c = example.createCriteria();
		if(!StringUtils.isBlank(custInfo.getMobilePhone())){
			c.andMobilePhoneEqualTo(custInfo.getMobilePhone().trim());
		}
		if(!StringUtils.isBlank(custInfo.getEmail())){
			c.andEmailEqualTo(custInfo.getEmail().trim());
		}
		if(!StringUtils.isBlank(custInfo.getPassword())){
			c.andPasswordEqualTo(custInfo.getPassword());
		}
		return example;
	}

}
