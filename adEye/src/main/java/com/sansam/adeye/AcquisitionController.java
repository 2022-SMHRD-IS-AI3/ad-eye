package com.sansam.adeye;


import java.util.Arrays;
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

import com.sansam.adeye.domain.AcqDTO;
import com.sansam.adeye.domain.AcqDashboardDTO;
import com.sansam.adeye.domain.AcquisitionDTO;
import com.sansam.adeye.domain.AcquisitionDashboardDTO;
import com.sansam.adeye.domain.AcquisitionSubmitDTO;
import com.sansam.adeye.domain.DeviceDTO;
import com.sansam.adeye.domain.LogDTO;
import com.sansam.adeye.persistence.impl.LogDAO;
import com.sansam.adeye.service.IAcquisitionService;
import com.sansam.adeye.service.IDeviceService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/acq")
@Log4j
public class AcquisitionController {
	
	@Autowired
	IAcquisitionService service;
	IDeviceService dservice;
	
	String code = "";
	String message = "";
	String reboot_code = "0";
	
	// 데이터 수집
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
	public @ResponseBody Map<String,String> submit(@RequestBody AcqDTO data) throws Exception {
		System.out.println(data.toString());
		log.info("수집 데이터 개수 : " + data.getAcq_list().size() + " 개");
		Map<String,String> paramMap = new HashMap<String, String>();
		
		try {
			reboot_code = "0";
			DeviceDTO result = service.acqCreate(data);
			
			if(result.getDevice_onoff() == 'R') {
				reboot_code = "1";
			}
			code = "201";
			message = "등록 성공";
			
		} catch (Exception e) {
			reboot_code = "0";
			code = "500";
			message = "서버 문제";
		}
		log.info(reboot_code);
		
		paramMap.put("reboot_code", reboot_code);
		paramMap.put("code", code);
	    paramMap.put("message", message);
	    
		return paramMap;
	}
	
	// 로그 수집
	@RequestMapping(value = "/log", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> log(@RequestBody List<LogDTO> data) throws Exception { // @ResponseBody : 응답할 때 JSON 데이터로 반환
		
		int result = service.logInsert(data);
		
		// 보내줄 맵 객체 생성
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		if(result == 1) {
			paramMap.put("code", "200");
			paramMap.put("message", "등록 성공");
		}else {
			paramMap.put("code", "500");
			paramMap.put("code", "서버 문제");
		}
	    
		return paramMap;
		
	}
	
	// 분석 페이지 화면 구성
	@RequestMapping(value = "/acqDashboard", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> acqDashboard(@RequestParam("sbs_seq") String sbs_seq,@RequestParam("search_date") String search_date) { // @ResponseBody : 응답할 때 JSON 데이터로 반환
		
		System.out.println("분석 메인 화면 ......sbs_seq: " + sbs_seq + ", search_date" + search_date);
		int seq = Integer.parseInt(sbs_seq);

		// 보내줄 맵 객체 생성
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		try {
			
			List<AcquisitionDashboardDTO> acdDto = service.totalCntList(new AcquisitionDTO(seq,search_date));
			System.out.println(acdDto);
			AcqDashboardDTO acDto = service.totalCnt(new AcquisitionDTO(seq,search_date));
			System.out.println(acDto);
			
			// 전체 노출인구 수 배열 선언
			int[] oneH_man_cnt = new int[24];
			// 전체 관심인구 수 배열 선언			
			int[] oneH_interest = new int[24];
			System.out.println(1);
			
			
			for (int i=0; i<24 ; i++) {
				// 하루 시간대별 노출인구 값 인덱스 순으로 저장
				oneH_man_cnt[i] = acdDto.get(i).getTotal_cnt();
				// 하루 시간대별 관심인구 값 인덱스 순으로 저장
				oneH_interest[i] = acdDto.get(i).getInterest_total_cnt();
			}
			// 하루 시간대별 전체 노출인구 수 확인
			System.out.println(Arrays.toString(oneH_man_cnt));
			// 하루 시간대별 전체 관심인구 수 확인
			System.out.println(Arrays.toString(oneH_interest));

			// 남자 노출인구 수
			int male_total_cnt = acDto.getMale_total_cnt();
			// 남자 관심인구 수			
			int male_interest_cnt = acDto.getMale_interest_cnt();
			// 여자 노출인구 수
			int female_total_cnt = acDto.getFemale_total_cnt();
			// 여자 관심인구 수
			int female_interest_cnt = acDto.getFemale_interest_cnt();
			// 여자 관심인구 수
			String update_time = acDto.getUpdate_time();
			// 하루 전체 노출인구 수
			int man_total = male_total_cnt + female_total_cnt;
			// 하루 전체 관심인구 수
			int interest_total = male_interest_cnt + female_interest_cnt;		
			
			// paramMap 담을 객체 생성
		    Map<String,Object> paramMapSub = new HashMap<String, Object>();
		    paramMapSub.put("oneH_man_cnt", oneH_man_cnt);
			paramMapSub.put("oneH_interest", oneH_interest);
			paramMapSub.put("man_total", man_total);
			paramMapSub.put("interest_total", interest_total);
			paramMapSub.put("male_total_cnt", male_total_cnt);
			paramMapSub.put("male_interest_cnt", male_interest_cnt);
			paramMapSub.put("female_total_cnt", female_total_cnt);
			paramMapSub.put("female_interest_cnt", female_interest_cnt);
			paramMapSub.put("update_time", update_time);
			    
		    
		    System.out.println(paramMapSub.toString());
		    
		    paramMap.put("result", paramMapSub);
		    paramMap.put("code", "200");
		    paramMap.put("message", "조회 성공");
		    
		} catch (Exception e) {
			
			paramMap.put("code", "500");
		    paramMap.put("message", "서버 문제");
		    
		}
		return paramMap;
	}
	
	// 데이터 중복값 제거(최댓값만 남기고)
	@RequestMapping(value = "/max_tid", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> acqMaxTid(@RequestBody String data) { // @ResponseBody : 응답할 때 JSON 데이터로 반환
		
		System.out.println("tid......uid: " + data);
		
		// 보내줄 맵 객체 생성
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		try {
			int max_tid = service.acqMaxTid(data);
			System.out.println(max_tid);
			paramMap.put("max_tid", max_tid);
			paramMap.put("code", "200");
		    paramMap.put("message", "전송 완료");
		} catch (Exception e) {
			
			paramMap.put("code", "500");
		    paramMap.put("message", "서버 문제");
		    
		}
		
		return paramMap;
		
	}
}
