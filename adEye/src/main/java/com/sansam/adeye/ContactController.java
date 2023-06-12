package com.sansam.adeye;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sansam.adeye.domain.ContactDTO;
import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.service.IContactService;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/contact")
@Log4j
public class ContactController {

	@Autowired
	IContactService service;
	
	// Test 페이지
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String register() throws Exception{

		log.info("/contact/test..............");
		
		return "/contact/test";
	}
	
	// 전체 문의 내역 조회
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> contactList(Criteria cri) throws Exception {
		
		log.info("/contactList : " + cri);
		// 보내줄 맵 객체 생성
		Map<String, Object> paramMap = new HashMap<String, Object>();

		try {
			// 
			List<ContactDTO> cDtoList = service.contactList(cri);
			log.info(cDtoList);
			Map<String,Object> paramMapsub = new HashMap<String, Object>();

			paramMapsub.put("data", cDtoList);
		    paramMap.put("result", paramMapsub);
		    paramMap.put("code", "200");
		    paramMap.put("message", "조회 성공");			
		} catch (Exception e) {
			paramMap.put("code", "204");
			paramMap.put("message", "조회불가");
		}
		return paramMap;
	}
	
	// 문의 생성
	@RequestMapping(value = "/send", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> contactSend(ContactDTO data) throws Exception {
		
		log.info("/contact/send : " + data);
		
		// 보내줄 맵 객체 생성
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		try {
			
			int cnt = service.contactSend(data);
			
			if(cnt>0) {
				paramMap.put("code", "201");
				paramMap.put("message", "생성완료");
			}else {
				paramMap.put("code", "203");
				paramMap.put("message", "처리실패");
			}
			
		} catch (Exception e) {
			paramMap.put("code", "500");
			paramMap.put("message", "서버문제");
		}
		return paramMap;
	}
	
	// 특정 문의 내역 조회
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> contactDetail(@RequestParam("contact_seq") String data ) throws Exception {
		
		log.info("/contact/detail : " + data);
		
		// 보내줄 맵 객체 생성
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		try {
			
			ContactDTO cDto = service.contactDetail(Integer.parseInt(data));
			// paramMap 에 담을 객체 생성
			Map<String, Object> paramMapsub = new HashMap<String, Object>();
			
			paramMapsub.put("contact_seq", cDto.getContact_seq());
			paramMapsub.put("email", cDto.getEmail());
			paramMapsub.put("phone", cDto.getPhone());
			paramMapsub.put("company", cDto.getCompany());
			paramMapsub.put("contact_content", cDto.getContact_content());
			paramMapsub.put("contact_dt", cDto.getContact_dt());
			paramMapsub.put("contact_open", cDto.getContact_open());
		    paramMap.put("result", paramMapsub);
		    paramMap.put("code", "200");
		    paramMap.put("message", "조회 성공");
						
		} catch (Exception e) {
			paramMap.put("code", "204");
			paramMap.put("message", "조회불가");
		}
		return paramMap;
	}
}
