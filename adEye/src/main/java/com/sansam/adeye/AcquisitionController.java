package com.sansam.adeye;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.sansam.adeye.domain.AcquisitionSubmitDTO;
import com.sansam.adeye.domain.DeviceDTO;
import com.sansam.adeye.domain.LogDTO;
import com.sansam.adeye.persistence.impl.LogDAO;
import com.sansam.adeye.service.IAcquisitionService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/acq")
@Log4j
public class AcquisitionController {
	
	@Autowired
	IAcquisitionService service;
	
	String code = "";
	String message = "";
	String reboot_code = "0";
	
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
	public @ResponseBody Map<String,String> submit(@RequestBody List<AcquisitionSubmitDTO> data) throws Exception {
		System.out.println(data.toString());
		log.info("수집 데이터 개수 : " + data.size() + " 개");
		Map<String,String> paramMap = new HashMap<String, String>();
		
		try {
			
			if(data.size() > 0) {
				DeviceDTO result = service.acqCreate(data);
				System.out.println(result.toString());
				if(result.getDevice_onoff() == 'R') {
					reboot_code = "1";
				}
				code = "201";
				message = "등록 성공";
			}else {
				code = "206";
				message = "전송데이터 없음";
			}
			
			
		} catch (Exception e) {
			reboot_code = "0";
			code = "500";
			message = "서버 문제";
		}
		
		System.out.println(code);
		System.out.println(message);
		
		paramMap.put("reboot_code", reboot_code);
		paramMap.put("code", code);
	    paramMap.put("message", message);
	    
		return paramMap;
	}
	
	@RequestMapping(value = "/log", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> log(@RequestBody List<LogDTO> data) throws Exception { // @ResponseBody : 응답할 때 JSON 데이터로 반환
		
		int result = service.logInsert(data);
		
		// 보내줄 맵 객체 생성
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		if(result == 1) {
			paramMap.put("code", "200");
			paramMap.put("message", "등록 성공");
		}else {
			paramMap.put("code", "500");
			paramMap.put("code", "서버 문제");
		}
	    
		return paramMap;
		
	}
	
	@RequestMapping(value = "/acqDashboard", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> acqDashboard(@RequestParam("sbs_seq") String sbs_seq,@RequestParam("search_date") String search_date) { // @ResponseBody : 응답할 때 JSON 데이터로 반환
		
		System.out.println("분석 메인 화면 ......sbs_seq: " + sbs_seq);
		
		// 보내줄 맵 객체 생성
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		try {
			//List<DeviceDTO> dto = service.deviceLog(Integer.parseInt(data));
			int[] oneH_man_cnt = {50,23,15,46,84,53,200,489,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
			int[] oneH_interest = {30,13,5,26,34,23,110,189,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
			
			int man_total = 1634;
			int interest_total = 811;
			int male_cnt = 1154;
			int female_cnt = 480;
					
			// paramMap 담을 객체 생성
		    Map<String,Object> paramMapSub = new HashMap<String, Object>();
		    paramMapSub.put("oneH_man_cnt", oneH_man_cnt);
			paramMapSub.put("oneH_interest", oneH_interest);
			paramMapSub.put("man_total", man_total);
			paramMapSub.put("interest_total", interest_total);
			paramMapSub.put("male_cnt", male_cnt);
			paramMapSub.put("female_cnt", female_cnt);
			    
		    
		    System.out.println(paramMapSub.toString());
		    
		    paramMap.put("result", paramMapSub);
		    paramMap.put("code", "200");
		    paramMap.put("message", "조회 성공");
		    
		} catch (Exception e) {
			
			paramMap.put("code", "500");
		    paramMap.put("message", "서버 문제");
		    
		}
	    
		return paramMap;
		
	}
	
	@RequestMapping(value = "/max_tid", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> acqMaxTid(@RequestBody String data) { // @ResponseBody : 응답할 때 JSON 데이터로 반환
		
		System.out.println("tid......uid: " + data);
		
		// 보내줄 맵 객체 생성
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		try {
			int max_tid = service.acqMaxTid(data);
			System.out.println(max_tid);
			paramMap.put("max_tid", max_tid);
			paramMap.put("code", "200");
		    paramMap.put("message", "전송 완료");
		} catch (Exception e) {
			
			paramMap.put("code", "500");
		    paramMap.put("message", "서버 문제");
		    
		}
		
		return paramMap;
		
	}
}
