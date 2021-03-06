package com.gdj43.kberp.web.clnt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj43.kberp.common.CommonProperties;
import com.gdj43.kberp.util.Utils;
import com.gdj43.kberp.web.common.service.ICommonService;

@Controller
public class IndvdlClntController {
	@Autowired
	public ICommonService iCommonService;

	@RequestMapping(value = "/cHeader")
	public ModelAndView cHeader(ModelAndView mav) {
		mav.setViewName("CS/clnt/cHeader");

		return mav;
	}

	
	@RequestMapping(value = "/cBottom") 
	public ModelAndView cBottom(ModelAndView mav) { 
		mav.setViewName("CS/clnt/cBottom");
	
		return mav; 
	}
	
	// LeftMenu
	@RequestMapping(value = "/cLeft")
	public ModelAndView cLeft(@RequestParam HashMap<String, String> params, 
								HttpSession session, ModelAndView mav) throws Throwable {
		
		mav.setViewName("CS/clnt/cLeft");
		
		return mav;
	}
	
	// LeftMenu Ajax
	@RequestMapping(value = "/cLeftAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String cLeftAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> leftMenu = iCommonService.getDataList("common.getLeftMenu", params);
		
		modelMap.put("leftMenu", leftMenu);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// ?????????
	@RequestMapping(value = "/indvdlLogin")
	public ModelAndView indvdlLogin(HttpSession session, ModelAndView mav) {
		if (session.getAttribute("sClntNum") != null) {
			mav.setViewName("redirect:cmbnInfo");
		} else {
			mav.setViewName("CS/clnt/clntLogin");
		}

		return mav;
	}
	
	// ????????? Ajax
	@RequestMapping(value = "/indvdlLoginAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String indvdlLoginAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			// ???????????? ?????????
			params.put("pw", Utils.encryptAES128(params.get("pw")));

			HashMap<String, String> data = iCommonService.getData("cl.icloginCheck", params);

			if (data != null && !data.isEmpty()) {
				session.setAttribute("sClntNum", data.get("CLNT_NUM"));
				session.setAttribute("sClntName", data.get("CLNT_NAME"));

				modelMap.put("res", CommonProperties.RESULT_SUCCESS);
			} else {
				modelMap.put("res", CommonProperties.RESULT_FAILED);
			}
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	// ????????????
	@RequestMapping(value = "/cLogout")
	public ModelAndView cLogout(HttpSession session, ModelAndView mav) {
		session.invalidate();

		mav.setViewName("redirect:clntLogin");

		return mav;
	}
	
	// ????????? ??? ????????? ???
	@RequestMapping(value = "/cmbnInfo")
	public ModelAndView cmbnInfo(ModelAndView mav) {
		
		mav.setViewName("CS/clnt/cmbnInfo");
		
		return mav;
	}
	
	// ????????? ??????
	@RequestMapping(value = "/findId")
	public ModelAndView findId(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		
		
		
		mav.setViewName("CS/clnt/findId");
		return mav;
	}
	
	@RequestMapping(value="/userAjax", method=RequestMethod.POST, 
			produces="text/json;charset=UTF-8")
	@ResponseBody // View??? ?????? ??????
	public String userAjax(@RequestParam HashMap<String,String> params) throws Throwable {
	
		ObjectMapper mapper = new ObjectMapper();
		
		//???????????? ?????? ??????
		Map<String,Object> modelMap = new HashMap<String,Object>();
				
		int cnt = iCommonService.getIntData("cl.findId2",params);
		
		modelMap.put("cnt",cnt);
		
		return mapper.writeValueAsString(modelMap); 
	}
	
	
	//????????? ?????? Ajax
	
	@RequestMapping(value="/findIdAjax/{gbn}", method=RequestMethod.POST, 
			produces="text/json;charset=UTF-8")
	@ResponseBody // View??? ?????? ??????
	public String findIdAjax(@RequestParam HashMap<String,String> params,
							@PathVariable String gbn) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String, String>> list = iCommonService.getDataList("cl.findId",params);
		int cnt = iCommonService.getIntData("cl.findId2",params);
		modelMap.put("list",list);
		modelMap.put("cnt",cnt);
		// ?????? ?????????
		if(cnt==0) {
			modelMap.put("res", "failed");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	// ???????????? ??????
	@RequestMapping(value = "/findPw")
	public ModelAndView findPw(ModelAndView mav) {
		mav.setViewName("CS/clnt/findPw");

		return mav;
	}
	
	// ????????????
	@RequestMapping(value = "/signUp")
	public ModelAndView signUp(ModelAndView mav) {
		mav.setViewName("CS/clnt/signUp");
		
		return mav;
	}
	
	// ?????? ??????, ??????, ??????
	@RequestMapping(value="/signUpActionAjax/{gbn}", method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String signUpActionAjax(@RequestParam HashMap<String, String> params,
								   @PathVariable String gbn) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();

		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			params.put("signup_pw", Utils.encryptAES128(params.get("signup_pw")));
			
			switch(gbn) {
			case "i":
				iCommonService.insertData("cl.signUp", params);
				break;
			case "u":
				iCommonService.updateData("cl.inqryRspndUp", params);
				break;
			case "d":
				iCommonService.updateData("cl.inqryRspndDel", params);
				break;
			}
			modelMap.put("res", "success");
			
		} catch(Throwable e) {
			e.printStackTrace();
			modelMap.put("res", "failed");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
}
