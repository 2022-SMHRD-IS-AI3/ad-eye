package com.sansam.adeye.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sansam.adeye.domain.AcquisitionDTO;
import com.sansam.adeye.domain.AcquisitionSubmitDTO;
import com.sansam.adeye.domain.LogDTO;
import com.sansam.adeye.persistence.IAcquisitionDAO;
import com.sansam.adeye.service.IAcquisitionService;

@Service
public class AcquisitionServiceImpl implements IAcquisitionService{

	@Autowired
	private IAcquisitionDAO acDao;
	
	// 데이터 조회
	@Override
	public List<AcquisitionDTO> checkData(int seq) throws Exception {
		
		return acDao.checkData(seq);
	}
	// 데이터 수집
	@Override
	public List<AcquisitionSubmitDTO> submit(String uid) throws Exception {
		
		return acDao.submit(uid);
	}
	// 로그 수집
	@Override
	public List<LogDTO> log(String uid) throws Exception {
		
		return acDao.log(uid);
	}
}
