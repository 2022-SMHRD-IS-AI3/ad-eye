package com.sansam.adeye;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.domain.MemberDTO;
import com.sansam.adeye.domain.PageDTO;
import com.sansam.adeye.domain.SubscriptionDTO;
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
		System.out.println(data);
		// 보내줄 맵 객체 생성
	    Map<String, String> paramMap = new HashMap<String, String>();

	    try {
	    	
	    	int cnt = service.memberUpdate(data);
	    	System.out.println(cnt);
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
	public @ResponseBody Map<String, Object> memberList(Criteria cri) throws Exception {
		log.info("/member/목록..................");
	    // paramMap 담을 객체 생성
		Map<String,Object> paramMap = new HashMap<String, Object>();

		try {
			// 회원 목록 정보 불러오기
			List<MemberDTO> mDtoList = service.memberList(cri);
			System.out.println(mDtoList);
		    // mDtoList = [{mem_id : , mem_company : , mem_phone : , mem_email : , 
			//              mem_status : ,mem_joindate : company_adrr : , mem_pw : },{...},{...}]
			// mem_pw : 해당 회원이 현재 구독 중인 수
			int total = service.totalCnt(cri);
			System.out.println(total);
			// total : 총 회원 수 (상태 값 Y 인 경우만)
			paramMap.put("pageMaker", new PageDTO(cri, total));
		    paramMap.put("result", mDtoList);
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
	public @ResponseBody Map<String, Object> devicelist(Criteria cri) throws Exception {
		log.info("/devicelist/회원 구독 목록..................");
		Map<String,Object> paramMap = new HashMap<String, Object>();

		try {
			System.out.println(cri.toString());
			// 회원 구독 목록 불러오기
			List<SubscriptionDTO> sDtoList = service.devicelist(cri);
			System.out.println(sDtoList);
			String mem_company = service.memSbsData(cri).getMem_company();
			System.out.println(mem_company);
			int sbs_total = service.memSbsData(cri).getSbs_total();
			System.out.println(sbs_total);
		    // paramMap 담을 객체 생성
			Map<String,Object> paramMapsub = new HashMap<String, Object>();

			paramMapsub.put("mem_company", mem_company);
			// 해당 회원이 현재 구독 중인 수
			paramMapsub.put("sbs_total", sbs_total);
			// sDtoList = [{sbs_seq : , sbs_alias : , sbs_loc : , sbs_total_man : , sbs_total_interest : ,
			//              sbs_male_per : , sbs_female_per : },{...},{...}]
			// sbs_total_man = 전체 노출 인구 수
			// sbs_total_interest = 전체 관심 인구 수
			// sbs_male_per = 전체 노출 인구 중 남자
			// sbs_female_per = 전체 노출 인구 중 여자
			paramMapsub.put("sbs_list", sDtoList);
			paramMap.put("result", paramMapsub);
		    paramMap.put("code", "200");
		    paramMap.put("message", "조회 성공");
		    
		} catch (Exception e) {
			
			paramMap.put("code", "500");
		    paramMap.put("message", "서버 문제");
		    
		}
	    
		return paramMap;
		
		
	}
	
	// 회원 아이디 존재 여부 확인
		@RequestMapping(value = "/sbsIdCheck", method = RequestMethod.GET)
		public @ResponseBody Map<String, Object> idCheck(@RequestParam("mem_id") String data) throws Exception {
			log.info("/sbsIdCheck/아이디 확인하기.....");
			Map<String,Object> paramMap = new HashMap<String, Object>();
			
			try {
				
				int cnt = service.sbsIdCheck(data);
				
				if (cnt > 0) {
					
				    paramMap.put("code", "200");
				    paramMap.put("message", "조회 성공");
					
				}else {
					paramMap.put("code", "204");
				    paramMap.put("message", "존재하지 않는 아이디");
				}
				
			} catch (Exception e) {
				paramMap.put("code", "500");
			    paramMap.put("message", "서버 문제");
			}
			
			return paramMap;
		}
}
