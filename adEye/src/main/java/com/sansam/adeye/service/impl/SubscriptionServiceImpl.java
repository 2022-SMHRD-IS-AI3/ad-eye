package com.sansam.adeye.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.domain.SubscriptionDTO;
import com.sansam.adeye.persistence.ISubscriptionDAO;
import com.sansam.adeye.service.ISubscriptionService;

@Service
public class SubscriptionServiceImpl implements ISubscriptionService{

	@Autowired
	private ISubscriptionDAO sDao;
	
	// 전체 구독 조회
	@Override
	public List<SubscriptionDTO> sdsList(Criteria cri) throws Exception {
		
		return sDao.sdsList(cri);
	}
	// 구독 생성
	@Override
	public int sbsInsert(SubscriptionDTO sDto) throws Exception {
		
		return sDao.sbsInsert(sDto);
	}
	// 특정 구독 정보 조회
	@Override
	public SubscriptionDTO sbsDetail(int seq) throws Exception {
		
		return sDao.sbsDetail(seq);
	}
	// 특정 구독 수정
	@Override
	public int sbsUpdate(SubscriptionDTO sDto) throws Exception {
		
		return sDao.sbsUpdate(sDto);
	}
	// 특정 구독 삭제 (상태 변경)
	@Override
	public int sbsDelete(int seq) throws Exception {
		
		return sDao.sbsDelete(seq);
	}

}
