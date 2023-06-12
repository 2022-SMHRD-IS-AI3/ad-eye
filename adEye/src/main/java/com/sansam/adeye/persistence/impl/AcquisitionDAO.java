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
	
	// 수집 데이터 저장
	@Override
	public DeviceDTO acqCreate(List<AcquisitionSubmitDTO> dtoList) throws Exception {
		
		// 처리에 따른 결과코드 담아주기 
		DeviceDTO result = null;
		
		try {
			
			for (AcquisitionSubmitDTO dto : dtoList) {
				System.out.println(dto);
				
				int cnt = session.selectOne("AcquisitionMapper.tidCheck",new AcquisitionSubmitDTO(dto.getDevice_uid(), dto.getAcq_tid(), null, null, null, null));
				
				if(cnt > 0) {
					session.insert("AcquisitionMapper.update", dto);
					System.out.println(cnt);
				}else {
					session.insert("AcquisitionMapper.create", dto);
				}
			}
			
			result.setDevice_seq(1);
			
		} catch (Exception e) {
			result.setDevice_seq(2);
		}
		// uid 값으로  seq,onoff 상태 가져오기
		DeviceDTO d = session.selectOne("DeviceMapper.getOnoff", dtoList.get(0).getDevice_uid());
		result.setDevice_onoff(d.getDevice_onoff());
		// 재부팅 요청이 들어온 경우
		if(d.getDevice_onoff() == 'R') {
			
			// 상태를 다시 Y로 변경
			session.update("DeviceMapper.control", new DeviceDTO(d.getDevice_seq(),'Y'));
			// result 재부팅 요청 ai 쪽에 알려주 코드
		}
		
		System.out.println(result.toString());
		
		return result;
	}
	
	@Override
	public int acqMaxTid(String uid) throws Exception {
		int t = session.selectOne("AcquisitionMapper.maxTid", uid);
		return t; 
	}
		
}
