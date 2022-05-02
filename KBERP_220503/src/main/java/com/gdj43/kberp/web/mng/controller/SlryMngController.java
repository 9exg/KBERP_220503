package com.gdj43.kberp.web.mng.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj43.kberp.common.bean.PagingBean;
import com.gdj43.kberp.common.service.IPagingService;
import com.gdj43.kberp.web.common.service.ICommonService;

/*** 급여 관리 메뉴 ***/

@Controller
public class SlryMngController {
	
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IPagingService iPagingService;
	
	// 급여명세서조회(관리자)
	@RequestMapping(value = "/slrSpcfctnList")
	public ModelAndView slrSpcfctnList(@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		if(params.get("page") == null || params.get("page") == "") {
			params.put("page", "1");
		}
		
		if(params.get("mon") == null || params.get("mon") == "") {
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			String thisMon = sdf.format(today);
			params.put("mon", thisMon);			
		}
		
		mav.addObject("mon", params.get("mon"));
		mav.addObject("page", params.get("page"));
		
		mav.setViewName("mng/slrSpcfctnList");
		
		return mav;
	}
	
	// 급여명세서조회(관리자) ajax
	@RequestMapping(value ="/slrSpcfctnListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String slrSpcfctnListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		// 총 게시글 수
		int cnt = iCommonService.getIntData("SlryMng.getSlryMngCnt", params);
		
		// 페이징 계산
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCount", Integer.toString(pb.getStartCount()));
		params.put("endCount", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCommonService.getDataList("SlryMng.getSlryMngList", params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}

	//급여명세서 상세보기(관리자)
		@RequestMapping(value = "/slrSpcfctnViewMng")
		public ModelAndView slrSpcfctnViewMng(@RequestParam HashMap<String, String> params, 
									 ModelAndView mav) throws Throwable {
		
			HashMap<String, String> data = iCommonService.getData("SlryMng.slrSpcfctnView", params);
			
			mav.addObject("data", data);
			
			mav.setViewName("mng/slrSpcfctnViewMng");
			
			return mav;
		}
}
