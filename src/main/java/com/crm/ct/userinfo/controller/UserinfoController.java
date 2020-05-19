package com.crm.ct.userinfo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.crm.ct.common.PaginationInfo;
import com.crm.ct.common.SearchVO;
import com.crm.ct.userinfo.model.UserinfoService;
import com.crm.ct.userinfo.model.UserinfoVO;


@Controller
public class UserinfoController {
	
	private static final Logger logger=LoggerFactory.getLogger(UserinfoController.class);
	@Autowired UserinfoService userinfoservice;
	
	@RequestMapping(value="/userList.do")
	public String userListShow(
			@RequestParam(defaultValue = "1") int currentPage,
		    @RequestParam(defaultValue = "15") int recordCountPerPage,
		    @RequestParam(defaultValue = "") String searchKeyword,
		    @RequestParam(defaultValue = "all") String searchCondition,
			Model model){
		logger.info("userinfo입니다. 파라미터 currentPage={}, recordCountPerPage={}",currentPage,recordCountPerPage);
		logger.info("userinfo입니다. 파라미터 searchCondition={}, searchKeyword={}",searchCondition,searchKeyword);
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		//페이지 관련 정보 저장
		PaginationInfo pageinfo=new PaginationInfo();
		pageinfo.setCurrentPage(currentPage);
		pageinfo.setRecordCountPerPage(recordCountPerPage);
		pageinfo.setBlockSize(10);
		map.put("firstRecordIndex",pageinfo.getFirstRecordIndex());	
		map.put("recordCountPerPage",recordCountPerPage);	
		
		//검색정보 맵에 저장
		map.put("searchKeyword", searchKeyword);
		map.put("searchCondition", searchCondition);
		
		List<UserinfoVO> userList= userinfoservice.userinfoAll(map);
		
		logger.info("userinfo 전체 조회 수 userList.size={}",userList.size());
		
		
		//totalcount 조회
		int totalCount=userinfoservice.getTotalCount(map);
		logger.info("totalCount={}",totalCount);
		pageinfo.setTotalRecord(totalCount);
		
		model.addAttribute("pagingInfo",pageinfo);
		model.addAttribute("userList",userList);
		
		return "userinfo/userList";
	}
	
	@RequestMapping(value="/userAdd.do")
	public String userAddShow(){
		logger.info("여기는 userAddShow입니다.");
		
		return "userinfo/userAdd";
	}
}
