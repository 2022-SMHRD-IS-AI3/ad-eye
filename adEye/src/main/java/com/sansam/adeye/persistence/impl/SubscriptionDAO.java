package com.sansam.adeye.persistence.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.domain.SubscriptionDTO;
import com.sansam.adeye.persistence.ISubscriptionDAO;

@Repository
public class SubscriptionDAO implements ISubscriptionDAO{

	@Autowired
	private SqlSession session;
	
	// 전체 구독 조회 : /
	@Override
	public List<SubscriptionDTO> sbsList(Criteria cri) throws Exception{
		return session.selectList("SubscriptionMapper.list", cri);
	}
	// 구독 만료 5일 이내 조회
	@Override
	public List<SubscriptionDTO> sbsListExpiry(Criteria cri) throws Exception{
		System.out.println("Service 접속");
		return session.selectList("SubscriptionMapper.sbsListExpiry", cri);
	}
	// 특정 회원 전체 구독 조회 : deviceList
	public List<SubscriptionDTO> devicelist(Criteria cri) throws Exception {
		System.out.println("DAO 접속");
		return session.selectList("SubscriptionMapper.memSbsList", cri);
	}
	// 특정 회원 전체 구독 조회 : 회사명, 구독 수
	public SubscriptionDTO memSbsData(Criteria cri) throws Exception {
		System.out.println("DAO 접속");
		return session.selectOne("SubscriptionMapper.memSbsData", cri);
	}
	// 구독 생성 : /insert
	@Override
	public int sbsInsert(SubscriptionDTO sDto) throws Exception {
		System.out.println("test11");
		return session.insert("SubscriptionMapper.create", sDto);
	}
	// 특정 구독 정보 조회 : /detail
	@Override
	public SubscriptionDTO sbsDetail(int seq) throws Exception {
		return session.selectOne("SubscriptionMapper.detail", seq);
	}
	// 특정 구독 수정 : /update
	@Override
	public int sbsUpdate(SubscriptionDTO sDto) throws Exception{
		return session.update("SubscriptionMapper.update", sDto);
	}
	// 특정 구독 삭제 (상태 변경) : /delete
	@Override
	public int sbsDelete(int seq) throws Exception {
		return session.update("SubscriptionMapper.delete", seq);
	}
	// 전체 구독 목록 페이징
	@Override
	public int totalCnt(Criteria cri) throws Exception {
		System.out.println("DAO 접속");
		return session.selectOne("SubscriptionMapper.totalCnt", cri);
	}
	// 회원 그독 목록 페이징 : memSbsCnt
	@Override
	public int memSbsCnt(Criteria cri) throws Exception {
		System.out.println("DAO 접속");
		return session.selectOne("SubscriptionMapper.memSbsCnt", cri);
	}
}
