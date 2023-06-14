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
		System.out.println("DAO 접속");
		return session.selectList("MemberMapper.list", cri);
	}
	
	// 유저 생성 : /insert
	@Override
	public int memberInsert(MemberDTO mDto) throws Exception {
		System.out.println("DAO 접속");
		int result = 0;
		
		try {
			result = session.insert("MemberMapper.create", mDto);
		} catch (Exception e) {
		}
		
		return result;
	}
	
	// 특정 유저 정보 조회 : /detail
	@Override
	public MemberDTO memberDetail(String mId) throws Exception {
		System.out.println("DAO 접속");
		return session.selectOne("MemberMapper.detail", mId);
	}
	
	//특정 유저 정보 수정 : /update
	@Override
	public int memberUpdate(MemberDTO mDto) throws Exception {
		System.out.println("DAO 접속");
		return session.update("MemberMapper.update", mDto);
	}
	
	// 특정 유저 정보 삭제 (상태 변경) : /delete
	@Override
	public int memberDelete(String mId) throws Exception {
		System.out.println("DAO 접속");
		return session.update("MemberMapper.delete", mId);
	}
	
	// Login
	@Override
	public MemberDTO login(MemberDTO mDto) throws Exception {
		System.out.println("DAO 접속");
		return session.selectOne("MemberMapper.login", mDto);
	}
	
	// 아이디 확인
	@Override
	public int sbsIdCheck(String mid) throws Exception {
		System.out.println("DAO 접속");
		int result = session.selectOne("MemberMapper.sbsIdCheck", mid);
		System.out.println(result);
		return result;
	}
}
