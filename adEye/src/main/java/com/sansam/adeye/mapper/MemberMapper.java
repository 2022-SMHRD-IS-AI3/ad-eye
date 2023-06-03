package com.sansam.adeye.mapper;

import com.sansam.adeye.domain.MemberDTO;

public interface MemberMapper {
	
	public void insert(MemberDTO mbtn);
	public void delete(String id);
	public void update(MemberDTO mbtn);
	public void login(MemberDTO mbtn);

}