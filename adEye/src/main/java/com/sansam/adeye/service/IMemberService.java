package com.sansam.adeye.service;

import java.util.List;

import com.sansam.adeye.domain.MemberDTO;

public interface IMemberService {

	// 등록
	public void insert(MemberDTO mdto) throws Exception;
	// 가져오기
	public MemberDTO detail(Integer bno) throws Exception;
	// 수정
	public boolean modify(MemberDTO bDto) throws Exception;
	// 제거
	public boolean delete(Integer bno) throws Exception;
	
	
}
