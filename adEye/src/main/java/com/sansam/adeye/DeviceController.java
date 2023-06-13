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
		    
		    // paramMap 담을 객체 생성
		    Map<String,Object> paramMapSub = new HashMap<String, Object>();

		    paramMapSub.put("device_seq", dto.getDevice_seq());
		    paramMapSub.put("device_uid", dto.getDevice_uid());
		    paramMapSub.put("device_onoff", dto.getDevice_onoff());
		    paramMapSub.put("device_status", dto.getDevice_status());
		    paramMapSub.put("device_dt", dto.getDevice_dt());
		    paramMap.put("result", paramMapSub);
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
	
	// 기기 로그 
	@SuppressWarnings("null")
	@RequestMapping(value = "/log", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> log(Criteria cri) throws Exception {

		log.info("/device/log...data : " + cri);
		
		// 보내줄 맵 객체 생성
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		try {
			
			List<LogDTO> lList = service.deviceLog(cri);
		    System.out.println(lList.toString());
		    // paramMap 담을 객체 생성
		    Map<String,Object> paramMapSub = new HashMap<String, Object>();
		    
		    paramMapSub.put("data", lList);
		    paramMap.put("result", paramMapSub);
		    paramMap.put("code", "200");
		    paramMap.put("message", "조회 성공");
		    
		} catch (Exception e) {
			
			paramMap.put("code", "500");
		    paramMap.put("message", "서버 문제");
		    
		}
		
		return paramMap;
	}
	
	// 기기 전체 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> deviceList(Criteria cri) throws Exception {
		
		log.info("/device/log...data : " + cri);
		
		// 보내줄 맵 객체 생성
		Map<String,Object> paramMap = new HashMap<String, Object>();
		
		try {
			
			List<DeviceDTO> dList = service.deviceList(cri);
			System.out.println(dList.toString());
			
		    // paramMap 담을 객체 생성
		    Map<String,Object> paramMapSub = new HashMap<String, Object>();
			
		    paramMapSub.put("data", dList);
		    paramMap.put("result", paramMapSub);
		    paramMap.put("code", "200");
		    paramMap.put("message", "조회 성공");
		    
		} catch (Exception e) {
			
			paramMap.put("code", "500");
		    paramMap.put("message", "서버 문제");
		    
		}
		
		return paramMap;
	}

}
