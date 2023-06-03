package com.sansam.adeye.persistence.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.domain.MemberDTO;
import com.sansam.adeye.persistence.IMemberDAO;

@Repository
public class MemberDAO implements IMemberDAO{

	@Autowired
	private SqlSession session;
	
	// 전체 유저 정보 조회 : /
	@Override
	public List<MemberDTO> memberList(Criteria cri) throws Exception {
		return session.selectList("MemberMapper.list", cri);
	}
	
	// 유저 생성 : /insert
	@Override
	public void memberInsert(MemberDTO mDto) throws Exception {
		session.insert("MemberMapper.create", mDto);
	}
	
	// 특정 유저 정보 조회 : /detail
	@Override
	public MemberDTO memberDetail(String mId) throws Exception {
		return session.selectOne("MemberMapper.detail", mId);
	}
	
	//특정 유저 정보 수정 : /update
	@Override
	public int memberUpdate(MemberDTO mDto) throws Exception {
		return session.update("MemberMapper.update", mDto);
	}
	
	// 특정 유저 정보 삭제 (상태 변경) : /delete
	@Override
	public int memberDelete(MemberDTO mDto) throws Exception {
		return session.update("MemberMapper.delUpdate", mDto);
	}
	
	// Login
	@Override
	public MemberDTO login(MemberDTO mDto) throws Exception {
		return session.selectOne("MemberMapper.login", mDto);
	}
}
