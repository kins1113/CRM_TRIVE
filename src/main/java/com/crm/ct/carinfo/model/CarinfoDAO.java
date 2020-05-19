package com.crm.ct.carinfo.model;

import java.util.List;
import java.util.Map;

public interface CarinfoDAO {
	
	public  List<Map<String, Object>>  carinfoAll(Map<String, Object> map);
	public int getTotalCount(Map<String, Object> map);
	public int carinfoShowckChange(Map<String, Object> map);
	public int insertCarinfo(List<Object> list);
	
	public List<Map<String, Object>> selecrColumnName();
	public List<Map<String, Object>> selectColumnNameReal();
	public int carinfoColumnAdd(Map<String, Object> map);
	public int carinfoColumnComment(Map<String, Object> map);
	public List<Map<String, Object>> carManagerSelect();
	public int carColDel(String colName);
}
