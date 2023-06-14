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
	// user dash list
	@RequestMapping(value = "/user_dash_list", method = RequestMethod.GET)
	public String userDashList()throws Exception{
		
		log.info("/user_dashboard.................");
		
		return "pages/user_dash_list";
	}
	
	// user dashboard
	@RequestMapping(value = "/user_dashboard", method = RequestMethod.GET)
	public String userDash()throws Exception{
		
		log.info("/user_dashboard.................");
		
		return "pages/user_dashboard";
	}

	// login	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login()throws Exception{
		
		log.info("/login.................");
		
		return "pages/login";
	}
	
	// main
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String main()throws Exception{
		
		log.info("/index.................");
		
		return "pages/index";
	}
	
	// admin_user_register
	@RequestMapping(value = "/user_register", method = RequestMethod.GET)
	public String user_register()throws Exception{
		
		log.info("/user_register.................");
		
		return "pages/user_register";
	}

	// admin_user_management_list
	@RequestMapping(value = "/user_management", method = RequestMethod.GET)
	public String user_management()throws Exception{
			
		log.info("/user_management.................");
			
		return "pages/user_management";
	}
	
	// admin_dashboard
	@RequestMapping(value = "/admin_dashboard", method = RequestMethod.GET)
	public String admin_dashboard()throws Exception{
		
		log.info("/admin_dashboard.................");
		
		return "pages/admin_dashboard";
	}
	
	// contact_detail
	@RequestMapping(value = "/contact_detail", method = RequestMethod.GET)
	public String contact_detail()throws Exception{
		
		log.info("/contact_detail.................");
		
		return "pages/contact_detail";
	}
	

	// contact_list
		@RequestMapping(value = "/contact_list", method = RequestMethod.GET)
		public String contact_list()throws Exception{
			
			log.info("/contact_list.................");
			
			return "pages/contact_list";
		}
	
	// admin_user_dashboard
	@RequestMapping(value = "/admin_user_dashboard", method = RequestMethod.GET)
	public String admin_user_dashboard()throws Exception{
		
		log.info("/admin_user_dashboard.................");
		
		return "pages/admin_user_dashboard";
	}
	
		
	
	// subscription
	@RequestMapping(value = "/subscription", method = RequestMethod.GET)
	public String subscription()throws Exception{
		
		log.info("/subscription.................");
		
		return "pages/subscription";
	}
	
	// subscription_register
	@RequestMapping(value = "/subscription_register", method = RequestMethod.GET)
	public String subscription_register()throws Exception{
		
		log.info("/subscription_register.................");
		
		return "pages/subscription_register";
	}
	
	
	// log_list
		@RequestMapping(value = "/log_list", method = RequestMethod.GET)
		public String log_list()throws Exception{
			
			log.info("/log_list.................");
			
			return "pages/log_list";
		}
	
//	// Login 을 위한 HTML 파일 내려주기
//    @GetMapping("/pages/user_dash_list")
//    public String loginPage() {
//    	
//    	log.info("/user_dash_list.................");
//        return "/pages/user_dash_list";
//    }

}
