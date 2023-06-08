package com.sansam.adeye;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.sansam.adeye.domain.AcquisitionSubmitDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/acq")
@Log4j
public class AcquisitionController {
	
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
	public @ResponseBody Map<String,String> submit(@RequestBody List<AcquisitionSubmitDTO> data) {
		
		log.info("Welcome home! The client locale is {}");
		for (AcquisitionSubmitDTO adto : data) {
			System.out.println(adto.getDevice_uid()+"-"+adto.getAcq_tid()+"-"+adto.getAcq_start_dt()+"-"+adto.getAcq_end_dt()+"-"+adto.getAcq_interest()+"-"+adto.getAcq_gender());
		}
//		for (AiSubmitDTO dto : data) {
//			
//			System.out.println(dto.getData_time() +" ... " +dto.getEffect()+" ... " +dto.getGender());
//		}
		Map<String,String> paramMap = new HashMap<String, String>();
		paramMap.put("reboot_code", "0");
		return paramMap;
	}
	
	@RequestMapping(value = "/log", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> log(@RequestBody String data) { // @ResponseBody : 응답할 때 JSON 데이터로 반환
		
		System.out.println("test " + data);
		
		// 보내줄 맵 객체 생성, 
	    Map<String,Object> paramMap = new HashMap<String, Object>();

	    // paramMap 담을 객체 생성
	    Map<String,Object> paramMap2 = new HashMap<String, Object>();
	    
	    paramMap2.put("mem_id", "ad230531xxx");
	    paramMap.put("result", paramMap2);
	    paramMap.put("code", "201");
	    paramMap.put("message", "등록 성공");
	    
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
}
