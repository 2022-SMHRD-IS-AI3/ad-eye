package com.sansam.adeye.persistence;

import java.util.List;

import com.sansam.adeye.domain.LogDTO;

public interface ILogDAO {

	// 로그 등록
	public int logInsert(List<LogDTO> dtoList) throws Exception;
}
