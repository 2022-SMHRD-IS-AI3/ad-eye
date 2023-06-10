package com.sansam.adeye;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sansam.adeye.domain.DeviceDTO;
import com.sansam.adeye.domain.MemberDTO;
import com.sansam.adeye.domain.SubscriptionDTO;
import com.sansam.adeye.service.ISubscriptionService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/subscription")
@Log4j
public class SubscriptionController {
	
	 @Autowired
	 ISubscriptionService service;
	
	// 구독 등록
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> insert(SubscriptionDTO data) throws Exception {
		
		log.info("/subscription/insert.................."+ data.toString());
		// 보내줄 맵 객체 생성
	    Map<String,Object> paramMap = new HashMap<String, Object>();
	    
	    
	    try {
	    	
	    	System.out.println("test1");
	    	int cnt = service.sbsInsert(data);
	    	System.out.println("test2");
	    	if(cnt > 0 ) {
		    	
		    	paramMap.put("code", "201");
			    paramMap.put("message", "등록 성공");
			    
			    System.out.println("test3");
		    }else {
		    	
		    	paramMap.put("code", "203");
			    paramMap.put("message", "처리 실패");
			    System.out.println("test4");
			    
		    }
		} catch (Exception e) {
			paramMap.put("code", "500");
		    paramMap.put("message", "서버 문제");
		    System.out.println("test5");
		}
	    System.out.println("test6");
		return paramMap;
	}
	
	// 구독 상세 
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> detail(@RequestParam("sbs_seq") String data) throws Exception {
		
		log.info("/subscription/detail..................data : " + data);
		
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		try {
			
			// SubscriptionDTO dto = service.subscriptionDetail(data);
			// 보내줄 맵 객체 생성,
		    
		    // paramMap 담을 객체 생성 
		    Map<String,Object> paramMapSub = new HashMap<String, Object>();

		    paramMapSub.put("sbs_seq", 1);
		    paramMapSub.put("mem-pw", 0000);
		    paramMapSub.put("mem_id", "test012123");
		    paramMapSub.put("mem_company", "애드컴퍼니");
		    paramMapSub.put("device_seq", 1);
		    paramMapSub.put("sbs_loc", "광주 동구 예술길 31_15");
		    paramMapSub.put("sbs_alias", "별칭");
		    paramMapSub.put("sbs_start_dt", "2023-04-01");
		    paramMapSub.put("sbs_end_dt", "2023-04-01");
		    paramMapSub.put("sbs_end_dt", "2023-04-01");
		    paramMapSub.put("sbs_reg_dt", "2023-04-01");
		    paramMapSub.put("sbs_grade", "standard");
		    paramMapSub.put("sbs_status ", "Y");
		    paramMap.put("result", paramMapSub);
		    paramMap.put("code", "200");
		    paramMap.put("message", "조회 성공");
		    
		} catch (Exception e) {
			paramMap.put("code", "204");
		    paramMap.put("message", "조회 실패");
		}
	    
		return paramMap;
	}
	
	// 구독 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> update(SubscriptionDTO data) throws Exception {
		
		log.info("/subscription/update..................data : "+data.toString());
		
		// 보내줄 맵 객체 생성
	    Map<String, String> paramMap = new HashMap<String, String>();
	    
	    try {
	    	
	    	// int cnt = service.subscriptionUpdate(data);

		    if(1 > 0) {
		    	paramMap.put("code", "202");
			    paramMap.put("message", "수정 완료");
		    } else {
		    	paramMap.put("code", "204");
			    paramMap.put("message", "수정 실패");
		    }
		    
		} catch (Exception e) {
			paramMap.put("code", "500");
		    paramMap.put("message", "서버 문제");
		}
		return paramMap;
		
	}
	
	// 구독 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public @ResponseBody Map<String, String> delete(@RequestParam("sbs_seq") String data) throws Exception {
		
		log.info("/subscription/delete..................");
		
		// 보내줄 맵 객체 생성
	    Map<String, String> paramMap = new HashMap<String, String>();
	    
	    try {
	    	
	    	// int cnt = service.subscriptionDelete(Integer.parseInt(data));
		    
		    if(1 > 0 ) {
		    	paramMap.put("code", "201");
			    paramMap.put("message", "삭제 성공");
		    }else {
		    	paramMap.put("code", "203");
			    paramMap.put("message", "삭제 실패");
		    }
		    
		} catch (Exception e) {
			paramMap.put("code", "500");
		    paramMap.put("message", "서버 문제");
		}
	    
		return paramMap;
	}
	
	
	
	
	
}
