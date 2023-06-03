package com.sansam.adeye.service;

import com.sansam.adeye.domain.MemberDTO;

public interface IMemberService {
	
	// 회원등록 
	public void memberInsert(MemberDTO dto) throws Exception;
	
	// 회원조회
	public MemberDTO memberDetail(String mid) throws Exception;
	
	
	
	
	

}
