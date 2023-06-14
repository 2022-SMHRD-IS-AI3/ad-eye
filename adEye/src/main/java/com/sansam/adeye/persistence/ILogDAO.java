package com.sansam.adeye.persistence;

import java.util.List;

import com.sansam.adeye.domain.Criteria;
import com.sansam.adeye.domain.LogDTO;

public interface ILogDAO {

	// 로그 등록
	public int logInsert(List<LogDTO> dtoList) throws Exception;
	// 특정 기기 로그 조회
	public List<LogDTO> deviceLog(Criteria cri) throws Exception;
	// 전체 로그 조회
	public List<LogDTO> LogList(Criteria cri) throws Exception;
}
