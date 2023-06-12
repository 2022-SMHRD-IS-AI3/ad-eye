package com.sansam.adeye.persistence;

import java.util.List;

import com.sansam.adeye.domain.AcqDashboardDTO;
import com.sansam.adeye.domain.AcquisitionDTO;
import com.sansam.adeye.domain.AcquisitionDashboardDTO;
import com.sansam.adeye.domain.AcquisitionSubmitDTO;
import com.sansam.adeye.domain.DeviceDTO;
import com.sansam.adeye.domain.LogDTO;

public interface IAcquisitionDAO {

	// 데이터 조회 : 분석페이지화면구성(리스트)
	public List<AcquisitionDashboardDTO> totalCntList(AcquisitionDTO reParam) throws Exception;
	// 데이터 조회 : 분석페이지화면구성(값)
	public AcqDashboardDTO totalCnt(AcquisitionDTO reParam) throws Exception;
	
	// 수집 등록
	public DeviceDTO acqCreate(List<AcquisitionSubmitDTO> dtoList) throws Exception;
	
	// maxTid
	public int acqMaxTid(String uid) throws Exception;
}