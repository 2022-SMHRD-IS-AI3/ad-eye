package com.sansam.adeye;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sansam.adeye.domain.AdminDashboardDTO;
import com.sansam.adeye.service.IAdminDashboardService;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {

	@Autowired
	IAdminDashboardService service;

	// 관리자 대시보드 (관리자 페이지 기본 화면 구성)
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> adminDashboard(HttpSession session) throws Exception {
		
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		if(session.getAttribute("LoginId") != null) {
			
			Map<String,Object> paramMapSub = new HashMap<String, Object>();
			AdminDashboardDTO dto = service.adminView('Y');				
			
			// 미확인 문의글 수
		    paramMapSub.put("contact_noread_cnt", dto.getContact_noread_cnt());
		    // 총 문의글 수
		    paramMapSub.put("contact_total", dto.getContact_total());
		    // 사용중인 기기 수
		    paramMapSub.put("device_use_cnt", dto.getDevice_use_cnt());
		    // 등록 된 기기 수
		    paramMapSub.put("device_total", dto.getDevice_total());
		    // 구독 중 계약 만료 5일 이내 수
		    paramMapSub.put("sbs_dday", dto.getSbs_dday());
		    // 현재 구독 중 수
		    paramMapSub.put("sbs_total", dto.getSbs_total());
		    paramMap.put("result", paramMapSub);
			paramMap.put("code", "200");
			paramMap.put("message", "조회 성공");
		}else {
			paramMap.put("code", "202");
			paramMap.put("message", "로그인 후 이용해주세요");
		}
		
		return paramMap;
	}
}
