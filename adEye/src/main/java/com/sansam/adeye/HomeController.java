package com.sansam.adeye;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sansam.adeye.domain.AcquisitionSubmitDTO;
import com.sansam.adeye.domain.MemberDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		System.out.println("123");
		
		
		return "home";
	}
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
	public @ResponseBody Map<String,String> submit(@RequestBody List<AcquisitionSubmitDTO> data) {
		
		logger.info("Welcome home! The client locale is {}.", "/tid_data.................");
		for (AcquisitionSubmitDTO adto : data) {
			System.out.println(adto.getUid()+"-"+adto.getTid()+"-"+adto.getStart_data_time()+"-"+adto.getEnd_data_time()+"-"+adto.getEffect()+"-"+adto.getGender());
		}
//		for (AiSubmitDTO dto : data) {
//			
//			System.out.println(dto.getData_time() +" ... " +dto.getEffect()+" ... " +dto.getGender());
//		}
		Map<String,String> paramMap = new HashMap<String, String>();
		paramMap.put("reboot_code", "0");
		return paramMap;
	}
	
	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public @ResponseBody Map<String,String> login(@RequestBody MemberDTO data, HttpServletRequest request) {
		
		logger.info("/login................."+data.toString());
		
		System.out.println(data.getMem_id()+"-"+data.getMem_pw());
		
		Map<String,String> paramMap = new HashMap<String, String>();
		if(data.getMem_id().equals("test01") && data.getMem_pw().equals("0000")) {
			
			HttpSession session = request.getSession();
			session.setAttribute("LoginId","test01");
			paramMap.put("code", "200");
			paramMap.put("message", "로그인 성공");
		}else {
			paramMap.put("code", "204");
			paramMap.put("message", "로그인 실패");
		}
		
		return paramMap;
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public @ResponseBody Map<String,String> logout(HttpSession session) {
		
		logger.info("/logout................."+session.getAttribute("LoginId"));
		System.out.println("삭제할 세션 "+session.getAttributeNames());
		session.invalidate();
		Map<String,String> paramMap = new HashMap<String, String>();
		paramMap.put("code", "202");
		paramMap.put("message", "로그아웃 성공");
		
		
		
		return paramMap;
	}
	
	
	// 로그인상태 확인
	@RequestMapping(value = "/loginSession", method = RequestMethod.GET)
	public @ResponseBody Map<String,String> loginSession(HttpSession session) {
		
		Map<String,String> paramMap = new HashMap<String, String>();
		if(session.getAttribute("LoginId") != null) {
			
			paramMap.put("code", "200");
			paramMap.put("message", "로그인중");
		}else {
			paramMap.put("code", "202");
			paramMap.put("message", "로그인해주세요");
		}
		logger.info("/loginSession................."+session.getAttribute("LoginId"));
		
		return paramMap;
	}
	
	// 어드민대시보드
	@RequestMapping(value = "/adminDashboard", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> adminDashboard(HttpSession session) {
		
		Map<String,Object> paramMap = new HashMap<String, Object>();
		if(session.getAttribute("LoginId") != null) {
			
			Map<String,Object> paramMapSub = new HashMap<String, Object>();
		    paramMapSub.put("contact_noread_cnt", 3);
		    paramMapSub.put("contact_total", 55);
		    paramMapSub.put("device_use_cnt", 13);
		    paramMapSub.put("device_total", 20);
		    paramMapSub.put("sbs_dday", 3);
		    paramMapSub.put("sbs_total", 13);
		    paramMap.put("result", paramMapSub);
			paramMap.put("code", "200");
			paramMap.put("message", "조회 성공");
		}else {
			paramMap.put("code", "202");
			paramMap.put("message", "로그인 후 이용해주세요");
		}
		logger.info("/adminDashboard.................");
		
		return paramMap;
	}
	
}
