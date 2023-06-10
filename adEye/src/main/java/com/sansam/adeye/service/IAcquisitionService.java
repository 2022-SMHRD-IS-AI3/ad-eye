package com.sansam.adeye.service;

import java.util.List;

import com.sansam.adeye.domain.AcquisitionDTO;
import com.sansam.adeye.domain.AcquisitionSubmitDTO;
import com.sansam.adeye.domain.LogDTO;

public interface IAcquisitionService {

	// 데이터 조회
	public List<AcquisitionDTO> acqDashboard(int seq) throws Exception;
	// 데이터 수집
	public List<AcquisitionSubmitDTO> submit(String uid) throws Exception;
	// 로그 수집
	public List<LogDTO> log(String uid) throws Exception;
	// 수집 등록
	public int acqCreate(List<AcquisitionSubmitDTO> dtoList ) throws Exception;
	// max tid
	public int acqMaxTid(String uid) throws Exception;
	

}
