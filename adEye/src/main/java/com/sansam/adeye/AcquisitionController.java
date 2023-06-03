package com.sansam.adeye;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sansam.adeye.domain.AcquisitionSubmitDTO;
import com.sansam.adeye.domain.MemberDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/acquisition")
@Log4j
public class AcquisitionController {
	
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> acquisition(@RequestParam("tid_data") List<AcquisitionSubmitDTO> data) { // @ResponseBody : 응답할 때 JSON 데이터로 반환
		log.info("/tid_data.................");
		
		for (AcquisitionSubmitDTO dto : data) {
			
			System.out.println(dto.getNow_time() +" ... " +dto.getTid_gender());
		}
		
		// 보내줄 맵 객체 생성, 
	    Map<String,Object> paramMap = new HashMap<String, Object>();

	    // paramMap 담을 객체 생성
	    Map<String,Object> paramMap2 = new HashMap<String, Object>();
	      
	    paramMap2.put("mem-id", "ad230531xxx");
	    paramMap.put("result", paramMap2);
	    paramMap.put("code", "201");
	    paramMap.put("message", "등록 성공");
	    
	    // {"result":{"mem-id":"ad230531xxx"},"code":"201","message":"등록 성공"}
		return paramMap;
		
	}
}
