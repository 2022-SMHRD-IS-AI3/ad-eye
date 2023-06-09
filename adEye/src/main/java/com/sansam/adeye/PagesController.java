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
	
	@RequestMapping(value = "/user_dashboard", method = RequestMethod.GET)
	public String userDashList()throws Exception{
		
		log.info("/user_dashboard.................");
		
		return "pages/user_dashboard";
	}
	
	
	
//	// Login 을 위한 HTML 파일 내려주기
//    @GetMapping("/pages/user_dash_list")
//    public String loginPage() {
//    	
//    	log.info("/user_dash_list.................");
//        return "/pages/user_dash_list";
//    }

}
