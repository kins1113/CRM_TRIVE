package com.crm.ct.userinfo.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserinfoDAOMybatis implements UserinfoDAO{

	private String namespace="config.mybatis.mapper.oracle.userinfo.";	
	@Autowired SqlSessionTemplate sqlsession;
	
	@Override
	public List<UserinfoVO> userinfoAll(Map<String, Object> map) {
		return sqlsession.selectList(namespace+"userinfoAll",map);
	}

	@Override
	public int getTotalCount(Map<String, Object> map) {
		return sqlsession.selectOne(namespace+"getTotalCount",map);
	}

}
