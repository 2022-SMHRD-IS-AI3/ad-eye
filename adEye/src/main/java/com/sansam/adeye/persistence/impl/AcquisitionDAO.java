package com.sansam.adeye.persistence.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sansam.adeye.domain.AcquisitionDTO;
import com.sansam.adeye.persistence.IAcquisitionDAO;

@Repository
public class AcquisitionDAO implements IAcquisitionDAO{

	@Autowired
	private SqlSession session;
	
	// 데이터 조회
	@Override
	public List<AcquisitionDTO> checkData(int seq) throws Exception{
		
		return session.selectList("Acquisition.list", seq);
	}
		
}
