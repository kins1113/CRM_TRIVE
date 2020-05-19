package com.crm.ct.optioninfo.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OptioninfoServiceImpl implements OptioninfoService{
	
	@Autowired OptioninfoDAO optioninfoDAO;

	@Override
	public List<Map<String, Object>> optioninfoCar() {
		return optioninfoDAO.optioninfoCar();
	}
	
	
}
