package com.sansam.adeye.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sansam.adeye.domain.ContactDTO;
import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.persistence.IContactDAO;
import com.sansam.adeye.service.IContactService;

@Service
public class ContactServiceImpl implements IContactService{

	@Autowired
	private IContactDAO cDao;
	
	// 전체 문의 내역 조회
	@Override
	public List<ContactDTO> contactList(Criteria cri) throws Exception {
		System.out.println("contactList...Service");
		return cDao.contactList(cri);
	}
	// 문의 생성
	@Override
	public int contactSend(ContactDTO cDto) throws Exception {
		
		return cDao.contactSend(cDto);
	}
	// 특정 문의 내역 조회
	@Override
	public ContactDTO contactDetail(int seq) throws Exception {
		
		return cDao.contactDetail(seq);
	}
	// 특정 문의 내역 조회 시 열람 확인 값 자동 변경
	@Override
	public int openYn(int seq) throws Exception{
		
		return cDao.openYn(seq);
	}
	// 전체 문의 내역 페이징
	@Override
	public int totalCnt(Criteria cri) throws Exception {
		return cDao.totalCnt(cri);
	}
	// 문의 삭제
	@Override
	public int delete(int seq) throws Exception {
		return cDao.delete(seq);
	}
}
