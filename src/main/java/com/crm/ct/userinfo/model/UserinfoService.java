package com.crm.ct.userinfo.model;

import java.util.List;
import java.util.Map;

public interface UserinfoService {
	
	public List<UserinfoVO> userinfoAll(Map<String, Object> map);
	public int getTotalCount(Map<String, Object>map);
}
