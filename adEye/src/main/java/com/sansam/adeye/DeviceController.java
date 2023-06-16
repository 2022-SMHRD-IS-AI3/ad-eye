package com.sansam.adeye;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
import com.sansam.adeye.domain.LogDTO;
import com.sansam.adeye.domain.PageDTO;
import com.sansam.adeye.service.IDeviceService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/device")
@Log4j
public class DeviceController {
	
	@Autowired
	IDeviceService service;
	
	// 관리자 - 기기 등록 페이지 접속
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() throws Exception {
		
		log.info("/device/register............");
		
		return "/device/register";
		
	}
	
	// 관리자 - 기기 등록
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> insert(@RequestBody DeviceDTO data) throws Exception {
		
		log.info("/device/insert.................."+ data.getDevice_uid());
		
		// 보내줄 맵 객체 생성
	    Map<String,Object> paramMap = new HashMap<String, Object>();
	    
	    try {
	    	
	    	int cnt = service.deviceInsert(data);
	    	
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
	
	// 기기 상세
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> detail(@RequestParam("device_seq") String data) throws Exception {

		log.info("/device/detail..................data : " + data);
		
		// 보내줄 맵 객체 생성
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		try {
			
			DeviceDTO dto = service.deviceDetail(Integer.parseInt(data));

		    paramMap.put("result", dto);
		    paramMap.put("code", "200");
		    paramMap.put("message", "조회 성공");
		    
		} catch (Exception e) {
			
			paramMap.put("code", "500");
		    paramMap.put("message", "서버 문제");
		    
		}
		
		return paramMap;
	}
	
	// 기기 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> update(DeviceDTO data) throws Exception {
		
		log.info("/device/update..................data : ");
		
		// 보내줄 맵 객체 생성
	    Map<String, String> paramMap = new HashMap<String, String>();
	    
	    try {
	    	
	    	int cnt = service.deviceUpdate(data);

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
	
	// 기기 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public @ResponseBody Map<String, String> delete(@RequestParam("device_seq") String data) throws Exception {
		
		log.info("/device/delete..................");
		
		// 보내줄 맵 객체 생성
	    Map<String, String> paramMap = new HashMap<String, String>();
	    
	    try {
	    	
	    	int cnt = service.deviceDelete(Integer.parseInt(data));
		    
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
	

	// 기기 onoff
	@RequestMapping(value = "/onoff", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> onoff(DeviceDTO data) throws Exception {
		
		log.info("/device/onoff..................data : "+data);
		
		// 보내줄 맵 객체 생성
	    Map<String, String> paramMap = new HashMap<String, String>();
	    
	    try {
	    	
	    	int cnt = service.deviceControl(data); // data로 변경

		    if(cnt > 0) {
		    	paramMap.put("code", "202");
			    paramMap.put("message", "처리 완료");
		    } else {
		    	paramMap.put("code", "204");
			    paramMap.put("message", "처리 실패");
		    }
		    
		} catch (Exception e) {
			paramMap.put("code", "500");
		    paramMap.put("message", "서버 문제");
		}
	    
	    
		return paramMap;
	}
	
	// 기기 로그 조회
	@SuppressWarnings("null")
	@RequestMapping(value = "/log", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> log(Criteria cri, @RequestParam("device_seq") String data) throws Exception {

		log.info("/device/log...data : " + cri);
		// device_seq 값을 cri 에 있는 type 이라는 key 값의 value 로 저장
		// mapper에서 type 이라는 key로 불러서 TO_NUMBER 로 타입변환 후 사용 
		cri.setType(data);
		System.out.println(cri);
		
		// 보내줄 맵 객체 생성
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		try {
			
			List<LogDTO> lList = service.deviceLog(cri);
		    System.out.println(lList.toString());
		    // lList = [{log_seq : , log_msg : , log_dt : , device_uid : , sbs_alias : },{...},{...}]
		    int total = service.devLogCnt(cri);
		    System.out.println(total);
		    // total : 특정 기기 로그 수
		    paramMap.put("pageMaker", new PageDTO(cri, total));
		    paramMap.put("result", lList);
		    paramMap.put("code", "200");
		    paramMap.put("message", "조회 성공");
		    
		} catch (Exception e) {
			
			paramMap.put("code", "500");
		    paramMap.put("message", "서버 문제");
		    
		}
		
		return paramMap;
	}
	
	// 기기 전체 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> deviceList(Criteria cri) throws Exception {
		
		log.info("/device/log...data : " + cri);
		
		// 보내줄 맵 객체 생성
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		try {
			
			List<DeviceDTO> dList = service.deviceList(cri);
			System.out.println(dList.toString());
		    // dList = [{device_seq : , device_uid : , device_onoff : , device_status : , device_dt : , 
		    //           mem_company : , sbs_seq : , sbs_alias : , data_check : },{...},{...}]
		    // data_check : 5분간 넘어온 Log 개수
			int total = service.totalCnt(cri);
			System.out.println(total);
			// total : 등록된 기기 총 수 (상태값 D가 아닌 것)
			paramMap.put("pageMaker", new PageDTO(cri, total));
		    paramMap.put("result", dList);
		    paramMap.put("code", "200");
		    paramMap.put("message", "조회 성공");
		} catch (Exception e) {
			paramMap.put("code", "500");
		    paramMap.put("message", "서버 문제");
		}
		return paramMap;
	}

	
	// 전체 로그 조회
	@RequestMapping(value = "/logList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> logList(Criteria cri) throws Exception {
		
		log.info("/device/log...data : " + cri);
		
		// 보내줄 맵 객체 생성
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		try {
			
			List<LogDTO> logList = service.LogList(cri);
		    // logList = [{log_seq : , log_msg : , log_dt : , device_uid : , sbs_loc : },{...},{...}]
			int total = service.logTotalCnt(cri);
			System.out.println(total);
			// total : 전체 로그 수
			paramMap.put("pageMaker", new PageDTO(cri, total));
		    paramMap.put("result", logList);
		    paramMap.put("code", "200");
		    paramMap.put("message", "조회 성공");
			
		} catch (Exception e) {
			paramMap.put("code", "500");
		    paramMap.put("message", "서버 문제");
		}
		
		return paramMap;
	}
	
	// 기기 간단 목록 조회
	@RequestMapping(value = "/simple", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> deviceSimpleList() throws Exception {
		
		log.info("/device/simple... : ");
		
		// 보내줄 맵 객체 생성
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		try {
			
			List<DeviceDTO> dList = service.deviceSimpleList();
			System.out.println(dList.toString());
		    paramMap.put("result", dList);
		    paramMap.put("code", "200");
		    paramMap.put("message", "조회 성공");
		} catch (Exception e) {
			paramMap.put("code", "500");
		    paramMap.put("message", "서버 문제");
		}
		return paramMap;
	}
	
	
	
}
