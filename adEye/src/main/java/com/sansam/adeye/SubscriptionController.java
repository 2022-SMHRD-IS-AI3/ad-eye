package com.sansam.adeye;

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
import com.sansam.adeye.domain.DeviceDTO;
import com.sansam.adeye.domain.MemberDTO;
import com.sansam.adeye.domain.PageDTO;
import com.sansam.adeye.domain.SubscriptionDTO;
import com.sansam.adeye.service.ISubscriptionService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/subscription")
@Log4j
public class SubscriptionController {
	
	 @Autowired
	 ISubscriptionService service;
	
	 // 전체 구독 조회
	 @RequestMapping(value = "/", method = RequestMethod.GET)
	 public @ResponseBody Map<String, Object> sbsList(Criteria cri) throws Exception {
		 log.info("/subscription/list " + cri);
		 Map<String,Object> paramMap = new HashMap<String, Object>();
		 int seq = Integer.parseInt(cri.getSeq()); 
		 
		 try {
		 	 
			 	if (seq > 0) {
			 		// 구독 만료 5일 이내 목록 정보 불러오기
			 		List<SubscriptionDTO> sList = service.sbsListExpiry(cri);
			 		System.out.println(sList);
				    // sList = [{sbs_seq : , mem_id : , device_seq : , mem_company : , sbs_loc : , 
				    //           sbs_alias : , sbs_start_dt : , sbs_end_dt : , sbs_reg_dt : , sbs_grade : , 
				    //           sbs_status : , d_day : },{...},{...}]
				    // d_day : 계약 만료 까지 잔여일
					int total = service.dDayCnt(cri);
					System.out.println(total);
					paramMap.put("pageMaker", new PageDTO(cri, total));
				    paramMap.put("result", sList);
			 	}else {
			 		// 구독 목록 정보 불러오기
					List<SubscriptionDTO> sList = service.sbsList(cri);
					System.out.println(sList);
				    // sList = [{sbs_seq : , mem_id : , device_seq : , mem_company : , sbs_loc : , 
				    //           sbs_alias : , sbs_start_dt : , sbs_end_dt : , sbs_reg_dt : , sbs_grade : , 
				    //           sbs_status : , d_day : },{...},{...}]
				    // d_day : 계약 만료 까지 잔여일
					int total = service.totalCnt(cri);
					System.out.println(total);
					paramMap.put("pageMaker", new PageDTO(cri, total));
				    paramMap.put("result", sList);
			 	}
				

			    paramMap.put("code", "200");
			    paramMap.put("message", "조회 성공");
			} catch (Exception e) {
				paramMap.put("code", "500");
			    paramMap.put("message", "서버 문제");
			}
		 
		 return paramMap;
	 }
	 
	// 구독 등록
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> insert(SubscriptionDTO data) throws Exception {
		
		log.info("/subscription/insert.................."+ data.toString());
		// 보내줄 맵 객체 생성
	    Map<String,Object> paramMap = new HashMap<String, Object>();
	    int seq = data.getDevice_seq();
	    System.out.println(seq);
	    
	    try {
	    	
	    	int cnt = service.sbsInsert(data);
	    	int dev_cnt = service.devStatusOn(seq); 

	    	if(cnt > 0 && dev_cnt > 0) {
		    	
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
		// 보내줄 맵 객체 생성
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		try {
			
			SubscriptionDTO dto = service.sbsDetail(Integer.parseInt(data));
			System.out.println(dto.toString());

		    paramMap.put("result", dto);
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
	    int sbs_seq = data.getSbs_seq();
	    int dev_seq = data.getDevice_seq();

	    try {
		    int before_dev_seq = service.sbsDetail(sbs_seq).getDevice_seq();
		    if (before_dev_seq != dev_seq) {
		    	service.devStatusOff(before_dev_seq);
		    }
	    	
	    	int cnt = service.sbsUpdate(data);
	    	int dev_cnt = 0;
	    	
	    	char status = service.sbsDetail(sbs_seq).getSbs_status();
	    	
	    	if (status == 'N') {
	    		dev_cnt = service.devStatusOff(dev_seq);
	    	}else if (status == 'Y') {
	    		dev_cnt = service.devStatusOn(dev_seq);
	    	}
	    	
		    if(cnt > 0 && dev_cnt > 0) {
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
		
		log.info("/subscription/delete.................." + data);
		
		// 보내줄 맵 객체 생성
	    Map<String, String> paramMap = new HashMap<String, String>();
	    
	    try {
	    	int dev_seq = service.sbsDetail(Integer.parseInt(data)).getDevice_seq();
	    	
	    	int cnt = service.sbsDelete(Integer.parseInt(data));
	    	service.devStatusOff(dev_seq);
		    
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
