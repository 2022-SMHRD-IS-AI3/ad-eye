package com.sansam.adeye.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.domain.MemberDTO;
import com.sansam.adeye.persistence.IMemberDAO;
import com.sansam.adeye.service.IMemberService;

@Service
public class MemberServiceImpl implements IMemberService {

	@Autowired
	private IMemberDAO mDao;
	
	// 회원 목록
	@Override
	public List<MemberDTO> memberList(Criteria cri) throws Exception {
		System.out.println("Service 접속");
		return mDao.memberList(cri);
	}

	// 회원 등록  
	@Override
	public int memberInsert(MemberDTO dto) throws Exception {
		System.out.println("Service 접속");
		return mDao.memberInsert(dto);
	}

	// 회원 조회
	@Override
	public MemberDTO memberDetail(String mid) throws Exception {
		System.out.println("Service 접속");
		return mDao.memberDetail(mid);
	}

	// 회원 수정
	@Override
	public int memberUpdate(MemberDTO dto) throws Exception {
		System.out.println("Service 접속");
		return mDao.memberUpdate(dto);
	}

	// 회원 삭제
	@Override
	public int memberDelete(String mid) throws Exception {
		System.out.println("Service 접속");
		return mDao.memberDelete(mid);
	}
	
}
