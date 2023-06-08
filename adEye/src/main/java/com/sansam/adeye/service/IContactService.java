package com.sansam.adeye.service;

import java.util.List;

import com.sansam.adeye.domain.ContactDTO;
import com.sansam.adeye.domain.Criteria;

public interface IContactService {

	// 전체 문의 내역 조회
	public List<ContactDTO> contactList(Criteria cri) throws Exception;
	// 문의 생성
	public int contactSend(ContactDTO cDto) throws Exception;
	// 특정 문의 내역 조회
	public ContactDTO contactDetail(Integer seq) throws Exception;
	
}
