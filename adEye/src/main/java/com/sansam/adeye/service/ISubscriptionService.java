package com.sansam.adeye.service;

import java.util.List;

import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.domain.SubscriptionDTO;

public interface ISubscriptionService {

	// 전체 구독 조회
	public List<SubscriptionDTO> sdsList(Criteria cri) throws Exception;
	
	// 구독 생성
	public int sbsInsert(SubscriptionDTO sDto) throws Exception;
	
	// 특정 구독 정보 조회
	public SubscriptionDTO sbsDetail(int seq) throws Exception;
	
	// 특정 구독 수정
	public int sbsUpdate(SubscriptionDTO sDto) throws Exception;
	
	// 특정 구독 삭제 (상태 변경)
	public int sbsDelete(int seq) throws Exception;
	
}
