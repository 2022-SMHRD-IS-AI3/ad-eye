package com.sansam.adeye.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.domain.SubscriptionDTO;
import com.sansam.adeye.persistence.IDeviceDAO;
import com.sansam.adeye.persistence.ISubscriptionDAO;
import com.sansam.adeye.service.ISubscriptionService;

@Service
public class SubscriptionServiceImpl implements ISubscriptionService{

	@Autowired
	private ISubscriptionDAO sDao;
	
	@Autowired
	private IDeviceDAO dDao;
	
	// 전체 구독 조회
	@Override
	public List<SubscriptionDTO> sbsList(Criteria cri) throws Exception {
		System.out.println("Service 접속");
		return sDao.sbsList(cri);
	}
	// 구독 만료 5일 이내 조회
	@Override
	public List<SubscriptionDTO> sbsListExpiry(Criteria cri) throws Exception{
		System.out.println("Service 접속");
		return sDao.sbsListExpiry(cri);
	}
	// 구독 생성
	@Override
	public int sbsInsert(SubscriptionDTO sDto) throws Exception {
		System.out.println("Service 접속");
		int t = sDao.sbsInsert(sDto);
		System.out.println(t);
		return t;
	}
	// 구독 생성 시 등록 된 기기 상태 변경(N -> Y)
	@Override
	public int devStatusOn(int seq) throws Exception {
		System.out.println("Service 접속");
		return dDao.devStatusOn(seq);
	}
	// 특정 구독 정보 조회
	@Override
	public SubscriptionDTO sbsDetail(int seq) throws Exception {
		System.out.println("Service 접속");
		return sDao.sbsDetail(seq);
	}
	// 특정 구독 수정
	@Override
	public int sbsUpdate(SubscriptionDTO sDto) throws Exception {
		System.out.println("Service 접속");
		return sDao.sbsUpdate(sDto);
	}
	// 특정 구독 삭제 (상태 변경)
	@Override
	public int sbsDelete(int seq) throws Exception {
		System.out.println("Service 접속");
		return sDao.sbsDelete(seq);
	}
	// 전체 구독 목록 페이징
	@Override
	public int totalCnt(Criteria cri) throws Exception {
		System.out.println("Service 접속");
		return sDao.totalCnt(cri);
	}

}
