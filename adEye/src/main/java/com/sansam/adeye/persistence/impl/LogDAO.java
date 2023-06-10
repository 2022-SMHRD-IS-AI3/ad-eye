package com.sansam.adeye.persistence.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sansam.adeye.domain.AcquisitionSubmitDTO;
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
	
	

}
