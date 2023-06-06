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
		return session.selectList("ContactMapper.list", cri);
	}
	// 문의 생성
	@Override
	public int contactSend(ContactDTO cDto) throws Exception{
		
		int result = 0;
		
		try {
			result = session.insert("ContactMapper.create", cDto);
		} catch (Exception e) {
		}
		
		return result;
	}
	// 특정 문의 내역 조회
	@Override
	public ContactDTO contactDetail(Integer seq) throws Exception{
		return session.selectOne("ContactMapper.detail", seq);
	}
}
