package com.sansam.adeye.persistence.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sansam.adeye.domain.AcquisitionDTO;
import com.sansam.adeye.domain.AcquisitionSubmitDTO;
import com.sansam.adeye.domain.LogDTO;
import com.sansam.adeye.persistence.IAcquisitionDAO;

@Repository
public class AcquisitionDAO implements IAcquisitionDAO{

	@Autowired
	private SqlSession session;
	
	// 데이터 조회 : 분석페이지화면구성
	@Override
	public List<AcquisitionDTO> acqDashboard(int seq) throws Exception{
		
		return session.selectList("AcquisitionMapper.list", seq);
	}
	// 데이터 수집
	@Override
	public List<AcquisitionSubmitDTO> submit(String uid) throws Exception {
		
		return session.selectList("AcquisitionMapper.submit", uid);
	}
	// 로그 수집
	@Override
	public List<LogDTO> log(String uid) throws Exception {
		
		return session.selectList("AcquisitionMapper.log", uid);
	}
		
}
