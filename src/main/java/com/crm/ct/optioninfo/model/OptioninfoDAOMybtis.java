package com.crm.ct.optioninfo.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OptioninfoDAOMybtis implements OptioninfoDAO{
	
	@Autowired SqlSessionTemplate sqlsession;
	private String namespace="config.mybatis.mapper.oracle.optioninfo.";
	
	@Override
	public List<Map<String, Object>> optioninfoCar() {
		return sqlsession.selectList(namespace+"optioninfoCar");
	}

}
