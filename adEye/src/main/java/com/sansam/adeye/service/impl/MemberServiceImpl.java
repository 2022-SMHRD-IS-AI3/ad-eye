package com.sansam.adeye.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.domain.MemberDTO;
import com.sansam.adeye.domain.SubscriptionDTO;
import com.sansam.adeye.persistence.IMemberDAO;
import com.sansam.adeye.persistence.ISubscriptionDAO;
import com.sansam.adeye.service.IMemberService;

@Service
public class MemberServiceImpl implements IMemberService {

	@Autowired
	private IMemberDAO mDao;
	
	@Autowired
	private ISubscriptionDAO sDao;
	
	// 회원 목록
	@Override
	public List<MemberDTO> memberList(Criteria cri) throws Exception {
		System.out.println("Service 접속");
		return mDao.memberList(cri);
	}
	
	// 회원 구독 전체 목록 : sbs_list
	public List<SubscriptionDTO> devicelist(Criteria cri) throws Exception {
		System.out.println("Service 접속");
		return sDao.devicelist(cri);
	}
	// 회원 전체 구독 조회 : 회사명, 구독 수
	public SubscriptionDTO memSbsData(Criteria cri) throws Exception {
		System.out.println("Service 접속");
		return sDao.memSbsData(cri);
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
	
	// Login
	@Override
	public MemberDTO login(MemberDTO mDto) throws Exception {
		System.out.println("Service 접속");
		return mDao.login(mDto);
	}
	
	// 아이디 확인
	@Override
	public int sbsIdCheck(String mid) throws Exception {
		System.out.println("Service 접속");
		return mDao.sbsIdCheck(mid);
	}
	
	// 회원 목록 페이징
	@Override
	public int totalCnt(Criteria cri) throws Exception {
		System.out.println("Service 접속");
		return mDao.totalCnt(cri);
	}
	
	// 회원 구독 목록 페이징 : memSbsCnt
	@Override
	public int memSbsCnt(Criteria cri) throws Exception {
		System.out.println("Service 접속");
		return sDao.memSbsCnt(cri);
	}
}
