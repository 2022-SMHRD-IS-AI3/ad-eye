package com.sansam.adeye.service;

import java.util.List;

import com.sansam.adeye.domain.AcquisitionDTO;

public interface IAcquisitionService {

	// 데이터 조회
	public List<AcquisitionDTO> checkData(int seq) throws Exception;
	
}
