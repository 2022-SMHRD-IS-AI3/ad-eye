package com.sansam.adeye.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sansam.adeye.domain.AcquisitionDTO;
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
	
	// 데이터 조회
	@Override
	public List<AcquisitionDTO> acqDashboard(int seq) throws Exception {
		
		return acDao.acqDashboard(seq);
	}
	
	// 로그 수집
	@Override
	public int logInsert(List<LogDTO> dto) throws Exception {
		
		return lDao.logInsert(dto);
	}
	@Override
	public DeviceDTO acqCreate(List<AcquisitionSubmitDTO> dtoList) throws Exception {
		return acDao.acqCreate(dtoList);
	}
	@Override
	public int acqMaxTid(String uid) throws Exception {
		return acDao.acqMaxTid(uid);
	}
}
