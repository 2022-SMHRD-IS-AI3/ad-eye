package com.sansam.adeye.persistence;

import java.util.List;

import com.sansam.adeye.domain.AcquisitionDTO;

public interface IAcquisitionDAO {

	// 데이터 조회
	public List<AcquisitionDTO> checkData(int seq) throws Exception;
	
}