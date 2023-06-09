package com.sansam.adeye;

import java.util.ArrayList;
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
		
		// 보내줄 맵 객체 생성
	    Map<String,Object> paramMap = new HashMap<String, Object>();
	    
	    try {
	    	
		    int cnt = service.memberInsert(data);
	
		    if(cnt > 0 ) {
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

		    paramMapSub.put("mem_id", dto.getMem_id());
		    paramMapSub.put("mem_pw", dto.getMem_pw());
		    paramMapSub.put("mem_company", dto.getMem_company());
		    paramMapSub.put("mem_phone", dto.getMem_phone());
		    paramMapSub.put("mem_email", dto.getMem_email());
		    paramMapSub.put("mem_status", dto.getMem_status());
		    paramMapSub.put("mem_joindate", dto.getMem_joindate());
		    paramMapSub.put("company_addr", dto.getCompany_addr());
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
		
		// 보내줄 맵 객체 생성
	    Map<String, String> paramMap = new HashMap<String, String>();

	    try {
	    	
	    	int cnt = service.memberUpdate(data);

		    if(cnt > 0) {
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
	
	// 회원 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public @ResponseBody Map<String, String> delete(@RequestParam("mem_id") String data) throws Exception {

		log.info("/member/delete..................");
		
		// 보내줄 맵 객체 생성
	    Map<String, String> paramMap = new HashMap<String, String>();
	    
	    try {
	    	
		    int cnt = service.memberDelete(data);
			    
		    if(cnt > 0 ) {
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
	
	// 회원 목록
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> list(Criteria cri) throws Exception {
		log.info("/member/목록..................");
		Map<String,Object> paramMap = new HashMap<String, Object>();

		try {
			
			//List<DeviceDTO> dto = service.deviceLog(Integer.parseInt(data));
		    
		    // paramMap 담을 객체 생성
		    List<Map<String, Object>> paramMapSubList = new ArrayList<>();
		    for (int i = 0; i < 2; i++) {
		    	Map<String,Object> paramMapSub = new HashMap<String, Object>();
		    	paramMapSub.put("mem_id", "test012123");
			    paramMapSub.put("mem_company", "애드컴퍼니");
			    paramMapSub.put("mem_pw", "0000");
			    paramMapSub.put("mem_phone", "000-000-0000");
			    paramMapSub.put("mem_email", "smhrd@smhdrd.com");
			    paramMapSub.put("mem_status", "Y");
			    paramMapSub.put("mem_joindate", "2023-05-05 12:50:12");
			    paramMapSub.put("company_addr", "광주 동구 예술길 31-15");
			    
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

	// 회원 구독목록 조회
	@RequestMapping(value = "/devicelist", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> devicelist(Criteria cri, @RequestParam("mem_id") String data) throws Exception {
		log.info("/devicelist/메인 구독 목록..................");
		Map<String,Object> paramMap = new HashMap<String, Object>();

		try {
			System.out.println(cri.toString());
			System.out.println(data);
			//List<DeviceDTO> dto = service.deviceLog(Integer.parseInt(data));
		    
		    // paramMap 담을 객체 생성
			
			paramMap.put("mem_company", "애드컴퍼니");
			paramMap.put("sbs_total", "2");
		    List<Map<String, Object>> paramMapSubList = new ArrayList<>();
		    for (int i = 0; i < 2; i++) {
		    	Map<String,Object> paramMapSub = new HashMap<String, Object>();
		    	paramMapSub.put("sbs_seq", "test012123");
			    paramMapSub.put("sbs_alias", "애드컴퍼니");
			    paramMapSub.put("sbs_loc", "0000");
			    paramMapSub.put("sbs_total_man", "000-000-0000");
			    paramMapSub.put("sbs_total_interest", "smhrd@smhdrd.com");
			    paramMapSub.put("sbs_male_per", "Y");
			    paramMapSub.put("sbs_female_per", "2023-05-05 12:50:12");
			    
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
