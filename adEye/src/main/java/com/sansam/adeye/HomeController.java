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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sansam.adeye.domain.AcquisitionSubmitDTO;
import com.sansam.adeye.domain.MemberDTO;
import com.sansam.adeye.service.IMemberService;


@Controller
public class HomeController {
	
	@Autowired
	IMemberService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
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
	
	// 로그인
		@RequestMapping(value = "/login", method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> login(MemberDTO data) {
			
			System.out.println("로그인 아이디 "+data.toString());
			Map<String,Object> paramMap = new HashMap<String, Object>();
			Map<String,Object> paramMapsub = new HashMap<String, Object>();
			
			try {
				
				MemberDTO mDto = service.login(data);
				char admin_yn = mDto.getAdmin_yn();
				String mem_id = mDto.getMem_id();
				
				if(admin_yn == 'N') {
					paramMapsub.put("move_url", "/pages/user/dashboard?mem_id=" + mem_id);
					paramMap.put("result", paramMapsub);
					paramMap.put("code", "200");
					paramMap.put("message", "로그인 성공");
				}else if(admin_yn == 'Y'){
					paramMapsub.put("move_url", "/pages/admin");
					paramMap.put("result", paramMapsub);
					paramMap.put("code", "200");
					paramMap.put("message", "로그인 성공");				
				}
				
			} catch (Exception e) {
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
	
	
}
