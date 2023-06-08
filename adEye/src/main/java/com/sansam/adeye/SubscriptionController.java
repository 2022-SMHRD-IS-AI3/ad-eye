package com.sansam.adeye;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sansam.adeye.domain.DeviceDTO;
import com.sansam.adeye.domain.MemberDTO;
import com.sansam.adeye.domain.SubscriptionDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/subscription")
@Log4j
public class SubscriptionController {
	
	// @Autowired
	// ISubcriptionService service;
	
	// 구독 등록
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> insert(SubscriptionDTO data) throws Exception {
		
		log.info("/subscription/insert.................."+ data.getSbs_seq());
		// 보내줄 맵 객체 생성
	    Map<String,Object> paramMap = new HashMap<String, Object>();
	    
	    try {
	    	
	    	//int cnt = service.subscriptionInsert(data);
	    	
	    	if(1 > 0 ) {
		    	
		    	paramMap.put("code", "201");
			    paramMap.put("message", "등록 성공");
			    
		    }else {
		    	
		    	paramMap.put("code", "203");
			    paramMap.put("message", "처리 실패");
			    
		    }
		} catch (Exception e) {
			paramMap.put("code", "500");
		    paramMap.put("message", "서버 문제");
		}
	    
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

//		    paramMapSub.put("mem-id", dto.getMem_id());
//		    paramMapSub.put("mem-pw", dto.getMem_pw());
//		    paramMapSub.put("mem-company", dto.getMem_company());
//		    paramMapSub.put("mem-phone", dto.getMem_phone());
//		    paramMapSub.put("mem-email", dto.getMem_email());
//		    paramMapSub.put("mem-status", dto.getMem_status());
//		    paramMapSub.put("mem-joindate", dto.getMem_joindate());
//		    paramMapSub.put("company-addr", dto.getCompany_addr());
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
		
		log.info("/subscription/update..................data : ");
		
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