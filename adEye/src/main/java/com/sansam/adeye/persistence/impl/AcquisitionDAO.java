package com.sansam.adeye.persistence.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sansam.adeye.domain.AcqDTO;
import com.sansam.adeye.domain.AcqDashboardDTO;
import com.sansam.adeye.domain.AcquisitionDTO;
import com.sansam.adeye.domain.AcquisitionDashboardDTO;
import com.sansam.adeye.domain.AcquisitionSubmitDTO;
import com.sansam.adeye.domain.DeviceDTO;
import com.sansam.adeye.domain.LogDTO;
import com.sansam.adeye.persistence.IAcquisitionDAO;

@Repository
public class AcquisitionDAO implements IAcquisitionDAO{

	@Autowired
	private SqlSession session;
	
	// 데이터 조회 : 분석페이지화면구성(리스트)
	@Override
	public List<AcquisitionDashboardDTO> totalCntList(AcquisitionDTO reParam) throws Exception {
		System.out.println("DAO 접속");
		System.out.println("sbs_seq "+ reParam.getSbs_seq());
		System.out.println("search_date "+ reParam.getSearch_date());
		List<AcquisitionDashboardDTO> t = session.selectList("AcquisitionMapper.totalCntList", reParam);
		System.out.println(t.toString());
		return t;
	}
	
	// 데이터 조회 : 분석페이지화면구성(값)
	@Override
	public AcqDashboardDTO totalCnt(AcquisitionDTO reParam) throws Exception {
		System.out.println("DAO 접속");
		System.out.println("sbs_seq "+ reParam.getSbs_seq());
		System.out.println("search_date "+ reParam.getSearch_date());
		AcqDashboardDTO t = session.selectOne("AcquisitionMapper.totalCnt", reParam);
		System.out.println(t.toString());
		return t;
	}
	
	// 수집 데이터 저장
	@Override
	public DeviceDTO acqCreate(AcqDTO adto) throws Exception {
		
		// 처리에 따른 결과코드 담아주기 
		DeviceDTO result = new DeviceDTO();
		
		try {
			
			if(adto.getAcq_list().size() > 0) {
				
				for (AcquisitionSubmitDTO dto : adto.getAcq_list()) {
					System.out.println("1313"+dto);
					
					int cnt = session.selectOne("AcquisitionMapper.tidCheck",new AcquisitionSubmitDTO(dto.getDevice_uid(), dto.getAcq_tid(), null, null, null, null));
					if(cnt > 0) {
						session.insert("AcquisitionMapper.update", dto);
						System.out.println(cnt);
					}else {
						session.insert("AcquisitionMapper.create", dto);
					}
					
				}
				result.setDevice_seq(1);
			}
			
		} catch (Exception e) {
			result.setDevice_seq(2);
			
		}
		// uid 값으로  seq,onoff 상태 가져오기
		DeviceDTO d = session.selectOne("DeviceMapper.getOnoff", adto.getDevice_uid());
		
		result.setDevice_onoff(d.getDevice_onoff());
		// 재부팅 요청이 들어온 경우
		if(d.getDevice_onoff() == 'R') {
			
			// 상태를 다시 Y로 변경

			session.update("DeviceMapper.control", new DeviceDTO(d.getDevice_uid(),'Y'));

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
