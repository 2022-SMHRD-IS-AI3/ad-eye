package com.sansam.adeye.persistence.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sansam.adeye.domain.ContactDTO;
import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.persistence.IContactDAO;

@Repository
public class ContactDAO implements IContactDAO{

	@Autowired
	private SqlSession session;
	
	// 전체 문의 내역 조회
	@Override
	public List<ContactDTO> contactList(Criteria cri) throws Exception{
		System.out.println("contactList...DAO");
		return session.selectList("ContactMapper.list", cri);
	}
	// 문의 생성
	@Override
	public int contactSend(ContactDTO cDto) throws Exception{
		
		int result = 0;
		
		System.out.println(123);
		result = session.insert("ContactMapper.create", cDto);
			
		System.out.println(result);
		
		
		return result;
	}
	// 특정 문의 내역 조회
	@Override
	public ContactDTO contactDetail(int seq) throws Exception{
		System.out.println(123);
		return session.selectOne("ContactMapper.detail", seq);
	}
	// 특정 문의 내역 조회 시 열람 확인 값 자동 변경
	@Override
	public int openYn(int seq) throws Exception{
		return session.update("ContactMapper.openYn", seq);
	}
	// 전체 문의 내역 페이징
	public int totalCnt(Criteria cri) throws Exception {
		return session.selectOne("ContactMapper.totalCnt", cri);
	}
}
