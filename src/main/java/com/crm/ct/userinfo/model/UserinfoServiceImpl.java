package com.crm.ct.userinfo.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserinfoServiceImpl implements UserinfoService{
	
	@Autowired UserinfoDAO userinfodao;
	@Override
	public List<UserinfoVO> userinfoAll(Map<String, Object> map) {
		return userinfodao.userinfoAll(map);
	}
	@Override
	public int getTotalCount(Map<String, Object> map) {
		return userinfodao.getTotalCount(map);
	}
	
}
