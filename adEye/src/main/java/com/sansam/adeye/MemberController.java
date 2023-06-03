package com.sansam.adeye;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sansam.adeye.domain.MemberDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String bookList(@RequestParam("bno") int bno) {
		System.out.println(bno);
		return "login";
	}
	
	// 예시 컨트롤러 코드 작성
//		@RequestMapping(value = "/member", method = RequestMethod.POST)
//		public @ResponseBody Map<String,Object> member(MemberDTO data) { // @ResponseBody : 응답할 때 JSON 데이터로 반환
//			log.info("/member.................");
//			
//			if(data.getMem_id().equals("admin") && data.getMem_pw().equals("123")) {
//				System.out.println(data.getMem_id());
//				System.out.println(data.getMem_pw());
//			}
//			
//			
//			// 보내줄 맵 객체 생성,
//		    Map<String,Object> paramMap = new HashMap<String, Object>();
//
//		    // paramMap 담을 객체 생성
//		    Map<String,Object> paramMap2 = new HashMap<String, Object>();
//		      
//		    paramMap2.put("mem-id", "ad230531xxx");
//		    paramMap.put("result", paramMap2);
//		    paramMap.put("code", "201");
//		    paramMap.put("message", "등록 성공");
//		    
//		    // {"result":{"mem-id":"ad230531xxx"},"code":"201","message":"등록 성공"}
//			return paramMap;
//			
//		}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> insert(MemberDTO data) throws Exception {
		// 보내줄 맵 객체 생성,
	    Map<String,Object> paramMap = new HashMap<String, Object>();
	    
	    

	    // paramMap 담을 객체 생성
	    Map<String,Object> paramMapSub = new HashMap<String, Object>();
		paramMapSub.put("mem-id", "ad230531xxx");
	    paramMap.put("result", paramMapSub);
	    paramMap.put("code", "201");
	    paramMap.put("message", "등록 성공");
	    
		return paramMap;
	}
}



