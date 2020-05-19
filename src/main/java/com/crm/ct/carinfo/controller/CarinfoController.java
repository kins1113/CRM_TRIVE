package com.crm.ct.carinfo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.ct.carinfo.model.CarinfoService;
import com.crm.ct.carinfo.model.CarinfoVO;
import com.crm.ct.common.PaginationInfo;
import com.crm.ct.optioninfo.model.OptioninfoService;
import com.crm.ct.userinfo.model.UserinfoVO;

@Controller
public class CarinfoController {
	
	private static Logger logger=LoggerFactory.getLogger(CarinfoController.class);
	@Autowired CarinfoService carinfoService;
	@Autowired OptioninfoService optioninfoService;
	
	
	@RequestMapping(value="/carList.do")
	public String carList(@RequestParam(defaultValue = "1") int currentPage,
		    @RequestParam(defaultValue = "15") int recordCountPerPage,
		    @RequestParam(defaultValue = "") String searchKeyword,
		    @RequestParam(defaultValue = "all") String searchCondition,
			Model model){
		logger.info("여기는 carList.do 입니다.");
		logger.info("carList입니다. 파라미터 currentPage={}, recordCountPerPage={}",currentPage,recordCountPerPage);
		logger.info("carList입니다. 파라미터 searchCondition={}, searchKeyword={}",searchCondition,searchKeyword);
		
		//
		Map<String, Object> map =new HashMap<String, Object>();
		
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
			
			List<Map<String, Object>> carList= carinfoService.carinfoAll(map);
			
			logger.info("carinfo 전체 조회 수 userList.size={}",carList.size());
			
			
			//totalcount 조회
			int totalCount=carinfoService.getTotalCount(map);
			logger.info("totalCount={}",totalCount);
			pageinfo.setTotalRecord(totalCount);
			
			//column name 조회
			List<Map<String,Object>> carNameList= carinfoService.selecrColumnName();
			logger.info("carNameList.size={}",carNameList.size());
			//column Leal name 조회
			List<Map<String,Object>> carNameLealList= carinfoService.selecrColumnName();
			logger.info("carNameLealList.size={}",carNameLealList.size());
			
			model.addAttribute("pagingInfo",pageinfo);
			model.addAttribute("carList",carList);
			model.addAttribute("carNameList",carNameList);
			model.addAttribute("carNameLealList",carNameLealList);
		
		return "carinfo/carList";
	}
	@RequestMapping(value="/carinfoShowckChange.do", method = RequestMethod.POST)
	@ResponseBody
	public int carinfoShowckChange(@RequestParam int no, @RequestParam String showck){
		logger.info("여기는 carinfo ShowCK Cahange 입니다. 파라미터 no={}, showch={}",no,showck);
		//맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no",no);
		if(showck.equals("출력")){
			map.put("showck",0);
		}else{
			map.put("showck",1);
		}
		int re=carinfoService.carinfoShowckChange(map);
		logger.info("showCK 변경 결과 값 re={}",re);
		return re;
	}
	@RequestMapping(value="/carAdd.do")
	public String carAddShow(){
		logger.info("carAddShow입니다.");
		
		return "carinfo/carAdd";
	}
	
	@RequestMapping(value="/carManager.do")
	public String carManagerShow(Model model){
		logger.info("carManagerShow입니다.");
		List<Map<String, Object>> optionList= optioninfoService.optioninfoCar();
		
		model.addAttribute("optionList",optionList);
		
		//column name 조회
		List<Map<String,Object>> carColList= carinfoService.carManagerSelect();
		logger.info("carColList.size={}",carColList.size());
		
		model.addAttribute("carColList",carColList);
		
		return "carinfo/carManager";
	}
	
	@RequestMapping(value="/carOptionAdd.do")
	public String carOptionAdd(
			@RequestParam String dataType,
			@RequestParam String opname					
			){
		logger.info("여기는 carOptionAdd입니다. dataType={} ,opname={}",dataType,opname);
		
		
		return "carinfo/carList";
	}
	
	@RequestMapping(value="carColumnAdd.do", method=RequestMethod.POST)
	public String carColumnAdd(
			@RequestParam(defaultValue="")String colNameKR,
			@RequestParam(defaultValue="")String colNameEN,
			@RequestParam(defaultValue="")String colType,
			@RequestParam(defaultValue="50")int colSize,
			@RequestParam(defaultValue="")String pageInfo	
			
			){
		logger.info("여기는 carColumnAdd 입니다. 파라미터  colNameKR={}, colNameEN={}",colNameKR,colNameEN);
		logger.info("여기는 carColumnAdd 입니다. 파라미터 colType={}  colSize={} ",colType,colSize);
		
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("colNameKR",colNameKR);
		map.put("colNameEN",colNameEN);
		map.put("colType",colType);
		map.put("colSize",colSize);
		
		int re=carinfoService.carinfoColumnAdd(map);
		int re2=carinfoService.carinfoColumnComment(map);
		if("carManager.jsp".equals(pageInfo)){
			return "redirect:carManager.do";
		}else{
			return "redirect:carList.do";
		}
	}
	
	@RequestMapping("carColumnDel.do")
	@ResponseBody
	public int carColumnDel(@RequestParam(defaultValue="")String colName){
		logger.info("carColumnDel 입니다. 파라미터 colName={}",colName);
		
		//공백이 아닐경우에만..
		int re=0;
		if(!colName.equals("")){
			re = carinfoService.carColDel(colName);
		}else{
			re=100;
		}
		logger.info("컬럼 삭제 결과 값 re={}",re);
		return re;
	}
	
	@RequestMapping("/carinfo/showLayer.do")
	public String showLayer(Model model){
		
		//column name 조회
		List<Map<String,Object>> carNameList= carinfoService.selecrColumnName();
		logger.info("carNameList.size={}",carNameList.size());
		
		model.addAttribute("carNameList",carNameList);
		
		return "carinfo/layer";
	}
	
	@RequestMapping(value="/carinfo/insertCarinfo.do")
	public String insertCarInfo(HttpServletRequest request,Model model){
		//carinfo의 컬럼정보를 가지고있는 list
		List<Map<String,Object>> carNameList= carinfoService.selecrColumnName();
		
		//차량정보를 담아서 DB작업할 map
		List<Object> carList=new ArrayList();
		
		for(int i=0; i<carNameList.size();i++){
			Map<String, Object> map=carNameList.get(i);
			String colParam=request.getParameter(map.get("COLUMN_NAME")+"");
			String colName=map.get("COLUMN_NAME")+"";
			logger.info("insertCarInfo 입니다 파라미터 colName={}, colParam={}",colName,colParam);
			if(!"".equals(colParam) && colParam!=null){
				carList.add(colParam);
			}else if(!colName.equals("NO")){
				logger.info("!colName.equals(NO)  colName={}",colName);
				logger.info("++++++++++++++++++++++++++++++++colParam={}",colParam);
				carList.add(colParam);
			}
		}
		
		//insert 하기
		int re = carinfoService.insertCarinfo(carList);
		logger.info("insert 결과 값 re ={}",re);
		
		
		model.addAttribute("carNameList",carNameList);
		return "carinfo/layer";
	}
}
