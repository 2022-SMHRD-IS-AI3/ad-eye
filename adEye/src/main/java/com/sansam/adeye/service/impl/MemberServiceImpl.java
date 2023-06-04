package com.sansam.adeye.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sansam.adeye.domain.MemberDTO;
import com.sansam.adeye.persistence.IMemberDAO;
import com.sansam.adeye.service.IMemberService;

@Service
public class MemberServiceImpl implements IMemberService {

	@Autowired
	private IMemberDAO mDao;

	// 회원 등록  
	@Override
	public void memberInsert(MemberDTO dto) throws Exception {
		
		mDao.memberInsert(dto);
	}

	// 회원 조회
	@Override
	public MemberDTO memberDetail(String mid) throws Exception {
		
		return mDao.memberDetail(mid);
	}

	// 회원 수정
	@Override
	public int memberUpdate(MemberDTO dto) throws Exception {

		return mDao.memberUpdate(dto);
	}

	// 회원 삭제
	@Override
	public int memberDelete(String mid) throws Exception {

		return mDao.memberDelete(mid);
	}
	
}
