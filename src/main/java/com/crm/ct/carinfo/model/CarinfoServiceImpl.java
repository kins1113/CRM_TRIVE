package com.crm.ct.carinfo.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CarinfoServiceImpl implements CarinfoService{

	@Autowired CarinfoDAO carinfoDAO;
	@Override
	public List<Map<String, Object>> carinfoAll(Map<String, Object> map) {
		return carinfoDAO.carinfoAll(map);
	}

	@Override
	public int getTotalCount(Map<String, Object> map) {
		return carinfoDAO.getTotalCount(map);
	}

	@Override
	public int carinfoShowckChange(Map<String, Object> map) {
		return carinfoDAO.carinfoShowckChange(map);
	}

	@Override
	public List<Map<String, Object>> selecrColumnName() {
		return carinfoDAO.selecrColumnName();
	}

	@Override
	public List<Map<String, Object>> selectColumnNameReal() {
		return carinfoDAO.selectColumnNameReal();
	}

	@Override
	public int carinfoColumnAdd(Map<String, Object> map) {
		return carinfoDAO.carinfoColumnAdd(map);
	}

	@Override
	public int carinfoColumnComment(Map<String, Object> map) {
		return carinfoDAO.carinfoColumnComment(map);
	}

	@Override
	public List<Map<String, Object>> carManagerSelect() {
		return carinfoDAO.carManagerSelect();
	}

	@Override
	public int carColDel(String colName) {
		return carinfoDAO.carColDel(colName);
	}

	@Override
	public int insertCarinfo(List<Object> list) {
		return carinfoDAO.insertCarinfo(list);
	}

}
