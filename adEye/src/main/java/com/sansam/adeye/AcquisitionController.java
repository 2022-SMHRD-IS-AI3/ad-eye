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
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> dashboard(@RequestParam("sbs_seq") String sbs_seq,@RequestParam("search_date") String search_date) { // @ResponseBody : 응답할 때 JSON 데이터로 반환
		
		System.out.println("분석 메인 화면 ......sbs_seq: " + sbs_seq);
		
		// 보내줄 맵 객체 생성
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		try {
			
			//List<DeviceDTO> dto = service.deviceLog(Integer.parseInt(data));
		    
		    // paramMap 담을 객체 생성
			
		    List<Map<String, Object>> paramMapSubList = new ArrayList<>();
		    for (int i = 0; i < 2; i++) {
		    	Map<String,Object> paramMapSub = new HashMap<String, Object>();
		    	paramMapSub.put("device_seq", 1);
			    paramMapSub.put("device_uid", "device-test");
			    paramMapSub.put("device_NM", "기기네임");
			    paramMapSub.put("device_onoff", "Y");
			    paramMapSub.put("device_status", "Y");
			    paramMapSub.put("device_dt", "2023-05-05 12:50:12");
			    
			    paramMapSubList.add(paramMapSub);
			}
		    
		    System.out.println(paramMapSubList.toString());
		    
		    paramMap.put("result", paramMapSubList);
		    paramMap.put("code", "200");
		    paramMap.put("message", "조회 성공");
		    
		} catch (Exception e) {
			
			paramMap.put("code", "500");
		    paramMap.put("message", "서버 문제");
		    
		}
	    
		return paramMap;
		
	}
}
