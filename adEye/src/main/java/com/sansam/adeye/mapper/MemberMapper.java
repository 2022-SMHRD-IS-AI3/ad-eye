package com.sansam.adeye.mapper;

import java.util.List;

import com.sansam.adeye.domain.MemberDTO;

public interface MemberMapper {
	
	public void insert(MemberDTO mbtn);
	public int delete(String id);
	public int update(MemberDTO mbtn);
	public MemberDTO login(MemberDTO mbtn);
	public MemberDTO detail(String mem_id);
	public List<MemberDTO> selectall();

}
