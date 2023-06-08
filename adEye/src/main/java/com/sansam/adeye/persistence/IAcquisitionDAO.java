package com.sansam.adeye.persistence;

import java.util.List;

import com.sansam.adeye.domain.AcquisitionDTO;
import com.sansam.adeye.domain.AcquisitionSubmitDTO;
import com.sansam.adeye.domain.LogDTO;

public interface IAcquisitionDAO {

	// 데이터 조회
	public List<AcquisitionDTO> checkData(int seq) throws Exception;
	// 데이터 수집
	public List<AcquisitionSubmitDTO> submit(String uid) throws Exception;
	// 로그 수집
	public List<LogDTO> log(String uid) throws Exception;
}