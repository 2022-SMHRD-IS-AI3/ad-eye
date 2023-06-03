package com.sansam.adeye.persistence;

import java.util.List;

import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.domain.MemberDTO;

public interface IMemberDAO {

	// 전체 유저 조회
	public List<MemberDTO> memberList(Criteria cri) throws Exception;
	// 유저 생성
	public void memberInsert(MemberDTO mDto) throws Exception;
	// 특정 유저 정보 조회
	public MemberDTO memberDetail(String mId) throws Exception;
	//특정 유저 정보 수정
	public int memberUpdate(MemberDTO mDto) throws Exception;
	// 특정 유저 정보 삭제 (상태 변경)
	public int memberDelete(String mId) throws Exception;	
	// Login
	public MemberDTO login(MemberDTO mDto) throws Exception;
}
