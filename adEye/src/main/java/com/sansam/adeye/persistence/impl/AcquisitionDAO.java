package com.sansam.adeye.persistence.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sansam.adeye.domain.AcquisitionDTO;
import com.sansam.adeye.domain.AcquisitionSubmitDTO;
import com.sansam.adeye.domain.DeviceDTO;
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
	@Override
	public int acqCreate(List<AcquisitionSubmitDTO> dtoList) throws Exception {
		
		// 처리에 따른 결과코드 담아주기 
		int result = 0;
		
		try {
			
			for (AcquisitionSubmitDTO dto : dtoList) {
				
				// 데이터 수집 생성 - 객체 1개마다
				session.insert("AcquisitionMapper.create", dto);
			}
			
			result = 1;
			
		} catch (Exception e) {
			result = 2;
		}
		// uid 값으로  seq,onoff 상태 가져오기
		DeviceDTO d = session.selectOne("DeviceMapper.getOnoff", dtoList.get(0).getDevice_uid());
		
		// 재부팅 요청이 들어온 경우
		if(d.getDevice_onoff() == 'R') {
			
			// 상태를 다시 Y로 변경
			session.update("DeviceMapper.control", new DeviceDTO(d.getDevice_seq(),'Y'));
			// result 재부팅 요청 ai 쪽에 알려주 코드
			result = 12;
		}
		
		return result;
	}
	@Override
	public int acqMaxTid(String uid) throws Exception {
		System.out.println("dao u " + uid);
		int t = session.selectOne("AcquisitionMapper.maxTid", uid);
		System.out.println("dao t " + t);
		return t; 
	}
		
}
