package com.sansam.adeye;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.sansam.adeye.domain.AcquisitionSubmitDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/acq")
@Log4j
public class AcquisitionController {
	
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> acquisition(@RequestBody List<AcquisitionSubmitDTO> data) { // @ResponseBody : 응답할 때 JSON 데이터로 반환
		log.info("/tid_data................."+data.toString());
		
		for (AcquisitionSubmitDTO adto : data) {
			System.out.println(adto.getStart_data_time()+"-"+adto.getEnd_data_time()+"-"+adto.getEffect()+"-"+adto.getGender());
		}
		
		/*for (AcquisitionSubmitDTO dto : data) {
			
			System.out.println(dto.getEffect() +" ... " +dto.getGender());
		}*/
//		ObjectMapper mapper = new ObjectMapper();
//
//		List<AcquisitionSubmitDTO> board = mapper.readValue(data, List<AcquisitionSubmitDTO>);
		
		// 보내줄 맵 객체 생성, 
	    Map<String,Object> paramMap = new HashMap<String, Object>();

	    // paramMap 담을 객체 생성
	    Map<String,Object> paramMap2 = new HashMap<String, Object>();
	    
	    paramMap2.put("mem_id", "ad230531xxx");
	    paramMap.put("result", paramMap2);
	    paramMap.put("code", "201");
	    paramMap.put("message", "등록 성공");
	    
	    // {"result":{"mem-id":"ad230531xxx"},"code":"201","message":"등록 성공"}
		return paramMap;
		
	}
}
