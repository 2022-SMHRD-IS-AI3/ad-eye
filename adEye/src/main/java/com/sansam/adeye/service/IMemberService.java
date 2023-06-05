package com.sansam.adeye.service;

import com.sansam.adeye.domain.MemberDTO;

public interface IMemberService {
	
	// 회원등록 
	public int memberInsert(MemberDTO dto) throws Exception;
	
	// 회원상세
	public MemberDTO memberDetail(String mid) throws Exception;
	
	// 회원수정
	public int memberUpdate(MemberDTO dto) throws Exception;
	
	// 회원수정
	public int memberDelete(String mid) throws Exception;

}
