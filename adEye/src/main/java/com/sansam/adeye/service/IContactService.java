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
	public ContactDTO contactDetail(int seq) throws Exception;
	// 특정 문의 내역 조회 시 열람 확인 값 자동 변경
	public int openYn(int seq) throws Exception;
	// 전체 문의 내역 페이징
	public int totalCnt(Criteria cri) throws Exception;
}
