package com.sansam.adeye.persistence.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sansam.adeye.domain.AcquisitionSubmitDTO;
import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.domain.LogDTO;
import com.sansam.adeye.persistence.ILogDAO;

@Repository
public class LogDAO implements ILogDAO{
	
	@Autowired
	private SqlSession session;
	
	// 로그 등록
	@Override
	public int logInsert(List<LogDTO> dtoList) throws Exception {
		
		int result = 0;
		
		try {
			
			for (LogDTO dto : dtoList) {
				String[] dataArr = dto.getLog_msg().split(",");
				SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				dto.setLog_dt(fm.parse(dataArr[0]));
				
				session.insert("LogMapper.create", dto);
			}
			
			result = 1;
			
		} catch (Exception e) {
			result = 2;
		}
		return result;
	}
	
	// 특정 기기 로그 조회
	@Override
	public List<LogDTO> deviceLog(Criteria cri) throws Exception {
		System.out.println("DAO 접속");
		return session.selectList("LogMapper.deviceLog", cri);
	}

	// 전체 로그 조회
	@Override
	public List<LogDTO> LogList(Criteria cri) throws Exception {
		System.out.println("DAO 접속");
		return session.selectList("LogMapper.logList", cri);
	}
	
	// 전체 로그 조회 페이징
	@Override
	public int totalCnt(Criteria cri) throws Exception {
		System.out.println("DAO 접속");
		return session.selectOne("LogMapper.totalCnt", cri);
	}
	
	// 특정 기기 로그 조회 페이징
	@Override
	public int devLogCnt(Criteria cri) throws Exception {
		System.out.println("DAO 접속");
		return session.selectOne("LogMapper.devLogCnt", cri);
	}

}
