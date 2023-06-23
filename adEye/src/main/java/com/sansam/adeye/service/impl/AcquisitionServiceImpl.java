package com.sansam.adeye.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sansam.adeye.domain.AcqDTO;
import com.sansam.adeye.domain.AcqDashboardDTO;
import com.sansam.adeye.domain.AcquisitionDTO;
import com.sansam.adeye.domain.AcquisitionDashboardDTO;
import com.sansam.adeye.domain.AcquisitionSubmitDTO;
import com.sansam.adeye.domain.DeviceDTO;
import com.sansam.adeye.domain.LogDTO;
import com.sansam.adeye.persistence.IAcquisitionDAO;
import com.sansam.adeye.persistence.ILogDAO;
import com.sansam.adeye.service.IAcquisitionService;

@Service
public class AcquisitionServiceImpl implements IAcquisitionService{

	@Autowired
	private IAcquisitionDAO acDao;
	
	@Autowired
	private ILogDAO lDao;
	
	// 데이터 조회 : 분석페이지화면구성(리스트)
	@Override
	public List<AcquisitionDashboardDTO> totalCntList(AcquisitionDTO reParam) throws Exception {
		System.out.println("Service 접속");
		return acDao.totalCntList(reParam);
	}
	// 데이터 조회 : 분석페이지화면구성(값)
	@Override
	public AcqDashboardDTO totalCnt(AcquisitionDTO reParam) throws Exception {
		System.out.println("Service 접속");
		return acDao.totalCnt(reParam);
	}
	
	// 로그 수집
	@Override
	public int logInsert(List<LogDTO> dto) throws Exception {
		
		return lDao.logInsert(dto);
	}
	@Override
	public DeviceDTO acqCreate(AcqDTO dto) throws Exception {
		return acDao.acqCreate(dto);
	}
	@Override
	public int acqMaxTid(String uid) throws Exception {
		return acDao.acqMaxTid(uid);
	}
}
