package com.sansam.adeye;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/pages")
@Log4j
public class PagesController {
	
	// main
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main()throws Exception{
		
		log.info("/main.................");
		
		return "pages/main";
	}
	
	// 로그인	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login()throws Exception{
		
		log.info("/login.................");
		
		return "pages/login";
	}
	
	// 유저 ---------------------------------------------------------

	// 유저 로그인 후 구독 목록
	@RequestMapping(value = "/user/dashboard", method = RequestMethod.GET)
	public String userDashList()throws Exception{
		
		log.info("/user/dashboard.................");
		
		return "pages/user/dashboard/index";
	}
	
	// 유저 분석 대시보드
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String userDashboard()throws Exception{
		
		log.info("/user.................");
		
		return "pages/user/index";
	}

	// 유저 내 정보 수정
	@RequestMapping(value = "/user/register", method = RequestMethod.GET)
	public String userRegister()throws Exception{
		
		log.info("/user/register.................");
		
		return "pages/user/register/index";
	}
	
	// 관리자 ---------------------------------------------------------

	// 관리자 유저 목록
	@RequestMapping(value = "/admin/member", method = RequestMethod.GET)
	public String adminMemberList()throws Exception{
			
		log.info("/admin/member.................");
			
		return "pages/admin/member/index";
	}
	
	// 관리자 유저 정보
	@RequestMapping(value = "/admin/member/push", method = RequestMethod.GET)
	public String adminMemberPush()throws Exception{
		
		log.info("/admin/member/push.................");
		
		return "pages/admin/member/push/index";
	}
	
	// 관리자 대시보드
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminDashboard()throws Exception{
		
		log.info("/admin.................");
		
		return "pages/admin/index";
	}
	
	// 관리자 문의 목록
	@RequestMapping(value = "/admin/contact", method = RequestMethod.GET)
	public String contact_list()throws Exception{
		
		log.info("/admin/contact.................");
		
		return "pages/admin/contact/index";
	}
	
	// 관리자 문의 상세
	@RequestMapping(value = "/admin/contact/detail", method = RequestMethod.GET)
	public String contact_detail()throws Exception{
		
		log.info("/admin/contact/detail.................");
		
		return "pages/admin/contact/detail/index";
	}
	
	// 관리자 기기 목록
	@RequestMapping(value = "/admin/device", method = RequestMethod.GET)
	public String device_list()throws Exception{
		
		log.info("/admin/device.................");
		
		return "pages/admin/device/index";
	}
	
	// 관리자 기기 정보
	@RequestMapping(value = "/admin/device/push", method = RequestMethod.GET)
	public String device_register()throws Exception{
		
		log.info("/admin/device/push.................");
		
		return "pages/admin/device/push/index";
	}
	
	// 관리자 기기 팝업
	@RequestMapping(value = "/admin/device/pop", method = RequestMethod.GET)
	public String admin_user_dashboard()throws Exception{
		
		log.info("/admin/device/pop.................");
		
		return "pages/admin/device/pop/index";
	}
	
	// 관리자 구독 목록
	@RequestMapping(value = "/admin/sbs", method = RequestMethod.GET)
	public String subscription()throws Exception{
		
		log.info("/admin/sbs.................");
		
		return "pages/admin/sbs/index";
	}
	
	// 관리자 구독 정보
	@RequestMapping(value = "/admin/sbs/push", method = RequestMethod.GET)
	public String subscription_register()throws Exception{
		
		log.info("/admin/sbs/push.................");
		
		return "pages/admin/sbs/push/index";
	}
	
	// 관리자 로그 목록
	@RequestMapping(value = "/admin/log", method = RequestMethod.GET)
	public String log_list()throws Exception{
		
		log.info("/admin/log.................");
		
		return "pages/admin/log/index";
	}

}
