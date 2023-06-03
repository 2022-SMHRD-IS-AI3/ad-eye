package com.sansam.adeye.mapper;

import java.util.List;

import com.sansam.adeye.domain.MemberDTO;

public interface MemberMapper {
	
	public List<MemberDTO> memberList();
	public void memberInsert(MemberDTO mbtn);
	public MemberDTO memberDetail(String mem_id);
	public int memberUpdate(MemberDTO mbtn);
	public int memberDelete(String id);
	public MemberDTO login(MemberDTO mbtn);
	
}
