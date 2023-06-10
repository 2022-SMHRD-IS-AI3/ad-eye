package com.sansam.adeye.persistence;

import java.util.List;

import com.sansam.adeye.domain.AcquisitionDTO;
import com.sansam.adeye.domain.AcquisitionSubmitDTO;
import com.sansam.adeye.domain.DeviceDTO;
import com.sansam.adeye.domain.LogDTO;

public interface IAcquisitionDAO {

	// 데이터 조회
	public List<AcquisitionDTO> acqDashboard(int seq) throws Exception;
	
	// 수집 등록
	public DeviceDTO acqCreate(List<AcquisitionSubmitDTO> dtoList) throws Exception;
	
	// maxTid
	public int acqMaxTid(String uid) throws Exception;
}