package com.sansam.adeye;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.domain.MemberDTO;
import com.sansam.adeye.service.IMemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {
	
	@Autowired
	IMemberService service;
	
	// 관리자 - 회원 등록 페이지 접속
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() throws Exception{

		log.info("/member/register..............");
		
		return "/member/register";
	}
	
	// 관리자 - 회원 등록
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> insert(MemberDTO data) throws Exception {
		
		log.info("/member/insert.................."+ data.getMem_company());
		
			
		
		// 보내줄 맵 객체 생성,
	    Map<String,Object> paramMap = new HashMap<String, Object>();
	    
	    int cnt = service.memberInsert(data);

	    if(cnt > 0 ) {
	    	paramMap.put("code", "201");
		    paramMap.put("message", "등록 성공");
	    }else {
	    	paramMap.put("code", "203");
		    paramMap.put("message", "처리 실패");
	    }
	    
	    
		return paramMap;
	}
	
	// 회원 상세 
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> detail(@RequestParam("mem_id") String data) throws Exception {
		
		log.info("/member/detail..................data : " + data);
		
		Map<String,Object> paramMap = new HashMap<String, Object>();
		try {
			MemberDTO dto = service.memberDetail(data);
			// 보내줄 맵 객체 생성,
		    
		    // paramMap 담을 객체 생성 
		    Map<String,Object> paramMapSub = new HashMap<String, Object>();

		    paramMapSub.put("mem-id", dto.getMem_id());
		    paramMapSub.put("mem-pw", dto.getMem_pw());
		    paramMapSub.put("mem-company", dto.getMem_company());
		    paramMapSub.put("mem-phone", dto.getMem_phone());
		    paramMapSub.put("mem-email", dto.getMem_email());
		    paramMapSub.put("mem-status", dto.getMem_status());
		    paramMapSub.put("mem-joindate", dto.getMem_joindate());
		    paramMapSub.put("company-addr", dto.getCompany_addr());
		    paramMap.put("result", paramMapSub);
		    paramMap.put("code", "200");
		    paramMap.put("message", "조회 성공");
		} catch (Exception e) {
			paramMap.put("code", "204");
		    paramMap.put("message", "조회 실패");
		}
		
		
	    
		return paramMap;
	}
	
	// 회원 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> update(MemberDTO data) throws Exception {
		
		log.info("/member/update..................");
		
		// 보내줄 맵 객체 생성,
	    Map<String, String> paramMap = new HashMap<String, String>();
	    System.out.println(data.toString());
	    int cnt = service.memberUpdate(data);

	    if(cnt > 0) {
	    	paramMap.put("code", "202");
		    paramMap.put("message", "수정 완료");
	    } else {
	    	paramMap.put("code", "204");
		    paramMap.put("message", "수정 실패");
	    }
		
		return paramMap;
	}
	
	// 회원 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public @ResponseBody Map<String, String> delete(@RequestParam("mem_id") String data) throws Exception {

		log.info("/member/delete..................");
		
		// 보내줄 맵 객체 생성
	    Map<String, String> paramMap = new HashMap<String, String>();
	    
	    int cnt = service.memberDelete(data);
		    
	    if(cnt > 0 ) {
	    	paramMap.put("code", "201");
		    paramMap.put("message", "삭제 성공");
	    }else {
	    	paramMap.put("code", "203");
		    paramMap.put("message", "삭제 실패");
	    }
		return paramMap;
	}
	
	// 회원 목록
//		@RequestMapping(value = "/list", method = RequestMethod.GET)
//		public void list(Criteria cri) throws Exception {
//
//			log.info("/member/delete..................");
//			
//		}
}
