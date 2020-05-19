package com.crm.ct.carinfo.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarinfoDAOMybatis implements CarinfoDAO {
	
	private String namespace="config.mybatis.mapper.oracle.carinfo.";	
	@Autowired SqlSessionTemplate sqlsession;
	
	@Override
	public List<Map<String, Object>> carinfoAll(Map<String, Object> map) {
		return sqlsession.selectList(namespace+"carinfoAll", map);
	}

	@Override
	public int getTotalCount(Map<String, Object> map) {
		return sqlsession.selectOne(namespace+"getTotalCount",map);
	}

	@Override
	public int carinfoShowckChange(Map<String, Object> map) {
		return sqlsession.update(namespace+"carinfoShowckChange", map);
	}

	@Override
	public List<Map<String, Object>> selecrColumnName() {
		return sqlsession.selectList(namespace+"selecrColumnName");
	}

	@Override
	public List<Map<String, Object>> selectColumnNameReal() {
		return sqlsession.selectList(namespace+"selectColumnNameReal");
	}

	@Override
	public int carinfoColumnAdd(Map<String, Object> map) {
		return sqlsession.insert(namespace+"carinfoColumnAdd",map);
	}

	@Override
	public int carinfoColumnComment(Map<String, Object> map) {
		return sqlsession.insert(namespace+"carinfoColumnComment",map);
	}

	@Override
	public List<Map<String, Object>> carManagerSelect() {
		return sqlsession.selectList(namespace+"carManagerSelect");
	}

	@Override
	public int carColDel(String colName) {
		System.out.println(colName+"colName");
		return sqlsession.update(namespace+"carColDel",colName);
	}

	@Override
	public int insertCarinfo(List<Object> list) {
		return sqlsession.insert(namespace+"insertCarinfo",list);
	}

}
