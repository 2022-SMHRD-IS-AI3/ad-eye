package com.sansam.adeye;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sansam.adeye.domain.MemberDTO;
import com.sansam.adeye.service.IMemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {
	
	@Autowired
	IMemberService service;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() throws Exception{

		log.info("/member/register..............");
		
		return "/member/register";
	}
	
	// 회원 등록
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> insert(MemberDTO data) throws Exception {
		
		log.info("/member/insert..................");
		
		// 보내줄 맵 객체 생성,
	    Map<String,Object> paramMap = new HashMap<String, Object>();
	    
	    service.memberInsert(data);

	    paramMap.put("code", "201");
	    paramMap.put("message", "등록 성공");
	    
		return paramMap;
	}
	
	// 회원 상세 
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> detail(@RequestParam("mem-id") String data) throws Exception {
		
		log.info("/member/detail..................");
		
		// 보내줄 맵 객체 생성,
	    Map<String,Object> paramMap = new HashMap<String, Object>();
	    
	    MemberDTO dto = service.memberDetail(data);

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
	    
		return paramMap;
	}
	
	// 회원 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> update(MemberDTO data) throws Exception {
		
		log.info("/member/update..................");
		
		// 보내줄 맵 객체 생성,
	    Map<String, String> paramMap = new HashMap<String, String>();
	    
	    int cnt = service.memberUpdate(data);

	    if(cnt > 0) {
	    	paramMap.put("code", "202");
		    paramMap.put("message", "처리 완료");
	    } else {
	    	paramMap.put("code", "204");
		    paramMap.put("message", "조회 성공");
	    }
		
		return paramMap;
	}
	
	// 회원 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public @ResponseBody Map<String, String> delete(@RequestParam("mem-id") String data) throws Exception {
		
		log.info("/member/delete..................");
		
		// 보내줄 맵 객체 생성
	    Map<String, String> paramMap = new HashMap<String, String>();
	    
	    int cnt = service.memberDelete(data);

	    if(cnt > 0) {
	    	paramMap.put("code", "202");
		    paramMap.put("message", "처리 완료");
	    } else {
	    	paramMap.put("code", "204");
		    paramMap.put("message", "존재하지 않는 데이터입니다");
	    }
		return paramMap;
	}
	
}
