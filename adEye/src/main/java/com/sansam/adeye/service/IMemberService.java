package com.sansam.adeye.service;

import java.util.List;

import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.domain.MemberDTO;
import com.sansam.adeye.domain.SubscriptionDTO;

public interface IMemberService {
	
	// 회원목록
	public List<MemberDTO> memberList(Criteria cri) throws Exception;
	
	// 회원 구독 전체 목록 : sbs_list
	public List<SubscriptionDTO> devicelist(Criteria cri) throws Exception;
	// 회원 전체 구독 조회 : 회사명, 구독 수
	public SubscriptionDTO memSbsData(Criteria cri) throws Exception;
	
	// 회원등록 
	public int memberInsert(MemberDTO dto) throws Exception;
	
	// 회원상세
	public MemberDTO memberDetail(String mid) throws Exception;
	
	// 회원수정
	public int memberUpdate(MemberDTO dto) throws Exception;
	
	// 회원수정
	public int memberDelete(String mid) throws Exception;

	// 로그인
	public MemberDTO login(MemberDTO mDto) throws Exception;
	
}
