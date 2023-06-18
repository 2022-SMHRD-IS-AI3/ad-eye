package com.sansam.adeye.persistence;

import java.util.List;

import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.domain.SubscriptionDTO;

public interface ISubscriptionDAO {

	// 전체 구독 조회
	public List<SubscriptionDTO> sbsList(Criteria cri) throws Exception;
	// 구독 만료 5일 이내 조회
	public List<SubscriptionDTO> sbsListExpiry(Criteria cri) throws Exception;
	// 특정 회원 전체 구독 조회 : deviceList
	public List<SubscriptionDTO> devicelist(Criteria cri) throws Exception;
	// 특정 회원 전체 구독 조회 : 회사명, 구독 수
	public SubscriptionDTO memSbsData(Criteria cri) throws Exception;
	// 구독 생성
	public int sbsInsert(SubscriptionDTO sDto) throws Exception;
	// 특정 구독 정보 조회
	public SubscriptionDTO sbsDetail(int seq) throws Exception;
	// 특정 구독 수정
	public int sbsUpdate(SubscriptionDTO sDto) throws Exception;
	// 특정 구독 삭제 (상태 변경)
	public int sbsDelete(int seq) throws Exception;
	// 전체 구독 목록 페이징
	public int totalCnt(Criteria cri) throws Exception;
	// 전체 구독 목록 페이징 : dDayCnt
	public int dDayCnt(Criteria cri) throws Exception;
	// 회원 구독 목록 페이징 : memSbsCnt
	public int memSbsCnt(Criteria cri) throws Exception;
}
